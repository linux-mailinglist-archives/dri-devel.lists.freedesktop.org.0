Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F70C36413B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 14:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708F96E29D;
	Mon, 19 Apr 2021 12:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB2C6E2B6
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 12:06:01 +0000 (UTC)
Date: Mon, 19 Apr 2021 12:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1618833959;
 bh=8Ya2xDVsLBmnQmOgmdXTngf3ko9NpMvbD64juYEQy2s=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=aqs3n2mZsD3lU6aCOB6NiGNo6YUJmdIJlqDw68ETaZisoqUBSW9tezFWCRIVlfEbx
 rz2XGNNaIB0Pda8Gf+yRPxUhSlvrmRTZ2q4d08B43XzAqtCZeS+FocLDzxzF8/VUyy
 FcpQ2DB+9pWZ5QrhJf5le7KwX3lmYetraA+bTrCpJAScpD+CYGnihQLS2WP88ws+kW
 QjIMbzxdwcJC7e3l7COjXWZsGdtN37kZ3Q/05anyezg15pNR0Xz1HYyjnM4rvHQ66e
 TvzxeCM8HdG7FnC9/IqxXczGUGbG1XgoGQT14qon3QfqiFzZ1s3n725kLzFCFB5i0d
 PeIAfpR0Ey/7g==
To: DRI Development <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: Split render/display SoCs, Mesa's renderonly, and Wayland dmabuf hints
Message-ID: <a28f2wvjsZ0pMcKjyC4C5DgvT59Bn32JORf1DdTei3818_ZXYRGV19m5IpaWqELPeDNPSj2SRbMznfuCrCYmO0mLtpaxN5MprB3QRk3Isww=@emersion.fr>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I'm working on a Wayland extension [1] that, among other things, allows
compositors to advertise the preferred device to be used by Wayland
clients.

In general, compositors will send a render node. However, in the case
of split render/display SoCs, things get a little bit complicated.

The Wayland compositor will find the display-only DRM device (usually
at /dev/dri/card0). This DRM device will have a DRM primary node, but
no DRM render node.

The Wayland compositor will create a GBM device from this display-only
device, then create an EGL display. Under the hood, Mesa's kmsro will
kick in and magically open a render node from a different device.

However the compositor has no knowledge of this, and has no way to
discover the render node opened by kmsro.

This is an issue because the compositor has no render node to send to
Wayland clients. The compositor is forced to send a primary node to
clients. Clients will need to open the primary node and rely on Mesa's
renderonly to once again magically open the render node under the hood.

In general clients cannot be expected to be able to open primary nodes.
This happens to work on systemd distributions because udev sets a
special uaccess tag on the primary node that makes logind grant
permissions to users physically logged in on a VT.

This will fall apart on non-logind systems and on systems where no user
is physically logged in. Additionally, it may be desirable to deny
access to primary nodes in sandboxes.

So I believe the best way forward would be for the compositor to send
the render node to clients. This could prevent clients to allocate
buffers suitable for scan-out, but that can be fixed with some kind of
buffer constraints negotiation, like we presented at XDC 2020 [2].

There are a few solutions:

1. Require compositors to discover the render device by trying to import
   a buffer. For each available render device, the compositor would
   allocate a buffer, export it as a DMA-BUF, import it to the
   display-only device, then try to drmModeAddFB.
2. Allow compositors to query the render device magically opened by
   kmsro. This could be done either via EGL_EXT_device_drm, or via a
   new EGL extension.
3. Allow compositors to query the kernel drivers to know which devices
   are compatible with each other. Some uAPI to query a compatible
   display device from a render-only device, or vice-versa, has been
   suggested in the past.

(1) has a number of limitations and gotchas. It requires allocating
real buffers, this has a rather big cost for something done at
compositor initialization time. It requires to select a buffer format
and modifier compatible with both devices, so it can't be isolated in
a simple function (and e.g. shared between all compositors in libdrm).
Some drivers will allow to drmModeAddFB buffers that can't be scanned
out, and will only reject the buffer at atomic commit time.

(2) wouldn't work with non-EGL APIs such as Vulkan. Eric Anholt seemed
pretty opposed to this idea, but I didn't fully understood why.

I don't know how feasible (3) is. The kernel drivers must be able to
decide whether buffers coming from another driver can be scanned out,
but how early can they give an answer? Can they give an answer solely
based on a DRM node, and not a DMA-BUF?

Feedback is welcome. Do you agree with the premise that compositors
need access to the render node? Do you have any other potential solution
in mind? Which solution would you prefer?

Thanks,

Simon

[1]: https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/8
[2]: https://xdc2020.x.org/event/9/contributions/634/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

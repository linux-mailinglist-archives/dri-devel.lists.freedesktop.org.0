Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893C324DF4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFE36EC84;
	Thu, 25 Feb 2021 10:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A93F6EC80
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Feb 2021 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614248729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypTa3inN3myqZyj0TrRQjMS6xlcjWVaVwQu0mECVBzY=;
 b=g2ppyDSPxFZqw6CFDqYUx0fjMf4oE+HCRfXApsHY4o5Vtdv/hc7yLtjSufFQpAx+PYgWL4
 4OsYefbA+GoSMLabE5zh1j1qKxS36i2aRZzueNTvPWNzMH4dR6F2WIAk+UajtLB+PIs8ZD
 js3vEqaCocx7vcwOz/YS5sKk6rimiTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-ZeIqJevEPgudTbsJh2jYBw-1; Thu, 25 Feb 2021 05:25:24 -0500
X-MC-Unique: ZeIqJevEPgudTbsJh2jYBw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6EFE106BB24;
 Thu, 25 Feb 2021 10:25:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-4.ams2.redhat.com
 [10.36.114.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 638A550B44;
 Thu, 25 Feb 2021 10:25:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CBBF18000A7; Thu, 25 Feb 2021 11:25:20 +0100 (CET)
Date: Thu, 25 Feb 2021 11:25:20 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH] drm/vkms: Add support for virtual hardware mode
Message-ID: <20210225102520.uysa4muovemqi66n@sirius.home.kraxel.org>
References: <20210224105509.yzdimgbu2jwe3auf@adolin>
 <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFwdHaaGs8BPSAah1Vp5pJWTzxoruLgOWxQu1aDAyCKLQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 10:09:42AM +0100, Daniel Vetter wrote:
> On Wed, Feb 24, 2021 at 11:55 AM Sumera Priyadarsini
> <sylphrenadin@gmail.com> wrote:
> >
> > Add a virtual hardware or vblank-less mode as a module to enable
> > VKMS to emulate virtual graphic drivers. This mode can be enabled
> > by setting enable_virtual_hw=1 at the time of loading VKMS.
> >
> > A new function vkms_crtc_composer() has been added to bypass the
> > vblank mode and is called directly in the atomic hook in
> > vkms_atomic_begin(). However, some crc captures still use vblanks
> > which causes the crc-based igt tests to crash. Currently, I am unsure
> > about how to approach one-shot implementation of crc reads so I am
> > still working on that.
> 
> Gerd, Zack: For virtual hw like virtio-gpu or vmwgfx that does
> one-shot upload and damage tracking, what do you think is the best way
> to capture crc for validation? Assuming that's even on the plans
> anywhere ...
> 
> Ideally it'd be a crc that the host side captures, so that we really
> have end-to-end validation, including the damage uploads and all that.

Disclaimer:  Not knowing much about the crc thing beside having noticed
it exists and seems to be used for display content checking.

> For vkms we're going for now with one-shot crc generation after each
> atomic flip (or DIRTYFB ioctl call). Will need a pile of igt changes,
> but seems like the most fitting model.
> Other option would be that we'd wire up something on the kernel side
> that generates a crc on-demand every time igt reads a new crc value
> (maybe with some rate limiting). But that's not really how virtual hw
> works when everything is pushed explicitly to the host side.

igt runs inside the guest, right?

You can ask qemu to write out a screen dump.  Reading that and calculate
a crc from it should be easy.  But the tricky part is how to coordinate
guest and host then.  qemu autotesting typically runs on the host,
connected to qemu (monitor) and guest (ssh or serial console) so it can
control both host and guest side.

Another option to access the screen would be vnc.  With user networking
and a guest forwarding rule it should be possible to allow the guest
access the qemu vnc server for its own display.  Would be more effort to
capture the display, but it would for the most part take the host out of
the picture.  The guest could coordinate everything on its own then.

On-demand crc via debugfs or ioctl would work too, but yes that wouldn't
verify the host-side.  At least not without virtio protocol extensions.
We could add a new command asking the host to crc the display and return
the result for on-demand crc.  Or add a crc request flag to an existing
command (VIRTIO_GPU_CMD_RESOURCE_FLUSH probably).

take care,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

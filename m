Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CF124584C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Aug 2020 17:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932546E221;
	Sun, 16 Aug 2020 15:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852646E221
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Aug 2020 15:17:55 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E3D388050E;
 Sun, 16 Aug 2020 17:17:50 +0200 (CEST)
Date: Sun, 16 Aug 2020 17:17:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH RESEND v12 0/4] Panel rotation patches
Message-ID: <20200816151749.GA1394979@ravnborg.org>
References: <20200813215609.28643-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813215609.28643-1-digetx@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=8w4ccKQgAAAA:20 a=e5mUnYsNAAAA:8 a=TCdPBaVuNUQlGkixCqMA:9
 a=CjuIK1q_8ugA:10 a=W4TVW4IDbPiebHqcZpNg:22 a=AjGcO6oz07-iQ99wixmX:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Derek Basehore <dbasehore@chromium.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Fri, Aug 14, 2020 at 12:56:05AM +0300, Dmitry Osipenko wrote:
> Hello!
> 
> This series adds support for display panel's DT rotation property. It's a
> continuation of the work that was initially started by Derek Basehore for
> the panel driver that is used by some Mediatek device [1]. I picked up the
> Derek's patches and added my t-b and r-b tags to them, I also added
> rotation support to the panel-lvds and panel-simple drivers.
> 
> We need the rotation support for the Nexus 7 tablet device which is now
> supported by the upstream kernel, the device has display panel mounted
> upside-down and it uses panel-lvds [2].
> 
> [1] https://lkml.org/lkml/2020/3/5/1119
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi?#n1036
> 
> Changelog:
> 
> v12: - No code changes. The v11 missed v5.9 release, re-sending patches
>        for the v5.10 kernel. Please review and apply patches to linux-next,
>        thanks in advance!
> 
> v11: - This series is factored out from this patchset [3] because these
>        patches do not have hard dependency on the Tegra DRM patches and
>        it should be nicer to review and apply the properly grouped patches.
> 
>      - Initially [3] only touched the panel-lvds driver and Emil Velikov
>        suggested that it will be better to support more panels in the review
>        comments to [3]. So I included the Derek's patch for the BOE panel
>        and added rotation support to the panel-simple driver. I tested that
>        panel-lvds and panel-simple work properly with the rotated panel using
>        the Opentegra Xorg driver [4] and Wayland Weston [5].
> 
>      - The panel-lvds driver now prints a error message if rotation property
>        fails to be parsed.
> 
> [3] https://lore.kernel.org/lkml/20200614200121.14147-1-digetx@gmail.com/
> [4] https://github.com/grate-driver/xf86-video-opentegra/commit/28eb20a3959bbe5bc3a3b67e55977093fd5114ca
> [5] https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/315
> 
> Derek Basehore (2):
>   drm/panel: Add helper for reading DT rotation
>   drm/panel: Read panel orientation for BOE TV101WUM-NL6
> 
> Dmitry Osipenko (2):
>   drm/panel: lvds: Read panel orientation
>   drm/panel-simple: Read panel orientation

Thanks for your persistence with these patches.
While applying I made a few updates:
- fixed two trivial checkpatch warnings
- small update to kernel-doc for the new function, to better match
  surrounding wording
- added error message to panel-boe-tv101wum-nl6.c when failed to get
  orientation
- use same wording in all error messages and use "orientation" and not
  rotation as this matches the called function
 
	Sam

> 
>  drivers/gpu/drm/drm_panel.c                   | 43 +++++++++++++++++++
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    |  6 +++
>  drivers/gpu/drm/panel/panel-lvds.c            | 10 +++++
>  drivers/gpu/drm/panel/panel-simple.c          | 11 +++++
>  include/drm/drm_panel.h                       |  9 ++++
>  5 files changed, 79 insertions(+)
> 
> -- 
> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

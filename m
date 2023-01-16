Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CBD66D063
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 21:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A787710E4C4;
	Mon, 16 Jan 2023 20:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF0B10E4C4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hRkGhkGEnmgInCvs3rVTwzKWsHh71Vg6LNBuwBJhnGI=;
 b=QpnuNWjLm3HBShNHcv1jkSScOozA8nnb9tpP+9W+043hpJ6PGppYJYI84cxZGlrmGe7ujd0PptYxG
 UUvbYWLLqfrxsTfUgKV/DOQoSkAJgPOD5o+u6sNhB99ST605WNzltrTnMSpRVz6aEQk41HeRil52vw
 DvtpDbVTkouMlsjRLL4/z0jE88xfAHyxmDyfHOEGzmyQyQPuL/r2CYcpx1flwP3+rHOCEdicnuvs/W
 jM7Sl2WRxpVKA/mNBJ35JXcIEKPBseR8jqbmHVxwY0qvlMsWz5KI6lrsqzage8xYkyxtnvI445elRs
 23dxmjsrEbVTFfR9rEzkEYmhMT9TGuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hRkGhkGEnmgInCvs3rVTwzKWsHh71Vg6LNBuwBJhnGI=;
 b=mCI+axuI2AfxFUOLQXYc2VJUv0VtmpAfcrLE6qklmT6q+xl8lgRJLmMDbSswchsPqWUlGnmCIrq0A
 k5Y79kqBw==
X-HalOne-ID: f12f8be1-95de-11ed-b1f5-ede074c87fad
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id f12f8be1-95de-11ed-b1f5-ede074c87fad;
 Mon, 16 Jan 2023 20:47:09 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:47:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/22] drm: Remove includes for drm_crtc_helper.h
Message-ID: <Y8W3y32sOpP3D6YX@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-1-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Mon, Jan 16, 2023 at 02:12:13PM +0100, Thomas Zimmermann wrote:
> A lot of source files include drm_crtc_helper.h for its contained
> include statements. This leads to excessive compile-time dependencies.
> 
> Where possible, remove the include statements for drm_crtc_helper.h
> and include the required source files directly. Also remove the
> include statements from drm_crtc_helper.h itself, which doesn't need
> most of them.
With this patchset drm_crtc_helper usage is reduced from 85 places to 35
places. And the 35 places is only .c files.
This is a very nice reduction of bloat! I hope this has a measureable
effect on building times.

I was working on something similar, but that approach only added missing
includes, and did not kill all the unnessesary includes - which I think
is the biggest win here.

All patches are:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

For a few of them the r-b is conditional, see the specific comments
posted.


I did a build check here with the archs and config I verifies with.
This covers "alpha arm arm64 sparc64 i386 x86 powerpc s390 riscv sh"
and everything was fine. I have a few specific configs to pull in
drivers that need a bit extra to be built.
So I consider build coverage OK for applying, but it would be nice to
wait a few days for the bots to verify too.

My own work on slimming drm_atomic_helper.h and drm_print.h will be
rebased on top of your work before I continue it.
I need to look into removing unused includes too.

	Sam

> 
> I built this patchset on x86-64, aarch64 and arm. Hopefully I found
> all include dependencies.
> 
> Thanks to Sam Ravnborg for bringing this to my attention.
> 
> Thomas Zimmermann (22):
>   drm/amdgpu: Fix coding style
>   drm: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/amdgpu: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/arm/komeda: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/aspeed: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/ast: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/bridge: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/gma500: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/i2c/ch7006: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/ingenic: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/kmb: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/logicvc: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/nouveau: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/radeon: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/rockchip: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/shmobile: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/sprd: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/sun4i: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/tidss: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/udl: Remove unnecessary include statements for drm_crtc_helper.h
>   drm/vboxvideo: Remove unnecessary include statements for
>     drm_crtc_helper.h
>   drm/crtc-helper: Remove most include statements from drm_crtc_helper.h
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c     |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c         |  5 +++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c        |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_encoders.c       |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c            |  1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h           |  1 -
>  drivers/gpu/drm/amd/amdgpu/atombios_crtc.c         |  1 -
>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  1 -
>  drivers/gpu/drm/amd/amdgpu/dce_v10_0.c             |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v11_0.c             |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v6_0.c              |  2 ++
>  drivers/gpu/drm/amd/amdgpu/dce_v8_0.c              |  2 ++
>  drivers/gpu/drm/arm/display/komeda/komeda_crtc.c   |  1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_kms.h    |  1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c           |  1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c            |  1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c            |  1 -
>  drivers/gpu/drm/ast/ast_drv.c                      |  1 -
>  drivers/gpu/drm/ast/ast_main.c                     |  1 -
>  drivers/gpu/drm/ast/ast_mode.c                     |  1 -
>  drivers/gpu/drm/bridge/analogix/analogix-anx6345.c |  1 -
>  drivers/gpu/drm/bridge/analogix/anx7625.c          |  1 -
>  .../gpu/drm/bridge/cadence/cdns-mhdp8546-core.c    |  1 -
>  drivers/gpu/drm/bridge/ite-it6505.c                |  1 -
>  drivers/gpu/drm/bridge/ite-it66121.c               |  1 -
>  drivers/gpu/drm/bridge/tc358768.c                  |  1 -
>  drivers/gpu/drm/bridge/tc358775.c                  |  1 -
>  drivers/gpu/drm/drm_crtc_helper.c                  |  1 -
>  drivers/gpu/drm/drm_lease.c                        |  2 +-
>  drivers/gpu/drm/drm_plane_helper.c                 |  1 -
>  drivers/gpu/drm/gma500/cdv_device.c                |  1 +
>  drivers/gpu/drm/gma500/cdv_intel_crt.c             |  2 ++
>  drivers/gpu/drm/gma500/cdv_intel_display.c         |  1 +
>  drivers/gpu/drm/gma500/cdv_intel_dp.c              |  1 +
>  drivers/gpu/drm/gma500/cdv_intel_hdmi.c            |  2 ++
>  drivers/gpu/drm/gma500/cdv_intel_lvds.c            |  2 ++
>  drivers/gpu/drm/gma500/framebuffer.c               |  2 ++
>  drivers/gpu/drm/gma500/gma_display.c               |  2 ++
>  drivers/gpu/drm/gma500/oaktrail_crtc.c             |  1 +
>  drivers/gpu/drm/gma500/oaktrail_hdmi.c             |  2 ++
>  drivers/gpu/drm/gma500/oaktrail_lvds.c             |  1 +
>  drivers/gpu/drm/gma500/psb_device.c                |  1 +
>  drivers/gpu/drm/gma500/psb_intel_display.c         |  3 +++
>  drivers/gpu/drm/gma500/psb_intel_drv.h             |  1 -
>  drivers/gpu/drm/gma500/psb_intel_lvds.c            |  2 ++
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c            |  2 ++
>  drivers/gpu/drm/i2c/ch7006_drv.c                   |  2 ++
>  drivers/gpu/drm/i2c/ch7006_priv.h                  |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  1 -
>  drivers/gpu/drm/kmb/kmb_crtc.c                     |  1 -
>  drivers/gpu/drm/kmb/kmb_plane.c                    |  1 -
>  drivers/gpu/drm/logicvc/logicvc_interface.c        |  1 -
>  drivers/gpu/drm/logicvc/logicvc_mode.c             |  1 -
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c            |  1 +
>  drivers/gpu/drm/nouveau/dispnv04/dac.c             |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvmodesnv17.c     |  1 -
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  2 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/head.c            |  1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c              |  1 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c              |  1 -
>  drivers/gpu/drm/radeon/atombios_crtc.c             |  2 +-
>  drivers/gpu/drm/radeon/atombios_encoders.c         |  1 +
>  drivers/gpu/drm/radeon/r300.c                      |  1 -
>  drivers/gpu/drm/radeon/radeon_asic.c               |  1 -
>  drivers/gpu/drm/radeon/radeon_connectors.c         |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c            |  1 +
>  drivers/gpu/drm/radeon/radeon_drv.c                |  1 -
>  drivers/gpu/drm/radeon/radeon_encoders.c           |  1 -
>  drivers/gpu/drm/radeon/radeon_irq_kms.c            |  1 -
>  drivers/gpu/drm/radeon/radeon_legacy_crtc.c        |  2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |  2 +-
>  drivers/gpu/drm/radeon/radeon_legacy_tv.c          |  1 -
>  drivers/gpu/drm/radeon/radeon_mode.h               |  2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  1 -
>  drivers/gpu/drm/shmobile/shmob_drm_crtc.c          |  2 ++
>  drivers/gpu/drm/shmobile/shmob_drm_drv.c           |  1 -
>  drivers/gpu/drm/shmobile/shmob_drm_plane.c         |  1 -
>  drivers/gpu/drm/sprd/sprd_dpu.c                    |  1 -
>  drivers/gpu/drm/sprd/sprd_drm.c                    |  1 -
>  drivers/gpu/drm/sprd/sprd_dsi.c                    |  1 -
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c              |  2 +-
>  drivers/gpu/drm/tidss/tidss_crtc.c                 |  1 -
>  drivers/gpu/drm/tidss/tidss_drv.c                  |  1 -
>  drivers/gpu/drm/tidss/tidss_encoder.c              |  2 +-
>  drivers/gpu/drm/tidss/tidss_kms.c                  |  1 -
>  drivers/gpu/drm/tidss/tidss_plane.c                |  1 -
>  drivers/gpu/drm/udl/udl_drv.c                      |  2 +-
>  drivers/gpu/drm/udl/udl_modeset.c                  |  1 -
>  drivers/gpu/drm/vboxvideo/vbox_drv.c               |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_main.c              |  1 -
>  include/drm/drm_crtc_helper.h                      | 14 +++++++++-----
>  include/drm/drm_fixed.h                            |  1 +
>  94 files changed, 70 insertions(+), 70 deletions(-)
> 
> 
> base-commit: 68d139b609a97a83e7c231189d4864aba4e1679b
> prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
> prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
> prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
> -- 
> 2.39.0

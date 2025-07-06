Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A3AF0381
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 21:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B7910E5FA;
	Tue,  1 Jul 2025 19:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Tr7zAbjX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD5710E64D
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 19:18:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A1DD6778;
 Tue,  1 Jul 2025 21:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1751397485;
 bh=kq8tQ3cbn8KZbaq2vDg+qQTtG0aqT0dqJB6ROLVVJgY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tr7zAbjXx3UnXiCSNCSS46D+8w/by9NPy6jSB1PQZjj4zgWvFogQjAPz/uLIIylT2
 z+dwHBvN0U+g4Ors86DdYRiTXpf99D7qSsxtwj5xy4CEp0GojW/KL+gJT/o+IDrghX
 AXAILN5KScYKRFclTss2zGpObMnCpuxtQVeQ4HMg=
Date: Tue, 1 Jul 2025 22:18:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 04/19] drm: Pass the format info to .fb_create()
Message-ID: <20250701191801.GA17819@pendragon.ideasonboard.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-5-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-5-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,

Thank you for the patch.

On Tue, Jul 01, 2025 at 12:07:07PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pass along the format information from the top to .fb_create()
> so that we can avoid redundant (and somewhat expensive) lookups
> in the drivers.
> 
> Done with cocci (with some manual fixups):
> @@
> identifier func =~ ".*create.*";
> identifier dev, file, mode_cmd;
> @@
> struct drm_framebuffer *func(
>        struct drm_device *dev,
>        struct drm_file *file,
> +      const struct drm_format_info *info,
>        const struct drm_mode_fb_cmd2 *mode_cmd)
> {
> ...
> (
> - const struct drm_format_info *info = drm_get_format_info(...);
> |
> - const struct drm_format_info *info;
> ...
> - info = drm_get_format_info(...);
> )
> <...
> - if (!info)
> -    return ...;
> ...>
> }
> 
> @@
> identifier func =~ ".*create.*";
> identifier dev, file, mode_cmd;
> @@
> struct drm_framebuffer *func(
>        struct drm_device *dev,
>        struct drm_file *file,
> +      const struct drm_format_info *info,
>        const struct drm_mode_fb_cmd2 *mode_cmd)
> {
> ...
> }
> 
> @find@
> identifier fb_create_func =~ ".*create.*";
> identifier dev, file, mode_cmd;
> @@
> struct drm_framebuffer *fb_create_func(
>        struct drm_device *dev,
>        struct drm_file *file,
> +      const struct drm_format_info *info,
>        const struct drm_mode_fb_cmd2 *mode_cmd);
> 
> @@
> identifier find.fb_create_func;
> expression dev, file, mode_cmd;
> @@
> fb_create_func(dev, file
> +	       ,info
> 	       ,mode_cmd)
> 
> @@
> expression dev, file, mode_cmd;
> @@
> drm_gem_fb_create(dev, file
> +	       ,info
> 	       ,mode_cmd)
> 
> @@
> expression dev, file, mode_cmd;
> @@
> drm_gem_fb_create_with_dirty(dev, file
> +	       ,info
> 	       ,mode_cmd)
> 
> @@
> expression dev, file_priv, mode_cmd;
> identifier info, fb;
> @@
> info = drm_get_format_info(...);
> ...
> fb = dev->mode_config.funcs->fb_create(dev, file_priv
> +                                      ,info
>                                        ,mode_cmd);
> 
> @@
> identifier dev, file_priv, mode_cmd;
> @@
> struct drm_mode_config_funcs {
> ...
> struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
>                                      struct drm_file *file_priv,
> +                                     const struct drm_format_info *info,
>                                      const struct drm_mode_fb_cmd2 *mode_cmd);
> ...
> };
> 
> v2: Fix kernel docs (Laurent)
>     Fix commit msg (Geert)
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Cc: virtualization@lists.linux.dev
> Cc: spice-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-tegra@vger.kernel.org
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c            |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h            |  1 +
>  .../gpu/drm/arm/display/komeda/komeda_framebuffer.c    |  1 +
>  .../gpu/drm/arm/display/komeda/komeda_framebuffer.h    |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c                       |  3 ++-
>  drivers/gpu/drm/armada/armada_fb.c                     |  6 ++----
>  drivers/gpu/drm/armada/armada_fb.h                     |  3 ++-
>  drivers/gpu/drm/drm_framebuffer.c                      |  2 +-
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c           |  4 ++++
>  drivers/gpu/drm/exynos/exynos_drm_fb.c                 |  4 +---
>  drivers/gpu/drm/gma500/framebuffer.c                   |  1 +
>  drivers/gpu/drm/i915/display/intel_fb.c                |  1 +
>  drivers/gpu/drm/i915/display/intel_fb.h                |  1 +
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c              |  5 +++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c                 |  7 ++-----
>  drivers/gpu/drm/msm/msm_drv.h                          |  3 ++-
>  drivers/gpu/drm/msm/msm_fb.c                           |  6 ++----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c                      | 10 ++--------
>  drivers/gpu/drm/nouveau/nouveau_display.c              |  1 +
>  drivers/gpu/drm/nouveau/nouveau_display.h              |  1 +
>  drivers/gpu/drm/omapdrm/omap_fb.c                      |  6 ++----
>  drivers/gpu/drm/omapdrm/omap_fb.h                      |  3 ++-
>  drivers/gpu/drm/qxl/qxl_display.c                      |  1 +
>  drivers/gpu/drm/radeon/radeon_display.c                |  1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c          |  3 ++-
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c           |  3 ++-
>  drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c       |  3 ++-
>  drivers/gpu/drm/rockchip/rockchip_drm_fb.c             |  7 +------
>  drivers/gpu/drm/tegra/drm.h                            |  1 +
>  drivers/gpu/drm/tegra/fb.c                             |  4 +---
>  drivers/gpu/drm/tests/drm_framebuffer_test.c           |  1 +
>  drivers/gpu/drm/vc4/vc4_kms.c                          |  3 ++-
>  drivers/gpu/drm/virtio/virtgpu_display.c               |  1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                    |  1 +
>  drivers/gpu/drm/xen/xen_drm_front_kms.c                |  1 +
>  drivers/gpu/drm/xlnx/zynqmp_kms.c                      |  3 ++-
>  include/drm/drm_gem_framebuffer_helper.h               |  3 +++
>  include/drm/drm_mode_config.h                          |  1 +
>  38 files changed, 59 insertions(+), 49 deletions(-)

[snip]

> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index e971e1b8a850..2e848b816218 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -82,6 +82,7 @@ struct drm_mode_config_funcs {
>  	 */

It would be nice to document the new parameter here. With that
addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	struct drm_framebuffer *(*fb_create)(struct drm_device *dev,
>  					     struct drm_file *file_priv,
> +					     const struct drm_format_info *info,
>  					     const struct drm_mode_fb_cmd2 *mode_cmd);
>  
>  	/**

-- 
Regards,

Laurent Pinchart

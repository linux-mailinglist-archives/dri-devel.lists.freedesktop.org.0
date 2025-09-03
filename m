Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB3B4297F
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 21:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE8210E0FD;
	Wed,  3 Sep 2025 19:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVLruMOC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FA910E04A;
 Wed,  3 Sep 2025 19:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756926604; x=1788462604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nqS3UzHQKIkIb/Rkk4XlaX9LsWxMZrg1+PMmz+JaHDI=;
 b=ZVLruMOCkYJ4zQRN8G57c41PSkAWYjG19uZwMVq8xnvczcp0L5wlEGc0
 3ubyy/THqIH6LVlUOQB771UZKYn3zY3GgUC+IOZ4CVKBGNh/GvNA0G5bD
 mz4tgvuBLo6IzenyMm1gn2BMWuUs6gRm+j5WpmGOclKBC3XZHYXjAKBb3
 QFaP/Nf0EnHr8gbhzsMDCLXyAbNXOHPr7F7OojVaTvZoZqpBN7aumdD+t
 tcUTQhcm9IFV6XPi7qX+bd6XAMibKqRpeiax5D2MIGErgvNwkdhMDzC02
 Hd/H4JErwmq1rabqLCo2RXxHN5+0teCSBmZ6IDzX2T9ilcTbWR9UvqJrd Q==;
X-CSE-ConnectionGUID: lovc/5k3QSKkyNYSMnpwbw==
X-CSE-MsgGUID: GiAoQTR0Sk+ylaIJgT3IbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="69513733"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="69513733"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 12:10:01 -0700
X-CSE-ConnectionGUID: nGwL7IPyTYW/wuPoo+6uVg==
X-CSE-MsgGUID: AsgfiIXISiG9KRkXNJLYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171814105"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.11])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 12:09:45 -0700
Date: Wed, 3 Sep 2025 22:09:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, Russell King <linux@armlinux.org.uk>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: Re: [PATCH v2 00/37] drm/atomic: Get rid of existing states (not
 really)
Message-ID: <aLiSdWgOl15jb8Ga@intel.com>
References: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250902-drm-no-more-existing-state-v2-0-de98fc5f6d66@kernel.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Sep 02, 2025 at 11:34:59AM +0200, Maxime Ripard wrote:
> Hi,
> 
> Here's a series to get rid of the drm_atomic_helper_get_existing_*_state
> accessors.
> 
> The initial intent was to remove the __drm_*_state->state pointer to
> only rely on old and new states, but we still need it now to know which
> of the two we need to free: if a state has not been committed (either
> dropped or checked only), then we need to free the new one, if it has
> been committed we need to free the old state. 
> 
> Thus, the state pointer is kept (and documented) only to point to the
> state we should free eventually.
> 
> All users have been converted to the relevant old or new state
> accessors.  
> 
> This was tested on tidss.
> 
> Let me know what you think,
> Maxime
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

<replying again to see if my smtp issues are now solved...>

Other than the pre-existing ingenic private state issue that
Dmitry spotted I didn't see anything obviously wrong.

So apart from that the series is
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
> Changes in v2:
> - Dropped the first and second patches
> - Reworked the recipient list to be nicer with SMTPs
> - Link to v1: https://lore.kernel.org/r/20250825-drm-no-more-existing-state-v1-0-f08ccd9f85c9@kernel.org
> 
> ---
> Maxime Ripard (37):
>       drm/atomic: Convert drm_atomic_get_connector_state() to use new connector state
>       drm/atomic: Remove unused drm_atomic_get_existing_connector_state()
>       drm/atomic: Document __drm_connectors_state state pointer
>       drm/atomic: Convert __drm_atomic_get_current_plane_state() to modern accessor
>       drm/atomic: Convert drm_atomic_get_plane_state() to use new plane state
>       drm/vkms: Convert vkms_crtc_atomic_check() to use new plane state
>       drm/tilcdc: crtc: Use drm_atomic_helper_check_crtc_primary_plane()
>       drm/atomic: Remove unused drm_atomic_get_existing_plane_state()
>       drm/atomic: Document __drm_planes_state state pointer
>       drm/atomic: Convert drm_atomic_get_crtc_state() to use new connector state
>       drm/ingenic: ipu: Switch to drm_atomic_get_new_crtc_state()
>       drm/arm/malidp: Switch to drm_atomic_get_new_crtc_state()
>       drm/armada: Switch to drm_atomic_get_new_crtc_state()
>       drm/atmel-hlcdc: Switch to drm_atomic_get_new_crtc_state()
>       drm/exynos: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-dc: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-dcss: Switch to drm_atomic_get_new_crtc_state()
>       drm/imx-ipuv3: Switch to drm_atomic_get_new_crtc_state()
>       drm/ingenic: Switch to drm_atomic_get_new_crtc_state()
>       drm/kmb: Switch to drm_atomic_get_new_crtc_state()
>       drm/logicvc: Switch to drm_atomic_get_new_crtc_state()
>       drm/loongson: Switch to drm_atomic_get_new_crtc_state()
>       drm/mediatek: Switch to drm_atomic_get_new_crtc_state()
>       drm/msm/mdp5: Switch to drm_atomic_get_new_crtc_state()
>       drm/omap: Switch to drm_atomic_get_new_crtc_state()
>       drm/rockchip: Switch to drm_atomic_get_new_crtc_state()
>       drm/sun4i: Switch to drm_atomic_get_new_crtc_state()
>       drm/tegra: Switch to drm_atomic_get_new_crtc_state()
>       drm/tilcdc: Switch to drm_atomic_get_new_crtc_state()
>       drm/vboxvideo: Switch to drm_atomic_get_new_crtc_state()
>       drm/vc4: Switch to drm_atomic_get_new_crtc_state()
>       drm/atomic: Switch to drm_atomic_get_new_crtc_state()
>       drm/framebuffer: Switch to drm_atomic_get_new_crtc_state()
>       drm/atomic: Remove unused drm_atomic_get_existing_crtc_state()
>       drm/atomic: Document __drm_crtcs_state state pointer
>       drm/atomic: Convert drm_atomic_get_private_obj_state() to use new plane state
>       drm/atomic: Document __drm_private_objs_state state pointer
> 
>  drivers/gpu/drm/arm/malidp_planes.c             |   2 +-
>  drivers/gpu/drm/armada/armada_plane.c           |   3 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c |   2 +-
>  drivers/gpu/drm/drm_atomic.c                    |  21 ++--
>  drivers/gpu/drm/drm_framebuffer.c               |   2 +-
>  drivers/gpu/drm/exynos/exynos_drm_plane.c       |   2 +-
>  drivers/gpu/drm/imx/dc/dc-plane.c               |   2 +-
>  drivers/gpu/drm/imx/dcss/dcss-plane.c           |   4 +-
>  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c         |   3 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c       |   3 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c           |   4 +-
>  drivers/gpu/drm/kmb/kmb_plane.c                 |   3 +-
>  drivers/gpu/drm/logicvc/logicvc_layer.c         |   4 +-
>  drivers/gpu/drm/loongson/lsdc_plane.c           |   2 +-
>  drivers/gpu/drm/mediatek/mtk_plane.c            |   3 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c      |   7 +-
>  drivers/gpu/drm/omapdrm/omap_plane.c            |   2 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c     |   6 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c    |   2 +-
>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c          |   3 +-
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c          |   3 +-
>  drivers/gpu/drm/tegra/dc.c                      |   2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c            |   9 +-
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c           |   3 +-
>  drivers/gpu/drm/vboxvideo/vbox_mode.c           |   8 +-
>  drivers/gpu/drm/vc4/vc4_plane.c                 |   6 +-
>  drivers/gpu/drm/vkms/vkms_crtc.c                |   4 +-
>  include/drm/drm_atomic.h                        | 144 ++++++++++++------------
>  28 files changed, 124 insertions(+), 135 deletions(-)
> ---
> base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
> change-id: 20250825-drm-no-more-existing-state-9b3252c1a33b
> 
> Best regards,
> -- 
> Maxime Ripard <mripard@kernel.org>

-- 
Ville Syrjälä
Intel

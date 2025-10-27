Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6511BC0C6FA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 09:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6EC10E3B5;
	Mon, 27 Oct 2025 08:50:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fJD1tXv/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BAC10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761555008; x=1793091008;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lQFP5i4h0NhDRiG8WGVwpbu31fE0ocV55y7NMexkC28=;
 b=fJD1tXv/L4aclYX8pE9TgIEVOUmexMmzSGSxHpOCrO0ZvXGtl1TW38jy
 Cu4K59nr2QuOkEQbNS6XJoPylX2vzwBxsGafr4yZjMJzwB2iFvmv+77PE
 +tlbewZXnhKbRfc0KJkwXCch9PZ+2glSutGOgFrSwbhv0PflJzSqeeaC0
 YPlFsvZGtKRG84xL5ElToy2fpLZDSHxzzjc7V8KTt66rH+UBp3OJK7JtI
 /Tos+OeHHXh1NWl960nWITylTl+8Adb3fBGYmvYB+slVICPHG+2uJsBOS
 Wt7GRCtAh/lHczT1FbVeLgl4r6FOVByvy3T6tP8xv2H9wih/L/eIOTmX2 A==;
X-CSE-ConnectionGUID: P+zlbw8zRtiacTZUHcKgIA==
X-CSE-MsgGUID: u9N5lpcnSQKcLDh5Nmo2rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63722760"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="63722760"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:50:08 -0700
X-CSE-ConnectionGUID: RWdTYCHBRXaBnyFA3fxD1Q==
X-CSE-MsgGUID: hFLDCByJQnS1Drk++R66Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184216145"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 01:49:59 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shreeya Patel
 <shreeya.patel@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@collabora.com,
 linux-mmc@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
In-Reply-To: <20251025164023.308884-12-yury.norov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251025164023.308884-1-yury.norov@gmail.com>
 <20251025164023.308884-12-yury.norov@gmail.com>
Date: Mon, 27 Oct 2025 10:49:56 +0200
Message-ID: <6e82c656573d436b6c53d242a0ed45007e5849ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sat, 25 Oct 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
> confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
> as appropriate.

GENMASK argument order matches how most specs I've ever looked at define
bits. It's high:low. I, for one, think it's silly to add another set of
macros purely to swap the argument order.

> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> ---
>  drivers/gpu/drm/rockchip/rockchip_lvds.h             | 2 +-
>  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c         | 4 ++--
>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h | 4 ++--
>  drivers/mmc/host/dw_mmc-rockchip.c                   | 4 ++--
>  drivers/soc/rockchip/grf.c                           | 4 ++--
>  sound/soc/rockchip/rockchip_i2s_tdm.h                | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> index 2d92447d819b..e79e6031be59 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
> +++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
> @@ -115,7 +115,7 @@
>  #define   PX30_LVDS_INVERT_DCLK(val)		FIELD_PREP_WM16(BIT(5), (val))
>  
>  #define PX30_LVDS_GRF_PD_VO_CON1		0x438
> -#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
> +#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(BITS(13, 14), (val))

IMO this change would make more sense in defining register contents:

+#define   PX30_LVDS_FORMAT_MASK			GENMASK(14, 13)
-#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(GENMASK(14, 13), (val))
+#define   PX30_LVDS_FORMAT(val)			FIELD_PREP_WM16(PX30_LVDS_FORMAT_MASK, (val))


BR,
Jani.


>  #define   PX30_LVDS_MODE_EN(val)		FIELD_PREP_WM16(BIT(12), (val))
>  #define   PX30_LVDS_MSBSEL(val)			FIELD_PREP_WM16(BIT(11), (val))
>  #define   PX30_LVDS_P2S_EN(val)			FIELD_PREP_WM16(BIT(6), (val))
> diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> index 38c49030c7ab..438fea5f6f6d 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> @@ -1698,7 +1698,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
>  		val = rk3588_get_hdmi_pol(polflags);
>  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(1), 1));
>  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
> -			     FIELD_PREP_WM16(GENMASK(6, 5), val));
> +			     FIELD_PREP_WM16(BITS(5, 6), val));
>  		break;
>  	case ROCKCHIP_VOP2_EP_HDMI1:
>  		div &= ~RK3588_DSP_IF_EDP_HDMI1_DCLK_DIV;
> @@ -1711,7 +1711,7 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
>  		val = rk3588_get_hdmi_pol(polflags);
>  		regmap_write(vop2->vop_grf, RK3588_GRF_VOP_CON2, FIELD_PREP_WM16(BIT(4), 1));
>  		regmap_write(vop2->vo1_grf, RK3588_GRF_VO1_CON0,
> -			     FIELD_PREP_WM16(GENMASK(8, 7), val));
> +			     FIELD_PREP_WM16(BITS(7, 8), val));
>  		break;
>  	case ROCKCHIP_VOP2_EP_EDP0:
>  		div &= ~RK3588_DSP_IF_EDP_HDMI0_DCLK_DIV;
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> index b13f58e31944..14df3f53ff8f 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.h
> @@ -12,8 +12,8 @@
>  #include <linux/bitops.h>
>  #include <linux/hw_bitfield.h>
>  
> -#define UPDATE(x, h, l)		FIELD_PREP(GENMASK((h), (l)), (x))
> -#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(GENMASK((h), (l)), (v))
> +#define UPDATE(x, h, l)		FIELD_PREP(BITS((l), (h)), (x))
> +#define HIWORD_UPDATE(v, h, l)	FIELD_PREP_WM16(BITS((l), (h)), (v))
>  
>  /* SYS_GRF */
>  #define SYS_GRF_SOC_CON1			0x0304
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
> index 82dd906bb002..7fac1a7281bf 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -148,10 +148,10 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
>  
>  	if (sample)
>  		mci_writel(host, TIMING_CON1,
> -			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
> +			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
>  	else
>  		mci_writel(host, TIMING_CON0,
> -			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
> +			   FIELD_PREP_WM16(BITS(1, 11), raw_value));
>  
>  	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
>  		sample ? "sample" : "drv", degrees, delay_num,
> diff --git a/drivers/soc/rockchip/grf.c b/drivers/soc/rockchip/grf.c
> index 344870da7675..89fd4a4c69eb 100644
> --- a/drivers/soc/rockchip/grf.c
> +++ b/drivers/soc/rockchip/grf.c
> @@ -125,8 +125,8 @@ static const struct rockchip_grf_info rk3566_pipegrf __initconst = {
>  #define RK3576_SYSGRF_SOC_CON1		0x0004
>  
>  static const struct rockchip_grf_value rk3576_defaults_sys_grf[] __initconst = {
> -	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(7, 6), 3) },
> -	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(GENMASK(9, 8), 3) },
> +	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(6, 7), 3) },
> +	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, FIELD_PREP_WM16_CONST(BITS(8, 9), 3) },
>  };
>  
>  static const struct rockchip_grf_info rk3576_sysgrf __initconst = {
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.h b/sound/soc/rockchip/rockchip_i2s_tdm.h
> index 0171e05ee886..eee6db372ee7 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.h
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.h
> @@ -287,7 +287,7 @@ enum {
>  #define I2S_TDM_RXCR	(0x0034)
>  #define I2S_CLKDIV	(0x0038)
>  
> -#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(GENMASK((h), (l)), (v)))
> +#define HIWORD_UPDATE(v, h, l)	(FIELD_PREP_WM16_CONST(BITS((l), (h)), (v)))
>  
>  /* PX30 GRF CONFIGS */
>  #define PX30_I2S0_CLK_IN_SRC_FROM_TX		HIWORD_UPDATE(1, 13, 12)

-- 
Jani Nikula, Intel

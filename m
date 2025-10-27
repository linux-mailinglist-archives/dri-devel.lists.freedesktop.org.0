Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C851DC0D7B0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0926910E462;
	Mon, 27 Oct 2025 12:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="kDy9KX24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A749D10E462
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:21:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1761567688; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=B37m3tRXg9231oauumFgq3IS919cZOBg5SjkoJsfAAEv3xg7NZzheR2/o1Z6DWXuET3Phh+B65kMnrMCibaDLL47gqWercUuzNjDdQ/QEDk4PDMfokyzUxleEz3k8oEQQE8eM/LGA6cXBQj3Z5m2bCDyEdLFNH72QNvwSyqfTHs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1761567688;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=JzOl43h72qIg903VcLgPPqEaQOxJyebUM6Y8SFlK3FI=; 
 b=PHxByQ8byaqaWcg7cDcy7ZXDXysm3SbInlN64ODpr8FHXGPi7kW3HXHt+zOniUMSCoQtu7DUByVBCUDCbhdmo00hUk8zNn6A7YdjO/9J7MEh1bEETNOogOlizsXIBRbcRpyX3gSWzK3sSO0p/n4fuKKbZFBpqUY9Cjzvie0NDxU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761567688; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=JzOl43h72qIg903VcLgPPqEaQOxJyebUM6Y8SFlK3FI=;
 b=kDy9KX2417EVcr5ZvR/y8uZmt2IgIbpSIydVjZEiNT4mUYn+LTARqHpo2PI9/c+O
 XrqA+KwqLPKUa7++D+dlwBTP8fipyA2OMRQQKoikyQmHtIagGSU4zKzvjDMhQPiCI7W
 A4THQcscyFyTp2lEGrAOYogNvIgC0YM8dyTtux88=
Received: by mx.zohomail.com with SMTPS id 1761567685152749.0643459384486;
 Mon, 27 Oct 2025 05:21:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, kernel@collabora.com, linux-mmc@vger.kernel.org, 
 linux-sound@vger.kernel.org, "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 11/21] drivers: don't use GENMASK() in FIELD_PREP_WM16()
Date: Mon, 27 Oct 2025 13:21:15 +0100
Message-ID: <2824034.mvXUDI8C0e@workhorse>
In-Reply-To: <20251025164023.308884-12-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
 <20251025164023.308884-12-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Saturday, 25 October 2025 18:40:10 Central European Standard Time Yury Norov (NVIDIA) wrote:
> Recently added FIELD_PREP_WM16() in a few places uses GENMASK. It's
> confusing and may mislead readers. Switch to BITS() or FIRST_BITS()
> as appropriate.
> 
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
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I made sure there were no accidental changes introduced by the
swapping of values, so in terms of correctness, this appears
all good to me.

Kind regards,
Nicolas Frattaroli




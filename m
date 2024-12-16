Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8789F2DB9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 11:05:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96F610E130;
	Mon, 16 Dec 2024 10:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sYrTFDFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4204610E130
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 10:05:01 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3022c61557cso41338051fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 02:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734343499; x=1734948299; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HLzU3OoGAZg1lvIIB2cj0SjgTHG2tkXZPV4oMUjorKM=;
 b=sYrTFDFdwfBFY9ukM2jXyo+UvCDUDu6nd7zO3x0DNP+w6BnK9Z8gVrlpmQfVWNS639
 cF3Fecn7M/0bs+SKldzTElmeZzEJG8cX/Xg+Yle2iTt/X6isGrbIeHCZkocX9gdi2Abv
 Zz8hQ6X5WiPvULoifd08yv2Ew8gM/0mrzMtloc3iHrpfmfhpMf+dAjTmtubgv461luBK
 5oNjTEbLrV7FUEPe44XBirsLh4MD2/CGU8yV6OxRzRW6iKm1sPQGXWvbTlYcIvuHmIVI
 oaF5TGzQ/QlaEDsf3AR38FSqzqci04/sOs4JmxfgwsHIa2MmUZiv5KPtRiw28gHH8Pwi
 Ww5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734343499; x=1734948299;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HLzU3OoGAZg1lvIIB2cj0SjgTHG2tkXZPV4oMUjorKM=;
 b=TnLH702w8XMVfhn+Q6M7CGZjje96ueRYwGnDfv3KrqXmn2FS9YSwQBe4czyvBOwWB6
 +t8/R7aaJWYUR5R89N7RUkvUOB/J3UzyubIlfRH1MtlTkH0LxYgqqM+HpY3Y9HX69RRJ
 bWAG7cqZiFarDiKJRoR9Z6A+8MDQRTSngYNxJt+J5Mx22oZnAWP5ZAfVXE3ojuTpe23J
 A6RSeGVZ/h/TQikl/uJG094bCUxFopx39ctPOTqKvSV87AkTRz49xPR/9ppACjGH+hba
 Q2MgXsgEdit2hVfOVj+Av0qcHgegV60edirtTt4Nzq/MmoHMPupsN1wk8FB5W6EHkSQV
 Ctaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWDzd4bxJhdlBaDrdQxUzY4WSzZemLN5VuUnyaSvsjCyOJqNirfg3qnN0sh0tHGsI5wlPhxTI9Ark=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiBa3iczl+HEAYmw5KQ6oQJeKXEh3EzwCMbwzN8XJKbTsA4Yb6
 t+c86m3F8PMuWHR//xxGrsTDQPXPAfSoW4RO6wxKAzObqu47j1MHbvDO5QUnbvs=
X-Gm-Gg: ASbGnctBPg9XrE9byPQNwqPp5Jjmc2uNO0XKPIixSGXBp7OMOhxxtXP6TQKTD95AG5J
 1AwGDUfW39Oj71fvGTwXe5pxm8U2zkEMGFuliC9Au5S69oA0gKJa0k4ANZK2RO3fL8qYqxt0BFm
 zx8X2LBR1lOsyKjXMs9ty5PsnYQ7UMpDQqRNMxeVrjRFPFLy61UOviUmJYMBykoeVa80nLoPMjX
 32tWU1cfY2/M2EcbGFuHrI43eCB7n8/WmjJzekE1IIJu5kmrcUIYPSX+tD2lXTCgbcz5hkQguxF
 8lZXWNM1VSBeSMEVjrm0BENfnq3cqX3jtYp9
X-Google-Smtp-Source: AGHT+IEANV1rjeOcZD+mfElWFOCdmwQitk5ard7G/sdmw/kgz+ZvJnKtp9SusUqTBt+TDbtuy27Lww==
X-Received: by 2002:a2e:a99e:0:b0:302:16da:a052 with SMTP id
 38308e7fff4ca-302544ae804mr44008281fa.27.1734343499432; 
 Mon, 16 Dec 2024 02:04:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045239sm8283241fa.36.2024.12.16.02.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 02:04:58 -0800 (PST)
Date: Mon, 16 Dec 2024 12:04:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Damon Ding <damon.ding@rock-chips.com>, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 03/11] drm/rockchip: analogix_dp: Add support for RK3588
Message-ID: <25bh2uy6wg3kcoqmnzt5dwfamc32bjyjlivkqq4cvne6kryj3z@svlz45bbaoy7>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
 <20241216031225.3746-4-damon.ding@rock-chips.com>
 <gwogudb5vae7wu452zwuqmdlyaibenoso4f5pjmu3uttckhy2w@shndol4mz5n4>
 <4395748.ejJDZkT8p0@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4395748.ejJDZkT8p0@diego>
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

On Mon, Dec 16, 2024 at 10:11:54AM +0100, Heiko Stübner wrote:
> Am Montag, 16. Dezember 2024, 09:57:41 CET schrieb Dmitry Baryshkov:
> > On Mon, Dec 16, 2024 at 11:12:17AM +0800, Damon Ding wrote:
> > > RK3588 integrates the analogix eDP 1.3 TX controller IP and the HDMI/eDP
> > > TX Combo PHY based on a Samsung IP block, and there are also two
> > > independent eDP display interface on RK3588 Soc.
> > > 
> > > Add just the basic support for now, i.e. RGB output up to 4K@60Hz, without
> > > the tests of audio, PSR and other eDP 1.3 specific features.
> > > 
> > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Add support for the other eDP output edp1
> > > ---
> > >  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 82 ++++++++++++++++---
> > >  include/drm/bridge/analogix_dp.h              |  3 +-
> > >  2 files changed, 74 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > index 871606a31ef1..4c9a55776ada 100644
> > > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > @@ -51,10 +51,12 @@ struct rockchip_grf_reg_field {
> > >  /**
> > >   * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
> > >   * @lcdc_sel: grf register field of lcdc_sel
> > > + * @edp_mode: grf register field of edp_mode
> > >   * @chip_type: specific chip type
> > >   */
> > >  struct rockchip_dp_chip_data {
> > >  	const struct rockchip_grf_reg_field lcdc_sel;
> > > +	const struct rockchip_grf_reg_field edp_mode;
> > >  	u32	chip_type;
> > >  };
> > >  
> > > @@ -134,12 +136,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
> > >  		return ret;
> > >  	}
> > >  
> > > +	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
> > > +	if (ret != 0)
> > > +		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
> > 
> > Is it to be called for non-eDP hosts too? Or for older hosts?
> 
> The implementation of rockchip_grf_field_write (in patch1) seems to
> take care of checking if that field actually exists and doing nothing if
> not.
> 
> I think eDP/DP is more a naming thing, the Analogix controller is called
> an eDP controller in all documentation things.
> 
> Even back on rk3288, the Analogix-DP, still is called an eDP controller in
> documentation, with the only difference being that it does not contain
> another additional "dedicated" DP controller

At the very least this should be mentioned in the commit message.

> > > +	i = 0;
> > > +	while (is_rockchip(dp_data[i].chip_type))
> > > +		i++;
> > > +
> > > +	if (id >= i) {
> > > +		DRM_DEV_ERROR(dev, "invalid edp id: %d\n", id);
> > > +		return -ENODEV;
> > > +	}
> > 
> > Is it applicable to non-eDP case?
> 
> same as above, it's always called eDP in all pieces of documentation,
> (Compliant with DP 1.2 and eDP 1.3)

Ack

> 
> Heiko
> 
> > > +
> > >  	dp->dev = dev;
> > >  	dp->adp = ERR_PTR(-ENODEV);
> > > -	dp->data = dp_data;
> > > +	dp->data = &dp_data[id];
> > >  	dp->plat_data.panel = panel;
> > >  	dp->plat_data.dev_type = dp->data->chip_type;
> > >  	dp->plat_data.power_on = rockchip_dp_poweron;
> > > @@ -464,19 +507,38 @@ static int rockchip_dp_resume(struct device *dev)
> > >  static DEFINE_RUNTIME_DEV_PM_OPS(rockchip_dp_pm_ops, rockchip_dp_suspend,
> > >  		rockchip_dp_resume, NULL);
> > >  
> > > -static const struct rockchip_dp_chip_data rk3399_edp = {
> > > -	.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > > -	.chip_type = RK3399_EDP,
> > > +static const struct rockchip_dp_chip_data rk3399_edp[] = {
> > > +	{
> > > +		.lcdc_sel = GRF_REG_FIELD(0x6250, 5, 5),
> > > +		.chip_type = RK3399_EDP,
> > > +	},
> > > +	{ /* sentinel */ }
> > > +};
> > > +
> > > +static const struct rockchip_dp_chip_data rk3288_dp[] = {
> > > +	{
> > > +		.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > > +		.chip_type = RK3288_DP,
> > > +	},
> > > +	{ /* sentinel */ }
> > >  };
> > >  
> > > -static const struct rockchip_dp_chip_data rk3288_dp = {
> > > -	.lcdc_sel = GRF_REG_FIELD(0x025c, 5, 5),
> > > -	.chip_type = RK3288_DP,
> > > +static const struct rockchip_dp_chip_data rk3588_edp[] = {
> > > +	{
> > > +		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
> > > +		.chip_type = RK3588_EDP,
> > > +	},
> > > +	{
> > > +		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
> > > +		.chip_type = RK3588_EDP,
> > > +	},
> > > +	{ /* sentinel */ }
> > >  };
> > >  
> > >  static const struct of_device_id rockchip_dp_dt_ids[] = {
> > >  	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
> > >  	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
> > > +	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
> > >  	{}
> > >  };
> > >  MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
> > > diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
> > > index 6002c5666031..54086cb2d97d 100644
> > > --- a/include/drm/bridge/analogix_dp.h
> > > +++ b/include/drm/bridge/analogix_dp.h
> > > @@ -15,11 +15,12 @@ enum analogix_dp_devtype {
> > >  	EXYNOS_DP,
> > >  	RK3288_DP,
> > >  	RK3399_EDP,
> > > +	RK3588_EDP,
> > >  };
> > >  
> > >  static inline bool is_rockchip(enum analogix_dp_devtype type)
> > >  {
> > > -	return type == RK3288_DP || type == RK3399_EDP;
> > > +	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
> > >  }
> > >  
> > >  struct analogix_dp_plat_data {
> > 
> > 
> 
> 
> 
> 

-- 
With best wishes
Dmitry

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B505182FC
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 13:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AD010F9EF;
	Tue,  3 May 2022 11:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470010F9EF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 11:02:19 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nlqIJ-0000jM-Qp; Tue, 03 May 2022 13:02:15 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v11 11/24] drm/rockchip: dw_hdmi: Use auto-generated tables
Date: Tue, 03 May 2022 13:02:14 +0200
Message-ID: <2236782.ElGaqSPkdT@diego>
In-Reply-To: <20220422072841.2206452-12-s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-12-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 22. April 2022, 09:28:28 CEST schrieb Sascha Hauer:
> From: Douglas Anderson <dianders@chromium.org>
> 
> The previous tables for mpll_cfg and curr_ctrl were created using the
> 20-pages of example settings provided by the PHY vendor.  Those
> example settings weren't particularly dense, so there were places
> where we were guessing what the settings would be for 10-bit and
> 12-bit (not that we use those anyway).  It was also always a lot of
> extra work every time we wanted to add a new clock rate since we had
> to cross-reference several tables.
> 
> In <https://crrev.com/c/285855> I've gone through the work to figure
> out how to generate this table automatically.  Let's now use the
> automatically generated table and then we'll never need to look at it
> again.
> 
> We only support 8-bit mode right now and only support a small number
> of clock rates and I've verified that the only 8-bit rate that was
> affected was 148.5.  That mode appears to have been wrong in the old
> table.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

This breaks hdmi on my rk3328-rock64 which then ends up in a
	[CRTC:37:crtc-0] vblank wait timed out

warning-loop.

Some part of the patch11-14 range also creates sparking horizontal
lines on my rk3288-pinky.

I haven't the time to dig overly deep into that, so left out the
hdmi-rate patches (11-14) for now.


Heiko


> ---
> 
> Notes:
>     Changes since v5:
>     - Add missing Signed-off-by me
>     
>     Changes since v3:
>     - new patch
> 
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 130 +++++++++++---------
>  1 file changed, 69 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> index fe4f9556239ac..cb43e7b47157d 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
> @@ -91,80 +91,88 @@ static struct rockchip_hdmi *to_rockchip_hdmi(struct drm_encoder *encoder)
>  
>  static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
>  	{
> -		27000000, {
> -			{ 0x00b3, 0x0000},
> -			{ 0x2153, 0x0000},
> -			{ 0x40f3, 0x0000}
> +		30666000, {
> +			{ 0x00b3, 0x0000 },
> +			{ 0x2153, 0x0000 },
> +			{ 0x40f3, 0x0000 },
>  		},
> -	}, {
> -		36000000, {
> -			{ 0x00b3, 0x0000},
> -			{ 0x2153, 0x0000},
> -			{ 0x40f3, 0x0000}
> +	},  {
> +		36800000, {
> +			{ 0x00b3, 0x0000 },
> +			{ 0x2153, 0x0000 },
> +			{ 0x40a2, 0x0001 },
>  		},
> -	}, {
> -		40000000, {
> -			{ 0x00b3, 0x0000},
> -			{ 0x2153, 0x0000},
> -			{ 0x40f3, 0x0000}
> +	},  {
> +		46000000, {
> +			{ 0x00b3, 0x0000 },
> +			{ 0x2142, 0x0001 },
> +			{ 0x40a2, 0x0001 },
>  		},
> -	}, {
> -		54000000, {
> -			{ 0x0072, 0x0001},
> -			{ 0x2142, 0x0001},
> -			{ 0x40a2, 0x0001},
> +	},  {
> +		61333000, {
> +			{ 0x0072, 0x0001 },
> +			{ 0x2142, 0x0001 },
> +			{ 0x40a2, 0x0001 },
>  		},
> -	}, {
> -		65000000, {
> -			{ 0x0072, 0x0001},
> -			{ 0x2142, 0x0001},
> -			{ 0x40a2, 0x0001},
> +	},  {
> +		73600000, {
> +			{ 0x0072, 0x0001 },
> +			{ 0x2142, 0x0001 },
> +			{ 0x4061, 0x0002 },
>  		},
> -	}, {
> -		66000000, {
> -			{ 0x013e, 0x0003},
> -			{ 0x217e, 0x0002},
> -			{ 0x4061, 0x0002}
> +	},  {
> +		92000000, {
> +			{ 0x0072, 0x0001 },
> +			{ 0x2145, 0x0002 },
> +			{ 0x4061, 0x0002 },
>  		},
> -	}, {
> -		74250000, {
> -			{ 0x0072, 0x0001},
> -			{ 0x2145, 0x0002},
> -			{ 0x4061, 0x0002}
> +	},  {
> +		122666000, {
> +			{ 0x0051, 0x0002 },
> +			{ 0x2145, 0x0002 },
> +			{ 0x4061, 0x0002 },
>  		},
> -	}, {
> -		83500000, {
> -			{ 0x0072, 0x0001},
> +	},  {
> +		147200000, {
> +			{ 0x0051, 0x0002 },
> +			{ 0x2145, 0x0002 },
> +			{ 0x4064, 0x0003 },
>  		},
> -	}, {
> -		108000000, {
> -			{ 0x0051, 0x0002},
> -			{ 0x2145, 0x0002},
> -			{ 0x4061, 0x0002}
> +	},  {
> +		184000000, {
> +			{ 0x0051, 0x0002 },
> +			{ 0x214c, 0x0003 },
> +			{ 0x4064, 0x0003 },
>  		},
> -	}, {
> -		106500000, {
> -			{ 0x0051, 0x0002},
> -			{ 0x2145, 0x0002},
> -			{ 0x4061, 0x0002}
> +	},  {
> +		226666000, {
> +			{ 0x0040, 0x0003 },
> +			{ 0x214c, 0x0003 },
> +			{ 0x4064, 0x0003 },
>  		},
> -	}, {
> -		146250000, {
> -			{ 0x0051, 0x0002},
> -			{ 0x2145, 0x0002},
> -			{ 0x4061, 0x0002}
> +	},  {
> +		272000000, {
> +			{ 0x0040, 0x0003 },
> +			{ 0x214c, 0x0003 },
> +			{ 0x5a64, 0x0003 },
>  		},
> -	}, {
> -		148500000, {
> -			{ 0x0051, 0x0003},
> -			{ 0x214c, 0x0003},
> -			{ 0x4064, 0x0003}
> +	},  {
> +		340000000, {
> +			{ 0x0040, 0x0003 },
> +			{ 0x3b4c, 0x0003 },
> +			{ 0x5a64, 0x0003 },
>  		},
> -	}, {
> +	},  {
> +		600000000, {
> +			{ 0x1a40, 0x0003 },
> +			{ 0x3b4c, 0x0003 },
> +			{ 0x5a64, 0x0003 },
> +		},
> +	},  {
>  		~0UL, {
> -			{ 0x00a0, 0x000a },
> -			{ 0x2001, 0x000f },
> -			{ 0x4002, 0x000f },
> +			{ 0x0000, 0x0000 },
> +			{ 0x0000, 0x0000 },
> +			{ 0x0000, 0x0000 },
>  		},
>  	}
>  };
> 





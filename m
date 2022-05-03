Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB98518415
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:17:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADAEB10F9A2;
	Tue,  3 May 2022 12:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C34F10F98F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:17:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0720E1042;
 Tue,  3 May 2022 05:17:16 -0700 (PDT)
Received: from [10.57.80.111] (unknown [10.57.80.111])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8A753F73D;
 Tue,  3 May 2022 05:17:13 -0700 (PDT)
Message-ID: <9e2d54d3-90d0-a9cf-2b93-84fbb567fb91@arm.com>
Date: Tue, 3 May 2022 13:17:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v11 11/24] drm/rockchip: dw_hdmi: Use auto-generated tables
Content-Language: en-GB
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-12-s.hauer@pengutronix.de> <2236782.ElGaqSPkdT@diego>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2236782.ElGaqSPkdT@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Douglas Anderson <dianders@chromium.org>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Yakir Yang <ykk@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-05-03 12:02, Heiko Stübner wrote:
> Am Freitag, 22. April 2022, 09:28:28 CEST schrieb Sascha Hauer:
>> From: Douglas Anderson <dianders@chromium.org>
>>
>> The previous tables for mpll_cfg and curr_ctrl were created using the
>> 20-pages of example settings provided by the PHY vendor.  Those
>> example settings weren't particularly dense, so there were places
>> where we were guessing what the settings would be for 10-bit and
>> 12-bit (not that we use those anyway).  It was also always a lot of
>> extra work every time we wanted to add a new clock rate since we had
>> to cross-reference several tables.
>>
>> In <https://crrev.com/c/285855> I've gone through the work to figure
>> out how to generate this table automatically.  Let's now use the
>> automatically generated table and then we'll never need to look at it
>> again.
>>
>> We only support 8-bit mode right now and only support a small number
>> of clock rates and I've verified that the only 8-bit rate that was
>> affected was 148.5.  That mode appears to have been wrong in the old
>> table.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> Signed-off-by: Yakir Yang <ykk@rock-chips.com>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> This breaks hdmi on my rk3328-rock64 which then ends up in a
> 	[CRTC:37:crtc-0] vblank wait timed out
> 
> warning-loop.

Oh yeah, that... IIRC from back when I was looking at it, it's because 
the inno-hdmi phy does its own rate validation at a point when it's 
already far too late to actually reject the mode. It manages to work at 
the moment because its set of supported rates mostly line up with those 
for the Synopsys phy which dw-hdmi-rockchip still insists on validating 
against even when a vendor phy is present.

> Some part of the patch11-14 range also creates sparking horizontal
> lines on my rk3288-pinky.

I figure that's the PLL jitter issue that's come up before. Similarly, 
when I last tried hacking in a 154MHz rate for my monitor's 1920x1200 
mode, it was rock solid on RK3399, but intolerably glitchy on RK3288.

Robin.

> I haven't the time to dig overly deep into that, so left out the
> hdmi-rate patches (11-14) for now.
> 
> 
> Heiko
> 
> 
>> ---
>>
>> Notes:
>>      Changes since v5:
>>      - Add missing Signed-off-by me
>>      
>>      Changes since v3:
>>      - new patch
>>
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 130 +++++++++++---------
>>   1 file changed, 69 insertions(+), 61 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> index fe4f9556239ac..cb43e7b47157d 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> @@ -91,80 +91,88 @@ static struct rockchip_hdmi *to_rockchip_hdmi(struct drm_encoder *encoder)
>>   
>>   static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
>>   	{
>> -		27000000, {
>> -			{ 0x00b3, 0x0000},
>> -			{ 0x2153, 0x0000},
>> -			{ 0x40f3, 0x0000}
>> +		30666000, {
>> +			{ 0x00b3, 0x0000 },
>> +			{ 0x2153, 0x0000 },
>> +			{ 0x40f3, 0x0000 },
>>   		},
>> -	}, {
>> -		36000000, {
>> -			{ 0x00b3, 0x0000},
>> -			{ 0x2153, 0x0000},
>> -			{ 0x40f3, 0x0000}
>> +	},  {
>> +		36800000, {
>> +			{ 0x00b3, 0x0000 },
>> +			{ 0x2153, 0x0000 },
>> +			{ 0x40a2, 0x0001 },
>>   		},
>> -	}, {
>> -		40000000, {
>> -			{ 0x00b3, 0x0000},
>> -			{ 0x2153, 0x0000},
>> -			{ 0x40f3, 0x0000}
>> +	},  {
>> +		46000000, {
>> +			{ 0x00b3, 0x0000 },
>> +			{ 0x2142, 0x0001 },
>> +			{ 0x40a2, 0x0001 },
>>   		},
>> -	}, {
>> -		54000000, {
>> -			{ 0x0072, 0x0001},
>> -			{ 0x2142, 0x0001},
>> -			{ 0x40a2, 0x0001},
>> +	},  {
>> +		61333000, {
>> +			{ 0x0072, 0x0001 },
>> +			{ 0x2142, 0x0001 },
>> +			{ 0x40a2, 0x0001 },
>>   		},
>> -	}, {
>> -		65000000, {
>> -			{ 0x0072, 0x0001},
>> -			{ 0x2142, 0x0001},
>> -			{ 0x40a2, 0x0001},
>> +	},  {
>> +		73600000, {
>> +			{ 0x0072, 0x0001 },
>> +			{ 0x2142, 0x0001 },
>> +			{ 0x4061, 0x0002 },
>>   		},
>> -	}, {
>> -		66000000, {
>> -			{ 0x013e, 0x0003},
>> -			{ 0x217e, 0x0002},
>> -			{ 0x4061, 0x0002}
>> +	},  {
>> +		92000000, {
>> +			{ 0x0072, 0x0001 },
>> +			{ 0x2145, 0x0002 },
>> +			{ 0x4061, 0x0002 },
>>   		},
>> -	}, {
>> -		74250000, {
>> -			{ 0x0072, 0x0001},
>> -			{ 0x2145, 0x0002},
>> -			{ 0x4061, 0x0002}
>> +	},  {
>> +		122666000, {
>> +			{ 0x0051, 0x0002 },
>> +			{ 0x2145, 0x0002 },
>> +			{ 0x4061, 0x0002 },
>>   		},
>> -	}, {
>> -		83500000, {
>> -			{ 0x0072, 0x0001},
>> +	},  {
>> +		147200000, {
>> +			{ 0x0051, 0x0002 },
>> +			{ 0x2145, 0x0002 },
>> +			{ 0x4064, 0x0003 },
>>   		},
>> -	}, {
>> -		108000000, {
>> -			{ 0x0051, 0x0002},
>> -			{ 0x2145, 0x0002},
>> -			{ 0x4061, 0x0002}
>> +	},  {
>> +		184000000, {
>> +			{ 0x0051, 0x0002 },
>> +			{ 0x214c, 0x0003 },
>> +			{ 0x4064, 0x0003 },
>>   		},
>> -	}, {
>> -		106500000, {
>> -			{ 0x0051, 0x0002},
>> -			{ 0x2145, 0x0002},
>> -			{ 0x4061, 0x0002}
>> +	},  {
>> +		226666000, {
>> +			{ 0x0040, 0x0003 },
>> +			{ 0x214c, 0x0003 },
>> +			{ 0x4064, 0x0003 },
>>   		},
>> -	}, {
>> -		146250000, {
>> -			{ 0x0051, 0x0002},
>> -			{ 0x2145, 0x0002},
>> -			{ 0x4061, 0x0002}
>> +	},  {
>> +		272000000, {
>> +			{ 0x0040, 0x0003 },
>> +			{ 0x214c, 0x0003 },
>> +			{ 0x5a64, 0x0003 },
>>   		},
>> -	}, {
>> -		148500000, {
>> -			{ 0x0051, 0x0003},
>> -			{ 0x214c, 0x0003},
>> -			{ 0x4064, 0x0003}
>> +	},  {
>> +		340000000, {
>> +			{ 0x0040, 0x0003 },
>> +			{ 0x3b4c, 0x0003 },
>> +			{ 0x5a64, 0x0003 },
>>   		},
>> -	}, {
>> +	},  {
>> +		600000000, {
>> +			{ 0x1a40, 0x0003 },
>> +			{ 0x3b4c, 0x0003 },
>> +			{ 0x5a64, 0x0003 },
>> +		},
>> +	},  {
>>   		~0UL, {
>> -			{ 0x00a0, 0x000a },
>> -			{ 0x2001, 0x000f },
>> -			{ 0x4002, 0x000f },
>> +			{ 0x0000, 0x0000 },
>> +			{ 0x0000, 0x0000 },
>> +			{ 0x0000, 0x0000 },
>>   		},
>>   	}
>>   };
>>
> 
> 
> 
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

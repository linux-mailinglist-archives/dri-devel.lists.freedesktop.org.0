Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F39978CF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 01:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0D110E82B;
	Wed,  9 Oct 2024 23:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="dyDCeq7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C91C10E82B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1728514988;
 bh=flB3GAXd531I7pJ9v5rHSbRqXKrrWbbOxKntv0nGr6M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dyDCeq7XxDxTQk9D+aU9Ss8vnfBOmEl2T1OOw50xuB6tOwV3jzCMzUVXPJ3bTvtkI
 6HnBOX805I/aaX+lwrPrT5MiZzueNqAN41WQSuM9F6uOTotVKVxHPJCcQfPYLPEFUu
 Kd76MBH4g84TKMUaRkNCgdvSolTFh7l0T4F6j7EfreWPEI0YU5L+NwmgYl3oewx1cl
 sId5a893yq4JBh1AAR3B6Lbot5oN2o0Jc4omFfginpj/rfakLknl39+6cff86eSDBd
 mYLezQG8FI/GBjwc70UHEn3/vjps2JdG5f7kohiUOoxEO3mBc8Kmv5Z7scWwB22gVn
 J1Yq7dPsKAIIA==
Received: from [IPV6:2001:861:8b81:d330:d4b:52bf:3fe7:c311] (unknown
 [IPv6:2001:861:8b81:d330:d4b:52bf:3fe7:c311])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B690A17E0EAA;
 Thu, 10 Oct 2024 01:03:07 +0200 (CEST)
Message-ID: <ad07d7a3-5676-4a0b-a79c-9bd7b751cc74@collabora.com>
Date: Thu, 10 Oct 2024 02:03:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] drm/rockchip: Add basic RK3588 HDMI output support
To: Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20240929-b4-rk3588-bridge-upstream-v8-0-83538c2cc325@collabora.com>
 <20240929-b4-rk3588-bridge-upstream-v8-3-83538c2cc325@collabora.com>
 <83349da6-17bc-432d-badc-5946c42a53ed@kwiboo.se>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <83349da6-17bc-432d-badc-5946c42a53ed@kwiboo.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Jonas,

On 9/29/24 3:34 AM, Jonas Karlman wrote:
> Hi Cristian,
> 
> On 2024-09-29 00:36, Cristian Ciocaltea wrote:
>> The RK3588 SoC family integrates the newer Synopsys DesignWare HDMI 2.1
>> Quad-Pixel (QP) TX controller IP and a HDMI/eDP TX Combo PHY based on a
>> Samsung IP block.
>>
>> Add just the basic support for now, i.e. RGB output up to 4K@60Hz,
>> without audio, CEC or any of the HDMI 2.1 specific features.
>>
>> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>> Tested-by: Heiko Stuebner <heiko@sntech.de>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/Kconfig               |   9 +
>>  drivers/gpu/drm/rockchip/Makefile              |   1 +
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 425 +++++++++++++++++++++++++
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c    |   2 +
>>  drivers/gpu/drm/rockchip/rockchip_drm_drv.h    |   1 +
>>  5 files changed, 438 insertions(+)
>>
> 
> [snip]
> 
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> new file mode 100644
>> index 000000000000..6103d30d40fb
> 
> [snip]
> 
>> +static irqreturn_t dw_hdmi_qp_rk3588_irq(int irq, void *dev_id)
>> +{
>> +	struct rockchip_hdmi_qp *hdmi = dev_id;
>> +	u32 intr_stat, val;
>> +	int debounce_ms;
>> +
>> +	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
>> +	if (!intr_stat)
>> +		return IRQ_NONE;
>> +
>> +	val = HIWORD_UPDATE(RK3588_HDMI0_HPD_INT_CLR,
>> +			    RK3588_HDMI0_HPD_INT_CLR);
>> +	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON2, val);
>> +
>> +	debounce_ms = intr_stat & RK3588_HDMI0_LEVEL_INT ? 150 : 20;
>> +	mod_delayed_work(system_wq, &hdmi->hpd_work,
>> +			 msecs_to_jiffies(debounce_ms));
> 
> If I am understanding this correctly this will wait for 150 ms after HPD
> goes high and 20 ms after HPD goes low to trigger the hpd_work.
> 
> Would it not make more sense to be the other way around? In order to
> reduce unnecessary HOTPLUG=1 uevents from being triggered during short
> EDID refresh pulses? At least that is what I am playing around with for
> dw-hdmi.

Sorry for my late reply, I'm on vacation but eventually managed to get
access to a display, so I took the opportunity to prepare v9 [1].

The debouncing setup was borrowed from downstream driver and I haven't
payed much attention to it, but now that you pointed this out I think we
could simplify it and just use 150 ms in both cases.

Thanks,
Cristian

[1]: https://lore.kernel.org/all/20241010-b4-rk3588-bridge-upstream-v9-0-68c47dde0410@collabora.com/


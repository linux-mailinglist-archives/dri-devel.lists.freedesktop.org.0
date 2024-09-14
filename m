Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EAF9792F2
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2024 20:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BC010E00D;
	Sat, 14 Sep 2024 18:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="eh1sKraz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C772C10E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Sep 2024 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1726338541;
 bh=2yDJGLRu2gAeWgfvO6TGgF4YVt64dhBuu/OY77p7t8A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eh1sKraz7x9kS3czQy+9/fxF6N5XeQ2mG7h7DIfI7MMRO6tTWxgv44vLDlA+n1bh+
 jSnYtFGAzkeFL3gvy2XX5PhQ48FW7Od8+q1a/w6/w24Bi88Z4k8YKJ4YenNRROaVFd
 LdrDqbRzdDz8z3hP1pqzcVPqWVDyzMtEdc4F8zzruM2k5sXsjqxw/lJA1vmspSz9aB
 zmVW9wsE1p4W+ZGO+rHnHKC7oKXrfPpGuLZW9O4YFa8EtEiYpwNeV3lVcqwPaCyOVe
 wDl3AuaAwFipLxjpYHtml4e5MpY5mMw6mBIUDjovM5Vye9DGWYZcn4APWVFdF/dhKH
 9q4wvwp3UZMtw==
Received: from [192.168.1.90] (unknown [188.27.55.48])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F8BF17E3608;
 Sat, 14 Sep 2024 20:29:00 +0200 (CEST)
Message-ID: <4766d230-c9c3-414d-a954-3b0c890e7e08@collabora.com>
Date: Sat, 14 Sep 2024 21:28:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/rockchip: Add basic RK3588 HDMI output support
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240906-b4-rk3588-bridge-upstream-v6-0-a3128fb103eb@collabora.com>
 <20240906-b4-rk3588-bridge-upstream-v6-3-a3128fb103eb@collabora.com>
 <2376712.1SvkZsmPdQ@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2376712.1SvkZsmPdQ@diego>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/10/24 10:08 PM, Heiko Stübner wrote:
> Am Freitag, 6. September 2024, 03:17:42 CEST schrieb Cristian Ciocaltea:
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
> 
> [...]
> 
>> diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
>> index 3ff7b21c0414..3eab662a5a1d 100644
>> --- a/drivers/gpu/drm/rockchip/Makefile
>> +++ b/drivers/gpu/drm/rockchip/Makefile
>> @@ -11,6 +11,7 @@ rockchipdrm-$(CONFIG_ROCKCHIP_VOP) += rockchip_drm_vop.o rockchip_vop_reg.o
> 
>> +static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>> +				    void *data)
>> +{
>> +	static const char * const clk_names[] = {
>> +		"pclk", "earc", "aud", "hdp", "hclk_vo1",
>> +		"ref" /* keep "ref" last */
>> +	};
> 
> [...]
> 
>> +	for (i = 0; i < ARRAY_SIZE(clk_names); i++) {
>> +		clk = devm_clk_get_enabled(hdmi->dev, clk_names[i]);
>> +
>> +		if (IS_ERR(clk)) {
>> +			ret = PTR_ERR(clk);
>> +			if (ret != -EPROBE_DEFER)
>> +				drm_err(hdmi, "Failed to get %s clock: %d\n",
>> +					clk_names[i], ret);
>> +			return ret;
>> +		}
>> +	}
>> +	hdmi->ref_clk = clk;
> 
> How about using devm_clk_bulk_get_all_enable() for everything except the
> refclk and a separate call to devm_clk_get_enabled() for that refclk .

This helper seems to be partially broken as it doesn't return the number of
clocks stored in the clk_bulk_data table referenced by the clks argument,
meaning it's not possible to iterate these clocks.  I provided a new helper
[1] as a possible fix.

If that gets accepted, we could rewrite this as:

	ret = devm_clk_bulk_get_all_enabled(hdmi->dev, &clks);
	if (ret < 0) {
		drm_err(hdmi, "Failed to get clocks: %d\n", ret);
		return ret;
	}

	for (i = 0; i < ret; i++) {
		if (!strcmp(clks[i].id, "ref")) {
			hdmi->ref_clk = clks[1].clk;
			break;
		}
	}
	if (!hdmi->ref_clk) {
		drm_err(hdmi, "Missing ref clock\n");
		return -EINVAL;
	}

> That hdmi->ref_clk just accidentially falls out of that loop at the end
> looks somewhat strange, so getting and keeping that refclk
> separately would make this look cleaner.

I've added /* keep "ref" last */ comment above, but I agree it's not really
the best approach.

I'm going to submit v7 in the meantime, as this was the last remaining open
topic on my list.  I guess we can figure this out afterwards.

Thanks,
Cristian

[1] https://lore.kernel.org/lkml/20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com/


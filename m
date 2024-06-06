Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78BE8FE37A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C2B10E8B4;
	Thu,  6 Jun 2024 09:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Qncj7IYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DBD10E8B3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717667605;
 bh=CKTgow/rXEHMO5WjfhlWa4EqAX2k6le6hA30B/0Rkug=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Qncj7IYyv4cPm7O8mmmeYAsqXX2wIMRYjy47ZisSwnTzuBapQHru2SfHHT5snuLzU
 NyJ/WPRp/6MGqP+ZMMhBM4jFWOLG5/qddVlFH5dKcZP1qRN2m4xOQPv74qFQfH8/rp
 HRvkqkGUS91XBUdJFpJZXiT3vRq4FPOvfZVb8E1/oIsOHdhO7Z1761xudvFgPbsq0r
 l7XGNa3vch39wRWsYD7c/tVCqEAyk/84VVKlCpUI6/mlItPi497RrIQuHRENY/R79h
 8efYUvpHPwgqh8nQpKJOxnRvThALy2bP83BmgTfnm2bmRiHLGOhyWq7dtWHacQdkar
 HgukqBYuuih7w==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id CC0683781182;
 Thu,  6 Jun 2024 09:53:23 +0000 (UTC)
Message-ID: <25ba8753-b7e9-4f6f-a9ad-c5266540939a@collabora.com>
Date: Thu, 6 Jun 2024 12:53:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] drm/bridge: synopsys: Add DW HDMI QP TX controller
 driver
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
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <20240601-b4-rk3588-bridge-upstream-v1-13-f6203753232b@collabora.com>
 <2554679.TLnPLrj5Ze@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2554679.TLnPLrj5Ze@diego>
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

On 6/5/24 5:48 PM, Heiko Stübner wrote:
> Am Samstag, 1. Juni 2024, 15:12:35 CEST schrieb Cristian Ciocaltea:
>> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller supports
>> the following features, among others:
>>
>> * Fixed Rate Link (FRL)
>> * 4K@120Hz and 8K@60Hz video modes
>> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS), aka
>>   Cinema VRR
>> * Fast Vactive (FVA), aka Quick Frame Transport (QFT)
>> * SCDC I2C DDC access
>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>> * Multi-stream audio
>> * Enhanced Audio Return Channel (EARC)
>>
>> Add driver to enable basic support, i.e. RGB output up to 4K@60Hz,
>> without audio, CEC or any HDMI 2.1 specific features.
>>
>> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/bridge/synopsys/Makefile     |   2 +-
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 787 +++++++++++++++++++++++++
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 831 +++++++++++++++++++++++++++
>>  include/drm/bridge/dw_hdmi.h                 |   8 +
>>  4 files changed, 1627 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
>> index ce715562e9e5..8354e4879f70 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
>> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
> 
>> +static int dw_hdmi_qp_i2c_read(struct dw_hdmi *hdmi,
>> +			       unsigned char *buf, unsigned int length)
>> +{
>> +	struct dw_hdmi_i2c *i2c = hdmi->i2c;
>> +	int stat;
>> +
>> +	if (!i2c->is_regaddr) {
>> +		dev_dbg(hdmi->dev, "set read register address to 0\n");
>> +		i2c->slave_reg = 0x00;
>> +		i2c->is_regaddr = true;
>> +	}
>> +
>> +	while (length--) {
>> +		reinit_completion(&i2c->cmp);
>> +
>> +		dw_hdmi_qp_mod(hdmi, i2c->slave_reg++ << 12, I2CM_ADDR,
>> +			       I2CM_INTERFACE_CONTROL0);
>> +
>> +		dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
>> +			       I2CM_INTERFACE_CONTROL0);
> 
> Somehow the segment handling is present in the rest of the i2c code here, but
> not the actual handling for reads.
> 
> The vendor-kernel does:
> 
> -               dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> -                              I2CM_INTERFACE_CONTROL0);
> +               if (i2c->is_segment)
> +                       dw_hdmi_qp_mod(hdmi, I2CM_EXT_READ, I2CM_WR_MASK,
> +                                      I2CM_INTERFACE_CONTROL0);
> +               else
> +                       dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
> +                                      I2CM_INTERFACE_CONTROL0);

Hmm, for some reason this is not present in the stable-5.10-rock5 branch 
I've been using as an implementation reference:

https://github.com/radxa/kernel/blob/stable-5.10-rock5/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c#L760

Is there an updated fork?

> Without this change, connecting to a DVI display does not work, and
> reading the EDID ends in the "i2c read error" below.
> 
> Adding the segment handling as above makes the DVI connection
> work (as it does in the vendor-kernel).
> 
> So it would be nice if you could maybe incorporate this in the next version?

Sure, thanks for pointing this out!

Cristian

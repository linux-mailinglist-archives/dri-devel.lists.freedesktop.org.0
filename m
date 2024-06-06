Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17D18FE563
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 13:32:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168A910E907;
	Thu,  6 Jun 2024 11:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TRsvVgw6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2000E10E907
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 11:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717673529;
 bh=LVldkK8M41rECJCGVc6CKfxKAtGbI7b4XW5+qeNYwes=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TRsvVgw6mTl+ZIgvPF2J6hWsru1V6hAeE9pFE45FwtFb76e08WNM+8tFtIVUKq9Z9
 7OTDTyFGfdwSQFIs6njlQRyB0//L69olHhFkTBN2F5tgeh+9GFNSTrVUWdMqU1qcUo
 hgrGKWDFgfNMwWhCz/kgI/8eJzl0cDALMCAi41jPbxHzp/1dtfSjyM6GYd8C7dpeCJ
 S1A2GCGTLv5KuFzqMougFG03gNQcYP1uH4ZtzsuJPCoN0Wf2+W+rh7tRtRYbeINtZ2
 BtzBGEQ7NXXd+IZ0cHtAQuMFAYpzJD8ZU2T5f4KBOYmxMu+2SquHnzui5bUF3r/vwQ
 UrZXB0u/Ue4bQ==
Received: from [100.115.223.179] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C68F7378061A;
 Thu,  6 Jun 2024 11:32:07 +0000 (UTC)
Message-ID: <d42ac22f-1d12-4828-9bd0-9633c1ea92ee@collabora.com>
Date: Thu, 6 Jun 2024 14:32:07 +0300
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
 <2554679.TLnPLrj5Ze@diego>
 <25ba8753-b7e9-4f6f-a9ad-c5266540939a@collabora.com>
 <2491902.uoxibFcf9D@diego>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <2491902.uoxibFcf9D@diego>
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

On 6/6/24 1:16 PM, Heiko Stübner wrote:
> Am Donnerstag, 6. Juni 2024, 11:53:23 CEST schrieb Cristian Ciocaltea:
>> On 6/5/24 5:48 PM, Heiko Stübner wrote:
>>> Am Samstag, 1. Juni 2024, 15:12:35 CEST schrieb Cristian Ciocaltea:
>>>> The Synopsys DesignWare HDMI 2.1 Quad-Pixel (QP) TX controller supports
>>>> the following features, among others:
>>>>
>>>> * Fixed Rate Link (FRL)
>>>> * 4K@120Hz and 8K@60Hz video modes
>>>> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS), aka
>>>>   Cinema VRR
>>>> * Fast Vactive (FVA), aka Quick Frame Transport (QFT)
>>>> * SCDC I2C DDC access
>>>> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
>>>> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
>>>> * Multi-stream audio
>>>> * Enhanced Audio Return Channel (EARC)
>>>>
>>>> Add driver to enable basic support, i.e. RGB output up to 4K@60Hz,
>>>> without audio, CEC or any HDMI 2.1 specific features.
>>>>
>>>> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
>>>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/bridge/synopsys/Makefile     |   2 +-
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 787 +++++++++++++++++++++++++
>>>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h | 831 +++++++++++++++++++++++++++
>>>>  include/drm/bridge/dw_hdmi.h                 |   8 +
>>>>  4 files changed, 1627 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
>>>> index ce715562e9e5..8354e4879f70 100644
>>>> --- a/drivers/gpu/drm/bridge/synopsys/Makefile
>>>> +++ b/drivers/gpu/drm/bridge/synopsys/Makefile
>>>
>>>> +static int dw_hdmi_qp_i2c_read(struct dw_hdmi *hdmi,
>>>> +			       unsigned char *buf, unsigned int length)
>>>> +{
>>>> +	struct dw_hdmi_i2c *i2c = hdmi->i2c;
>>>> +	int stat;
>>>> +
>>>> +	if (!i2c->is_regaddr) {
>>>> +		dev_dbg(hdmi->dev, "set read register address to 0\n");
>>>> +		i2c->slave_reg = 0x00;
>>>> +		i2c->is_regaddr = true;
>>>> +	}
>>>> +
>>>> +	while (length--) {
>>>> +		reinit_completion(&i2c->cmp);
>>>> +
>>>> +		dw_hdmi_qp_mod(hdmi, i2c->slave_reg++ << 12, I2CM_ADDR,
>>>> +			       I2CM_INTERFACE_CONTROL0);
>>>> +
>>>> +		dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
>>>> +			       I2CM_INTERFACE_CONTROL0);
>>>
>>> Somehow the segment handling is present in the rest of the i2c code here, but
>>> not the actual handling for reads.
>>>
>>> The vendor-kernel does:
>>>
>>> -               dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
>>> -                              I2CM_INTERFACE_CONTROL0);
>>> +               if (i2c->is_segment)
>>> +                       dw_hdmi_qp_mod(hdmi, I2CM_EXT_READ, I2CM_WR_MASK,
>>> +                                      I2CM_INTERFACE_CONTROL0);
>>> +               else
>>> +                       dw_hdmi_qp_mod(hdmi, I2CM_FM_READ, I2CM_WR_MASK,
>>> +                                      I2CM_INTERFACE_CONTROL0);
>>
>> Hmm, for some reason this is not present in the stable-5.10-rock5 branch 
>> I've been using as an implementation reference:
>>
>> https://github.com/radxa/kernel/blob/stable-5.10-rock5/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c#L760
>>
>> Is there an updated fork?
> 
> I think the radxa code-base is quite old in terms of sdk-version it's based on.
> Grabbing a 6.1 branch from Radxa shows it in:
> https://github.com/radxa/kernel/blob/linux-6.1-stan-rkr1/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c#L995

Indeed, I should have switched to using this one as it seems to include 
quite a few potentially interesting updates (will check in detail for v2).

For now, we miss cdc0984c90dc ("drm/bridge: synopsys: dw-hdmi-qp: Support 
read ext block edid"), which provides an additional change:

@@ -1086,7 +1090,7 @@ static int dw_hdmi_i2c_xfer(struct i2c_adapter *adap,
                        i2c->is_segment = true;
                        hdmi_modb(hdmi, DDC_SEGMENT_ADDR, I2CM_SEG_ADDR,
                                  I2CM_INTERFACE_CONTROL1);
-                       hdmi_modb(hdmi, *msgs[i].buf, I2CM_SEG_PTR,
+                       hdmi_modb(hdmi, *msgs[i].buf << 7, I2CM_SEG_PTR,
                                  I2CM_INTERFACE_CONTROL1);
                } else {
                        if (msgs[i].flags & I2C_M_RD)

Will try to grab some more displays to improve testing on my end.

Thanks,
Cristian

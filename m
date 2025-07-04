Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B67AF95E4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:46:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32D1F88E26;
	Fri,  4 Jul 2025 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jXS+rROx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDD688E26
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751640395;
 bh=v8cXoT5/F19wrmjHbKU/PHIAXpvw0LXWFp/Fmehd2QY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jXS+rROx0FfOA3nvo+XoPJsrmSPiFsU84nd3JJxqdtnLXH9p9bfq3p5C9JerBnb1b
 HOete7Iolcy99BpVMAP8IiEy1G6qfAtrOsmRkyNWBFO3lQI+lKw25MrrLN8rzRMrxb
 SfklKP3CESeMsiJ4JeQ5cOXfa5Gv+BcrKvp5KZhcsMsdQbq1QIR0gL+PqbyarBREY4
 5vH1F0cv8Kd0s/PSQ5LjSV8qsuMSs+RgjMBy/bCvMzBZOk7QV09NVETlR8V+qbVL7f
 A6fYHyZaBIseHBvbvUvPRcng2yUMkpybaUZ2b297wANMRrnUqgkmF2PeikDhQRR2m3
 +1S9plpne9+gw==
Received: from [192.168.1.90] (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FC7A17E07FF;
 Fri,  4 Jul 2025 16:46:34 +0200 (CEST)
Message-ID: <f02af24c-18de-4b56-85cd-da7af8a73222@collabora.com>
Date: Fri, 4 Jul 2025 17:46:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
 <13504186.5MRjnR8RnV@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <13504186.5MRjnR8RnV@diego>
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

Hi Heiko,

On 7/4/25 5:37 PM, Heiko Stübner wrote:
> Hi Cristian,
> 
> Am Freitag, 4. Juli 2025, 16:23:22 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> In preparation to support the CEC interface of the DesignWare HDMI QP IP
>> block, extend the platform data to provide the required IRQ number.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
>>  include/drm/bridge/dw_hdmi_qp.h                | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 7d531b6f4c098c6c548788dad487ce4613a2f32b..126e556025961e8645f3567b4d7a1c73cc2f2e7f 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -539,6 +539,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  	if (plat_data.main_irq < 0)
>>  		return plat_data.main_irq;
>>  
>> +	plat_data.cec_irq = platform_get_irq_byname(pdev, "cec");
>> +	if (plat_data.cec_irq < 0)
>> +		return plat_data.cec_irq;
>> +
>>  	irq = platform_get_irq_byname(pdev, "hpd");
>>  	if (irq < 0)
>>  		return irq;
>> diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
>> index e9be6d507ad9cdc55f5c7d6d3ef37eba41f1ce74..b4a9b739734ec7b67013b683fe6017551aa19172 100644
>> --- a/include/drm/bridge/dw_hdmi_qp.h
>> +++ b/include/drm/bridge/dw_hdmi_qp.h
>> @@ -23,6 +23,7 @@ struct dw_hdmi_qp_plat_data {
>>  	const struct dw_hdmi_qp_phy_ops *phy_ops;
>>  	void *phy_data;
>>  	int main_irq;
>> +	int cec_irq;
>>  };
> 
> from a structure point-of-view, I'd expect the series to be something like:
> 
> (1) drm/bridge: dw-hdmi-qp: Add CEC support
>     -> including adding the cec_irq to dw_hdmi_qp_plat_data
> (2) drm/bridge: dw-hdmi-qp: Fixup timer base setup
>     -> including adding the ref_clk_rate to dw_hdmi_qp_plat_data
> (3) drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
> (4) drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
> (5) arm64: defconfig: Enable DW HDMI QP CEC support
> 
> The patches adding the generic functionality to the bridge should also
> include the needed elements and not depend on platform-specific patches.

You are right, that's a much better approach.

Thanks for the quick feedback!

Regards,
Cristian

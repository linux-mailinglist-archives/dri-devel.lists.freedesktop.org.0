Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6112A407DC
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 12:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B3610E1DC;
	Sat, 22 Feb 2025 11:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="ENxxpIdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m19731100.qiye.163.com (mail-m19731100.qiye.163.com
 [220.197.31.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD73010E1DC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 11:25:47 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id bdb51f7f;
 Sat, 22 Feb 2025 19:25:41 +0800 (GMT+08:00)
Message-ID: <799ccbd2-0c3b-4a55-b47e-1899975c4020@rock-chips.com>
Date: Sat, 22 Feb 2025 19:25:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org, vkoul@kernel.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, l.stach@pengutronix.de,
 dmitry.baryshkov@linaro.org, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
 <3340006.44csPzL39Z@diego>
Content-Language: en-US
In-Reply-To: <3340006.44csPzL39Z@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQktJTlZCTR8fSEgaTx5MHh5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a952d67f14803a3kunmbdb51f7f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhQ6Agw6HDIKER8cNz4OTxY2
 SFEaFA5VSlVKTE9LSUlITk9ISktIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKQ0pPNwY+
DKIM-Signature: a=rsa-sha256;
 b=ENxxpIdc+fRY3imBB4Fvef5vOGZG6fA5wJ7ZQJ3/Q4CHHOsDZlC+5/w3k4E3rp5BOTyNBD/acHQvH9bxtM6Ew6mLSBkk31732mwP2INmd+pp5ON4Wv4pZ1/ZSYTKU/EsXsoRaBhyh7otaP6W3DmyJLjc4G1myUF7V4vX7iQqVTg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=4IlcUWxsBK99tkFDt+EwbEGgFcki2T86lZTSUVVIHWQ=;
 h=date:mime-version:subject:message-id:from;
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

On 2025/1/31 4:33, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Donnerstag, 23. Januar 2025, 11:07:41 MEZ schrieb Damon Ding:
>> Move drm_of_find_panel_or_bridge() a little later and combine it with
>> component_add() into a new function rockchip_dp_link_panel(). The function
>> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
>> aiding to support for obtaining the eDP panel via the DP AUX bus.
>>
>> If failed to get the panel from the DP AUX bus, it will then try the other
>> way to get panel information through the platform bus.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ---
> 
>> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   	if (IS_ERR(dp->adp))
>>   		return PTR_ERR(dp->adp);
>>   
>> -	ret = component_add(dev, &rockchip_dp_component_ops);
>> -	if (ret)
>> -		return ret;
>> +	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
> 
> This causes an undefined-reference error, so you probably need something like:
> 
> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> index f9cbbb40b36f..fa946a809858 100644
> --- a/drivers/gpu/drm/rockchip/Kconfig
> +++ b/drivers/gpu/drm/rockchip/Kconfig
> @@ -8,6 +8,7 @@ config DRM_ROCKCHIP
>          select DRM_PANEL
>          select VIDEOMODE_HELPERS
>          select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
> +       select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
>          select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
>          select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
>          select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
> 
> 
> 
> 
> 

Yeah, I will add a new separate commit to do it in the next version.

Best regards
Damon


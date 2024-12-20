Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7239F8DFA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 09:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2890610EF1E;
	Fri, 20 Dec 2024 08:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="iEi6g1WM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m12792.qiye.163.com (mail-m12792.qiye.163.com
 [115.236.127.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DBD10EF24
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 08:29:33 +0000 (UTC)
Received: from [172.16.12.26] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 6524bd1b;
 Fri, 20 Dec 2024 16:29:28 +0800 (GMT+08:00)
Message-ID: <3663bbec-fcb2-4f93-aae6-3c2082491069@rock-chips.com>
Date: Fri, 20 Dec 2024 16:29:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org,
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, andy.yan@rock-chips.com, hjc@rock-chips.com,
 algea.cao@rock-chips.com, kever.yang@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-9-damon.ding@rock-chips.com>
 <aiggslcdbdmnc2amlvmzycyxmu3f5zp6kt4ifgzq5gkuugmnem@oqnwf4o7hbss>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <aiggslcdbdmnc2amlvmzycyxmu3f5zp6kt4ifgzq5gkuugmnem@oqnwf4o7hbss>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkkfSFZMQ0hDHUMeTkMYGEJWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93e32f9ba603a3kunm6524bd1b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6Lgw6ETIUTQg#DBcePSI8
 AiwKCRBVSlVKTEhPTUNISExLSkJLVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQ0pDNwY+
DKIM-Signature: a=rsa-sha256;
 b=iEi6g1WMQQreiv/+FEJCxMCUiHjf/pV7eXzPhn/R84mzSsPiUpa3E0pgNA78zs+aUH82NbkYE5nvx0SD3EXcLWntxzRLBLx5uPo67d6NN2FC4uiXzp/o+RB9hp572xA8aE1pa2rgbtS2afjv1ldkQhc3tnc4vYHr8cUpRnoDCyg=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=GihI+WisojgBHpW5R0ME2hXDuA+DiNX0v2ROBByVWgY=;
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

Hi Dmitry,

On 2024/12/20 8:16, Dmitry Baryshkov wrote:
> On Thu, Dec 19, 2024 at 04:05:57PM +0800, Damon Ding wrote:
>> The rockchip_dp_of_panel_on_aux_bus() helps to check whether the DT
>> configurations related to the DP AUX bus are correct or not.
>>
>> If failed to get the panel from the platform bus, it is good to try
>> the DP AUX bus. Then, the probing process will continue until it enters
>> the analogix_dp_bind(), where devm_of_dp_aux_populate_bus() is called
>> after &analogix_dp_device.aux has been initialized.
> 
> No. devm_of_dp_aux_populate_bus() should be called before bind(). And
> bind should only be called from the done_probing() callback. The reason
> is very simple: the panel driver might be built as a module and might be
> not available when the analogix driver is being probed.
> 
> Also, please invert the logic of the commit message (and the driver).
> The platform bus should be a fallback if there is no AUX bus panel, not
> other way around.
> 

I have tried the logic as you recommanded, and it is really a good way. 
I will fix this in the next version.

>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 24 +++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> index ba5263f85ee2..60c902abf40b 100644
>> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
>> @@ -317,6 +317,24 @@ static const struct drm_encoder_helper_funcs rockchip_dp_encoder_helper_funcs =
>>   	.atomic_check = rockchip_dp_drm_encoder_atomic_check,
>>   };
>>   
>> +static bool rockchip_dp_of_panel_on_aux_bus(const struct device_node *np)
>> +{
>> +	struct device_node *bus_node, *panel_node;
>> +
>> +	bus_node = of_get_child_by_name(np, "aux-bus");
>> +	if (!bus_node)
>> +		return false;
>> +
>> +	panel_node = of_get_child_by_name(bus_node, "panel");
>> +	of_node_put(bus_node);
>> +	if (!panel_node)
>> +		return false;
>> +
>> +	of_node_put(panel_node);
>> +
>> +	return true;
>> +}
>> +
>>   static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
>>   {
>>   	struct device *dev = dp->dev;
>> @@ -435,8 +453,10 @@ static int rockchip_dp_probe(struct platform_device *pdev)
>>   		return -ENODEV;
>>   
>>   	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
>> -	if (ret < 0)
>> -		return ret;
>> +	if (ret < 0) {
>> +		if (!rockchip_dp_of_panel_on_aux_bus(dev->of_node))
>> +			return ret;
>> +	}
>>   
>>   	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>>   	if (!dp)
>> -- 
>> 2.34.1
>>
> 

Best regards,
Damon


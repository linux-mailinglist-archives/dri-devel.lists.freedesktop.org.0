Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1650A4A172
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 19:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF91A10E0D9;
	Fri, 28 Feb 2025 18:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="SMx0uDl2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46310E0D9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 18:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B356E102901CB; Fri, 28 Feb 2025 19:27:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
 t=1740767226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ebfjXjv+bqlFowxWgcxVBRPIFf+y2ZFstbhRFYQ+B3o=;
 b=SMx0uDl2Mwn6/zecOEx6MQdyi0SH0kKNxIGNAfTZlFCp+iLnWFeP8mL1NQbqE9vBcwy/EA
 c59tK9X19cLR6C01stMKronJmlaTYccJe2s7OGzf3Bhfav4cncfDu2e9Sw65+JFdilJ11n
 j6HQT+DQYgi6QAFzpneNjPd1sFp/T9opiQZVYH4nXnvAMrcoUhzazc8HDqxYfJJry0Ujxw
 W4yHOYyE7zde/azlb7UohiwEy7thG/Ofuf+xYNWbzUDCgdyTZTvEVT9sm4WwJDYhoaCcbE
 GlgEtgDW2NFaNm97s7/KNeyle8S7FGEZxa/sJbSoBYve3u9mbM5AeK2jh4h/Uw==
Message-ID: <b0bfbb84-a3a8-403a-ad5a-95ebcd1eb00f@denx.de>
Date: Fri, 28 Feb 2025 17:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] drm/panthor: Implement optional reset
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org, imx@lists.linux.dev
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-5-marex@denx.de> <2180166.OBFZWjSADL@steina-w>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2180166.OBFZWjSADL@steina-w>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

On 2/28/25 11:06 AM, Alexander Stein wrote:

Hi,

>> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
>> index a9da1d1eeb707..51ee9cae94504 100644
>> --- a/drivers/gpu/drm/panthor/panthor_device.c
>> +++ b/drivers/gpu/drm/panthor/panthor_device.c
>> @@ -64,6 +64,17 @@ static int panthor_clk_init(struct panthor_device *ptdev)
>>   	return 0;
>>   }
>>   
>> +static int panthor_reset_init(struct panthor_device *ptdev)
>> +{
>> +	ptdev->resets = devm_reset_control_get_optional_exclusive_deasserted(ptdev->base.dev, NULL);
> 
> If the description as a write-once register is true, wouldn't this
> already write to it?

It would. I believe the reset handling in the GPU driver should be 
generic. The reset has to be deasserted here to access the GPU registers.

The question is, whether the GPUMIX GPURESET bit should be modeled as 
simple reset, even if it really behaves as a 
set-and-never-can-be-cleared latched bit.

>> +	if (IS_ERR(ptdev->resets))
>> +		return dev_err_probe(ptdev->base.dev,
>> +				     PTR_ERR(ptdev->resets),
>> +				     "get reset failed");
>> +
>> +	return 0;
>> +}
>> +
>>   void panthor_device_unplug(struct panthor_device *ptdev)
>>   {
>>   	/* This function can be called from two different path: the reset work
>> @@ -217,6 +228,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>>   	if (ret)
>>   		return ret;
>>   
>> +	ret = panthor_reset_init(ptdev);
>> +	if (ret)
>> +		return ret;
>> +
>>   	ret = panthor_devfreq_init(ptdev);
>>   	if (ret)
>>   		return ret;
>> @@ -470,6 +485,10 @@ int panthor_device_resume(struct device *dev)
>>   	if (ret)
>>   		goto err_disable_stacks_clk;
>>   
>> +	ret = reset_control_deassert(ptdev->resets);
>> +	if (ret)
>> +		goto err_disable_coregroup_clk;
>> +
> 
> This wouldn't work at all on a write-once register, no? Same for resume.
See above and also my reply to 2/9 .

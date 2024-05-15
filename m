Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510E48C6505
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 12:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA8510E574;
	Wed, 15 May 2024 10:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="aDbI0B6B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E014810E574
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 10:35:05 +0000 (UTC)
Message-ID: <bd175eb3-ca70-4ce7-89ab-ca7f622ed153@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715769303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkdIypPkNo7ZCkUM8QaRa9DJEq1BNKqggZXsE+KZK30=;
 b=aDbI0B6Ba1g2/Mdo8UvEU9SQZvcC9rJVNzq/91r9EBWX9kEcdg3WGr4Vlio7LW3IVDIBGf
 NURuIB5mCVVPXpKp6Zo5w4ZZwD7kSdgHs/70xlaglM1Fb2/LpQYKu6tAd55A16rWO18daV
 JbJkyITxF7wDEaT9gYxY4m/rbb4KZtY=
Date: Wed, 15 May 2024 18:34:59 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] drm/bridge: Support finding bridge with struct device
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514154045.309925-2-sui.jingfeng@linux.dev> <87v83fct2e.fsf@intel.com>
 <cd81893c-ef0b-4906-8c9c-a98b1e4669e6@linux.dev> <87pltncqtg.fsf@intel.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <87pltncqtg.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/15/24 18:28, Jani Nikula wrote:
> On Wed, 15 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>> Hi,
>>
>>
>> On 5/15/24 17:39, Jani Nikula wrote:
>>> On Tue, 14 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>>> index 584d109330ab..1928d9d0dd3c 100644
>>>> --- a/drivers/gpu/drm/drm_bridge.c
>>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>>> @@ -213,6 +213,23 @@ void drm_bridge_add(struct drm_bridge *bridge)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_bridge_add);
>>>>    
>>>> +/**
>>>> + * drm_bridge_add_with_dev - add the given bridge to the global bridge list
>>>> + *
>>>> + * @bridge: bridge control structure
>>>> + * @dev: pointer to the kernel device that this bridge is backed.
>>>> + */
>>>> +void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev)
>>>> +{
>>>> +	if (dev) {
>>>> +		bridge->kdev = dev;
>>>> +		bridge->of_node = dev->of_node;
>>>> +	}
>>>> +
>>>> +	drm_bridge_add(bridge);
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(drm_bridge_add_with_dev);
>>>
>>> I don't actually have an opinion on whether the dev parameter is useful
>>> or not.
>>>
>>> But please don't add a drm_bridge_add_with_dev() and then convert more
>>> than half the drm_bridge_add() users to that. Please just add a struct
>>> device *dev parameter to drm_bridge_add(), and pass NULL if it's not
>>> relevant.
>>>
>>
>> To be honest, previously, I'm just do it exactly same as the way you
>> told me here. But I'm exhausted and finally give up.
>>
>> Because this is again need me to modify *all* callers of
>> drm_bridge_add(), not only those bridges in drm/bridge/, but also
>> bridge instances in various KMS drivers.
>>
>> However, their some exceptions just don't fit!
>>
>> For example, the imx/imx8qxp-pixel-combiner.c just don't fit our
>> simple model. Our helper function assume that one device backing
>> one drm_bridge instance (1 to 1). Yet, that driver backing two or
>> more bridges with one platform device (1 to 2, 1 to 3, ..., ).
>> Hence, the imx/imx8qxp-pixel-combiner.c just can't use
>> drm_bridge_add_with_dev().
>>
>> The aux_hpd_bridge.c is also bad, it store the of_node of struct device
>> at the .platform_data member of the struct device.
> 
> Like I said, "pass NULL if it's not relevant."

OK, good idea.

> "_add_with_dev" is a terrible function name.
> 
> What if you need to add another parameter later? Add _add_with_foo and
> _add_with_dev_and_foo variants?

Yes, you are right, I'll back give another try then.

> BR,
> Jani.
> 
> 

-- 
Best regards
Sui

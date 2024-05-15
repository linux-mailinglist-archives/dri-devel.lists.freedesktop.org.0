Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E81F8C64F4
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 12:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4714310E038;
	Wed, 15 May 2024 10:28:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pyhde/m8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6810E038
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 10:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715768901; x=1747304901;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SZoWlGnmgV61Pl2VHs2CbLi62HpXvCNSpYiN4VVjKVE=;
 b=Pyhde/m8agAHHLjDkUvAzs61EtfnJBeZL/cVBlxk5C/m88WyPcK6ojLl
 g9Y3YPayp4VvV5poYchUWNz1+ivSDkUKY4FxABLmp+NuWBfPcSFROESEv
 P3fxpbuqSOf8j7PzJAzWAekOSui/sumwDZh8c7wYCjq3LfwTKoqnDGwOc
 6tooyMI4YoB7I+vx1jy0eSOLHIhkZa1fRErS6dUtEhTKbvKmmRX9/dVhr
 FzA14evSkvWHRpqrSP5FaMF3D4gb8eBViOn9qtxy+iN0eAAdeMT5WMIBa
 JLUauKb8Nc3XjtsMCMgBuB27YX0p7APN0wNGqoX3W6SGXIARZIRrU0rL5 Q==;
X-CSE-ConnectionGUID: TiSaFJFaTpWE2MZvpHSjyA==
X-CSE-MsgGUID: AElqrJ7zTxOy2aLPYqRyWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11927598"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="11927598"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 03:28:20 -0700
X-CSE-ConnectionGUID: kMvaXwGjT2+AJuapoRbj7Q==
X-CSE-MsgGUID: L2aWUYKIQD6r7RxqrmwhoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="35480132"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.141])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 03:28:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Neil Armstrong
 <neil.armstrong@linaro.org>, Maxime Ripard <mripard@kernel.org>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: Support finding bridge with struct device
In-Reply-To: <cd81893c-ef0b-4906-8c9c-a98b1e4669e6@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
 <20240514154045.309925-2-sui.jingfeng@linux.dev>
 <87v83fct2e.fsf@intel.com>
 <cd81893c-ef0b-4906-8c9c-a98b1e4669e6@linux.dev>
Date: Wed, 15 May 2024 13:28:11 +0300
Message-ID: <87pltncqtg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 15 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> Hi,
>
>
> On 5/15/24 17:39, Jani Nikula wrote:
>> On Tue, 14 May 2024, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>>> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
>>> index 584d109330ab..1928d9d0dd3c 100644
>>> --- a/drivers/gpu/drm/drm_bridge.c
>>> +++ b/drivers/gpu/drm/drm_bridge.c
>>> @@ -213,6 +213,23 @@ void drm_bridge_add(struct drm_bridge *bridge)
>>>   }
>>>   EXPORT_SYMBOL(drm_bridge_add);
>>>   
>>> +/**
>>> + * drm_bridge_add_with_dev - add the given bridge to the global bridge list
>>> + *
>>> + * @bridge: bridge control structure
>>> + * @dev: pointer to the kernel device that this bridge is backed.
>>> + */
>>> +void drm_bridge_add_with_dev(struct drm_bridge *bridge, struct device *dev)
>>> +{
>>> +	if (dev) {
>>> +		bridge->kdev = dev;
>>> +		bridge->of_node = dev->of_node;
>>> +	}
>>> +
>>> +	drm_bridge_add(bridge);
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_bridge_add_with_dev);
>> 
>> I don't actually have an opinion on whether the dev parameter is useful
>> or not.
>> 
>> But please don't add a drm_bridge_add_with_dev() and then convert more
>> than half the drm_bridge_add() users to that. Please just add a struct
>> device *dev parameter to drm_bridge_add(), and pass NULL if it's not
>> relevant.
>> 
>
> To be honest, previously, I'm just do it exactly same as the way you
> told me here. But I'm exhausted and finally give up.
>
> Because this is again need me to modify *all* callers of 
> drm_bridge_add(), not only those bridges in drm/bridge/, but also
> bridge instances in various KMS drivers.
>
> However, their some exceptions just don't fit!
>
> For example, the imx/imx8qxp-pixel-combiner.c just don't fit our
> simple model. Our helper function assume that one device backing
> one drm_bridge instance (1 to 1). Yet, that driver backing two or
> more bridges with one platform device (1 to 2, 1 to 3, ..., ).
> Hence, the imx/imx8qxp-pixel-combiner.c just can't use 
> drm_bridge_add_with_dev().
>
> The aux_hpd_bridge.c is also bad, it store the of_node of struct device 
> at the .platform_data member of the struct device.

Like I said, "pass NULL if it's not relevant."

"_add_with_dev" is a terrible function name.

What if you need to add another parameter later? Add _add_with_foo and
_add_with_dev_and_foo variants?

BR,
Jani.


-- 
Jani Nikula, Intel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9B47EA263
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 18:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D21A10E3E7;
	Mon, 13 Nov 2023 17:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6034F10E3E5;
 Mon, 13 Nov 2023 17:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699897843; x=1731433843;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=x3fSoSQz6UCNu3JdEMAXXt9H/432BZE0hvyfGRoi6Hc=;
 b=TJk7qqHkioV73o8EbWt4cTfBNc3zwObAQx3WysnvwCBo7sM7VJDn1Kt8
 OGkdFOycbnRouRWs3HAIghP6J6XD5Nq6ibwKxtz/5dDw3oxrNQnSIwyj5
 60gCrMutE/RMAjSUIlyZXJzOVLooB64fZewcJmbX8JG0k6KYZoLnrxClo
 vkBdrLicg9+H4t4YZIRRJpra2uYblih0pxWJ5cPQGJpYny1ZOw066M0ID
 qDU0SYU1XIgSi5lPSaTNUENj0bXpzFwRZO893WODQQbYtfv7iW12xVBue
 +OspGZ24YVBijXvwpwB00ogfPAUGjKjoV/dXt/SlyySYv2S8n76E4m5O/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="456972053"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="456972053"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:50:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011613445"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; d="scan'208";a="1011613445"
Received: from cgheban-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.55.92])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 09:50:39 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 15/20] drivers/gpu/drm/i915/display: remove
 I2C_CLASS_DDC support
In-Reply-To: <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231113112344.719-1-hkallweit1@gmail.com>
 <20231113112344.719-16-hkallweit1@gmail.com> <87sf59vodx.fsf@intel.com>
 <6f924890-a5a0-48b4-973d-3c0f88b0d294@gmail.com>
Date: Mon, 13 Nov 2023 19:50:36 +0200
Message-ID: <878r71tudv.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> On 13.11.2023 13:17, Jani Nikula wrote:
>> On Mon, 13 Nov 2023, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>> After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
>>> olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
>>> Class-based device auto-detection is a legacy mechanism and shouldn't
>>> be used in new code. So we can remove this class completely now.
>> 
>> So this is copy-pasted to all commits and the cover letter, but please
>> do explain why there are no functional changes here (or are there?),
>> without me having to go through the i2c stack and try to find the
>> commits alluded to in "After removal of the legacy ...".
>> 
> Legacy eeprom driver was marked deprecated 4 yrs ago with:
> 3079b54aa9a0 ("eeprom: Warn that the driver is deprecated")
> Now it has been removed with:
> 0113a99b8a75 ("eeprom: Remove deprecated legacy eeprom driver")
>
> Declaration of I2C_CLASS_DDC support is a no-op now, so there's
> no functional change in this patch.
>
> If loaded manually, the legacy eeprom driver exposed the DDC EEPROM
> to userspace. If this functionality is needed, then now the DDC
> EEPROM has to be explicitly instantiated using at24.
>
> See also:
> https://docs.kernel.org/i2c/instantiating-devices.html

I'll take your word for it. Though none of the documentation I can find
say that setting the class is legacy or deprecated or should be
avoided. *shrug*.

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
>
>> What does this mean?
>> 
>> 
>> BR,
>> Jani.
>> 
> Heiner
>
>> 
>>>
>>> Preferably this series should be applied via the i2c tree.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_gmbus.c |    1 -
>>>  drivers/gpu/drm/i915/display/intel_sdvo.c  |    1 -
>>>  2 files changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> index 40d7b6f3f..e9e4dcf34 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
>>> @@ -899,7 +899,6 @@ int intel_gmbus_setup(struct drm_i915_private *i915)
>>>  		}
>>>  
>>>  		bus->adapter.owner = THIS_MODULE;
>>> -		bus->adapter.class = I2C_CLASS_DDC;
>>>  		snprintf(bus->adapter.name,
>>>  			 sizeof(bus->adapter.name),
>>>  			 "i915 gmbus %s", gmbus_pin->name);
>>> diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> index a636f42ce..5e64d1baf 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
>>> @@ -3311,7 +3311,6 @@ intel_sdvo_init_ddc_proxy(struct intel_sdvo_ddc *ddc,
>>>  	ddc->ddc_bus = ddc_bus;
>>>  
>>>  	ddc->ddc.owner = THIS_MODULE;
>>> -	ddc->ddc.class = I2C_CLASS_DDC;
>>>  	snprintf(ddc->ddc.name, I2C_NAME_SIZE, "SDVO %c DDC%d",
>>>  		 port_name(sdvo->base.port), ddc_bus);
>>>  	ddc->ddc.dev.parent = &pdev->dev;
>>>
>> 
>

-- 
Jani Nikula, Intel

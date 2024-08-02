Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 322D1945AF0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBF510E9E4;
	Fri,  2 Aug 2024 09:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2DQpku/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF8210E047
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722590677; x=1754126677;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+30Ap14EQ4h2NhyFT3LMwTa6oZGyUzzw/ei5xXqzuqM=;
 b=R2DQpku//7JyY9pP+sUKwMdKZURzcTRkf7EQYSAlULKAzKwuMnwaLCmK
 1xHWZBwLLn6OyB70eQxztz88QcBwD7Yn4eFsPXkBunaVaZRwOU95HTcEm
 nMXMjr7wgTV0dMViGWTPhGzwifAmcIsJdeiI/JXm5NWnGTWloWMjVZZad
 c/KKGBxxL63rr0GQWeEth9gnKoFYH1hJAbT2oktSkVmWHpt2rSFC2uWgi
 FKm8hlb3m53hKQRpQ8A4PL0v88XhpT63xLoio5+e0vGj6WsG8SZjvsjEb
 Is/4hF25DTQx4r5YEyt7zpBaPO05gtQ/5nbTwCmZykwnvxylE0q7Yjv7d A==;
X-CSE-ConnectionGUID: aP7VYEgiRkOt7VCKPXzR9Q==
X-CSE-MsgGUID: ZXzzobvxT5yfYwPBDkF4lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="38061083"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="38061083"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:23:59 -0700
X-CSE-ConnectionGUID: 72nN5EiaRhukFY6hqjb4pg==
X-CSE-MsgGUID: xdmYLuhAS1qfQXnjSm7nFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55262104"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.66])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 02:23:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/client: Use common display mode for cloned outputs
In-Reply-To: <267474ce-d158-46c5-aeb8-8d839b3b4322@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240801130449.104645-1-tzimmermann@suse.de>
 <878qxf73mg.fsf@intel.com> <267474ce-d158-46c5-aeb8-8d839b3b4322@suse.de>
Date: Fri, 02 Aug 2024 12:23:21 +0300
Message-ID: <87wmkz5ldi.fsf@intel.com>
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

On Fri, 02 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 02.08.24 um 10:03 schrieb Jani Nikula:
>> On Thu, 01 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> For cloned outputs, don't pick a default resolution of 1024x768 as
>>> most hardware can do better. Instead look through the modes of all
>>> connectors to find a common mode for all of them.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_client_modeset.c | 54 +++++++++++++++++-----------
>>>   1 file changed, 34 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>>> index 31af5cf37a09..67b422dc8e7f 100644
>>> --- a/drivers/gpu/drm/drm_client_modeset.c
>>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>>> @@ -266,7 +266,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>>>   {
>>>   	int count, i, j;
>>>   	bool can_clone = false;
>>> -	struct drm_display_mode *dmt_mode, *mode;
>>> +	struct drm_display_mode *mode, *common_mode = NULL;
>>>   
>>>   	/* only contemplate cloning in the single crtc case */
>>>   	if (dev->mode_config.num_crtc > 1)
>>> @@ -309,35 +309,49 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>>>   		return true;
>>>   	}
>>>   
>>> -	/* try and find a 1024x768 mode on each connector */
>>> -	can_clone = true;
>>> -	dmt_mode = drm_mode_find_dmt(dev, 1024, 768, 60, false);
>>> -
>>> -	if (!dmt_mode)
>>> -		goto fail;
>>> +	/* try and find a mode common among connectors */
>>>   
>>> +	can_clone = false;
>>>   	for (i = 0; i < connector_count; i++) {
>>>   		if (!enabled[i])
>>>   			continue;
>>>   
>>> -		list_for_each_entry(mode, &connectors[i]->modes, head) {
>>> -			if (drm_mode_match(mode, dmt_mode,
>>> -					   DRM_MODE_MATCH_TIMINGS |
>>> -					   DRM_MODE_MATCH_CLOCK |
>>> -					   DRM_MODE_MATCH_FLAGS |
>>> -					   DRM_MODE_MATCH_3D_FLAGS))
>>> -				modes[i] = mode;
>>> +		list_for_each_entry(common_mode, &connectors[i]->modes, head) {
>>> +			can_clone = true;
>>> +
>>> +			for (j = 1; j < connector_count; j++) {
>> Should this start from i instead of 1?
>
> Right, it would make sense.
>
>>
>> Anyway, I have a hard time wrapping my head around this whole thing. I
>> think it would greatly benefit from a helper function to search for a
>> mode from an array of connectors.
>
> That's what it does. Here, the outer-most loop tries to find the first 
> enabled connector. For each of its modes, the inner loops test if that 
> mode is also present on all other enabled connectors.
>
> All of the client's mode-selection code is fairly obscure. I don't 
> really dare touching it.

I mean just refactoring the above loops to smaller pieces.

BR,
Jani.

>
> Best regards
> Thomas
>
>>
>> BR,
>> Jani.
>>
>>
>>> +				if (!enabled[i])
>>> +					continue;
>>> +
>>> +				can_clone = false;
>>> +				list_for_each_entry(mode, &connectors[j]->modes, head) {
>>> +					can_clone = drm_mode_match(common_mode, mode,
>>> +								   DRM_MODE_MATCH_TIMINGS |
>>> +							    DRM_MODE_MATCH_CLOCK |
>>> +							    DRM_MODE_MATCH_FLAGS |
>>> +							    DRM_MODE_MATCH_3D_FLAGS);
>>> +					if (can_clone)
>>> +						break; // found common mode on connector
>>> +				}
>>> +				if (!can_clone)
>>> +					break; // try next common mode
>>> +			}
>>> +			if (can_clone)
>>> +				break; // found common mode among all connectors
>>>   		}
>>> -		if (!modes[i])
>>> -			can_clone = false;
>>> +		break;
>>>   	}
>>> -	kfree(dmt_mode);
>>> -
>>>   	if (can_clone) {
>>> -		drm_dbg_kms(dev, "can clone using 1024x768\n");
>>> +		for (i = 0; i < connector_count; i++) {
>>> +			if (!enabled[i])
>>> +				continue;
>>> +			modes[i] = common_mode;
>>> +
>>> +		}
>>> +		drm_dbg_kms(dev, "can clone using" DRM_MODE_FMT "\n", DRM_MODE_ARG(common_mode));
>>>   		return true;
>>>   	}
>>> -fail:
>>> +
>>>   	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
>>>   	return false;
>>>   }

-- 
Jani Nikula, Intel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F64F7A1D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E6F10E54C;
	Thu,  7 Apr 2022 08:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF3E10E54C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649321118; x=1680857118;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=lSX50a6jnLkclzn/wMe/C8LXTgb1CQOGo94u6NkUO1E=;
 b=fUQxTahPYGgl3T/AvPmdWke4ZNuEUz0IKh61e/BHUlwqknkImlQ7srLY
 qntS3w3ab45CXzsC4J4jMFrwNR+pSTOVaXwW/jplhCdOsd83w3FjVAPWk
 GnkUVHsBJc7F3CXHLdSRlqnX0VPbw89PmJkvjmQjiu8BysObhu5uJZWI0
 Yiw4hwZlL7KXYSIhcxoSkYA5HsFXjKHdhVgp4AxeiQRnFqddArqbKa87P
 cEOVys4K4rOZKpKPJaEaBFEDXfnPtfswMp0l1Ndf0/fOAZFKYk7t7230W
 +9+JDjIqtsP+Oz4cORUyVdH7yL20npPGrxdefEHQNF5WGXD89yp2I/qSw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="260102419"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="260102419"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 01:45:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="524834889"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 01:45:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, lyude@redhat.com
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
In-Reply-To: <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
 <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
 <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de>
Date: Thu, 07 Apr 2022 11:45:11 +0300
Message-ID: <87tub55lk8.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi Javier
>
> Am 07.04.22 um 09:43 schrieb Javier Martinez Canillas:
>> On 4/6/22 21:08, Thomas Zimmermann wrote:
>>> Hi Javier
>>>
>>> Am 30.03.22 um 11:23 schrieb Javier Martinez Canillas:
>>>> On 3/22/22 20:27, Thomas Zimmermann wrote:
>>>>> Replace the DP-helper module with a display-helper module. Update
>>>>> all related Kconfig and Makefile rules.
>>>>>
>>>>> Besides the existing code for DisplayPort, the new module will
>>>>> contain helpers for other video-output standards, such as HDMI.
>>>>> Drivers will still be able to select the required video-output
>>>>> helpers. Linking all such code into a single module avoids the
>>>>> proliferation of small kernel modules.
>>>>>
>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> ---
>>>>
>>>> [snip]
>>>>
>>>>> +config DRM_DISPLAY_HELPER
>>>>> +	tristate
>>>>> +	depends on DRM
>>>>> +	help
>>>>> +	  DRM helpers for display adapters.
>>>>> +
>>>>>    config DRM_DP_HELPER
>>>>>    	tristate
>>>>>    	depends on DRM
>>>>> +	select DRM_DISPLAY_HELPER
>>>>>    	help
>>>>>    	  DRM helpers for DisplayPort.
>>>>>
>>>>
>>>> I was about to ask why this would still be needed but then re-read the
>>>> commit message that says drivers will still be able to select required
>>>> video-output helpers.
>>>>
>>>> That makes sense since the fact that all helpers will be in the same module
>>>> would be transparent to drivers.
>>>
>>> After some more testing, it turns out to be not so easy. For example, if
>>> we have DP_HELPER=m and HDMI_HELPER=y, then DISPLAY_HELPER would be
>>> auto-selected as 'y'. The code for DP_HELPER would not be linked correctly.
>>>
>>> I'm going to make drivers select DISPLAY_HELPER and the rsp helpers
>>> explicitly. The individual helpers would be covered boolean options that
>>> enable the feature in the display-helper library.
>>>
>>> If you know some Kconfig magic to enable the original design, let me know.
>>>
>> 
>> I do not. But I wonder if the problem here is the usage of select rather than
>> depends and if with the later the original design could still be achieved...
>
> With 'depends DRM_DISPLAY_HELPER' users would need to explictly enable 
> DRM_DISPLAY_HELPER, I think.
>
>> 
>> But yes, probably the only way to prevent that issue is to make the drivers
>> to explicitly select both DRM_DISPLAY_HELPER and respective helpers symbol.
>
> I'll remake the patches with the new style.
>
> I think another idea that could work is to use an intermediate symbol. 
> For DP, drivers would select the tristate DP_HELPER, which in turn 
> selects tristate DISPLAY_HELPER and boolean DISPLAY_DP_HELPER.  But this 
> would require a 'useless' symbol DP_HELPER only for convenience.  It's 
> an even less optimal solution, it seems.

Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
-->	In general use select only for non-visible symbols
-->	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

Most of the difficult Kconfig issues I've encountered over the years
come from not following the above two rules. People break those rules
for "convenience", causing a lot of inconvenience down the line.


BR,
Jani.


>
> Best regards
> Thomas
>
>>   --
>> Best regards,
>> 
>> Javier Martinez Canillas
>> Linux Engineering
>> Red Hat
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center

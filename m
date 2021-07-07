Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64163BEB1C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 17:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D486E0A1;
	Wed,  7 Jul 2021 15:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B666E0A1;
 Wed,  7 Jul 2021 15:40:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="231068220"
X-IronPort-AV: E=Sophos;i="5.84,331,1620716400"; d="scan'208";a="231068220"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:40:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,331,1620716400"; d="scan'208";a="461374956"
Received: from spendela-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.41.163])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 08:40:31 -0700
Date: Wed, 7 Jul 2021 08:40:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/53] drm/i915: Add "release id" version
Message-ID: <20210707154030.52spn6p2xo7cpoxh@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
 <20210701202427.1547543-2-matthew.d.roper@intel.com>
 <e15c0271-8663-6122-f7af-80c642fd2a4f@linux.intel.com>
 <87wnq57zb4.fsf@intel.com>
 <20210706210926.yo3edlztgeoitqul@ldmartin-desk2>
 <8735sq8qub.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8735sq8qub.fsf@intel.com>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 11:34:36AM +0300, Jani Nikula wrote:
>On Tue, 06 Jul 2021, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Mon, Jul 05, 2021 at 02:52:31PM +0300, Jani Nikula wrote:
>>>On Fri, 02 Jul 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 01/07/2021 21:23, Matt Roper wrote:
>>>>> From: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>
>>>>> Besides the arch version returned by GRAPHICS_VER(), new platforms
>>>>> contain a "release id" to make clear the difference from one platform to
>>>>> another. Although for the first ones we may use them as if they were a
>>>>
>>>> What does "first ones" refer to here?
>>>>
>>>>> major/minor version, that is not true for all platforms: we may have a
>>>>> `release_id == n` that is closer to `n - 2` than to `n - 1`.
>>>>
>>>> Hm this is a bit confusing. Is the sentence simply trying to say that,
>>>> as the release id number is growing, hw capabilities are not simply
>>>> accumulating but can be removed as well? Otherwise I am not sure how the
>>>> user of these macros is supposed to act on this sentence.
>>>>
>>>>> However the release id number is not defined by hardware until we start
>>>>> using the GMD_ID register. For the platforms before that register is
>>>>> useful we will set the values in software and we can set them as we
>>>>> please. So the plan is to set them so we can group different features
>>>>> under a single GRAPHICS_VER_FULL() check.
>>>>>
>>>>> After GMD_ID is used, the usefulness of a "full version check" will be
>>>>> greatly reduced and will be mostly used for deciding workarounds and a
>>>>> few code paths. So it makes sense to keep it as a separate field from
>>>>> graphics_ver.
>>>>>
>>>>> Also, currently there is not much use for the release id in media and
>>>>> display, so keep them out.
>>>>>
>>>>> This is a mix of 2 independent changes: one by me and the other by Matt
>>>>> Roper.
>>>>>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/i915/i915_drv.h          | 6 ++++++
>>>>>   drivers/gpu/drm/i915/intel_device_info.c | 2 ++
>>>>>   drivers/gpu/drm/i915/intel_device_info.h | 2 ++
>>>>>   3 files changed, 10 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>>>> index 6dff4ca01241..9639800485b9 100644
>>>>> --- a/drivers/gpu/drm/i915/i915_drv.h
>>>>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>>>>> @@ -1258,11 +1258,17 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>>>>>    */
>>>>>   #define IS_GEN(dev_priv, n)		(GRAPHICS_VER(dev_priv) == (n))
>>>>>
>>>>> +#define IP_VER(ver, release)		((ver) << 8 | (release))
>>>>> +
>>>>>   #define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics_ver)
>>>>> +#define GRAPHICS_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->graphics_ver, \
>>>>> +					       INTEL_INFO(i915)->graphics_ver_release)
>>>>>   #define IS_GRAPHICS_VER(i915, from, until) \
>>>>>   	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>>>>>
>>>>>   #define MEDIA_VER(i915)			(INTEL_INFO(i915)->media_ver)
>>>>> +#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media_ver, \
>>>>> +					       INTEL_INFO(i915)->media_ver_release)
>>>>>   #define IS_MEDIA_VER(i915, from, until) \
>>>>>   	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>>>>>
>>>>> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>>>>> index 7eaa92fee421..e8ad14f002c1 100644
>>>>> --- a/drivers/gpu/drm/i915/intel_device_info.c
>>>>> +++ b/drivers/gpu/drm/i915/intel_device_info.c
>>>>> @@ -97,7 +97,9 @@ void intel_device_info_print_static(const struct intel_device_info *info,
>>>>>   				    struct drm_printer *p)
>>>>>   {
>>>>>   	drm_printf(p, "graphics_ver: %u\n", info->graphics_ver);
>>>>> +	drm_printf(p, "graphics_ver_release: %u\n", info->graphics_ver_release);
>>>>
>>>> I get the VER and VER_FULL in the macros but could 'ver' and
>>>> 'ver_release' here and in the code simply be renamed to 'ver'/'version'
>>>> and 'release'? Maybe it is just me but don't think I encountered the
>>>> term "version release" before.
>>>
>>>Just bikeshedding here, but I thought of:
>>>
>>>	if (info->grapics_ver_release)
>>>		drm_printf(p, "graphics_ver: %u.%u\n", info->graphics_ver, info->graphics_ver_release);
>>>	else
>>>		drm_printf(p, "graphics_ver: %u\n", info->graphics_ver);
>>
>> humn... a suggestion that I got internally a few week ago and I forgot
>> to update this was that this doesn't need to be abbreviated in debugfs
>> and could very well be:
>>
>> 	drm_printf(p, "graphics version: %u\n", info->graphics_ver);
>> 	drm_printf(p, "graphics release: %u\n", info->graphics_ver_release);
>>>
>>>Also, I thought "x_ver" and "x_ver_release" sounds a bit odd, perhaps
>>>having "x_ver" and "x_rel" is more natural?
>>
>> Not sure what direction to go now though. Maybe trying to put all
>> suggestions together:
>>
>> 	if (info->graphics_rel)
>> 		drm_printf(p, "graphics version: %u.%u\n", info->graphics_ver, info->graphics_rel);
>> 	else
>> 		drm_printf(p, "graphics version: %u\n", info->graphics_ver);
>>
>> One thing  I like is that doing `| grep "graphics version"`
>> gives all info you are searching for.
>
>I'd like that, but this is all bikeshedding, really.

I already updated our local copy with all of this, so I'm fine including
that in the next version... since this is the first patch, I can also
send it standalone.

Lucas De Marchi

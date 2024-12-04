Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C71D29E35B5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 09:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A20210EC6E;
	Wed,  4 Dec 2024 08:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SIYXizQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22AD10EC5F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733301787; x=1764837787;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=IOwxwo7QkxLf/C7exfm98Mts7bU1WsTOT08b0sxX9iY=;
 b=SIYXizQd6FO4zUoR6QqHvnooEmmRnzvoMHeedHtXDMIfn1B/STMbyNqR
 iSMu8fiFcIujQuqWFYvzBW6/J5xdodgOisRCjY1B68SXyqNCXGeS1SB8v
 ES8jBqNp8THs6BGBmaoF6kJXvamHvYApynWTjlJCp6Pz9M2YF+VfO8awy
 VIRMzQsnnMdwauYHdLnCeW/xYusNk98um+d/L12DGQ6/c+031NRb3c5lE
 /X7Q7cgU6PwpCCAakvAW+acVurbAXhnnpmYjCTqhncP9G5AtEm0jtF3z3
 evvXoZf/FkA+DUQE8yiU9QTNOPs65VYdaY94tX0RXW08D8caj/1EB1tto g==;
X-CSE-ConnectionGUID: R2Q4bcgWSImEqLmphcHfNw==
X-CSE-MsgGUID: sRWYwaZ1Srqqvi0pmsmjBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33686971"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33686971"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:43:06 -0800
X-CSE-ConnectionGUID: Q2b1yxrQS1qk46488hXvow==
X-CSE-MsgGUID: 2P3Kd22jR/ajvprtVQjY1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98506947"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:43:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Jocelyn Falempe
 <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 1/6] drm/panic: Move drawing functions to drm_draw
In-Reply-To: <b71926ec-ca5b-4db6-a72e-6ba539e165f3@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241115142950.1758007-1-jfalempe@redhat.com>
 <20241115142950.1758007-2-jfalempe@redhat.com> <87y10x3u0x.fsf@intel.com>
 <a51f2945-4eff-411e-83ad-838e69daeb6a@redhat.com>
 <87ed2o506g.fsf@intel.com>
 <4f99d11e-7860-45f4-b366-e1ecf649914b@redhat.com>
 <b71926ec-ca5b-4db6-a72e-6ba539e165f3@suse.de>
Date: Wed, 04 Dec 2024 10:43:01 +0200
Message-ID: <87ser33kkq.fsf@intel.com>
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

On Tue, 03 Dec 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
>
> Am 03.12.24 um 15:19 schrieb Jocelyn Falempe:
>> On 03/12/2024 15:08, Jani Nikula wrote:
>>> On Tue, 03 Dec 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>> On 03/12/2024 12:06, Jani Nikula wrote:
>>>>> On Fri, 15 Nov 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>>>>> Move the color conversions, blit and fill functions to drm_draw.c,
>>>>>> so that they can be re-used by drm_log.
>>>>>> drm_draw is internal to the drm subsystem, and shouldn't be used by
>>>>>> gpu drivers.
>>>>>
>>>>> I started looking at this in patch 2:
>>>>>
>>>>>> +#include "../drm_draw.h"
>>>>>
>>>>> I think we should avoid #includes with ../ like this.
>>>>
>>>> Sure, I've added it in v8, after the clients moved to drm/clients/, but
>>>> I didn't think much about it.
>>>>
>>>>>
>>>>> Either drm_draw.h belongs in include/drm, or maybe clients/Makefile
>>>>> needs to add subdir-ccflags-y += -I$(src)/.. or something like that?
>>>>>
>>>>> If it's supposed to be internal, I guess the latter, but then the
>>>>> current convention is to have _internal.h suffix. All drm headers 
>>>>> under
>>>>> drivers/ have that.
>>>>
>>>> ok, I can rename drm_draw.h to drm_draw_internal.h, and add the include
>>>> in the Makefile.
>>>>>
>>>>> Is this the first drm subsystem internal thing that's a separate 
>>>>> module?
>>>>> Should we use EXPORT_SYMBOL_NS() and MODULE_IMPORT_NS() to enforce it
>>>>> being internal?
>>>>
>>>> It's not really a separate module, as it's built in the core drm 
>>>> module.
>>>> (the reason is that it's used by drm_panic too, which must be in the
>>>> core drm module).
>>>
>>> Right, sorry, I got confused and looked at this the other way round.
>>>
>>> drm_draw is part of drm.ko, drm log is part of drm_client_lib.ko, and
>>> uses drm_draw, right?
>> Yes, that's it.
>>>
>>> So is drm_draw really internal if drm client uses it?
>>
>> For me "internal" includes drm clients and kms helpers, but yes, it's 
>> not really clear.
>>
>>>
>>> I don't really deeply care either way, but it bugs me when it's
>>> somewhere in between. :)
>>>
>>> Either include/drm/drm_draw.h or drivers/gpu/drm/drm_draw_internal.h,
>>> the latter *possibly* with symbol namespace, but not a big deal.
>>
>> The other reason for "internal" is that we should find a way to merge 
>> drm_draw, drm_format_helper, and some vkms conversion helper, that 
>> does similar things. So the less users, the easier it will be.
>
> Exactly. 'internal' definitely means not-drivers. And the last thing we 
> want is DRM drivers that draw framebuffers by themselves. When we unify 
> and harmonize the various blit and draw helpers, we can still loosen the 
> requirements if necessary.

Then maybe we should have a "drm internal" symbol namespace for internal
stuff that's spread across modules? I don't think it's a blocker for
merging this series, but it would certainly raise some flags before
someone accidentally starts using the stuff, them being exported and
all.

BR,
Jani.


-- 
Jani Nikula, Intel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D740D7A7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 12:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DA66EB5E;
	Thu, 16 Sep 2021 10:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7436EB5B;
 Thu, 16 Sep 2021 10:43:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244911700"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="244911700"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:43:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="553817313"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.34.120])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:43:31 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tim Gardner <tim.gardner@canonical.com>, linux-kernel@vger.kernel.org
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: zero fill vma name buffer
In-Reply-To: <7a653532-046d-c68a-3dc9-ef2deaf455f9@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210915192318.2061-1-tim.gardner@canonical.com>
 <7a653532-046d-c68a-3dc9-ef2deaf455f9@linux.intel.com>
Date: Thu, 16 Sep 2021 13:43:28 +0300
Message-ID: <87ee9ox0kv.fsf@intel.com>
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

On Thu, 16 Sep 2021, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> On 15/09/2021 20:23, Tim Gardner wrote:
>> In capture_vma() Coverity complains of a possible buffer overrun. Even
>> though this is a static function where all call sites can be checked,
>> limiting the copy length could save some future grief.
>> 
>> CID 93300 (#1 of 1): Copy into fixed size buffer (STRING_OVERFLOW)
>> 4. fixed_size_dest: You might overrun the 16-character fixed-size string c->name
>>     by copying name without checking the length.
>> 5. parameter_as_source: Note: This defect has an elevated risk because the
>>     source argument is a parameter of the current function.
>> 1326        strcpy(c->name, name);
>> 
>> Fix any possible overflows by using strncpy(). Zero fill the name buffer to
>> guarantee ASCII string NULL termination.
>> 
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: intel-gfx@lists.freedesktop.org
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 9cf6ac575de1..154df174e2d7 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1297,10 +1297,11 @@ static bool record_context(struct i915_gem_context_coredump *e,
>>   	return simulated;
>>   }
>>   
>> +#define VMA_NAME_LEN 16
>>   struct intel_engine_capture_vma {
>>   	struct intel_engine_capture_vma *next;
>>   	struct i915_vma *vma;
>> -	char name[16];
>> +	char name[VMA_NAME_LEN];
>>   };
>>   
>>   static struct intel_engine_capture_vma *
>> @@ -1314,7 +1315,7 @@ capture_vma(struct intel_engine_capture_vma *next,
>>   	if (!vma)
>>   		return next;
>>   
>> -	c = kmalloc(sizeof(*c), gfp);
>> +	c = kzalloc(sizeof(*c), gfp);
>>   	if (!c)
>>   		return next;
>>   
>> @@ -1323,7 +1324,7 @@ capture_vma(struct intel_engine_capture_vma *next,
>>   		return next;
>>   	}
>>   
>> -	strcpy(c->name, name);
>> +	strncpy(c->name, name, VMA_NAME_LEN-1);
>
> GCC is supposed to catch any problems here as you say in the commit message.
>
> But to fix I suggest a single line change to strlcpy(c->name, name, 
> sizeof(c->name)) which always null terminates as bonus.

strscpy() is preferred over both strncpy() and strlcpy(). :)

BR,
Jani.

>
> Probably same in i915_vma_coredump_create() which with strncpy would 
> have a theoretical chance of attempting to copy over a 
> non-null-terminated string.
>
> Regards,
>
> Tvrtko
>
>>   	c->vma = vma; /* reference held while active */
>>   
>>   	c->next = next;
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE473DA1A1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 12:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9F66ED17;
	Thu, 29 Jul 2021 10:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803BC6E0CF;
 Thu, 29 Jul 2021 10:55:57 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="234748533"
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="234748533"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 03:55:57 -0700
X-IronPort-AV: E=Sophos;i="5.84,278,1620716400"; d="scan'208";a="664336706"
Received: from badunne-mobl5.ger.corp.intel.com (HELO [10.252.9.201])
 ([10.252.9.201])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2021 03:55:56 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/selftests: fixup igt_shrink_thp
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20210728155013.1741657-1-matthew.auld@intel.com>
 <c5365359-0a0d-2232-5fde-c1f4caf45cc6@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <8c6468ab-a266-cb19-7b1e-e7840fa514c0@intel.com>
Date: Thu, 29 Jul 2021 11:55:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c5365359-0a0d-2232-5fde-c1f4caf45cc6@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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

On 29/07/2021 11:53, Tvrtko Ursulin wrote:
> 
> Hi Matt,
> 
> On 28/07/2021 16:50, Matthew Auld wrote:
>> Since the object might still be active here, the shrink_all will simply
>> ignore it, which blows up in the test, since the pages will still be
>> there. Currently THP is disabled which should result in the test being
>> skipped, but if we ever re-enable THP we might start seeing the failure.
>> Fix this by forcing I915_SHRINK_ACTIVE.
>>
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c 
>> b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> index a094f3ce1a90..7a67e880b562 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -1575,7 +1575,10 @@ static int igt_shrink_thp(void *arg)
>>        * Now that the pages are *unpinned* shrink-all should invoke
>>        * shmem to truncate our pages.
>>        */
>> -    i915_gem_shrink_all(i915);
>> +    i915_gem_shrink(NULL, i915, -1UL, NULL,
>> +            I915_SHRINK_BOUND |
>> +            I915_SHRINK_UNBOUND |
>> +            I915_SHRINK_ACTIVE);
>>       if (i915_gem_object_has_pages(obj)) {
>>           pr_err("shrink-all didn't truncate the pages\n");
>>           err = -EINVAL;
>>
> 
> I did s/shrink-all/shrinking/ locally in the comment above, and in 
> pr_err below the call to shrinker. Are you okay if I repost like that 
> and with my r-b as part of my series?

Sure.

> 
> Regards,
> 
> Tvrtko

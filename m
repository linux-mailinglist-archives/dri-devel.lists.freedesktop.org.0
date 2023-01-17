Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76B66D8E9
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 09:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834CE10E526;
	Tue, 17 Jan 2023 08:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBAF10E523;
 Tue, 17 Jan 2023 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673945863; x=1705481863;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UGwC0F+2sTx0QDqsfwQrpl04CHc9lq1xYlAMZD/BwKA=;
 b=mhepK5qgTz1p5RmcYx097mpgzU4z4czqMbLJx8vaQ5wxMYx61PzObTSv
 KnuRSMFUCy7JTEchXJ8t1IzX2gc21wm+HkE2PcLLO+41WJXuESwMcC4cP
 8kJPDBoWjMbgPhJJA4rBeqMjycv4cjBCSVcQ8aZmaBkuMb4Nvk6MWRE4k
 HeGd/npczmoO5Sv0I5dy5tsLSm9VYYe58qMYQHern29fehvOc+sYL3Tve
 brF374cv6qbwOGSoOBzX4uDKBMdqP0y/vZ5ZAYY2vaJMdVntJHLR6HspU
 /R8xSS6H11Jj3nsx5wm5JzBccBUiAJ2/nfCnLw6w9y8Vse1MYtb1CEd/Z w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="410883136"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="410883136"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 00:57:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="609184032"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="609184032"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.45.93])
 ([10.249.45.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 00:57:40 -0800
Message-ID: <2d8c8af8-238a-a164-0224-88ac12acaf7d@linux.intel.com>
Date: Tue, 17 Jan 2023 09:57:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
References: <20230113120053.29618-1-nirmoy.das@intel.com>
 <Y8WcLtKY3/cSMjgw@ashyti-mobl2.lan>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <Y8WcLtKY3/cSMjgw@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx@lists.freedesktop.org, chris.p.wilson@linux.intel.com,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/16/2023 7:49 PM, Andi Shyti wrote:
> Hi Nirmoy,
>
> On Fri, Jan 13, 2023 at 01:00:53PM +0100, Nirmoy Das wrote:
>> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>>
>> Make sure that upon error after we have acquired the wakeref we do
>> release it again.
>>
>> Fixes: 027c38b4121e ("drm/i915/selftests: Grab the runtime pm in shrink_thp")
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: <stable@vger.kernel.org> # v6.0+
>> ---
>>   drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> index c281b0ec9e05..295d6f2cc4ff 100644
>> --- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
>> @@ -1855,7 +1855,7 @@ static int igt_shrink_thp(void *arg)
>>   			I915_SHRINK_ACTIVE);
>>   	i915_vma_unpin(vma);
>>   	if (err)
>> -		goto out_put;
>> +		goto out_wf;
>>   
>>   	/*
>>   	 * Now that the pages are *unpinned* shrinking should invoke
>> @@ -1871,7 +1871,7 @@ static int igt_shrink_thp(void *arg)
>>   		pr_err("unexpected pages mismatch, should_swap=%s\n",
>>   		       str_yes_no(should_swap));
>>   		err = -EINVAL;
>> -		goto out_put;
>> +		goto out_wf;
>>   	}
> aren't we missing here one out_put -> out_wf change?
>
> This one:
>
> @@ -1878,7 +1878,7 @@ static int igt_shrink_thp(void *arg)
>                  pr_err("unexpected residual page-size bits, should_swap=%s\n",
>                         str_yes_no(should_swap));
>                  err = -EINVAL;
> -               goto out_put;
> +               goto out_wf;


Thanks for catching this. Yes, we need this too. I will resend.


Nirmoy

>          }
>   
>          err = i915_vma_pin(vma, 0, 0, flags);
>
> Andi
>
>>   
>>   	if (should_swap == (obj->mm.page_sizes.sg || obj->mm.page_sizes.phys)) {
>> @@ -1883,7 +1883,7 @@ static int igt_shrink_thp(void *arg)
>>   
>>   	err = i915_vma_pin(vma, 0, 0, flags);
>>   	if (err)
>> -		goto out_put;
>> +		goto out_wf;
>>   
>>   	while (n--) {
>>   		err = cpu_check(obj, n, 0xdeadbeaf);
>> -- 
>> 2.39.0

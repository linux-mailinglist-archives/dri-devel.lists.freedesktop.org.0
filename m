Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64055903F0A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 16:44:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2839C10E671;
	Tue, 11 Jun 2024 14:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eh3ElQEr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EE4C10E671;
 Tue, 11 Jun 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718117085; x=1749653085;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0eY5v2aVIYkyWBnLiIXrCO8LqSFCnbok+Z0D8vIigPI=;
 b=Eh3ElQErVQ2rxGS/A9KdHhU/gsnz1jXgbJfqqAf1Sv3IaFTxHfm9P5zT
 +LFm7kzAcGN8m0G+bFqkH6nDKTA+fQAavHo/+Bh70bESGVHBHqc9G04SL
 7ywNCx5HSPpxbYSqJE0kuv+XRRXUzOD2tJ2traCDZ+B5AOutf5QXDv36Y
 glI6hjtfVNIp2AGhVhodlVp3bh12X4OcDQwQA5XgPRe8ttMQr4Y+I8SxP
 o+VRRNcDHeryA7881R2MAGd7Oqd0fiyG+XL4azdo9+d+U07B1YezxRAii
 sjRfFXv7HqfyCOEVaLYIksjDfC2kzUvcmruUGczxVn28s49rnSWJWxSPm A==;
X-CSE-ConnectionGUID: E41BV+gOSjido/fw0NAl8w==
X-CSE-MsgGUID: sHzUvt7LTiml+rglk3eKPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14990081"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="14990081"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:44:45 -0700
X-CSE-ConnectionGUID: iXQpq1rbSJeGclvrWAXEgQ==
X-CSE-MsgGUID: IgYV8GlFRK2oyRwoSKPojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40053499"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.94.248.108])
 ([10.94.248.108])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 07:44:42 -0700
Message-ID: <4e9b5d4a-c818-457b-9f5d-e046f7b8ec70@linux.intel.com>
Date: Tue, 11 Jun 2024 16:44:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/gt: debugfs: Evaluate forcewake usage within
 locks
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Nirmoy Das <nirmoy.das@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
References: <20240607145131.217251-1-andi.shyti@linux.intel.com>
 <4cc62e14-2775-44f3-9857-eaf9598074a5@linux.intel.com>
 <22fc70cd-b836-4694-b69a-c273e5000b2e@ursulin.net>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <22fc70cd-b836-4694-b69a-c273e5000b2e@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/11/2024 3:58 PM, Tvrtko Ursulin wrote:
>
> On 10/06/2024 10:24, Nirmoy Das wrote:
>> Hi Andi,
>>
>> On 6/7/2024 4:51 PM, Andi Shyti wrote:
>>> The forcewake count and domains listing is multi process critical
>>> and the uncore provides a spinlock for such cases.
>>>
>>> Lock the forcewake evaluation section in the fw_domains_show()
>>> debugfs interface.
>>>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>
>> Needs a Fixes tag, below seems to be correct one.
>>
>>
>> Fixes: 9dd4b065446a ("drm/i915/gt: Move pm debug files into a gt 
>> aware debugfs")
>>
>> Cc: <stable@vger.kernel.org> # v5.6+
>>
>> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
>
> What is the back story here and why would it need backporting? IGT 
> cares about the atomic view of user_forcewake_count and individual 
> domains or what?

There is no serious back story. This came from a static code analyzer 
report. I keep forgetting debugfs isn't mounted on production systems so 
we don't have to backport this patch.


Thanks,

Nirmoy

>
> Regards,
>
> Tvrtko
>
>
>>
>> Regards,
>>
>> Nirmoy
>>
>>
>>> ---
>>>   drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c 
>>> b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>>> index 4fcba42cfe34..0437fd8217e0 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
>>> @@ -71,6 +71,8 @@ static int fw_domains_show(struct seq_file *m, 
>>> void *data)
>>>       struct intel_uncore_forcewake_domain *fw_domain;
>>>       unsigned int tmp;
>>> +    spin_lock_irq(&uncore->lock);
>>> +
>>>       seq_printf(m, "user.bypass_count = %u\n",
>>>              uncore->user_forcewake_count);
>>> @@ -79,6 +81,8 @@ static int fw_domains_show(struct seq_file *m, 
>>> void *data)
>>> intel_uncore_forcewake_domain_to_str(fw_domain->id),
>>>                  READ_ONCE(fw_domain->wake_count));
>>> +    spin_unlock_irq(&uncore->lock);
>>> +
>>>       return 0;
>>>   }
>>>   DEFINE_INTEL_GT_DEBUGFS_ATTRIBUTE(fw_domains);

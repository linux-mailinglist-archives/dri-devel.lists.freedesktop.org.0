Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185157EDE57
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EFF10E5AF;
	Thu, 16 Nov 2023 10:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCFF10E5AF;
 Thu, 16 Nov 2023 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700129965; x=1731665965;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Nt6akQnpm7bWk9/h9cThAah0cF+LQLqs+jmfI+CwVH4=;
 b=KbGQLC8ULIXJ5DrMuTZ/PfUgITsFKeDvKdiuP37aWulkfL+0pUKqTFZ/
 ozrq6GjF6kCA12C7smjboIOGoyH/amMUnU/xPPbZuxdDfn0B4B41yDzpR
 fG8idEJ64VXCL388rKfjGvDgZY1RJaGAIYmm/UQMBbWRDyP/KusmtxpgE
 lVsJPtUnO/OukhGeswhcQ7307HYraMBa0vU0LPBqPw2QTxNtN8WsCTA3D
 6/2y01Cuu4QgyHoc9z/kA1eWmOke91nMVnnk+hqLDHl2+2qcVqhOFItbY
 t3pg6yEjZ+wQT9Oyr7dgdXJZko91bc/GONwaj0WPRWnUa+WfppPAqYGE+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376107038"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; d="scan'208";a="376107038"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 02:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768865316"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; d="scan'208";a="768865316"
Received: from shudso3x-mobl.ger.corp.intel.com (HELO [10.213.211.151])
 ([10.213.211.151])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 02:19:22 -0800
Message-ID: <0a15860d-6fa0-4f1c-b12b-2f9b65911fbc@linux.intel.com>
Date: Thu, 16 Nov 2023 10:19:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
 <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
 <246ecbb0dcbbc96d9e48f8de6798bd9d16961c8f.camel@intel.com>
 <dc97f378-c8c6-4841-95da-740f3ecca187@linux.intel.com>
 <b075538a522adbbb3b83934279b93bde9913b9e8.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <b075538a522adbbb3b83934279b93bde9913b9e8.camel@intel.com>
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/11/2023 19:48, Teres Alexis, Alan Previn wrote:
> On Tue, 2023-11-14 at 17:52 +0000, Tvrtko Ursulin wrote:
>> On 14/11/2023 17:37, Teres Alexis, Alan Previn wrote:
>>> On Tue, 2023-11-14 at 17:27 +0000, Tvrtko Ursulin wrote:
>>>> On 13/11/2023 17:57, Teres Alexis, Alan Previn wrote:
>>>>> On Wed, 2023-10-25 at 13:58 +0100, Tvrtko Ursulin wrote:
>>>>>> On 04/10/2023 18:59, Teres Alexis, Alan Previn wrote:
>>>>>>> On Thu, 2023-09-28 at 13:46 +0100, Tvrtko Ursulin wrote:
>>>>>>>> On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
>>
> alan:snip
> 
>>> alan: So i did trace back the gt->wakeref before i posted these patches and
>>> see that within these runtime get/put calls, i believe the first 'get' leads
>>> to __intel_wakeref_get_first which calls intel_runtime_pm_get via rpm_get
>>> helper and eventually executes a pm_runtime_get_sync(rpm->kdev); (hanging off
>>> i915_device). (naturally there is a corresponding mirros for the '_put_last').
>>> So this means the first-get and last-put lets the kernel know. Thats why when
>>> i tested this patch, it did actually cause the suspend to abort from kernel side
>>> and the kernel would print a message indicating i915 was the one that didnt
>>> release all refs.
>>
>> Ah that would be much better then.
>>
>> Do you know if everything gets resumed/restored correctly in that case
>> or we would need some additional work to maybe early exit from callers
>> of wait_for_suspend()?
> alan: So assuming we are still discussing about a "potentially new
> future leaked-wakeref bug" (i.e. putting aside the fact that
> Patch #1 + #2 resolves this specific series' bug), based on the
> previous testing we did, after this timeout-bail trigger,
> the suspend flow bails and gt/guc operation does actually continue
> as normal. However, its been a long time since we tested this so
> i am not sure of how accidental-new-future bugs might play to this
> assumption especially if some other subsystem that leaked the rpm
> wakref but that subsystem did NOT get reset like how GuC is reset
> at the end of suspend.
> 
>>
>> What I would also ask is to see if something like injecting a probing
>> failure is feasible, so we can have this new timeout exit path
>> constantly/regularly tested in CI.
> alan: Thats a good idea. In line with this, i would like to point out that
> rev6 of this series has been posted but i removed this Patch #3. However i did
> post this Patch #3 as a standalone patch here: https://patchwork.freedesktop.org/series/126414/
> as i anticipate this patch will truly help with future issue debuggability.
> 
> That said, i shall post a review on that patch with your suggestion to add
> an injected probe error for the suspend-resume flow and follow up on that one
> separately.

Cool! I don't know exactly how to do it but if we come up with way and 
so gain IGT coverage then I am okay with the patch in principle.

Like perhaps some new debugfs api needs to be added to provoke the 
timeout error path on suspend, or something.

Regards,

Tvrtko

> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>> alan: Anyways, i have pulled this patch out of rev6 of this series and created a
>>> separate standalone patch for this patch #3 that we review independently.
>>>
> 

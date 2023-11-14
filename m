Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E76167EB5D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348E910E4A2;
	Tue, 14 Nov 2023 17:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CFBE10E4A2;
 Tue, 14 Nov 2023 17:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699984486; x=1731520486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XHbu1eGqCnMNFYO71qEzZol4mCscbJKAVa4Vg+nhQ+0=;
 b=VQc2tX3ANeq2DduVfOMNuwrMsk0mFU47UXxihqzjx/yclnIZKaBA/Bte
 hZDWHWCbR6IeGFBFd8UCsRCkugbemakcvgbYqIhGIbvcl6jqPbGxn+UEd
 Pee9fd3wuCdsKvEvlqR6T3T4q8kDe5sdetMKal/VvncZHv2qXpl7rsKIk
 u84JJ6jDXzzlMPevhwnuTJPAbl88dt3A6/wy5ZkaQExCGyecOkpW2JO18
 Bqk8cLWWzBU885H/JY+tMoEZNakXMJjLOn/6O2p3o+VSZuK576NpjK2CO
 FXGEmBbJzKn7rQpgsKl/Ypc2x2nlZpfB/MfJGZWEWoalYLhyr9Yiq6gJ+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="457205566"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="457205566"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:52:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="888331253"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="888331253"
Received: from mahajan1-mobl.ger.corp.intel.com (HELO [10.213.195.180])
 ([10.213.195.180])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:52:14 -0800
Message-ID: <dc97f378-c8c6-4841-95da-740f3ecca187@linux.intel.com>
Date: Tue, 14 Nov 2023 17:52:12 +0000
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <246ecbb0dcbbc96d9e48f8de6798bd9d16961c8f.camel@intel.com>
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


On 14/11/2023 17:37, Teres Alexis, Alan Previn wrote:
> On Tue, 2023-11-14 at 17:27 +0000, Tvrtko Ursulin wrote:
>> On 13/11/2023 17:57, Teres Alexis, Alan Previn wrote:
>>> On Wed, 2023-10-25 at 13:58 +0100, Tvrtko Ursulin wrote:
>>>> On 04/10/2023 18:59, Teres Alexis, Alan Previn wrote:
>>>>> On Thu, 2023-09-28 at 13:46 +0100, Tvrtko Ursulin wrote:
>>>>>> On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
> alan: snip
>>
>>> alan: I won't say its NOT fixing anything - i am saying it's not fixing
>>> this specific bug where we have the outstanding G2H from a context destruction
>>> operation that got dropped. I am okay with dropping this patch in the next rev
>>> but shall post a separate stand alone version of Patch3 - because I believe
>>> all other i915 subsystems that take runtime-pm's DO NOT wait forever when entering
>>> suspend - but GT is doing this. This means if there ever was a bug introduced,
>>> it would require serial port or ramoops collection to debug. So i think such a
>>> patch, despite not fixing this specific bug will be very helpful for debuggability
>>> of future issues. After all, its better to fail our suspend when we have a bug
>>> rather than to hang the kernel forever.
>>
>> Issue I have is that I am not seeing how it fails the suspend when
>> nothing is passed out from *void* wait_suspend(gt). To me it looks the
>> suspend just carries on. And if so, it sounds dangerous to allow it to
>> do that with any future/unknown bugs in the suspend sequence. Existing
>> timeout wedges the GPU (and all that entails). New code just says "meh
>> I'll just carry on regardless".
> 
> alan: So i did trace back the gt->wakeref before i posted these patches and
> see that within these runtime get/put calls, i believe the first 'get' leads
> to __intel_wakeref_get_first which calls intel_runtime_pm_get via rpm_get
> helper and eventually executes a pm_runtime_get_sync(rpm->kdev); (hanging off
> i915_device). (naturally there is a corresponding mirros for the '_put_last').
> So this means the first-get and last-put lets the kernel know. Thats why when
> i tested this patch, it did actually cause the suspend to abort from kernel side
> and the kernel would print a message indicating i915 was the one that didnt
> release all refs.

Ah that would be much better then.

Do you know if everything gets resumed/restored correctly in that case 
or we would need some additional work to maybe early exit from callers 
of wait_for_suspend()?

What I would also ask is to see if something like injecting a probing 
failure is feasible, so we can have this new timeout exit path 
constantly/regularly tested in CI.

Regards,

Tvrtko

> alan: Anyways, i have pulled this patch out of rev6 of this series and created a
> separate standalone patch for this patch #3 that we review independently.
> 

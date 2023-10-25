Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E447D6C85
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 14:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A0410E0D7;
	Wed, 25 Oct 2023 12:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F0D10E5B6;
 Wed, 25 Oct 2023 12:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698238732; x=1729774732;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=psA/xCLXS6dYWJyQx9n3vCLD6NvH6t11xB6SltUFoeE=;
 b=HWnQ49gtZen3rCWPJLezkta/1qP+5ClQHN28+x5cfRHjXpvyV0z2o2M9
 CaLnMiK2bhEffOJsN8oWpq9inF+HN8qqdVZsG4Qwz+xjp/j04XMObfkB/
 fqtCQKZ5YCizEF5a6sNMNvYD7G4qMbaQ8oY8Y25kfDIR0UBuIhq17+Iyr
 5gxMZUmFlGs+WeyEfoIrabox843fdzAYoRlnhgdfn02GnFvLNINUObl56
 6xBYj5ajhJ3NyjSoh4v9bfwRYjJ1xKuFFoBFHjwLGC7yarcISnAYiDyO2
 B8juxI6mTqbtCoA8ELNXa9heEAdozJEqdc5tiveh0F02NimTMh3rMwYst A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="367512269"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="367512269"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:58:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="6835834"
Received: from lababeix-mobl1.ger.corp.intel.com (HELO [10.249.41.109])
 ([10.249.41.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 05:58:42 -0700
Message-ID: <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
Date: Wed, 25 Oct 2023 13:58:48 +0100
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
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


On 04/10/2023 18:59, Teres Alexis, Alan Previn wrote:
> On Thu, 2023-09-28 at 13:46 +0100, Tvrtko Ursulin wrote:
>> On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
>>> Thanks for taking the time to review this Tvrtko, replies inline below.
> alan:snip
> 
>>>>
>>>> Main concern is that we need to be sure there are no possible
>>>> ill-effects, like letting the GPU/GuC scribble on some memory we
>>>> unmapped (or will unmap), having let the suspend continue after timing
>>>> out, and not perhaps doing the forced wedge like wait_for_suspend() does
>>>> on the existing timeout path.
>>> alan: this will not happen because the held wakeref is never force-released
>>> after the timeout - so what happens is the kernel would bail the suspend.
>>
>> How does it know to fail the suspend when there is no error code
>> returned with this timeout? Maybe a stupid question.. my knowledge of
>> suspend-resume paths was not great even before I forgot it all.
> alan:Tvrtko, you and I both sir. (apologies for the tardy response yet again busy week).
> So i did trace back the gt->wakeref before i posted these patches and discovered that
> runtime get/put call, i believe that the first 'get' leads to __intel_wakeref_get_first
> which calls intel_runtime_pm_get via rpm_get helper and eventually executes a
> pm_runtime_get_sync(rpm->kdev); (hanging off i915). (ofc, there is a corresponding
> for '_put_last') - so non-first, non-last increases the counter for the gt...
> but this last miss will mean kernel knows i915 hasnt 'put' everything.
> 
> alan:snip
>>>
>>> Recap: so in both cases (original vs this patch), if we had a buggy gt-wakeref leak,
>>> we dont get invalid guc-accesses, but without this patch, we wait forever,
>>> and with this patch, we get some messages and eventually bail the suspend.
>>
>> It is not possible to wait for lost G2H in something like
>> intel_uc_suspend() and simply declare "bad things happened" if it times
>> out there, and forcibly clean it all up? (Which would include releasing
>> all the abandoned pm refs, so this patch wouldn't be needed.)
>>
> alan: I'm not sure if intel_uc_suspend should be held up by gt-level wakeref
> check unless huc/guc/gsc-uc are the only ones ever taking a gt wakeref.
> 
> As we already know, what we do know from a uc-perspective:
> -  ensure the outstanding guc related workers is flushed which we didnt before
> (addressed by patch #1).
> - any further late H2G-SchedDisable is not leaking wakerefs when calling H2G
> and not realizing it failed (addressed by patch #2).
> - (we already), "forcibly clean it all up" at the end of the intel_uc_suspend
> when we do the guc reset and cleanup all guc-ids. (pre-existing upstream code)
> - we previously didnt have a coherrent guarantee that "this is the end" i.e. no
> more new request after intel_uc_suspend. I mean by code logic, we thought we did
> (thats why intel_uc_suspend ends wth a guc reset), but we now know otherwise.
> So we that fix by adding the additional rcu_barrier (also part of patch #2).

It is not clear to me from the above if that includes cleaning up the 
outstanding CT replies or no. But anyway..

> 
> That said, patch-3 is NOT fixing a bug in guc -its about "if we ever have
> a future racy gt-wakeref late-leak somewhere - no matter which subsystem
> took it (guc is not the only subsystem taking gt wakerefs), we at
> least don't hang forever in this code. Ofc, based on that, even without
> patch-3 i am confident the issue is resolved anyway.
> So we could just drop patch-3 is you prefer?

.. given this it does sound to me that if you are confident patch 3 
isn't fixing anything today that it should be dropped.

Regards,

Tvrtko

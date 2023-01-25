Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFC967B897
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 18:31:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCF710E10C;
	Wed, 25 Jan 2023 17:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619610E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 17:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674667872; x=1706203872;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b/qAzqJTvFy4xiZPmOAm7JkVbr9jZZbEQu9s5cua2Is=;
 b=Xff7++0nypYWknYBCWzRPvlRXblqp3lgHQaVl4xghMHCu1Gxgn5/0EJz
 qwa5PJ8aTsb41jup/ofwRDjmWc72QmaYZvCtiCGM6bi4GaCRwrBkq1zw0
 qnpgdrj42Xy0x0kEVyUtUsSYfVDYlwa+OUWC6GEGlAej6XfEFd6YXsyja
 2mzuCj9g9/k5NP67tY2OSQQLkcDq1SE9/22fWJj45rduhaLyMO9yt0MMP
 Pv3shQHNOr4uHFmlKJDb7FO097PGFs15S0wSKNAP0J/dyB6W2JVjYv+mk
 4KioRXexyxfdU05geRIvkBqubTv8yn0wQ0uHfRpEBZXl1UHOJZRJ09a7D Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="310194543"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="310194543"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 09:30:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="805079453"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="805079453"
Received: from dodonnel-mobl.ger.corp.intel.com (HELO [10.213.233.83])
 ([10.213.233.83])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 09:30:45 -0800
Message-ID: <347560bc-d06a-92b7-8003-133d2b8af2df@linux.intel.com>
Date: Wed, 25 Jan 2023 17:30:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
Content-Language: en-US
To: Michal Hocko <mhocko@suse.com>, Shakeel Butt <shakeelb@google.com>
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <20230124194628.d44rtcfsv23fndxw@google.com>
 <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 android-mm@google.com, Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 25/01/2023 11:52, Michal Hocko wrote:
> On Tue 24-01-23 19:46:28, Shakeel Butt wrote:
>> On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
>>> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
>>>> When a buffer is exported to userspace, use memcg to attribute the
>>>> buffer to the allocating cgroup until all buffer references are
>>>> released.
>>>
>>> Is there any reason why this memory cannot be charged during the
>>> allocation (__GFP_ACCOUNT used)?
>>> Also you do charge and account the memory but underlying pages do not
>>> know about their memcg (this is normally done with commit_charge for
>>> user mapped pages). This would become a problem if the memory is
>>> migrated for example.
>>
>> I don't think this is movable memory.
>>
>>> This also means that you have to maintain memcg
>>> reference outside of the memcg proper which is not really nice either.
>>> This mimicks tcp kmem limit implementation which I really have to say I
>>> am not a great fan of and this pattern shouldn't be coppied.
>>>
>>
>> I think we should keep the discussion on technical merits instead of
>> personal perference. To me using skmem like interface is totally fine
>> but the pros/cons need to be very explicit and the clear reasons to
>> select that option should be included.
> 
> I do agree with that. I didn't want sound to be personal wrt tcp kmem
> accounting but the overall code maintenance cost is higher because
> of how tcp take on accounting differs from anything else in the memcg
> proper. I would prefer to not grow another example like that.
> 
>> To me there are two options:
>>
>> 1. Using skmem like interface as this patch series:
>>
>> The main pros of this option is that it is very simple. Let me list down
>> the cons of this approach:
>>
>> a. There is time window between the actual memory allocation/free and
>> the charge and uncharge and [un]charge happen when the whole memory is
>> allocated or freed. I think for the charge path that might not be a big
>> issue but on the uncharge, this can cause issues. The application and
>> the potential shrinkers have freed some of this dmabuf memory but until
>> the whole dmabuf is freed, the memcg uncharge will not happen. This can
>> consequences on reclaim and oom behavior of the application.
>>
>> b. Due to the usage model i.e. a central daemon allocating the dmabuf
>> memory upfront, there is a requirement to have a memcg charge transfer
>> functionality to transfer the charge from the central daemon to the
>> client applications. This does introduce complexity and avenues of weird
>> reclaim and oom behavior.
>>
>>
>> 2. Allocate and charge the memory on page fault by actual user
>>
>> In this approach, the memory is not allocated upfront by the central
>> daemon but rather on the page fault by the client application and the
>> memcg charge happen at the same time.
>>
>> The only cons I can think of is this approach is more involved and may
>> need some clever tricks to track the page on the free patch i.e. we to
>> decrement the dmabuf memcg stat on free path. Maybe a page flag.
>>
>> The pros of this approach is there is no need have a charge transfer
>> functionality and the charge/uncharge being closely tied to the actual
>> memory allocation and free.
>>
>> Personally I would prefer the second approach but I don't want to just
>> block this work if the dmabuf folks are ok with the cons mentioned of
>> the first approach.
> 
> I am not familiar with dmabuf internals to judge complexity on their end
> but I fully agree that charge-when-used is much more easier to reason
> about and it should have less subtle surprises.

Disclaimer that I don't seem to see patches 3&4 on dri-devel so maybe I 
am missing something, but in principle yes, I agree that the 2nd option 
(charge the user, not exporter) should be preferred. Thing being that at 
export time there may not be any backing store allocated, plus if the 
series is restricting the charge transfer to just Android clients then 
it seems it has the potential to miss many other use cases. At least 
needs to outline a description on how the feature will be useful outside 
Android.

Also stepping back for a moment - is a new memory category really 
needed, versus perhaps attempting to charge the actual backing store 
memory to the correct client? (There might have been many past 
discussions on this so it's okay to point me towards something in the 
archives.)

Regards,

Tvrtko

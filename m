Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 799343C6CA9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 10:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BD489CBA;
	Tue, 13 Jul 2021 08:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA9D899DB;
 Tue, 13 Jul 2021 08:50:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="273958449"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="273958449"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 01:50:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="459505855"
Received: from mphilpot-mobl.ger.corp.intel.com (HELO [10.213.255.124])
 ([10.213.255.124])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 01:50:23 -0700
Subject: Re: [PATCH 1/8] drm/i915: Explicitly track DRM clients
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
 <20210712121719.891536-2-tvrtko.ursulin@linux.intel.com>
 <YOxUuxLqpIDEsmMT@phenom.ffwll.local>
 <ba1a6cff-790f-a1e5-1cad-63f429b01f93@linux.intel.com>
 <YOxp+X4mlQzAxs5q@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <05aea0ce-10f4-7813-3baa-0ad2a036b60c@linux.intel.com>
Date: Tue, 13 Jul 2021 09:50:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOxp+X4mlQzAxs5q@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/07/2021 17:12, Daniel Vetter wrote:
> On Mon, Jul 12, 2021 at 04:51:42PM +0100, Tvrtko Ursulin wrote:
>>
>> On 12/07/2021 15:42, Daniel Vetter wrote:
>>> On Mon, Jul 12, 2021 at 01:17:12PM +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Tracking DRM clients more explicitly will allow later patches to
>>>> accumulate past and current GPU usage in a centralised place and also
>>>> consolidate access to owning task pid/name.
>>>>
>>>> Unique client id is also assigned for the purpose of distinguishing/
>>>> consolidating between multiple file descriptors owned by the same process.
>>>>
>>>> v2:
>>>>    Chris Wilson:
>>>>    * Enclose new members into dedicated structs.
>>>>    * Protect against failed sysfs registration.
>>>>
>>>> v3:
>>>>    * sysfs_attr_init.
>>>>
>>>> v4:
>>>>    * Fix for internal clients.
>>>>
>>>> v5:
>>>>    * Use cyclic ida for client id. (Chris)
>>>>    * Do not leak pid reference. (Chris)
>>>>    * Tidy code with some locals.
>>>>
>>>> v6:
>>>>    * Use xa_alloc_cyclic to simplify locking. (Chris)
>>>>    * No need to unregister individial sysfs files. (Chris)
>>>>    * Rebase on top of fpriv kref.
>>>>    * Track client closed status and reflect in sysfs.
>>>>
>>>> v7:
>>>>    * Make drm_client more standalone concept.
>>>>
>>>> v8:
>>>>    * Simplify sysfs show. (Chris)
>>>>    * Always track name and pid.
>>>>
>>>> v9:
>>>>    * Fix cyclic id assignment.
>>>>
>>>> v10:
>>>>    * No need for a mutex around xa_alloc_cyclic.
>>>>    * Refactor sysfs into own function.
>>>>    * Unregister sysfs before freeing pid and name.
>>>>    * Move clients setup into own function.
>>>>
>>>> v11:
>>>>    * Call clients init directly from driver init. (Chris)
>>>>
>>>> v12:
>>>>    * Do not fail client add on id wrap. (Maciej)
>>>>
>>>> v13 (Lucas): Rebase.
>>>>
>>>> v14:
>>>>    * Dropped sysfs bits.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> # v11
>>>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v11
>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>
>>> On the implementation: I'm not clear why this is a separate object. All
>>> that seems to achieve is make the lifetim fun we have in here even more
>>> annoying, for not real gain?
>>>
>>> What's the reasons for this separate i915_drm_client struct? The commit
>>> message talks about de-duping these within the same process, but with
>>> fdinfo I'm not seeing the relevance of this anymore.
>>
>> AFAIR I started with the new fields directly in file_priv (note file_priv
>> then needed to be freed via RCU due sysfs access to it!), but then the idea
>> there was to consolidate new members into a separate struct.
> 
> Yeah separate struct makes sense for this stuff, just to
> encapsulate/document things a bit. It's the entire scaffolding around it
> that I don't think makes sense anymore with the design switch to fdinfo.

So if I just drop the client name updating and lock/RCU used to query 
said client data locklessly you would be happy with that?

>> Plan was (and still is in internal) that the concept for DRM client will
>> gain more users/usefulness and would benefit from encapsulation from the
>> start.
>>
>> For instance at patch 3 in the series it does consolidate i915 users of
>> ctx->pid to go via ctx->client (process name as well). Those are async entry
>> points (compared to file_priv lifetime) from error capture and debugfs. Hm
>> no, debugfs is there no more, only error capture remains.
>>
>> As you say since the change of direction to use fdinfo, the asynchronous
>> entry path into those members from sysfs is gone. Hence if they were moved
>> back to file_priv, and assuming ctx->pid/name changes to be undone, then
>> file_priv could remain being immediately freed on file close. Or perhaps we
>> lose easy pid/name update for files passed over sockets. I'd have to think
>> about that a bit deeper.
>>
>> But essentially I think ctx->client is a cleaner design that ctx->pid and
>> given error capture and debugfs can be async to file_priv lifetime that's a
>> benefit for me.
> 
>>From a quick check it's just for debug printing when a ctx hung/got
> banned, and for that we do want the pid - users won't have an
> understanding of a drm_client. I think pid is actually what we want there.
> 
>> With regards to de-duping multiple fdinfo entries via client->id - that is
>> actually the opposite from what you suggest. Whereas with the sysfs approach
>> we had one entry per client, with fdinfo we have duplicates. So client->id
>> is essential for userspace to correctly account per client statistics.
> 
> Uh why? Like if you use fdinfo and have a bunch of duplicate drm_file,
> then your parsing tool can aggregate them all together under the same pid.
> No need we do that in the kernel.

It's not done in the kernel. It's just userspace which needs an unique key.

> If the problem is that we can't tell apart a dup'ed fd from multiple
> open() calls, then I think that should be solved by dropping the hash of
> the drm_file pointer into the fdinfo.

Yes hash would work as long as fdinfo is the only way in since then 
lifetime rules are aligned. Or I just keep the id as is since I am 
keeping the client encapsulation, which is simpler.

>>> Also, with the fdinfo approach, why do we still need to even track the
>>> pid? That can be all figured out from proc now, with much cleaner
>>> semantics.
>>
>> Not sure what you mean here. As explained above pid is tracked as
>> replacement for current ctx->pid tracking. So for uses inside i915.
> 
> Why do we need to track that for that info file?

It's not an absolute requirement. As I was explaining it was 
consolidating all accesses to pid/process name, with included update 
upon context create for shared file descriptors. It was two nice 
benefits IMHO, but if you disagree I can easily drop it. Ctx->pid then 
remains fixed to the value of the original opener and that's it.

>> Also note that even from userspace semantics of getting the pid from procfs
>> is not necessarily clean, since actually three different file descriptors
>> need to be open to get the whole set of data.
>>
>> /proc/<pid>/fdinfo/<fd> - obviously
>> /proc/<pid>/fd/<fd> - to filter out non drm fds avoiding text parsing above
>> file
>> /proc/<pid>/stat - to get the pid
> 
> Well yes userspace needs to keep track of a few things. top works like
> that too.
> 
>> Since in the intel_gpu_top conversion I do keep the /proc/<pid> open and do
>> the rest via openat, I am hoping at least that's safe againt pid swaps. For
>> the file descriptor cross check it is more questionable but worst case the
>> drm fd check via stat could be dropped and replaced with more fdinfo text
>> parsing.
>>
>> Having the pid and process name in fdinfo hence makes this easier and
>> potentially safer. Given how we already store ctx->pid I think that should
>> be fine.
> 
> Uh no. We need to understand either the procfs rules, or what we need to
> understand them. Re-rolling our own interpretation of pid within something
> that already has the pid seems very broken.
> 
> I do expect openat to work.

Yes me too. I mostly worry that someone will get it wrong because they 
would use string/path based access.

>> FWIW I still think the whole approach is bad since number of operations
>> required scales with number of non drm processes (even threads) on the
>> system.
> 
> top works.

So does a flat headed screwdriver for chiseling a short channel in soft 
walls. :) Relax, I am doing fdinfo as you can see, and yes it works for 
top. Simply stating it is very algorithmically inefficient for pure 
_gpu_ top.

Hm wait.. fdinfo actually cannot show persistent contexts. Process exits 
leaves a hog on the GPU and it will be invisible via fdinfo who was to 
blame. :( Sysfs implementation did not have that problem and it would 
show it as a closed client with a name and old pid. Tough luck I guess.

Regards,

Tvrtko

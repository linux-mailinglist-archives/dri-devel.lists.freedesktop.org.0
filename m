Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA4053BF5B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F15C10E263;
	Thu,  2 Jun 2022 20:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A52710E263;
 Thu,  2 Jun 2022 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654200693; x=1685736693;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kPiWNX+rq1y1Am3VtCAsGRaes1pPOtJ7FDRSUTVhK98=;
 b=LnH/8u1qGcnjwx9wpfRQmU1m4Rw5YVtDLBobZFsZoJfxAvZ06FRSM5iq
 H6jB/WDLDeNudb3Y/3OS+Rdu3hNzJzgH+qKKeWuJbhz1IehI3tQ9m5bD0
 Bmpbwl+apwF7AIGI7OSfPKIjRwukoIxcN+HNdvbUsop0YYcjqr1WAxgol
 h9ijtyEK7LXpLoGAgvR0LD4zugiuvyi1oa4jws1ouTZlIb0O0OdH7dUdG
 YjsnRn6YYTws1Q8mmbR+/ufVrJkGTCYl8ErbmBM5w7btaoUo3ErfzGvMJ
 d55BNPYKP7h2hXP5FIfJ6iAMTzFZt2mg6tIYLdu6lwCLObOyzGfSs+QuL g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="273636119"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="273636119"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:11:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="607027827"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:11:32 -0700
Date: Thu, 2 Jun 2022 13:11:14 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220602201112.GQ4461@nvishwa1-DESK>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601202836.GA15346@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220601202836.GA15346@jons-linux-dev-box>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: chris.p.wilson@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, daniel.vetter@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 01, 2022 at 01:28:36PM -0700, Matthew Brost wrote:
>On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
>> On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
>> > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
>> > +async worker. The binding and unbinding will work like a special GPU engine.
>> > +The binding and unbinding operations are serialized and will wait on specified
>> > +input fences before the operation and will signal the output fences upon the
>> > +completion of the operation. Due to serialization, completion of an operation
>> > +will also indicate that all previous operations are also complete.
>>
>> I guess we should avoid saying "will immediately start binding/unbinding" if
>> there are fences involved.
>>
>> And the fact that it's happening in an async worker seem to imply it's not
>> immediate.
>>

Ok, will fix.
This was added because in earlier design binding was deferred until next execbuff.
But now it is non-deferred (immediate in that sense). But yah, this is confusing
and will fix it.

>>
>> I have a question on the behavior of the bind operation when no input fence
>> is provided. Let say I do :
>>
>> VM_BIND (out_fence=fence1)
>>
>> VM_BIND (out_fence=fence2)
>>
>> VM_BIND (out_fence=fence3)
>>
>>
>> In what order are the fences going to be signaled?
>>
>> In the order of VM_BIND ioctls? Or out of order?
>>
>> Because you wrote "serialized I assume it's : in order
>>

Yes, in the order of VM_BIND/UNBIND ioctls. Note that bind and unbind will use
the same queue and hence are ordered.

>>
>> One thing I didn't realize is that because we only get one "VM_BIND" engine,
>> there is a disconnect from the Vulkan specification.
>>
>> In Vulkan VM_BIND operations are serialized but per engine.
>>
>> So you could have something like this :
>>
>> VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
>>
>> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>>
>>
>> fence1 is not signaled
>>
>> fence3 is signaled
>>
>> So the second VM_BIND will proceed before the first VM_BIND.
>>
>>
>> I guess we can deal with that scenario in userspace by doing the wait
>> ourselves in one thread per engines.
>>
>> But then it makes the VM_BIND input fences useless.
>>
>>
>> Daniel : what do you think? Should be rework this or just deal with wait
>> fences in userspace?
>>
>
>My opinion is rework this but make the ordering via an engine param optional.
>
>e.g. A VM can be configured so all binds are ordered within the VM
>
>e.g. A VM can be configured so all binds accept an engine argument (in
>the case of the i915 likely this is a gem context handle) and binds
>ordered with respect to that engine.
>
>This gives UMDs options as the later likely consumes more KMD resources
>so if a different UMD can live with binds being ordered within the VM
>they can use a mode consuming less resources.
>

I think we need to be careful here if we are looking for some out of
(submission) order completion of vm_bind/unbind.
In-order completion means, in a batch of binds and unbinds to be
completed in-order, user only needs to specify in-fence for the
first bind/unbind call and the our-fence for the last bind/unbind
call. Also, the VA released by an unbind call can be re-used by
any subsequent bind call in that in-order batch.

These things will break if binding/unbinding were to be allowed to
go out of order (of submission) and user need to be extra careful
not to run into pre-mature triggereing of out-fence and bind failing
as VA is still in use etc.

Also, VM_BIND binds the provided mapping on the specified address space
(VM). So, the uapi is not engine/context specific.

We can however add a 'queue' to the uapi which can be one from the
pre-defined queues,
I915_VM_BIND_QUEUE_0
I915_VM_BIND_QUEUE_1
...
I915_VM_BIND_QUEUE_(N-1)

KMD will spawn an async work queue for each queue which will only
bind the mappings on that queue in the order of submission.
User can assign the queue to per engine or anything like that.

But again here, user need to be careful and not deadlock these
queues with circular dependency of fences.

I prefer adding this later an as extension based on whether it
is really helping with the implementation.

Daniel, any thoughts?

Niranjana

>Matt
>
>>
>> Sorry I noticed this late.
>>
>>
>> -Lionel
>>
>>

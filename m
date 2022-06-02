Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C83653BFCC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9E4113485;
	Thu,  2 Jun 2022 20:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BF9113501;
 Thu,  2 Jun 2022 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654201528; x=1685737528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=F9EhYOs1fUd8XX6eoXjPmfaTjq8s4qu/WA/SfJsjn+A=;
 b=TxgZdAEU5Ht9Xm8qquijv84eMfWkoEQ5b6+CH/lYg418GQNHXI532te2
 1zZhaHJXBz4a0V5VnYFiTJvMjGAEhJBO7Twd9akCEc1CgdJNiv7GJUzzJ
 0HNynQ+1HnmerTMCfZwKzl8mGKFXeRywlB3iO+PrKcVa5x90dzPIMvbRV
 RZutyU1j54D+nW+vRxZJR+TrBXuREOE1edn7a6NyeapDA7bSWjALRBiID
 FJivIqplWjwmL7rax6OkWTxmPS1AgayUt9ohj56xhV3jF8vhvICF7fFQU
 dCouf1nKLoLQ1KXvNVmjxQaM9olRqIdhSRk18M9T9IfM1XFXemgL9rVmP g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="276083785"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="276083785"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:25:13 -0700
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="530732025"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:25:12 -0700
Date: Thu, 2 Jun 2022 13:24:54 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [Intel-gfx] [RFC v3 1/3] drm/doc/rfc: VM_BIND feature design
 document
Message-ID: <20220602202453.GR4461@nvishwa1-DESK>
References: <20220517183212.20274-1-niranjana.vishwanathapura@intel.com>
 <20220517183212.20274-2-niranjana.vishwanathapura@intel.com>
 <43746609-4f60-f347-5934-6680516297dd@intel.com>
 <20220601211849.GA30517@jons-linux-dev-box>
 <2508922c-dae7-af05-0feb-9c4b63411a8c@intel.com>
 <20220602162245.GA15751@jons-linux-dev-box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20220602162245.GA15751@jons-linux-dev-box>
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

On Thu, Jun 02, 2022 at 09:22:46AM -0700, Matthew Brost wrote:
>On Thu, Jun 02, 2022 at 08:42:13AM +0300, Lionel Landwerlin wrote:
>> On 02/06/2022 00:18, Matthew Brost wrote:
>> > On Wed, Jun 01, 2022 at 05:25:49PM +0300, Lionel Landwerlin wrote:
>> > > On 17/05/2022 21:32, Niranjana Vishwanathapura wrote:
>> > > > +VM_BIND/UNBIND ioctl will immediately start binding/unbinding the mapping in an
>> > > > +async worker. The binding and unbinding will work like a special GPU engine.
>> > > > +The binding and unbinding operations are serialized and will wait on specified
>> > > > +input fences before the operation and will signal the output fences upon the
>> > > > +completion of the operation. Due to serialization, completion of an operation
>> > > > +will also indicate that all previous operations are also complete.
>> > > I guess we should avoid saying "will immediately start binding/unbinding" if
>> > > there are fences involved.
>> > >
>> > > And the fact that it's happening in an async worker seem to imply it's not
>> > > immediate.
>> > >
>> > >
>> > > I have a question on the behavior of the bind operation when no input fence
>> > > is provided. Let say I do :
>> > >
>> > > VM_BIND (out_fence=fence1)
>> > >
>> > > VM_BIND (out_fence=fence2)
>> > >
>> > > VM_BIND (out_fence=fence3)
>> > >
>> > >
>> > > In what order are the fences going to be signaled?
>> > >
>> > > In the order of VM_BIND ioctls? Or out of order?
>> > >
>> > > Because you wrote "serialized I assume it's : in order
>> > >
>> > >
>> > > One thing I didn't realize is that because we only get one "VM_BIND" engine,
>> > > there is a disconnect from the Vulkan specification.
>> > >
>> > > In Vulkan VM_BIND operations are serialized but per engine.
>> > >
>> > > So you could have something like this :
>> > >
>> > > VM_BIND (engine=rcs0, in_fence=fence1, out_fence=fence2)
>> > >
>> > > VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>> > >
>> > Question - let's say this done after the above operations:
>> >
>> > EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
>> >
>> > Is the exec ordered with respected to bind (i.e. would fence3 & 4 be
>> > signaled before the exec starts)?
>> >
>> > Matt
>>
>>
>> Hi Matt,
>>
>> From the vulkan point of view, everything is serialized within an engine (we
>> map that to a VkQueue).
>>
>> So with :
>>
>> EXEC (engine=ccs0, in_fence=NULL, out_fence=NULL)
>> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>>
>> EXEC completes first then VM_BIND executes.
>>
>>
>> To be even clearer :
>>
>> EXEC (engine=ccs0, in_fence=fence2, out_fence=NULL)
>> VM_BIND (engine=ccs0, in_fence=fence3, out_fence=fence4)
>>
>>
>> EXEC will wait until fence2 is signaled.
>> Once fence2 is signaled, EXEC proceeds, finishes and only after it is done, VM_BIND executes.
>>
>> It would kind of like having the VM_BIND operation be another batch executed from the ringbuffer buffer.
>>
>
>Yea this makes sense. I think of VM_BINDs as more or less just another
>version of an EXEC and this fits with that.
>

Note that VM_BIND itself can bind while and EXEC (GPU job) is running.
(Say, getting binds ready for next submission). It is up to user though,
how to use it.

>In practice I don't think we can share a ring but we should be able to
>present an engine (again likely a gem context in i915) to the user that
>orders VM_BINDs / EXECs if that is what Vulkan expects, at least I think.
>

I have responded in the other thread on this.

Niranjana

>Hopefully Niranjana + Daniel agree.
>
>Matt
>
>> -Lionel
>>
>>
>> >
>> > > fence1 is not signaled
>> > >
>> > > fence3 is signaled
>> > >
>> > > So the second VM_BIND will proceed before the first VM_BIND.
>> > >
>> > >
>> > > I guess we can deal with that scenario in userspace by doing the wait
>> > > ourselves in one thread per engines.
>> > >
>> > > But then it makes the VM_BIND input fences useless.
>> > >
>> > >
>> > > Daniel : what do you think? Should be rework this or just deal with wait
>> > > fences in userspace?
>> > >
>> > >
>> > > Sorry I noticed this late.
>> > >
>> > >
>> > > -Lionel
>> > >
>> > >
>>

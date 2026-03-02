Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBv1KF/HpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:22:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F309C1DDBC9
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7470510E567;
	Mon,  2 Mar 2026 17:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="SFARcnHr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 324 seconds by postgrey-1.36 at gabe;
 Mon, 02 Mar 2026 17:22:33 UTC
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com
 [91.218.175.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6978D10E567
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 17:22:33 +0000 (UTC)
Date: Mon, 2 Mar 2026 09:16:59 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1772471826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+0hTkdLSJxLST+Ca0feXUOhEdE9wZFxP4nRO8YDMww=;
 b=SFARcnHrztkXY1y6z9GTNJFEqDdpos+RQ8DtYmFGfF/h4rX0TlPpmaQiqjKBFzZLPdO7IP
 lQiBEcdz55LkypeA97kCxM2Soh70Rw1DIgbaS3zYdqP2yXnqxVgY4yAc6pXyddxuv5DiYs
 7BlesXluyq8Yer9uDZK3Vu0jQc99B/c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, 
 Waiman Long <longman@redhat.com>, simona@ffwll.ch, tjmercier@google.com
Subject: Re: [PATCH 07/16] memcg: add support for GPU page counters. (v4)
Message-ID: <aaXEDLpXLROBO7To@linux.dev>
References: <20260224020854.791201-1-airlied@gmail.com>
 <20260224020854.791201-8-airlied@gmail.com>
 <ee914ffb-5c3d-4d41-abdb-5ed02db326c6@amd.com>
 <CAPM=9txUuS-qzA+gX2DvTuYR2OZ79RG86FuDA6czkpuJ_SR6KQ@mail.gmail.com>
 <4fddf319-50c4-40ab-9e36-04d629a8855e@amd.com>
 <aaWZrTZGsxxjbBYv@linux.dev>
 <8efef755-e429-4cec-bef4-b15b3f9f4632@amd.com>
 <aaWuoe_CQwbtcxEY@linux.dev>
 <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63dccd9c-f2e5-421e-ac3a-a7c13cec9121@amd.com>
X-Migadu-Flow: FLOW_OUT
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
X-Rspamd-Queue-Id: F309C1DDBC9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:airlied@gmail.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:roman.gushchin@linux.dev,m:muchun.song@linux.dev,m:cgroups@vger.kernel.org,m:david@fromorbit.com,m:longman@redhat.com,m:simona@ffwll.ch,m:tjmercier@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,kernel.org,cmpxchg.org,linux.dev,vger.kernel.org,fromorbit.com,redhat.com,ffwll.ch,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[shakeel.butt@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shakeel.butt@linux.dev,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 04:51:12PM +0100, Christian König wrote:
> On 3/2/26 16:40, Shakeel Butt wrote:
> > +TJ
> > 
> > On Mon, Mar 02, 2026 at 03:37:37PM +0100, Christian König wrote:
> >> On 3/2/26 15:15, Shakeel Butt wrote:
> >>> On Wed, Feb 25, 2026 at 10:09:55AM +0100, Christian König wrote:
> >>>> On 2/24/26 20:28, Dave Airlie wrote:
> >>> [...]
> >>>>
> >>>>> This has been a pain in the ass for desktop for years, and I'd like to
> >>>>> fix it, the HPC use case if purely a driver for me doing the work.
> >>>>
> >>>> Wait a second. How does accounting to cgroups help with that in any way?
> >>>>
> >>>> The last time I looked into this problem the OOM killer worked based on the per task_struct stats which couldn't be influenced this way.
> >>>>
> >>>
> >>> It depends on the context of the oom-killer. If the oom-killer is triggered due
> >>> to memcg limits then only the processes in the scope of the memcg will be
> >>> targetted by the oom-killer. With the specific setting, the oom-killer can kill
> >>> all the processes in the target memcg.
> >>>
> >>> However nowadays the userspace oom-killer is preferred over the kernel
> >>> oom-killer due to flexibility and configurability. Userspace oom-killers like
> >>> systmd-oomd, Android's LMKD or fb-oomd are being used in containerized
> >>> environments. Such oom-killers looks at memcg stats and hiding something
> >>> something from memcg i.e. not charging to memcg will hide such usage from these
> >>> oom-killers.
> >>
> >> Well exactly that's the problem. Android's oom killer is *not* using memcg exactly because of this inflexibility.
> > 
> > Are you sure Android's oom killer is not using memcg? From what I see in the
> > documentation [1], it requires memcg.
> 
> My bad, I should have been wording that better.
> 
> The Android OOM killer is not using memcg for tracking GPU memory allocations, because memcg doesn't have proper support for tracking shared buffers.

Yes indeed memcg is bad with buffers shared between memcgs (shmem, shared
filesystems).

> 
> In other words GPU memory allocations are shared by design and it is the norm that the process which is using it is not the process which has allocated it.

Here the GPU memory can be system memory or the actual memory on GPU, right?

I think I discussed with TJ on the possibility of moving the allocations in the
context of process using through custom fault handler in GPU drivers. I don't
remember the conclusion but I am assuming that is not possible.

> 
> What we would need (as a start) to handle all of this with memcg would be to accounted the resources to the process which referenced it and not the one which allocated it.

Irrespective of memcg charging decision, one of my request would be to at least
have global counters for the GPU memory which this series is adding. That would
be very similar to NR_KERNEL_FILE_PAGES where we explicit opt-out of memcg
charging but keep the global counter, so the admin can identify the reasons
behind high unaccounted memory on the system.

> 
> I can give a full list of requirements which would be needed by cgroups to cover all the different use cases, but it basically means tons of extra complexity.
> 
> Regards,
> Christian.
> 
> > 
> > [1] https://source.android.com/docs/core/perf/lmkd
> > 
> >>
> >> See the multiple iterations we already had on that topic. Even including reverting already upstream uAPI.
> >>
> >> The latest incarnation is that BPF is used for this task on Android.
> >>
> >> Regards,
> >> Christian.
> 

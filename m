Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6FF489B1E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 15:14:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB2010EB40;
	Mon, 10 Jan 2022 14:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 782D810E9AF
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jan 2022 14:14:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9ACF2B;
 Mon, 10 Jan 2022 06:14:14 -0800 (PST)
Received: from [10.57.11.80] (unknown [10.57.11.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0E723F766;
 Mon, 10 Jan 2022 06:14:13 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
To: Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa@collabora.com>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru> <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
From: Steven Price <steven.price@arm.com>
Message-ID: <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com>
Date: Mon, 10 Jan 2022 14:14:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/12/2021 08:56, Alexey Sheplyakov wrote:
> Hi,
> 
> On 23.12.2021 18:11, Alyssa Rosenzweig wrote:
>>> The kernel driver itself can't guess which jobs need a such a strict
>>> affinity, so setting proper requirements is the responsibility of
>>> the userspace (Mesa). However the userspace is not smart enough [yet].
>>> Therefore this patch applies the above affinity rule to all jobs on
>>> dual core group GPUs.
>>
>> What does Mesa need to do for this to work "properly"?
> 
> I don't know.
> The blob restricts affinity of jobs with JD_REQ_COHERENT_GROUP requirement.
> In theory jobs without such a requirement can run on any core, but in
> practice all jobs in slots 0, 1 are assigned to core group 0 (with workloads
> I've run - i.e. weston, firefox, glmark2, perhaps it's also SoC dependent).
> So I've forced all jobs in slots 0, 1 to core group 0. Surprisingly this
> (and memory attributes adjustment) appeared to be enough to get panfrost
> working with T628 (on some SoCs). Without these patches GPU locks up in
> a few seconds.

Let me fill in a few details here.

The T628 is pretty unique in that it has two core groups, i.e. more than
one L2 cache. Previous designs (i.e. T604) didn't have enough cores to
require a second core group, and later designs with sufficient cores
have coherent L2 caches so act as a single core group (although the
hardware has multiple L2s it only reports a single one as they act as if
a single cache).

Note that technically the T608, T658 and T678 also exist and have this
problem - but I don't believe any products were produced with these (so
unless you're in ARM with a very unusual FPGA they can be ignored).

The blob/kbase handle this situation with a new flag
JD_REQ_COHERENT_GROUP which specifies that the affinity of a job must
land on a single (coherent) core group, and
JD_REQ_SPECIFIC_COHERENT_GROUP which allows user space to target a
specific group.

In theory fragment shading can be performed over all cores (because a
fragment shader job doesn't need coherency between threads), so doesn't
need the JD_REQ_COHERENT_GROUP flag, vertex shading however requires to
be run on the same core group as the tiler (which always lives in core
group 0).

Of course there are various 'tricks' that can happen even within a
fragment shader which might require coherency.

So the expected sequence is that vertex+tiling is restricted to core
group 0, and fragment shading can be run over all cores. Although there
can be issues with performance doing this naïvely because the Job
Manager doesn't necessarily share the GPUs cores fairly between vertex
and fragment jobs. Also note that a cache flush is needed between
running the vertex+tiling and the fragment job to ensure that the extra
core group is coherent - this can be expensive, so it may not be worth
using the second core group in some situations. I'm not sure what logic
the Blob uses for that.

Finally there's GPU compute (i.e. OpenCL): here coherency is usually
required, but there's often more information about the amount of
coherency needed. In this case it is possible to run different job
chains on each core group. This is the only situation there slot 2 is
used, and is the reason for the JS_REQ_SPECIFIC_COHERENT_GROUP flag.
It's also a nightmare for scheduling as the hardware gets upset if the
affinity masks for slot 1 and slot 2 overlap.

>> What are the limitations of the approach implemented here?
> 
> Suboptimal performance.
> 
> 1) There might be job chains which don't care about affinity
>    (I haven't seen any of these yet on systems I've got).

You are effectively throwing away half the cores if everything is pinned
to core group 0, so I'm pretty sure the Blob manages to run (some)
fragment jobs without the COHERENT_GROUP flag.

But equally this is a reasonable first step for the kernel driver - we
can make the GPU look like ever other GPU by pretending the second core
group doesn't exist.

> 2) There might be dual core group GPUs which don't need such a strict affinity.
>    (I haven't seen any dual core group T[78]xx GPUs yet. This doesn't mean such
>     GPUs don't exist).

They should all be a single core group (fully coherent L2s).

>> If we need to extend it down the line with a UABI change, what would that look like?
> 
> I have no idea. And I'm not sure if it's worth the effort (since most jobs
> end up on core group 0 anyway).

Whether it's worth the effort depends on whether anyone really cares
about getting the full performance out of this particular GPU.

At this stage I think the main UABI change would be to add the opposite
flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
opt-in to allowing the job to run across all cores.

The second change would be to allow compute jobs to be run on the second
core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.

But clearly there's little point adding such flags until someone steps
up to do the Mesa work.

Steve

[1] Bike-shedding the name might be required ;)

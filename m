Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B350A48E672
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 09:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4253110EA3D;
	Fri, 14 Jan 2022 08:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FC110F14A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:01:37 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
 id 9A7375895B6; Thu, 13 Jan 2022 10:01:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
 sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=3.4.1
Received: from localhost (unknown [88.147.173.226])
 by air.basealt.ru (Postfix) with ESMTPSA id 1EC8758942B;
 Thu, 13 Jan 2022 10:01:33 +0000 (UTC)
Date: Thu, 13 Jan 2022 14:01:32 +0400
From: Alexey Sheplyakov <asheplyakov@basealt.ru>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
Message-ID: <Yd/4fIpQqKSRdY/P@asheplyakov-rocket>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru>
 <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
 <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com>
 <YdxwFCfWYtLd1Qqb@maud>
 <37d797e3-5957-13a6-32b0-6772ace6c540@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37d797e3-5957-13a6-32b0-6772ace6c540@arm.com>
X-Mailman-Approved-At: Fri, 14 Jan 2022 08:27:12 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Steven!

Thanks for such a detailed explanation of T628 peculiarities.

On Wed, Jan 12, 2022 at 05:03:15PM +0000, Steven Price wrote:
> On 10/01/2022 17:42, Alyssa Rosenzweig wrote:
> >> Whether it's worth the effort depends on whether anyone really cares
> >> about getting the full performance out of this particular GPU.
> >>
> >> At this stage I think the main UABI change would be to add the opposite
> >> flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
> >> opt-in to allowing the job to run across all cores.
> >>
> >> The second change would be to allow compute jobs to be run on the second
> >> core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.
> >>
> >> But clearly there's little point adding such flags until someone steps
> >> up to do the Mesa work.
> > 
> > I worry about the maintainence burden (both Mesa and kernel) of adding
> > UABI only used by a piece of hardware none of us own, and only useful
> > "sometimes" for that hardware. Doubly so for the second core group
> > support; currently Mesa doesn't advertise any compute support on
> > anything older than Mali T760 ... to the best of my knowledge, nobody
> > has missed that support either...
> 
> I agree there's no point adding the UABI support unless someone is
> willing to step and be a maintainer for that hardware. And I suspect no
> one cares enough about that hardware to do that.
> 
> > To be clear I am in favour of merging the patches needed for GLES2 to
> > work on all Malis, possibly at a performance cost on these dual-core
> > systems. That's a far cry from the level of support the DDK gave these
> > chips back in the day ... of course, the DDK doesn't support them at all
> > anymore, so Panfrost wins there by default! ;)
> > 
> 
> Agreed - I'm happy to merge a kernel series similar to this. I think the
> remaining problems are:
> 
> 1. Addressing Robin's concerns about the first patch. That looks like
> it's probably just wrong.

The first patch is wrong and I'll drop it.

> 2. I think this patch is too complex for the basic support. There's some
> parts like checking GROUPS_L2_COHERENT which also don't feature in kbase

That part has been adapted from kbase_gpuprops_construct_coherent_groups, see
https://github.com/hardkernel/linux/blob/2f0f4268209ddacc2cdea158104b87cedacbd0e3/drivers/gpu/arm/midgard/mali_kbase_gpuprops.c#L94

> so I don't believe are correct.

I'm not sure if it's correct or not, however
- it does not change anything for GPUs with coherent L2 caches
- it appears to correctly figure out core groups for several SoCs
  with T628 GPU (BE-M1000, Exynos 5422).

> 3. I don't think this blocks the change. But if we're not using the
> second core group we could actually power it down. Indeed simply not
> turning on the L2/shader cores should in theory work (jobs are not
> scheduled to cores which are turned off even if they are included in the
> affinity).

Powering off unused GPU is would be nice, however

1) the userspace might power on those cores again (via sysfs or something),
   so I prefer to explicitly schedule jobs to the core group 0.

2) on BE-M1000 GPU seems to lock up in a few seconds after powering off
   some (GPU) cores. In fact I had to disable GPU devfreq to prevent GPU
   lockups.

Therefore I consider powering off unused cores as a later optimization. 
(frankly speaking I'd better put the effort to *making use* of those cores
instead of figuring out why they fail to power down properly).

Best regards,
   Alexey

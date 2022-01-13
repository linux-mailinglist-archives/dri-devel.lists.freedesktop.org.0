Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 665AE48D6A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 12:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDCC10E14E;
	Thu, 13 Jan 2022 11:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7C5D710E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 11:22:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF0846D;
 Thu, 13 Jan 2022 03:22:21 -0800 (PST)
Received: from [10.57.34.187] (unknown [10.57.34.187])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C994D3F774;
 Thu, 13 Jan 2022 03:22:20 -0800 (PST)
From: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
To: Alexey Sheplyakov <asheplyakov@basealt.ru>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru> <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
 <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com> <YdxwFCfWYtLd1Qqb@maud>
 <37d797e3-5957-13a6-32b0-6772ace6c540@arm.com>
 <Yd/4fIpQqKSRdY/P@asheplyakov-rocket>
Message-ID: <b009b4c4-0396-58c2-7779-30c844f36f04@arm.com>
Date: Thu, 13 Jan 2022 11:22:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yd/4fIpQqKSRdY/P@asheplyakov-rocket>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "Vadim V . Vlasov" <vadim.vlasov@elpitech.ru>, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2022 10:01, Alexey Sheplyakov wrote:
> Hi, Steven!
> 
> Thanks for such a detailed explanation of T628 peculiarities.
> 
> On Wed, Jan 12, 2022 at 05:03:15PM +0000, Steven Price wrote:
>> On 10/01/2022 17:42, Alyssa Rosenzweig wrote:
>>>> Whether it's worth the effort depends on whether anyone really cares
>>>> about getting the full performance out of this particular GPU.
>>>>
>>>> At this stage I think the main UABI change would be to add the opposite
>>>> flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
>>>> opt-in to allowing the job to run across all cores.
>>>>
>>>> The second change would be to allow compute jobs to be run on the second
>>>> core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.
>>>>
>>>> But clearly there's little point adding such flags until someone steps
>>>> up to do the Mesa work.
>>>
>>> I worry about the maintainence burden (both Mesa and kernel) of adding
>>> UABI only used by a piece of hardware none of us own, and only useful
>>> "sometimes" for that hardware. Doubly so for the second core group
>>> support; currently Mesa doesn't advertise any compute support on
>>> anything older than Mali T760 ... to the best of my knowledge, nobody
>>> has missed that support either...
>>
>> I agree there's no point adding the UABI support unless someone is
>> willing to step and be a maintainer for that hardware. And I suspect no
>> one cares enough about that hardware to do that.
>>
>>> To be clear I am in favour of merging the patches needed for GLES2 to
>>> work on all Malis, possibly at a performance cost on these dual-core
>>> systems. That's a far cry from the level of support the DDK gave these
>>> chips back in the day ... of course, the DDK doesn't support them at all
>>> anymore, so Panfrost wins there by default! ;)
>>>
>>
>> Agreed - I'm happy to merge a kernel series similar to this. I think the
>> remaining problems are:
>>
>> 1. Addressing Robin's concerns about the first patch. That looks like
>> it's probably just wrong.
> 
> The first patch is wrong and I'll drop it.
> 
>> 2. I think this patch is too complex for the basic support. There's some
>> parts like checking GROUPS_L2_COHERENT which also don't feature in kbase
> 
> That part has been adapted from kbase_gpuprops_construct_coherent_groups, see
> https://github.com/hardkernel/linux/blob/2f0f4268209ddacc2cdea158104b87cedacbd0e3/drivers/gpu/arm/midgard/mali_kbase_gpuprops.c#L94

Gah! I was looking at the wrong version of kbase... ;)

>> so I don't believe are correct.
> 
> I'm not sure if it's correct or not, however
> - it does not change anything for GPUs with coherent L2 caches
> - it appears to correctly figure out core groups for several SoCs
>   with T628 GPU (BE-M1000, Exynos 5422).

Yeah, sorry about that - you are right this matches the (earlier) kbase
versions. I don't believe there ever was a GPU released without
GROUPS_L2_COHERENT set (which means that shader cores are coherent
within an L2, *NOT* that the L2 is coherent).

I think I was having an off day yesterday... ;) Ignore this - it's
arguably cargo-culting from kbase, but there are advantages to that.

>> 3. I don't think this blocks the change. But if we're not using the
>> second core group we could actually power it down. Indeed simply not
>> turning on the L2/shader cores should in theory work (jobs are not
>> scheduled to cores which are turned off even if they are included in the
>> affinity).
> 
> Powering off unused GPU is would be nice, however
> 
> 1) the userspace might power on those cores again (via sysfs or something),
>    so I prefer to explicitly schedule jobs to the core group 0.

We don't expose that level of control to user space. Currently panfrost
either powers on all cores or none.

> 2) on BE-M1000 GPU seems to lock up in a few seconds after powering off
>    some (GPU) cores. In fact I had to disable GPU devfreq to prevent GPU
>    lockups.

I'm not sure how you tested powering off some GPU cores - I'm surprised
that that causes problems. Having to disable GPU devfreq points to an
issue with the DVFS performance points in your DT (perhaps the voltages
are wrong?) or potentially a bug in the driving of the clocks/regulators.

> Therefore I consider powering off unused cores as a later optimization. 
> (frankly speaking I'd better put the effort to *making use* of those cores
> instead of figuring out why they fail to power down properly).

Making use is much more work - it depends if you(/anyone) cares about
power consumption on these devices. Although whether the hardware
actually implements any meaningful power gating for the second core
group is another matter so perhaps it wouldn't make any difference anyway.

My thought was something along the lines of the below which just turns
the cores off and otherwise doesn't require playing with affinities. If
we actually want to use the second core group then much more thought
will have to go into how the job slots are used.

---8<---
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index bbe628b306ee..2e9f9d1ee830 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -320,19 +320,34 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
 	u32 val;
+	u32 core_mask = U32_MAX;
 
 	panfrost_gpu_init_quirks(pfdev);
 
-	/* Just turn on everything for now */
-	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present);
+	if (pfdev->features.l2_present != 1) {
+		/*
+		 * Only support one core group for now.
+		 * ~(l2_present - 1) unsets all bits in l2_present except the
+		 * bottom bit. (l2_present - 2) has all the bits in the first
+		 * core group set. AND them together to generate a mask of
+		 * cores in the first core group.
+		 */
+		core_mask = ~(pfdev->features.l2_present - 1) &
+			     (pfdev->features.l2_present - 2);
+	}
+
+	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
-		val, val == pfdev->features.l2_present, 100, 20000);
+		val, val == (pfdev->features.l2_present & core_mask),
+		100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu L2");
 
-	gpu_write(pfdev, SHADER_PWRON_LO, pfdev->features.shader_present);
+	gpu_write(pfdev, SHADER_PWRON_LO,
+		  pfdev->features.shader_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
-		val, val == pfdev->features.shader_present, 100, 20000);
+		val, val == (pfdev->features.shader_present & core_mask),
+		100, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu shader");
 
---8<---
I don't have a dual-core group system to hand so this is mostly untested.

Thanks,

Steve

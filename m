Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2C748C907
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 18:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B93310E612;
	Wed, 12 Jan 2022 17:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DC0710E612
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 17:03:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D48181FB;
 Wed, 12 Jan 2022 09:03:17 -0800 (PST)
Received: from [10.57.36.149] (unknown [10.57.36.149])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE2CC3F774;
 Wed, 12 Jan 2022 09:03:16 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/panfrost: adjusted job affinity for dual core
 group GPUs
To: Alyssa Rosenzweig <alyssa@collabora.com>
References: <20211223110616.2589851-1-asheplyakov@basealt.ru>
 <20211223110616.2589851-3-asheplyakov@basealt.ru> <YcSDgIwrmHZ/BC2n@maud>
 <c94bafaa-3029-fea3-b623-1961b4b5e4cf@basealt.ru>
 <fca08e3c-c239-efdd-6ae5-132d84637d1f@arm.com> <YdxwFCfWYtLd1Qqb@maud>
From: Steven Price <steven.price@arm.com>
Message-ID: <37d797e3-5957-13a6-32b0-6772ace6c540@arm.com>
Date: Wed, 12 Jan 2022 17:03:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdxwFCfWYtLd1Qqb@maud>
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
 Alexey Sheplyakov <asheplyakov@basealt.ru>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2022 17:42, Alyssa Rosenzweig wrote:
>> Whether it's worth the effort depends on whether anyone really cares
>> about getting the full performance out of this particular GPU.
>>
>> At this stage I think the main UABI change would be to add the opposite
>> flag to kbase, (e.g. "PANFROST_JD_DOESNT_NEED_COHERENCY_ON_GPU"[1]) to
>> opt-in to allowing the job to run across all cores.
>>
>> The second change would be to allow compute jobs to be run on the second
>> core group, so another flag: PANFROST_RUN_ON_SECOND_CORE_GROUP.
>>
>> But clearly there's little point adding such flags until someone steps
>> up to do the Mesa work.
> 
> I worry about the maintainence burden (both Mesa and kernel) of adding
> UABI only used by a piece of hardware none of us own, and only useful
> "sometimes" for that hardware. Doubly so for the second core group
> support; currently Mesa doesn't advertise any compute support on
> anything older than Mali T760 ... to the best of my knowledge, nobody
> has missed that support either...

I agree there's no point adding the UABI support unless someone is
willing to step and be a maintainer for that hardware. And I suspect no
one cares enough about that hardware to do that.

> To be clear I am in favour of merging the patches needed for GLES2 to
> work on all Malis, possibly at a performance cost on these dual-core
> systems. That's a far cry from the level of support the DDK gave these
> chips back in the day ... of course, the DDK doesn't support them at all
> anymore, so Panfrost wins there by default! ;)
> 

Agreed - I'm happy to merge a kernel series similar to this. I think the
remaining problems are:

1. Addressing Robin's concerns about the first patch. That looks like
it's probably just wrong.

2. I think this patch is too complex for the basic support. There's some
parts like checking GROUPS_L2_COHERENT which also don't feature in kbase
so I don't believe are correct.

3. I don't think this blocks the change. But if we're not using the
second core group we could actually power it down. Indeed simply not
turning on the L2/shader cores should in theory work (jobs are not
scheduled to cores which are turned off even if they are included in the
affinity).

Thanks,

Steve

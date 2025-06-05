Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FAACF0DF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 15:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2DC10E050;
	Thu,  5 Jun 2025 13:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F76610E050
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 13:37:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E160168F;
 Thu,  5 Jun 2025 06:37:40 -0700 (PDT)
Received: from [10.1.196.50] (e121345-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57A603F5A1;
 Thu,  5 Jun 2025 06:37:56 -0700 (PDT)
Message-ID: <3a8e1101-469b-4686-b160-6fdb1737a636@arm.com>
Date: Thu, 5 Jun 2025 14:37:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/10] accel/rocket: Add IOCTL for BO creation
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Daniel Stone <daniel@fooishbar.org>, Rob Herring <robh@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
 <20250604-6-10-rocket-v6-6-237ac75ddb5e@tomeuvizoso.net>
 <CAPj87rPv7Pd5tbXhpRLaUJCGB8JmD4kfF50WRsEiST2gvtg3Bg@mail.gmail.com>
 <cc21a090-801d-4b32-bac2-01cebf896c85@arm.com>
 <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAAObsKDMhuqYtn=+xR6-n=Uk+5_rU91OqVKyQ5cxhqfTo5svjg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/06/2025 8:41 am, Tomeu Vizoso wrote:
[...]
>> In fact this is precisely the usage model I would suggest for this sort
>> of thing, and IIRC I had a similar conversation with the Ethos driver
>> folks a few years back. Running your own IOMMU domain is no biggie, see
>> several other DRM drivers (including rockchip). As long as you have a
>> separate struct device per NPU core then indeed it should be perfectly
>> straightforward to maintain distinct IOMMU domains per job, and
>> attach/detach them as part of scheduling the jobs on and off the cores.
>> Looks like rockchip-iommu supports cross-instance attach, so if
>> necessary you should already be OK to have multiple cores working on the
>> same job at once, without needing extra work at the IOMMU end.
> 
> Ok, so if I understood it correctly, the plan would be for each DRM
> client to have one IOMMU domain per each core (each core has its own
> IOMMU), and map all its buffers in all these domains.
> 
> Then when a job is about to be scheduled on a given core, make sure
> that the IOMMU for that core uses the domain for the client that
> submitted the job.
> 
> Did I get that right?

It should only need a single IOMMU domain per DRM client, so no faffing 
about replicating mappings. iommu_paging_domain_alloc() does need *an* 
appropriate target device so it can identify the right IOMMU driver, but 
that in itself doesn't preclude attaching other devices to the resulting 
domain as well as (or even instead of) the nominal one. In general, not 
all IOMMU drivers support cross-instance attach so it may fail with 
-EINVAL, and *that*'s when you might need to fall back to allocating 
multiple per-instance domains - but as I say since this is a 
Rockchip-specific driver where the IOMMU *is* intended to support this 
already, you don't need to bother.

Thanks,
Robin.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CF69A6AFF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 15:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF6510E50B;
	Mon, 21 Oct 2024 13:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A756D10E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 13:50:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1048DA7;
 Mon, 21 Oct 2024 06:51:07 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A5223F73B;
 Mon, 21 Oct 2024 06:50:36 -0700 (PDT)
Message-ID: <d9f64a98-2091-4882-8a2c-115fe24f6f77@arm.com>
Date: Mon, 21 Oct 2024 14:50:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Remove split on unmap behavior
To: Jason Gunthorpe <jgg@nvidia.com>, Steven Price <steven.price@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, patches@lists.linux.dev
References: <0-v1-8c5f369ec2e5+75-arm_no_split_jgg@nvidia.com>
 <20241021111758.561c81ca@collabora.com>
 <850c70ff-a7f0-4a0b-83a4-0b03a039831d@arm.com>
 <20241021121724.GN3559746@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20241021121724.GN3559746@nvidia.com>
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

On 21/10/2024 1:17 pm, Jason Gunthorpe wrote:
> On Mon, Oct 21, 2024 at 12:32:21PM +0100, Steven Price wrote:
> 
>>> that, we can always do it in two steps (unmap the 2M region and remap
>>> the borders). At some point it'd be good to have some kind of atomic
>>> page table updates, so we don't have this short period of time during
>>> which nothing is mapped (between the unmap and the remap), but that's a
>>> different story.
>>
>> The GPU hardware provides that. The only possible missing piece is that
>> the driver needs to know ahead of time that the unmap would unmap the 2M
>> region so it can do the correct lock before the entries are removed.
> 
> It looks like we need atomic update for some confidential compute
> scenarios, so I am working toward that with the coming generic pt
> stuff.

Beware that whatever the Mali drivers might have the option to do for 
themselves, there's still no notion of "atomic update" for SMMU and 
io-pgtable-arm in general, other than perhaps for permission changes - 
even BBML is quite explicitly non-atomic, as it's defined in terms of 
two otherwise-identical mappings existing at the same time, just 
guaranteeing that while they do, you'll still get behaviour consistent 
with one *or* the other, and not anything in-between.

As far as this patch goes, though, I would not be at all unhappy to see 
the back of split_blk_unmap... However if we are going to do this then 
I'd like even more to formally define it as the behaviour of 
iommu_unmap() and fix up all the other drivers which behave still 
differently (the statement in the commit message is incorrect - 
io-pgtable-arm-v7s still splits; at least exynos fails the unmap entirely.)

Thanks,
Robin.

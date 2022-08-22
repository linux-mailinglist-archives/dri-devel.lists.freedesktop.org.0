Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BE959BFD1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 14:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF0B2B8CD;
	Mon, 22 Aug 2022 12:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7B2A2B8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 12:55:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6632912FC;
 Mon, 22 Aug 2022 05:55:23 -0700 (PDT)
Received: from [10.57.15.77] (unknown [10.57.15.77])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AEF13F718;
 Mon, 22 Aug 2022 05:55:17 -0700 (PDT)
Message-ID: <c64e838a-dace-73dd-8ab9-7284166cf742@arm.com>
Date: Mon, 22 Aug 2022 13:55:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/3] iommu/dma: Move public interfaces to linux/iommu.h
Content-Language: en-GB
To: Christoph Hellwig <hch@infradead.org>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <9cd99738f52094e6bed44bfee03fa4f288d20695.1660668998.git.robin.murphy@arm.com>
 <YwNmosMGZdGtY3LX@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YwNmosMGZdGtY3LX@infradead.org>
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
Cc: jean-philippe@linaro.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
 catalin.marinas@arm.com, joro@8bytes.org, cohuck@redhat.com,
 sw0312.kim@samsung.com, alex.williamson@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, kyungmin.park@samsung.com, maz@kernel.org,
 tglx@linutronix.de, will@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-22 12:21, Christoph Hellwig wrote:
>> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
>> index 70393fbb57ed..79cb6eb560a8 100644
>> --- a/include/linux/iommu.h
>> +++ b/include/linux/iommu.h
>> @@ -1059,4 +1059,40 @@ void iommu_debugfs_setup(void);
>>   static inline void iommu_debugfs_setup(void) {}
>>   #endif
>>   
>> +#ifdef CONFIG_IOMMU_DMA
>> +#include <linux/msi.h>
> 
> I don't think msi.h is actually needed here.
> 
> Just make the struct msi_desc and struct msi_msg forward declarations
> unconditional and we should be fine.

dma-iommu.c still needs to pick up msi.h for the actual definitions 
somehow, so it seemed logical to keep things the same shape as before. 
However I don't have a particularly strong preference either way.

Thanks,
Robin.

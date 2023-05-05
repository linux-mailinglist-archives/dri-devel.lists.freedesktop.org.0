Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B05076F8516
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 16:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819F010E61D;
	Fri,  5 May 2023 14:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 079B310E61D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 14:54:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E628C1FB;
 Fri,  5 May 2023 07:54:45 -0700 (PDT)
Received: from [10.57.81.246] (unknown [10.57.81.246])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 055803F5A1;
 Fri,  5 May 2023 07:53:58 -0700 (PDT)
Message-ID: <8eab6d63-1fa1-704f-279b-83b2df7fa808@arm.com>
Date: Fri, 5 May 2023 15:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/3] iommu/dma: Clean up Kconfig
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>
References: <cover.1660668998.git.robin.murphy@arm.com>
 <2e33c8bc2b1bb478157b7964bfed976cb7466139.1660668998.git.robin.murphy@arm.com>
 <ZFUXmH9vndGZFuPr@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <ZFUXmH9vndGZFuPr@nvidia.com>
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

On 2023-05-05 15:50, Jason Gunthorpe wrote:
> On Tue, Aug 16, 2022 at 06:28:03PM +0100, Robin Murphy wrote:
>> Although iommu-dma is a per-architecture chonce, that is currently
>> implemented in a rather haphazard way. Selecting from the arch Kconfig
>> was the original logical approach, but is complicated by having to
>> manage dependencies; conversely, selecting from drivers ends up hiding
>> the architecture dependency *too* well. Instead, let's just have it
>> enable itself automatically when IOMMU API support is enabled for the
>> relevant architectures. It can't get much clearer than that.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   arch/arm64/Kconfig          | 1 -
>>   drivers/iommu/Kconfig       | 3 +--
>>   drivers/iommu/amd/Kconfig   | 1 -
>>   drivers/iommu/intel/Kconfig | 1 -
>>   4 files changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 571cc234d0b3..59af600445c2 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -209,7 +209,6 @@ config ARM64
>>   	select HAVE_KPROBES
>>   	select HAVE_KRETPROBES
>>   	select HAVE_GENERIC_VDSO
>> -	select IOMMU_DMA if IOMMU_SUPPORT
>>   	select IRQ_DOMAIN
>>   	select IRQ_FORCED_THREADING
>>   	select KASAN_VMALLOC if KASAN
>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>> index 5c5cb5bee8b6..1d99c2d984fb 100644
>> --- a/drivers/iommu/Kconfig
>> +++ b/drivers/iommu/Kconfig
>> @@ -137,7 +137,7 @@ config OF_IOMMU
>>   
>>   # IOMMU-agnostic DMA-mapping layer
>>   config IOMMU_DMA
>> -	bool
>> +	def_bool ARM64 || IA64 || X86
> 
> Robin, do you remember why you added IA64 here? What is the Itanimum
> IOMMU driver?

config INTEL_IOMMU
	bool "Support for Intel IOMMU using DMA Remapping Devices"
	depends on PCI_MSI && ACPI && (X86 || IA64)

Yes, really :)

Robin.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC1C0A451
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 09:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 545B810E132;
	Sun, 26 Oct 2025 08:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IWeO5BKP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Sun, 26 Oct 2025 08:00:15 UTC
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B0F10E132
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Oct 2025 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1761465612; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=gbW6lsAeQnITBSvhA7va7FPK1N1OCTuc7ZM09ubMnwE=;
 b=IWeO5BKP6yJYFscM9YXY3r/tbr5pI71MDjHBkAdgzNB7Q4iG3MrK0ptFkkvhAMmFhm2zvOmQeHQxjBfftV5i4lyFMvQQKPnwi5GU3p3/OaDEHR+tUB/lRVhuA4Un5qf6Ucn8TivJdyxwNTjV4PkPtQNsXFkLdKG+KuRCHJiyzm0=
Received: from 30.246.176.102(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0Wqyle5w_1761465304 cluster:ay36) by smtp.aliyun-inc.com;
 Sun, 26 Oct 2025 15:55:06 +0800
Message-ID: <3db524e7-b6ce-4652-8420-fdb4639ac73a@linux.alibaba.com>
Date: Sun, 26 Oct 2025 15:55:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] vfio/pci: Add dma-buf export support for MMIO
 regions
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1760368250.git.leon@kernel.org>
 <72ecaa13864ca346797e342d23a7929562788148.1760368250.git.leon@kernel.org>
 <20251022125012.GB244727@nvidia.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20251022125012.GB244727@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



在 2025/10/22 20:50, Jason Gunthorpe 写道:
> On Mon, Oct 13, 2025 at 06:26:11PM +0300, Leon Romanovsky wrote:
>> From: Leon Romanovsky <leonro@nvidia.com>
>>
>> Add support for exporting PCI device MMIO regions through dma-buf,
>> enabling safe sharing of non-struct page memory with controlled
>> lifetime management. This allows RDMA and other subsystems to import
>> dma-buf FDs and build them into memory regions for PCI P2P operations.
>>
>> The implementation provides a revocable attachment mechanism using
>> dma-buf move operations. MMIO regions are normally pinned as BARs
>> don't change physical addresses, but access is revoked when the VFIO
>> device is closed or a PCI reset is issued. This ensures kernel
>> self-defense against potentially hostile userspace.
> 
> Let's enhance this:
> 
> Currently VFIO can take MMIO regions from the device's BAR and map
> them into a PFNMAP VMA with special PTEs. This mapping type ensures
> the memory cannot be used with things like pin_user_pages(), hmm, and
> so on. In practice only the user process CPU and KVM can safely make
> use of these VMA. When VFIO shuts down these VMAs are cleaned by
> unmap_mapping_range() to prevent any UAF of the MMIO beyond driver
> unbind.
> 
> However, VFIO type 1 has an insecure behavior where it uses
> follow_pfnmap_*() to fish a MMIO PFN out of a VMA and program it back
> into the IOMMU. This has a long history of enabling P2P DMA inside
> VMs, but has serious lifetime problems by allowing a UAF of the MMIO
> after the VFIO driver has been unbound.

Hi, Jason,

Can you elaborate on this more?

 From my understanding of the VFIO type 1 implementation:

- When a device is opened through VFIO type 1, it increments the
   device->refcount
- During unbind, the driver waits for this refcount to drop to zero via
   wait_for_completion(&device->comp)
- This should prevent the unbind() from completing while the device is
   still in use

Given this refcount mechanism, I do not figure out how the UAF can
occur.

Thanks.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A82B124A1
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 21:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B076F10EA15;
	Fri, 25 Jul 2025 19:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="DrqrpaR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0610E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=EeOo9vMPBFT+62n5mqYkCAxWsQk1Wvt4dBFyCgwjFrk=; b=DrqrpaR7S9OrXgfKiTlAraouUx
 i4ghrIDe0rHZjeUNlfEzZoAUiPbvMyzYgY3NP/FMkua4fsEG4BUEfWmG08NaN3AJaxLLtN7IEqbhj
 4WALY5AeeenGjVOoB5wbIg0n3jzsD5dSSYuovvsWyo6RrCK5quFSZw02fh++FfvIYO/9zgKYx9SHc
 ffj80QXJEfFoR9tRFdpABXThOf1TAKdNiRKAY7HTLi6iU5GP9OmSa0ys2SxJ5ifdpvS0AuGd7so8G
 WtqXMuLWHNwwZap6WIJ6fbeihB/YIucDtjbo21c+DH8bj/20oQ4+GwAjSz3Bt9RGNE02AWYwVosV8
 6WQn0Kww==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1ufNqT-006E5j-0X;
 Fri, 25 Jul 2025 13:12:42 -0600
Message-ID: <a749c502-7794-42f0-8f86-163efd4640b2@deltatee.com>
Date: Fri, 25 Jul 2025 13:12:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leon Romanovsky <leon@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
 <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
 <20250725185402.GU402218@unreal>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20250725185402.GU402218@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: leon@kernel.org, hch@lst.de, alex.williamson@redhat.com,
 jgg@nvidia.com, akpm@linux-foundation.org, bhelgaas@google.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, axboe@kernel.dk, jglisse@redhat.com, joro@8bytes.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org,
 vivek.kasireddy@intel.com, will@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.1
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2025-07-25 12:54, Leon Romanovsky wrote:
>> The solution that would make more sense to me would be for either
>> dma_iova_try_alloc() or another helper in dma-iommu.c to handle the
>> P2PDMA case. dma-iommu.c already uses those same interfaces and thus
>> there would be no need to export the low level helpers from the p2pdma code.
> 
> I had same idea in early versions of DMA phys API discussion and it was
> pointed (absolutely right) that this is layering violation.

Respectfully, I have to disagree with this. Having the layer (ie.
dma-iommu) that normally checks how to handle a P2PDMA request now check
 how to handle these DMA requests is the exact opposite of a layering
violation. Expecting every driver that wants to do P2PDMA to have to
figure out for themselves how to map the memory before calling into the
DMA API doesn't seem like a good design choice to me.

> So unfortunately, I think that dma*.c|h is not right place for p2p
> type check.

dma*.c is already where those checks are done. I'm not sure patches to
remove the code from that layer and put it into the NVMe driver would
make a lot of sense (and then, of course, we'd have to put it into every
other driver that wants to participate in p2p transactions).

Logan


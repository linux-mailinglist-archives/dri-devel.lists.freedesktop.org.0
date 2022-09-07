Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D235B07D9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 17:02:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A017810E7A0;
	Wed,  7 Sep 2022 15:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A04F510E7A0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 15:01:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6961313D5;
 Wed,  7 Sep 2022 08:02:05 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF12C3F71A;
 Wed,  7 Sep 2022 08:01:56 -0700 (PDT)
Message-ID: <de00b89e-c676-1e71-c21b-dd3d13917b48@arm.com>
Date: Wed, 7 Sep 2022 16:01:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 4/4] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Content-Language: en-GB
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@infradead.org>
References: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <4-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
 <YxcYGzPv022G2vLm@infradead.org>
 <b6b5d236-c089-7428-4cc9-a08fe4f6b4a3@amd.com> <YxczjNIloP7TWcf2@nvidia.com>
 <YxiJJYtWgh1l0wxg@infradead.org> <YxiPh4u/92chN02C@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <YxiPh4u/92chN02C@nvidia.com>
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alex Williamson <alex.williamson@redhat.com>,
 Maor Gottlieb <maorg@nvidia.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-07 13:33, Jason Gunthorpe wrote:
> On Wed, Sep 07, 2022 at 05:05:57AM -0700, Christoph Hellwig wrote:
>> On Tue, Sep 06, 2022 at 08:48:28AM -0300, Jason Gunthorpe wrote:
>>> Right, this whole thing is the "standard" that dmabuf has adopted
>>> instead of the struct pages. Once the AMD GPU driver started doing
>>> this some time ago other drivers followed.
>>
>> But it is simple wrong.  The scatterlist requires struct page backing.
>> In theory a physical address would be enough, but when Dan Williams
>> sent patches for that Linus shot them down.
> 
> Yes, you said that, and I said that when the AMD driver first merged
> it - but it went in anyhow and now people are using it in a bunch of
> places.
> 
> I'm happy that Christian wants to start trying to fix it, and will
> help him, but it doesn't really impact this. Whatever fix is cooked up
> will apply equally to vfio and habana.

We've just added support for P2P segments in scatterlists, can that not 
be used here?

Robin.

>> That being said the scatterlist is the wrong interface here (and
>> probably for most of it's uses).  We really want a lot-level struct
>> with just the dma_address and length for the DMA side, and leave it
>> separate from that what is used to generate it (in most cases that
>> would be a bio_vec).
> 
> Oh definitely
> 
>>> Now we have struct pages, almost, but I'm not sure if their limits are
>>> compatible with VFIO? This has to work for small bars as well.
>>
>> Why would small BARs be problematic for the pages?  The pages are more
>> a problem for gigantic BARs do the memory overhead.
> 
> How do I get a struct page * for a 4k BAR in vfio?
> 
> The docs say:
> 
>   ..hotplug api on memory block boundaries. The implementation relies on
>   this lack of user-api constraint to allow sub-section sized memory
>   ranges to be specified to :c:func:`arch_add_memory`, the top-half of
>   memory hotplug. Sub-section support allows for 2MB as the cross-arch
>   common alignment granularity for :c:func:`devm_memremap_pages`.
> 
> Jason

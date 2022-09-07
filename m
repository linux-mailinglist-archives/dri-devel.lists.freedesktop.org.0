Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4E95B0A22
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 18:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C7110E7D6;
	Wed,  7 Sep 2022 16:31:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0CD0C10E7D3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 16:31:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A88EC143D;
 Wed,  7 Sep 2022 09:31:25 -0700 (PDT)
Received: from [10.57.15.197] (unknown [10.57.15.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 425123F71A;
 Wed,  7 Sep 2022 09:31:16 -0700 (PDT)
Message-ID: <6a42a8bc-4e2e-4502-3e7b-1a616dfee351@arm.com>
Date: Wed, 7 Sep 2022 17:31:14 +0100
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
 <Yxiq5sjf/qA7xS8A@infradead.org> <Yxi3cFfs0SA4XWJw@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Yxi3cFfs0SA4XWJw@nvidia.com>
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
 Dan Williams <dan.j.williams@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-07 16:23, Jason Gunthorpe wrote:
> On Wed, Sep 07, 2022 at 07:29:58AM -0700, Christoph Hellwig wrote:
>> On Wed, Sep 07, 2022 at 09:33:11AM -0300, Jason Gunthorpe wrote:
>>> Yes, you said that, and I said that when the AMD driver first merged
>>> it - but it went in anyhow and now people are using it in a bunch of
>>> places.
>>
>> drm folks made up their own weird rules, if they internally stick
>> to it they have to listen to it given that they ignore review comments,
>> but it violates the scatterlist API and has not business anywhere
>> else in the kernel.  And yes, there probably is a reason or two why
>> the drm code is unusually error prone.
> 
> That may be, but it is creating problems if DRM gets to do X crazy
> thing and nobody else can..
> 
> So, we have two issues here
> 
>   1) DMABUF abuses the scatter list, but this is very constrainted we have
>      this weird special "DMABUF scatterlist" that is only touched by DMABUF
>      importers. The imports signal that they understand the format with
>      a flag. This is ugly and would be nice to clean to a dma mapped
>      address list of some sort.
> 
>      I spent alot of time a few years ago removing driver touches of
>      the SGL and preparing the RDMA stack to do this kind of change, at
>      least.
> 
>   2) DMABUF abuses dma_map_resource() for P2P and thus doesn't work in
>      certain special cases.

FWIW, dma_map_resource() *is* for P2P in general. The classic case of 
one device poking at another's registers that was the original 
motivation is a standalone DMA engine reading/writing a peripheral 
device's FIFO, so the very similar inter-device doorbell signal is 
absolutely in scope too; VRAM might be a slightly greyer area, but if 
it's still not page-backed kernel memory then I reckon that's fair game.

The only trouble is that it's not geared for *PCI* P2P when that may or 
may not happen entirely upstream of IOMMU translation.

Robin.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5A0C415C1
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9994E10E1D8;
	Fri,  7 Nov 2025 18:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="H59v75Ni";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B10310E1D8
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 18:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=PjiF0FDj1ggdA8+srznADWIujFetT2w1WcC08yNm+xE=; b=H59v75NiiIx555adWgSui938BX
 Yc3i1CYEaGF7O6kQ1NqaqRVT/Zz7Cswv0/fmOzsuOsqzoIRagasqeUrHrhrdChqEbZeXwaG25NO+S
 5wwiT1Bk++lMCO2rTIpSkO6LuvNwiSk1/lj7Setie4/hO5vXucwRTkyP4yelMuEJS4S3/t3xpANoZ
 fMWvRG+69LUGWzme6PVDco0ZFCeM7vfUpGeksDZI3z5FpBYHlU5+MqvBB/XCUz0tSEk1fDzrRkUZ2
 YHwjo2XWY68XJ4S/UyDHNpcYYoIRz6GCK8IoBHNkuYm6Mq2NkrCY2ePjJ4l6ltSL9O9XJUZxKJPhW
 /Noao/Cg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vHRfI-00000000bYE-3FZm; Fri, 07 Nov 2025 18:58:28 +0000
Message-ID: <0c265a9b-fdc5-40d7-845f-30910f1ac6ea@infradead.org>
Date: Fri, 7 Nov 2025 10:58:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/11] PCI/P2PDMA: Document DMABUF model
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251106-dmabuf-vfio-v7-0-2503bf390699@nvidia.com>
 <20251106-dmabuf-vfio-v7-5-2503bf390699@nvidia.com>
 <135df7eb-9291-428b-9c86-d58c2e19e052@infradead.org>
 <20251107160120.GD15456@unreal>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251107160120.GD15456@unreal>
Content-Type: text/plain; charset=UTF-8
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

	

On 11/7/25 8:01 AM, Leon Romanovsky wrote:
> On Thu, Nov 06, 2025 at 10:15:07PM -0800, Randy Dunlap wrote:
>>
>>
>> On 11/6/25 6:16 AM, Leon Romanovsky wrote:
>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>>
>>> Reflect latest changes in p2p implementation to support DMABUF lifecycle.
>>>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
>>> ---
>>>  Documentation/driver-api/pci/p2pdma.rst | 95 +++++++++++++++++++++++++--------
>>>  1 file changed, 72 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
>>> index d0b241628cf1..69adea45f73e 100644
>>> --- a/Documentation/driver-api/pci/p2pdma.rst
>>> +++ b/Documentation/driver-api/pci/p2pdma.rst
>>> @@ -9,22 +9,47 @@ between two devices on the bus. This type of transaction is henceforth
>>>  called Peer-to-Peer (or P2P). However, there are a number of issues that
>>>  make P2P transactions tricky to do in a perfectly safe way.
>>>  
>>> -One of the biggest issues is that PCI doesn't require forwarding
>>> -transactions between hierarchy domains, and in PCIe, each Root Port
>>> -defines a separate hierarchy domain. To make things worse, there is no
>>> -simple way to determine if a given Root Complex supports this or not.
>>> -(See PCIe r4.0, sec 1.3.1). Therefore, as of this writing, the kernel
>>> -only supports doing P2P when the endpoints involved are all behind the
>>> -same PCI bridge, as such devices are all in the same PCI hierarchy
>>> -domain, and the spec guarantees that all transactions within the
>>> -hierarchy will be routable, but it does not require routing
>>> -between hierarchies.
>>> -
>>> -The second issue is that to make use of existing interfaces in Linux,
>>> -memory that is used for P2P transactions needs to be backed by struct
>>> -pages. However, PCI BARs are not typically cache coherent so there are
>>> -a few corner case gotchas with these pages so developers need to
>>> -be careful about what they do with them.
>>> +For PCIe the routing of TLPs is well defined up until they reach a host bridge
>>
>> Define what TLP means?
> 
> In PCIe "world", TLP is very well-known and well-defined acronym, which
> means Transaction Layer Packet.

It's your choice (or Bjorn's). I'm just reviewing...

>>                                    well-defined
> 
> Thanks
> 
> diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
> index 69adea45f73e..7530296a5dea 100644
> --- a/Documentation/driver-api/pci/p2pdma.rst
> +++ b/Documentation/driver-api/pci/p2pdma.rst
> @@ -9,17 +9,17 @@ between two devices on the bus. This type of transaction is henceforth
>  called Peer-to-Peer (or P2P). However, there are a number of issues that
>  make P2P transactions tricky to do in a perfectly safe way.
> 
> -For PCIe the routing of TLPs is well defined up until they reach a host bridge
> -or root port. If the path includes PCIe switches then based on the ACS settings
> -the transaction can route entirely within the PCIe hierarchy and never reach the
> -root port. The kernel will evaluate the PCIe topology and always permit P2P
> -in these well defined cases.
> +For PCIe the routing of Transaction Layer Packets (TLPs) is well-defined up
> +until they reach a host bridge or root port. If the path includes PCIe switches
> +then based on the ACS settings the transaction can route entirely within
> +the PCIe hierarchy and never reach the root port. The kernel will evaluate
> +the PCIe topology and always permit P2P in these well-defined cases.
> 
>  However, if the P2P transaction reaches the host bridge then it might have to
>  hairpin back out the same root port, be routed inside the CPU SOC to another
>  PCIe root port, or routed internally to the SOC.
> 
> -As this is not well defined or well supported in real HW the kernel defaults to
> +As this is not well-defined or well supported in real HW the kernel defaults to
Nit:                              well-supported

The rest of it looks good. Thanks.

>  blocking such routing. There is an allow list to allow detecting known-good HW,
>  in which case P2P between any two PCIe devices will be permitted.
> 
> @@ -39,7 +39,7 @@ delegates lifecycle management to the providing driver. It is expected that
>  drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
>  to provide an invalidation shutdown. These MMIO pages have no struct page, and
>  if used with mmap() must create special PTEs. As such there are very few
> -kernel uAPIs that can accept pointers to them, in particular they cannot be used
> +kernel uAPIs that can accept pointers to them; in particular they cannot be used
>  with read()/write(), including O_DIRECT.
> 
>  Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
> @@ -154,7 +154,7 @@ access happens.
>  Usage With DMABUF
>  =================
> 
> -DMABUF provides an alternative to the above struct page based
> +DMABUF provides an alternative to the above struct page-based
>  client/provider/orchestrator system. In this mode the exporting driver will wrap
>  some of its MMIO in a DMABUF and give the DMABUF FD to userspace.
> 
> @@ -162,10 +162,10 @@ Userspace can then pass the FD to an importing driver which will ask the
>  exporting driver to map it.
> 
>  In this case the initiator and target pci_devices are known and the P2P subsystem
> -is used to determine the mapping type. The phys_addr_t based DMA API is used to
> +is used to determine the mapping type. The phys_addr_t-based DMA API is used to
>  establish the dma_addr_t.
> 
> -Lifecycle is controlled by DMABUF move_notify(), when the exporting driver wants
> +Lifecycle is controlled by DMABUF move_notify(). When the exporting driver wants
>  to remove() it must deliver an invalidation shutdown to all DMABUF importing
>  drivers through move_notify() and synchronously DMA unmap all the MMIO.
> 

-- 
~Randy


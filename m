Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037C3B1673B
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 21:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E701F10E234;
	Wed, 30 Jul 2025 19:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Zm2Y9mqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C1E810E02C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753905533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJ8yWqGXhru7WhV5DGnUZnDJthF7Yg1ZkZASyV+JWoM=;
 b=Zm2Y9mqjX22vXnDrsFbD6PByULsHJbEU4LkyULVlhJP2sLLcl+BqmoYSMSzsYIykMgG22k
 oyr8lCJHGbxTzNeHD3LJq9dRuJTwzfYmenfChjRlG2gXBWewOgU8t3w6az+FtirpLm9RE8
 jU3aJUL5goSYhABxcYfhKo5SY6EIRxQ=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-EQMIAsSrPcW3JNn5C-eMhA-1; Wed, 30 Jul 2025 15:58:50 -0400
X-MC-Unique: EQMIAsSrPcW3JNn5C-eMhA-1
X-Mimecast-MFC-AGG-ID: EQMIAsSrPcW3JNn5C-eMhA_1753905530
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-87c44f602fbso2519239f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 12:58:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753905530; x=1754510330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJ8yWqGXhru7WhV5DGnUZnDJthF7Yg1ZkZASyV+JWoM=;
 b=q8HVRaTf60u/e58NxHoj8vs4ChtSGoQH4LiHSDVboob6z+ma32csqGLMXfDTbx3HcI
 L5hL+R58QUW9jJaCKkmTzMX9OW2okGyrY4DK6rUFHgDnauyKzkkxKck1l/ySFMJ2aOLv
 865bdFlny0MBQucDHIzYkZ4Z4YxM0MJysXfkkUf0uEWOA6JKUE5/nKIlpC1UM5fE1c48
 JxQD0GWRTd317O+TN2tNWmQjwS/C+9Z4EtW9m2nMlSuRJobVkgHaLr/WWRBkHv9VbxZL
 vSBK/I5EYvz+C1nlzlKbQIUdwECKjIK/bkHycsrVJfRgPkvGM32gTDHTP7JFxIIGcEJs
 KRsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS6oouJihSCbQJRPlKmuqjRvKqzvc8INMfBbDMYbjmlEPymoC2cEbM5+aUeiImjnxFSVMF8Eq9Vq0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzMilImK/okSJvE+eNfqvqwFdpQAN5/tfTKYcU0P4tGru/dgbv
 8AOiT/mwfLpVK1cg3OT0WPQnJIpBAuEQToRYhRknXCTo/ydrtXv2yfXlvksM8jWHwCVAhIEXEi8
 AKAqnOuh7V1rk/Tm5IhVatYDTW2kX3swxiedLJFYykCBgo20hhzsXLjYtdW6CVzDuEgMEFg==
X-Gm-Gg: ASbGncuMFF46u2Po5qkph1yArdAOJIJtLLH/U/Z2Vs3x/wtjGzvtjzFzVzNThoYwsFW
 VPUSfRw39Z6qLWgPcutTbAb2z1GdxZNwRc6eDVjf7/IlQ2nrpVb/mT8hJ3/tYNl5wpNlSGFr0gK
 DDmG7G1GGllIpUJU5zX/4F4CRreC5bw9BS+7KN8LxY1PmCBqZLEIcXbius9eqJXlDtgwomrwAsX
 imC54VKNYu0WDcOMqWEpxW8UFaKbhanPxcG4ZDsl8ZeiatKKEZShwB+KwzfLPNzww8wjr6GFwMt
 ZGfYz5X6+1MR0FiBcBHm03lRIT8rGidPJ0vAGfxOB9Y=
X-Received: by 2002:a05:6602:3403:b0:85b:544c:ba6c with SMTP id
 ca18e2360f4ac-88137489c1bmr247638039f.1.1753905529645; 
 Wed, 30 Jul 2025 12:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqzTNDwtWgU4diezEDNzfWAqDpdNRdRLffgeb0LuFILxM3AuzO6OxVkpYobVhQ8ZrxcWgziA==
X-Received: by 2002:a05:6602:3403:b0:85b:544c:ba6c with SMTP id
 ca18e2360f4ac-88137489c1bmr247635939f.1.1753905529204; 
 Wed, 30 Jul 2025 12:58:49 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50a55da3278sm19521173.84.2025.07.30.12.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 12:58:48 -0700 (PDT)
Date: Wed, 30 Jul 2025 13:58:46 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/10] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20250730135846.2208fe89.alex.williamson@redhat.com>
In-Reply-To: <cover.1753274085.git.leonro@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XRgu45q26aEFHokNbLnr-wJ-diyl5lFc1_3jYLQ1hKo_1753905530
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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

On Wed, 23 Jul 2025 16:00:01 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> ---------------------------------------------------------------------------
> Based on blk and DMA patches which will be sent during coming merge window.
> ---------------------------------------------------------------------------
> 
> This series extends the VFIO PCI subsystem to support exporting MMIO regions
> from PCI device BARs as dma-buf objects, enabling safe sharing of non-struct
> page memory with controlled lifetime management. This allows RDMA and other
> subsystems to import dma-buf FDs and build them into memory regions for PCI
> P2P operations.
> 
> The series supports a use case for SPDK where a NVMe device will be owned
> by SPDK through VFIO but interacting with a RDMA device. The RDMA device
> may directly access the NVMe CMB or directly manipulate the NVMe device's
> doorbell using PCI P2P.
> 
> However, as a general mechanism, it can support many other scenarios with
> VFIO. This dmabuf approach can be usable by iommufd as well for generic
> and safe P2P mappings.

I think this will eventually enable DMA mapping of device MMIO through
an IOMMUFD IOAS for the VM P2P use cases, right?  How do we get from
what appears to be a point-to-point mapping between two devices to a
shared IOVA between multiple devices?  I'm guessing we need IOMMUFD to
support something like IOMMU_IOAS_MAP_FILE for dma-buf, but I can't
connect all the dots.  Thanks,

Alex


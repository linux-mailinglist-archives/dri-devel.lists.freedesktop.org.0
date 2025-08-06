Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16053B1CEE4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 00:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4BD810E065;
	Wed,  6 Aug 2025 22:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CFdqmzkX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0810E065
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 22:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754517730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPKtzeEHbCO/oC/mPOhJydcV6bGZHZZqGISB9ILuO/c=;
 b=CFdqmzkXwjG7/90VFtMUN12j30HgBWafM3zN1/K36BMDJmGJqaoAWh11AXsNwIt3vtZhgy
 eCkNPcT7BppW6x84/Vn8r6n4zLedL2r4suT8IWJ0GaOlzgVzWbHJtPTqhu1V7s+CeCLE9J
 48+RGb7UcKsexp4IfnPS6250Gte8pxs=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-PENRmhXDOuuV01VDAFC4Mw-1; Wed, 06 Aug 2025 18:02:08 -0400
X-MC-Unique: PENRmhXDOuuV01VDAFC4Mw-1
X-Mimecast-MFC-AGG-ID: PENRmhXDOuuV01VDAFC4Mw_1754517728
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3e3fff9eb72so966525ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 15:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754517728; x=1755122528;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DPKtzeEHbCO/oC/mPOhJydcV6bGZHZZqGISB9ILuO/c=;
 b=eizKv4sR76D9DrTdo+1M+4FZvTqbgyIdwb+sE2j8JgiqkrW8AQbL1Zw1HREci3p+Vf
 HL4y7CB67gzP1TRYit1mnWHc++Bud7i+zkauyy0odDfr+sQBCjB4IP2+LkI1hZ2zFQPH
 XvqPwcBCVXaYcHpXLNCM/ZnIrXZy5l0oCCeClQg6e0qSks3JmL56KHH/apFJ4iKshCtw
 CPwkytuY9M3S8KTW4OMPrPmNJ22RvM9ui/8drB9xM2xtPFo3WW6BifTJwec54TAZ/X4v
 KKQUsUV8jHVuQsK6QozurU0g1GYpnm2dAJnLEuA0+VtYpWSkA3VzohZpD3TUOo7aqFMd
 nTPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoXS+IIQe6yVwz0/QPTUbUQRKYjk45MpDlbAmgzFDk0eKP7Ktr92/fsVpxPnP3OuCwuTQAcngEHPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVhhCiLc5UEDqjWvQK1hY0coIRazYbTH14dy8tKoi+3yQVbcK7
 jYyNXCS4Sk+MhpxaZy8cwELU9e5GO+hHrOFkJpp6bSEyRSNI9FF6vEkvX7ycav2TghqwToqYr91
 XYENq7QyqTAylHpFbkawjm9HvujKMmUwDJ68l0oDQoC+RoyLOr0TWvoNn6LnoLCzwbTEnCQ==
X-Gm-Gg: ASbGnctpaiwiPNgegTA9SpBhq7YG5Phm+FTKN/na2hYTPxfv+m5e9R318chfxXJppNY
 pe1PQ4cOVpUNagCjDm8rTIT6EO7+F5bQh8FCINxi1/MVByqnqDqbuRvsvUTPF6rb4hoyAHpl1Oi
 X/40FQ8Z2o8sxfVJGyiNsHhRpAr0OtOj7NjbDixzp9ifVxl+Ut8XmMoyd7TBC2kd0F+37icwG/h
 xdBx8F2gK5IGZ6dYalkPwH4hxQSlj72mD2JYpDr+9nVB+MREJHGWMVxQTbEnTmedP6VcBwkcrd3
 CWNmX+CG5qYJiwkw4oT98AKRtHwPh7TAqWMivAOFyXU=
X-Received: by 2002:a05:6e02:3193:b0:3dd:c927:3b4f with SMTP id
 e9e14a558f8ab-3e51b8854c1mr22433045ab.2.1754517727893; 
 Wed, 06 Aug 2025 15:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIzdy8eeJry7tYq6oPCO7e2LCNwpZ/0SyAUMoLDbyTlBwk+OaaK/N75sVSFjgffH+CpRQ7JQ==
X-Received: by 2002:a05:6e02:3193:b0:3dd:c927:3b4f with SMTP id
 e9e14a558f8ab-3e51b8854c1mr22432755ab.2.1754517727346; 
 Wed, 06 Aug 2025 15:02:07 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3e40297c389sm63783105ab.2.2025.08.06.15.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 15:02:05 -0700 (PDT)
Date: Wed, 6 Aug 2025 16:02:01 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 08/10] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20250806160201.2b72e7a0.alex.williamson@redhat.com>
In-Reply-To: <edb2ec654fc27ba8f73695382ab0a029f18422b5.1754311439.git.leon@kernel.org>
References: <cover.1754311439.git.leon@kernel.org>
 <edb2ec654fc27ba8f73695382ab0a029f18422b5.1754311439.git.leon@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Zy1VQ51RSPZZO2oxcZe_ZDIfBjRoTdAjhgC9zBBhYOg_1754517728
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

On Mon,  4 Aug 2025 16:00:43 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Make sure that all VFIO PCI devices have peer-to-peer capabilities
> enables, so we would be able to export their MMIO memory through DMABUF,
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 4 ++++
>  include/linux/vfio_pci_core.h    | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 31bdb9110cc0f..df9a32d3deac9 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -28,6 +28,7 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/mm.h>
>  #include <linux/iommufd.h>
> +#include <linux/pci-p2pdma.h>
>  #if IS_ENABLED(CONFIG_EEH)
>  #include <asm/eeh.h>
>  #endif
> @@ -2088,6 +2089,9 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +	vdev->provider = pci_p2pdma_enable(vdev->pdev);
> +	if (IS_ERR(vdev->provider))
> +		return PTR_ERR(vdev->provider);

I think this just made all vfio-pci drivers functionally dependent on
CONFIG_PCI_P2PDMA.  Seems at best exporting a dma-buf should be
restricted if this fails.  Thanks,

Alex

>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);
>  
> diff --git a/include/linux/vfio_pci_core.h b/include/linux/vfio_pci_core.h
> index fbb472dd99b36..b017fae251811 100644
> --- a/include/linux/vfio_pci_core.h
> +++ b/include/linux/vfio_pci_core.h
> @@ -94,6 +94,7 @@ struct vfio_pci_core_device {
>  	struct vfio_pci_core_device	*sriov_pf_core_dev;
>  	struct notifier_block	nb;
>  	struct rw_semaphore	memory_lock;
> +	struct p2pdma_provider  *provider;
>  };
>  
>  /* Will be exported for vfio pci drivers usage */


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57902BAAA1D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE23710E4AC;
	Mon, 29 Sep 2025 21:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eSzIvrH3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC80910E4AC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 21:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759180670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pary30BmU4/NqakwYdG1eNkY0RiL1NyFW4TmIsuJ5GE=;
 b=eSzIvrH3TgR0u/E7xT35nD+af8z61fl3d06j8oab4bPnIAOmHnplVN848Li+daD8aG2NUl
 eo9ppaNIkhWD0cfULhpqQAOKXbhi3NB/3F3Q77eGKJqGllFgASG+czUoRAp9Mk3BRKkKmM
 PaGkjgchT4tV6RFaWyNW7XHFmxsUftE=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-YIS4LKVfNRevUBx4NoHMaw-1; Mon, 29 Sep 2025 17:17:49 -0400
X-MC-Unique: YIS4LKVfNRevUBx4NoHMaw-1
X-Mimecast-MFC-AGG-ID: YIS4LKVfNRevUBx4NoHMaw_1759180668
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-4248bfd20faso13820775ab.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759180668; x=1759785468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pary30BmU4/NqakwYdG1eNkY0RiL1NyFW4TmIsuJ5GE=;
 b=AK2+mZAtmtoIAiIXj55EmRSRd9yVKN8MYJSZUoWYUVTg4IAICkpAZiU4rkQsF/3TO7
 Jti6+io4C8CCpEm/DjpzLsUARF/sK/siR+t0pvRC+SXgXJnN9BeNnD9HioOALluAM74o
 H9P6z1pgkVATdQ1EULgnaNSzZSIcsGvlOZWdGBs5c2F1ZzWSVqu598s6UFoHsJoENxVr
 Vkb4ibQz7dffB/rsZUGobT3qkTsbbt2vw3KkP713nm1BoNqL8bAqsgd4AdkmZ33x8AHw
 uVCjGpcU1x/C+akIlted7Lvf0DtVi6hMHwC046q7cFF4WwXkBl0YdHQnhHEREFkyQArm
 IKYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa2Pbx9FOT3cvHpsPwJ/xtzpU+veAeYjnlsdVNugArxjr4PG5blQMPPDKyYgPuzICCbkx2CkO2Bd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLboYZJ0LT4zem/HWtkfHHWn31ZIxhgjDwfVrh6J2mv64Ad9Hv
 2VpSxGlGwB/CvdbXtf1mD2/yulhKRJDUHkSTBSzQU38odiIQ1v3ktQibEW0FX8ARdi2SXqbbI4J
 AaU4HRzAu6e7p13QfiV3NktPbQSMvLi+Rl83WsjB9e6Olaxv8t+eQpyZ2O9NBpDmu8HcCiw==
X-Gm-Gg: ASbGncuk+qr2wkdGVwP4WmGYgxrnfqqEAdHm56L+1TT9XwkgAsJRaKcI/4AWkTe8DuN
 j+Q95roxnPLsFjtGCoeZP58rMJ8FLSvlhc3508UuwYY2eQwOAaq5fpQjvY/GGm5lvwehsP2TieT
 76y2oMN1dTV6qTxbKDFVUK21jxTykusJuFmtFl36URUQJmhiHvJYIte6EzGYWi7DiN0H5ALZRMO
 +zuPbvBATIKVLxqC2b3OTsEBF75Lhf/bROmgwiANMpE3Qgnyqyl0qbSaDxbe1FSh5uKwAtM15dt
 KQvhLroQ0PZgqR3UX4iaUVOicYg2jlrAtuzgRKQUHYk=
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id
 e9e14a558f8ab-425955e4dfdmr95833955ab.2.1759180668411; 
 Mon, 29 Sep 2025 14:17:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE31/4ZuuqxcHY5C8RvKg6dnDpxm6QWjHiIpet9IRXNGlsIsGmjCxy18kHCIW8dgbK0MWZ9w==
X-Received: by 2002:a05:6e02:1b08:b0:424:6c8e:6187 with SMTP id
 e9e14a558f8ab-425955e4dfdmr95833605ab.2.1759180667942; 
 Mon, 29 Sep 2025 14:17:47 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-5753c50a188sm920778173.31.2025.09.29.14.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 14:17:46 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:45 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 08/10] vfio/pci: Enable peer-to-peer DMA transactions
 by default
Message-ID: <20250929151745.439be1ec.alex.williamson@redhat.com>
In-Reply-To: <ac8c6ccd792e79f9424217d4bca23edd249916ca.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
 <ac8c6ccd792e79f9424217d4bca23edd249916ca.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C9e98UlqFzMz2xrzzTjRscgei3jrV-jBD25oNr7jLrM_1759180668
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

On Sun, 28 Sep 2025 17:50:18 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Make sure that all VFIO PCI devices have peer-to-peer capabilities
> enables, so we would be able to export their MMIO memory through DMABUF,
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 7dcf5439dedc..608af135308e 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -28,6 +28,9 @@
>  #include <linux/nospec.h>
>  #include <linux/sched/mm.h>
>  #include <linux/iommufd.h>
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +#include <linux/pci-p2pdma.h>
> +#endif
>  #if IS_ENABLED(CONFIG_EEH)
>  #include <asm/eeh.h>
>  #endif
> @@ -2085,6 +2088,7 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  {
>  	struct vfio_pci_core_device *vdev =
>  		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> +	int __maybe_unused ret;
>  
>  	vdev->pdev = to_pci_dev(core_vdev->dev);
>  	vdev->irq_type = VFIO_PCI_NUM_IRQS;
> @@ -2094,6 +2098,11 @@ int vfio_pci_core_init_dev(struct vfio_device *core_vdev)
>  	INIT_LIST_HEAD(&vdev->dummy_resources_list);
>  	INIT_LIST_HEAD(&vdev->ioeventfds_list);
>  	INIT_LIST_HEAD(&vdev->sriov_pfs_item);
> +#ifdef CONFIG_VFIO_PCI_DMABUF
> +	ret = pcim_p2pdma_init(vdev->pdev);
> +	if (ret)
> +		return ret;
> +#endif
>  	init_rwsem(&vdev->memory_lock);
>  	xa_init(&vdev->ctx);
>  

What breaks if we don't test the return value and remove all the
#ifdefs?  The feature call should fail if we don't have a provider but
that seems more robust than failing to register the device.  Thanks,

Alex


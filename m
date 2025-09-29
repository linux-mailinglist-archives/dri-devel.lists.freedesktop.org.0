Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE82BAAA17
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 23:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880210E4A6;
	Mon, 29 Sep 2025 21:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WPsZ2uOK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A293D10E4A6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 21:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1759180668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pvJsfDbbmraa6iCCkjoqVoBB3Mb9XdjPoCcVP3qHFzU=;
 b=WPsZ2uOKVqLQETBTtPI36pbF0fAxED6UkoBsRTJc8vHtRaFEZDfFfPLQP4ljacqDJheZ5W
 Y2DEBoMwKaz+PbrPOZllAvla0F8AGl+z0U2IkumRHuyBNeNJKaAk7AkouWXYCg5LnrrMk+
 dGbbTCtYvPQFnwpVJmRFJ0nwxKf4mZs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-yC-htG2MNhiPl3po9l23vA-1; Mon, 29 Sep 2025 17:17:45 -0400
X-MC-Unique: yC-htG2MNhiPl3po9l23vA-1
X-Mimecast-MFC-AGG-ID: yC-htG2MNhiPl3po9l23vA_1759180664
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-42b2a51fab6so3496165ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 14:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759180664; x=1759785464;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvJsfDbbmraa6iCCkjoqVoBB3Mb9XdjPoCcVP3qHFzU=;
 b=BdZgCPX8aGLaSGRxAjYLcK4WEAVM6l15B3m6Y2LJ1HE6H0h1B0QLyKKHPIrSh8QAUY
 rAlRRzsOe4d4zeJsTZEFsCGckoa1lWejaD2rZ0RLfAm3+xx4mxBMheL1RYenrdfdQzOk
 7qJNi4YyOPKSLqCT6ykoMuxAe9KMkTlaNZpdzu17mSGW84rN/VP+LPlq6/2gwu5m54r6
 dp66Aa0dN8UEj7n9i0gK7hxO1dakPFyDuz8bKnpD0RMGRzEkzrz2eapOWxl4fGdNIK2I
 Ld+Hm9JFcE9neRYfhd12Pca1+EM0Jr3Kgtj1jetNbU8fLhrZ8AylBdUludmOgHlt/M4u
 QkMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHKdU15hYgI1/PQJopkLWyMGNHAIb9mEyPpg8Yth+9CJQT014t8emaGlP84gGZ8PE5FAU+1D/7M8s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5z3xfH+hS/90NURBr0mgVmgqApRT8hnVjg2AmX8A5zD0YhIAi
 9kZjxjVbBV7ild0y90al24pmFz1ziHsoQqftgCLHSjeQP8RXImQEeYjsbFok8L1OIHCCnxi+FXE
 899oIC3w+aWLDeYT8+HqR0nt/8YN//mvExGfrOfW3lWoBdbNVbZL2H1c3UofD1bO1/E9dYA==
X-Gm-Gg: ASbGncu3ff1PE6NHm3ftJtCzbnuF6YM2A7wBfDxh1jwTsxL3+VGxxRr+NhUPQHEwLzB
 OQ1XuzWe7Io0G501SONfRDw9ft7dkiG0vI0L8u7REUSfgQ+jrwQ7uZr7FsmDXl/qgscpjt3gbNN
 7c38AvEo2OHmovQVi3S7lRS9qHjOUC/32IewBLH/xHlxcQq8+Dl2qoAcSu8M4D2NDhBuJudnuU3
 9NDQKnGFLHo+fliyNHdNuA5M9zpYBozMniSh2itPFSe/DLRS4d1zWTifdzBYIgHNQ7G8eUf3/z5
 HK36VImoV4KN51Ath1uuw5mLiFRah1geVWcP7tjgLhA=
X-Received: by 2002:a05:6e02:1525:b0:408:1624:b2ee with SMTP id
 e9e14a558f8ab-425955e4f60mr87964865ab.1.1759180664144; 
 Mon, 29 Sep 2025 14:17:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3VrvxaH7k00bkTZJWrxcv/Xeuv7Ik/zOnPnH3ASkfKmA5ptZ34qoyLfGaDXRfunQjFfs8kg==
X-Received: by 2002:a05:6e02:1525:b0:408:1624:b2ee with SMTP id
 e9e14a558f8ab-425955e4f60mr87964675ab.1.1759180663680; 
 Mon, 29 Sep 2025 14:17:43 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-57269f5d0c5sm1963571173.13.2025.09.29.14.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 14:17:42 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:17:40 -0600
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
Subject: Re: [PATCH v4 07/10] vfio/pci: Add dma-buf export config for MMIO
 regions
Message-ID: <20250929151740.21f001e3.alex.williamson@redhat.com>
In-Reply-To: <b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
References: <cover.1759070796.git.leon@kernel.org>
 <b1b44823f93fd9e7fa73dc165141d716cb74fa90.1759070796.git.leon@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o0Hlczzm3mTHrK6VcY7M6o26k68_YbQ52a6FghCmfrI_1759180664
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

On Sun, 28 Sep 2025 17:50:17 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Add new kernel config which indicates support for dma-buf export
> of MMIO regions, which implementation is provided in next patches.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/Kconfig | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 2b0172f54665..55ae888bf26a 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -55,6 +55,26 @@ config VFIO_PCI_ZDEV_KVM
>  
>  	  To enable s390x KVM vfio-pci extensions, say Y.
>  
> +config VFIO_PCI_DMABUF
> +	bool "VFIO PCI extensions for DMA-BUF"
> +	depends on VFIO_PCI_CORE
> +	depends on PCI_P2PDMA && DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  Enable support for VFIO PCI extensions that allow exporting
> +	  device MMIO regions as DMA-BUFs for peer devices to access via
> +	  peer-to-peer (P2P) DMA.
> +
> +	  This feature enables a VFIO-managed PCI device to export a portion
> +	  of its MMIO BAR as a DMA-BUF file descriptor, which can be passed
> +	  to other userspace drivers or kernel subsystems capable of
> +	  initiating DMA to that region.
> +
> +	  Say Y here if you want to enable VFIO DMABUF-based MMIO export
> +	  support for peer-to-peer DMA use cases.
> +
> +	  If unsure, say N.
> +
>  source "drivers/vfio/pci/mlx5/Kconfig"
>  
>  source "drivers/vfio/pci/hisilicon/Kconfig"

This is only necessary if we think there's a need to build a kernel with
P2PDMA and VFIO_PCI, but not VFIO_PCI_DMABUF.  Does that need really
exist?

I also find it unusual to create the Kconfig before adding the
supporting code.  Maybe this could be popped to the end or rolled into
the last patch if we decided to keep it.  Thanks,

Alex


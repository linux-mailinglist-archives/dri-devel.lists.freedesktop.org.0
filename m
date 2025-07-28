Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE0FB1439C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 22:56:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB2B10E008;
	Mon, 28 Jul 2025 20:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QFNnLwW7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EFC10E008
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 20:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1753736160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3lAhpTjpbvFQu27uIQ7LZXIQUIKIfZHhU7pyfNlOjpc=;
 b=QFNnLwW7h0LVmcrOTFzruTUTrsbLW/U87LNuxjdPDbgsnEIqJIy/+qvUElmp9bcLntM78f
 K6d2Zzl6gkff0KdD10y2kO8uZv+H/X67NRyWUkPC6DqGetXvuFFH9Aa7XQkNL75fRhKxTV
 4NE2O7n8DNx+ODm7VjxL57ZzGmwlBms=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-5juwjk6lOh20RHUix_hmTg-1; Mon, 28 Jul 2025 16:55:58 -0400
X-MC-Unique: 5juwjk6lOh20RHUix_hmTg-1
X-Mimecast-MFC-AGG-ID: 5juwjk6lOh20RHUix_hmTg_1753736158
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3e3ea64a166so451995ab.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 13:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753736157; x=1754340957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lAhpTjpbvFQu27uIQ7LZXIQUIKIfZHhU7pyfNlOjpc=;
 b=nlxvLM7c3JL+vyWe1mJcSWqhXNYK0E/mVR94nosypVWzRy9eO/XfIvgmoGZkA9SjGN
 QI80BNRS/UYbYrvlQSNYAULHYjrxZyHdwUmQir8U0SOKHJTnhCjNRkvdrVrtAwQorUlc
 M5/l3V8yKJxXAUCKGikfyYS2EAeMNNyvwj/zsTP20USfNSS/1BZbaEjDv0FKuVmsab3F
 VwoViShir8/l/su07Z+x8TNYo2ovQ+5dk55Awvc/jmeyfiJyNdmE0hMA45FnmbJMZ5Mx
 Iiq4qbS3oWJz+IvjjCc5VP7hL18Y5q4LCzIgVutgaVQosI4Z8GueE8OMmibLNFH/JmBO
 cNAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEpd5tC/FfWjpb6IeAxS70vtkEMjSapl6vRI4VBOBajD6RlncecR9Z+CG6EnL4ZDtxhyt78qB1ol8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJJx+kvOhyH3buSjveBel7J/HH58NXBRkurYo6XHeZDP+s5NHV
 uDHB/iB0fS+Hf5UT4ozQLisQqKSjbqy9TUH5FIvxGLFi4mWcALWO1dugOZCOjjkvlx+ovQafA9M
 AR3k7XOBgGtAj+4WBE6BIdy8BRjweWekYsGhTvTaTFiLDT4ztOr5cRuu69ggz087sRr884A==
X-Gm-Gg: ASbGncvFU5uw/pRJ3mlWkYaL+EsJBpIfop/D6XFDjLhsQE/Qwb97CoJj4phqqHllUTy
 ymPGIzePLw7ZbERv9V+L+E2vwSN3pGT7L+kiWL6B9qbSUY+FWSfjsOhHGNW48jpmZ5HBLXUJXBr
 tzimmCC/inJ9KKoDGC89S7g6/SdDZ3sK+plDPDI0yawpgPnf8vjLBjvu4MpJPhvvdud+t+0AODd
 6XnJ1GSpnwOaPpmUa3N8xOnERfY6tGXCmmQor9gJKlGKxRu6dJhVKT9WFMXm4Nb5P5O/sPP79G9
 H3T5GIcZe6RUCEIc+KEGXHB+znxsO0OQEFAk8PCtTYo=
X-Received: by 2002:a05:6e02:3389:b0:3e3:e461:4617 with SMTP id
 e9e14a558f8ab-3e3e4614777mr12699205ab.2.1753736157532; 
 Mon, 28 Jul 2025 13:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaMLNGgu4ToITqnk/t+y4I2RkNZuq3J6YSgL+Stwkf8Y5Ta3HhAl493hrL7HwiUxfbSIOjGA==
X-Received: by 2002:a05:6e02:3389:b0:3e3:e461:4617 with SMTP id
 e9e14a558f8ab-3e3e4614777mr12698925ab.2.1753736157034; 
 Mon, 28 Jul 2025 13:55:57 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-508c9341e4csm2109194173.76.2025.07.28.13.55.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:55:55 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:55:53 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Christoph Hellwig
 <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Bjorn Helgaas <bhelgaas@google.com>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Will
 Deacon <will@kernel.org>
Subject: Re: [PATCH 09/10] vfio/pci: Share the core device pointer while
 invoking feature functions
Message-ID: <20250728145553.53e94d49.alex.williamson@redhat.com>
In-Reply-To: <19f71a0f4d1a5db8c712cb4d094ccf2f10dc22c5.1753274085.git.leonro@nvidia.com>
References: <cover.1753274085.git.leonro@nvidia.com>
 <19f71a0f4d1a5db8c712cb4d094ccf2f10dc22c5.1753274085.git.leonro@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HjRNMYQfB1ONe65Z1PCmXY06hXTZjGlTlS9mRg0DWDM_1753736158
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

On Wed, 23 Jul 2025 16:00:10 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> There is no need to share the main device pointer (struct vfio_device *)
> with all the feature functions as they only need the core device
> pointer. Therefore, extract the core device pointer once in the
> caller (vfio_pci_core_ioctl_feature) and share it instead.
> 
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 30 +++++++++++++-----------------
>  1 file changed, 13 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
> index 1e675daab5753..5512d13bb8899 100644
> --- a/drivers/vfio/pci/vfio_pci_core.c
> +++ b/drivers/vfio/pci/vfio_pci_core.c
> @@ -301,11 +301,9 @@ static int vfio_pci_runtime_pm_entry(struct vfio_pci_core_device *vdev,
>  	return 0;
>  }
>  
> -static int vfio_pci_core_pm_entry(struct vfio_device *device, u32 flags,
> +static int vfio_pci_core_pm_entry(struct vfio_pci_core_device *vdev, u32 flags,
>  				  void __user *arg, size_t argsz)
>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>  	int ret;
>  
>  	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET, 0);
> @@ -322,12 +320,10 @@ static int vfio_pci_core_pm_entry(struct vfio_device *device, u32 flags,
>  }
>  
>  static int vfio_pci_core_pm_entry_with_wakeup(
> -	struct vfio_device *device, u32 flags,
> +	struct vfio_pci_core_device *vdev, u32 flags,
>  	struct vfio_device_low_power_entry_with_wakeup __user *arg,
>  	size_t argsz)

I'm tempted to fix the line wrapping here, but I think this patch
stands on its own.  Even if it's rather trivial, it makes sense to
consolidate and standardize on the vfio_pci_core_device getting passed
around within vfio_pci_core.c.  Any reason not to split this off?
Thanks,

Alex

>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>  	struct vfio_device_low_power_entry_with_wakeup entry;
>  	struct eventfd_ctx *efdctx;
>  	int ret;
> @@ -378,11 +374,9 @@ static void vfio_pci_runtime_pm_exit(struct vfio_pci_core_device *vdev)
>  	up_write(&vdev->memory_lock);
>  }
>  
> -static int vfio_pci_core_pm_exit(struct vfio_device *device, u32 flags,
> +static int vfio_pci_core_pm_exit(struct vfio_pci_core_device *vdev, u32 flags,
>  				 void __user *arg, size_t argsz)
>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>  	int ret;
>  
>  	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET, 0);
> @@ -1475,11 +1469,10 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
>  }
>  EXPORT_SYMBOL_GPL(vfio_pci_core_ioctl);
>  
> -static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
> -				       uuid_t __user *arg, size_t argsz)
> +static int vfio_pci_core_feature_token(struct vfio_pci_core_device *vdev,
> +				       u32 flags, uuid_t __user *arg,
> +				       size_t argsz)
>  {
> -	struct vfio_pci_core_device *vdev =
> -		container_of(device, struct vfio_pci_core_device, vdev);
>  	uuid_t uuid;
>  	int ret;
>  
> @@ -1506,16 +1499,19 @@ static int vfio_pci_core_feature_token(struct vfio_device *device, u32 flags,
>  int vfio_pci_core_ioctl_feature(struct vfio_device *device, u32 flags,
>  				void __user *arg, size_t argsz)
>  {
> +	struct vfio_pci_core_device *vdev =
> +		container_of(device, struct vfio_pci_core_device, vdev);
> +
>  	switch (flags & VFIO_DEVICE_FEATURE_MASK) {
>  	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY:
> -		return vfio_pci_core_pm_entry(device, flags, arg, argsz);
> +		return vfio_pci_core_pm_entry(vdev, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_LOW_POWER_ENTRY_WITH_WAKEUP:
> -		return vfio_pci_core_pm_entry_with_wakeup(device, flags,
> +		return vfio_pci_core_pm_entry_with_wakeup(vdev, flags,
>  							  arg, argsz);
>  	case VFIO_DEVICE_FEATURE_LOW_POWER_EXIT:
> -		return vfio_pci_core_pm_exit(device, flags, arg, argsz);
> +		return vfio_pci_core_pm_exit(vdev, flags, arg, argsz);
>  	case VFIO_DEVICE_FEATURE_PCI_VF_TOKEN:
> -		return vfio_pci_core_feature_token(device, flags, arg, argsz);
> +		return vfio_pci_core_feature_token(vdev, flags, arg, argsz);
>  	default:
>  		return -ENOTTY;
>  	}


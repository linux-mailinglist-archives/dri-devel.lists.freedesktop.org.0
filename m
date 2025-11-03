Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8BC2ADEB
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004DB10E398;
	Mon,  3 Nov 2025 09:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mPHhFvBj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128BA10E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:53:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47105bbb8d9so71705e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 01:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762163629; x=1762768429;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D423dPTmNpGJKcSjJTsDfI/X/hTMvomXahsqpyIMTdY=;
 b=mPHhFvBj4SjDaRE1K19UZypM19UJYo7FvpcOukHCABGzfecwECiNv5PpzJdLZfgnrw
 1gj9aT688EZZRPVVmPK5yixWCviMBcw+E0OqQa/PRTpfCRJXXUjFTIT7n9RWu4QW8ssX
 O4CczpNkLfCK9Ha528+bVqEccsKsQ6U6Dk8w9efG7NtGjfx0d5SY/JYnkgvWs0Dy1cL7
 ck5Ml/qh25niKDb1GPSKUEbN20y2qW3vfmy7lsGU09MmFbEZTqZLvZ10irbEMb+YqVFK
 6oC+BAKQFOIkozEJbDqh3pSTgdzwXFuhm4X3FF0J8PTPvuGFWjjtq9G8vVHZQEs1rQqO
 dWCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163629; x=1762768429;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D423dPTmNpGJKcSjJTsDfI/X/hTMvomXahsqpyIMTdY=;
 b=KnKtefCXFqI4YIsOX42W+9ZIkNlIVP1o2pGZgJOEa9wbyTEK/XgmXxGC/TJ04Qbw0Q
 UzDlPJw8EPZYRcwNuGm6gxd6AsfCac6nutOd4GGSvd2D0FZ89+XRCuIek0rgXfCk4FUR
 lv6ZEpwy/3LJCyO/jbVik4oE+C1dcaeLld1wqSew2yJuNxA+/Q/iVt/4ZwqLpm6X07l6
 RwRr1TLGS/FpWSL/nJZZ/FrVopfyZPs3wDtIsHhKdcdBN6tce1vucMzqAzKqxjVVubMY
 u/nN9b4myym8L6j9lCUFWRszIp/hC2h6nGMZ2sPriIKn9ltsjxukPH+Qq13aJMTG4F7M
 7Onw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaEJlliOPDUBtOQQIaV5ptUI5/0s7MoeuWE80C8xJI+OQXdLKRz4uaDPCsSYzbKumso4V/Gram4Wc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLy8pMDMGUV7vtk5NsVKEV0NW0KaBRvXGDLQvGUif2nQEaebUa
 oHmg9vfyR3CqZqvGZd2ASMkyp/Z38UtfL7hhW8DRaEGyZ85Y5SifqvFJ2S3ssj67jA==
X-Gm-Gg: ASbGncsRQeP3kcnIY7TaR1muBQmMjvGsDssirvRMOcWUZ9d6D2NCURuf342aNrfFU9L
 anxeepS5WsR7H/rTe5TMS6c9QFqREkBbt/3XURjSOaDgDm2ZurFem8q2TjZoXzKIOFkOMDzXLyD
 FwyDxQmEEjDbL7FJq1+QdLjNsF8VY7DoXuRgPWWjtxwE/eKHwVWLjxe6gAVRjdsPDTUGoGwXDqD
 OcroqhFCeU4I8ybh47I9QlZcJQCMIFMlhTFZ/tuMOII8IjwOirG5zDmdg/1kDt8uJOkRQgJ8Abb
 NiNUEvN/YmwqDOS6pRLXD5QUl4rLgw0ZD2/5OyO4F6vG+pWPw6TE21GY1Eo1J+xkgtZmLoR1mz/
 2bypcf5AcYHh9u3WbCxmwNbiP+DXFX4AHDHKF86pMV7Gp4Gw57/8SOAKD3wSHlJmv2CaqXWVAog
 hpN4jOsxmBXLQ/l9DtMl7T5t7T3XCMPecB3OTT72aRjwu1/frp+IxoyZaCHats
X-Google-Smtp-Source: AGHT+IGPSKpaT0Ddsg2x/WOeGEJojnpupEDLfdcNfDHxyjySRpAR+bkp9FY0Epu5UNDkS8vExhWcRA==
X-Received: by 2002:a05:600c:8711:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4773cdce892mr7221205e9.2.1762163629307; 
 Mon, 03 Nov 2025 01:53:49 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com.
 [34.140.140.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c374f84sm144508145e9.0.2025.11.03.01.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:53:48 -0800 (PST)
Date: Mon, 3 Nov 2025 09:53:45 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Pranjal Shrivastava <praan@google.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 09/22] vfio/platform: Provide a get_region_info op
Message-ID: <aQh7qbe_lcNysroo@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <9-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:23PM -0300, Jason Gunthorpe wrote:
> Move it out of vfio_platform_ioctl() and re-indent it. Add it to all
> platform drivers.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/vfio/platform/vfio_amba.c             |  1 +
>  drivers/vfio/platform/vfio_platform.c         |  1 +
>  drivers/vfio/platform/vfio_platform_common.c  | 50 +++++++++++--------
>  drivers/vfio/platform/vfio_platform_private.h |  2 +
>  4 files changed, 32 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index 9f5c527baa8a36..d600deaf23b6d7 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -115,6 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
>  	.open_device	= vfio_platform_open_device,
>  	.close_device	= vfio_platform_close_device,
>  	.ioctl		= vfio_platform_ioctl,
> +	.get_region_info = vfio_platform_ioctl_get_region_info,
>  	.read		= vfio_platform_read,
>  	.write		= vfio_platform_write,
>  	.mmap		= vfio_platform_mmap,
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index 512533501eb7f3..0e85c914b65105 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -101,6 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
>  	.open_device	= vfio_platform_open_device,
>  	.close_device	= vfio_platform_close_device,
>  	.ioctl		= vfio_platform_ioctl,
> +	.get_region_info = vfio_platform_ioctl_get_region_info,
>  	.read		= vfio_platform_read,
>  	.write		= vfio_platform_write,
>  	.mmap		= vfio_platform_mmap,
> diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
> index 3bf1043cd7957c..3ebd50fb78fbb7 100644
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -272,6 +272,34 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
>  }
>  EXPORT_SYMBOL_GPL(vfio_platform_open_device);
>  
> +int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
> +					struct vfio_region_info __user *arg)
> +{
> +	struct vfio_platform_device *vdev =
> +		container_of(core_vdev, struct vfio_platform_device, vdev);
> +	struct vfio_region_info info;
> +	unsigned long minsz;
> +
> +	minsz = offsetofend(struct vfio_region_info, offset);
> +
> +	if (copy_from_user(&info, arg, minsz))
> +		return -EFAULT;
> +
> +	if (info.argsz < minsz)
> +		return -EINVAL;
> +
> +	if (info.index >= vdev->num_regions)
> +		return -EINVAL;
> +
> +	/* map offset to the physical address  */
> +	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
> +	info.size = vdev->regions[info.index].size;
> +	info.flags = vdev->regions[info.index].flags;
> +
> +	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
> +}
> +EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
> +
>  long vfio_platform_ioctl(struct vfio_device *core_vdev,
>  			 unsigned int cmd, unsigned long arg)
>  {
> @@ -300,28 +328,6 @@ long vfio_platform_ioctl(struct vfio_device *core_vdev,
>  		return copy_to_user((void __user *)arg, &info, minsz) ?
>  			-EFAULT : 0;
>  
> -	} else if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
> -		struct vfio_region_info info;
> -
> -		minsz = offsetofend(struct vfio_region_info, offset);
> -
> -		if (copy_from_user(&info, (void __user *)arg, minsz))
> -			return -EFAULT;
> -
> -		if (info.argsz < minsz)
> -			return -EINVAL;
> -
> -		if (info.index >= vdev->num_regions)
> -			return -EINVAL;
> -
> -		/* map offset to the physical address  */
> -		info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
> -		info.size = vdev->regions[info.index].size;
> -		info.flags = vdev->regions[info.index].flags;
> -
> -		return copy_to_user((void __user *)arg, &info, minsz) ?
> -			-EFAULT : 0;
> -
>  	} else if (cmd == VFIO_DEVICE_GET_IRQ_INFO) {
>  		struct vfio_irq_info info;
>  
> diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
> index 8d8fab51684909..a6008320e77bae 100644
> --- a/drivers/vfio/platform/vfio_platform_private.h
> +++ b/drivers/vfio/platform/vfio_platform_private.h
> @@ -85,6 +85,8 @@ int vfio_platform_open_device(struct vfio_device *core_vdev);
>  void vfio_platform_close_device(struct vfio_device *core_vdev);
>  long vfio_platform_ioctl(struct vfio_device *core_vdev,
>  			 unsigned int cmd, unsigned long arg);
> +int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
> +					struct vfio_region_info __user *arg);
>  ssize_t vfio_platform_read(struct vfio_device *core_vdev,
>  			   char __user *buf, size_t count,
>  			   loff_t *ppos);
> -- 
> 2.43.0
> 

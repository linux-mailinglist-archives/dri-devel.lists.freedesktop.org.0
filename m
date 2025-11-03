Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9149C2AE25
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1DA10E1B0;
	Mon,  3 Nov 2025 09:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NbXM9NFF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27FB10E39E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:57:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47105bbb8d9so72475e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 01:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762163860; x=1762768660;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Gxg1uZruJtA4YMzZuNynPGAWW8m9xdZihRPr7yINg8=;
 b=NbXM9NFFD/zEhZPlYAOJ6/kqFHhmXF/xukCvHt5vZy3ptK15T+kvL1L+cBuqJzUCbf
 qVOqqfn1+6ff2v7aJrfDGgTSP01Ce4/3ohsDeAvQFfS7B3gEUioAuW/PwLcWZoGUDV1S
 lwMBsqB34AvcjwgNvkFTXUmCrZQwKb4m4WKUSjvGw9R/4Kmz9A8KRi1aNjG6FU2zWkP9
 tTql38AJkgl1LkfKfMtpEiSgN0t6q1cmLLxtP3AVGNFbZGkMU9nDeAMjchN+AIZTEy7o
 Vf9EsM8r0iXv8tqkOqmdhzqSln/TYtcrE3g9KXIXGx0tDiHBiCl4RxFGlvs7D5pS3pyq
 OgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163860; x=1762768660;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Gxg1uZruJtA4YMzZuNynPGAWW8m9xdZihRPr7yINg8=;
 b=baSmTYkSU+pf1fxzpfKgIZwd36LT5Axn8Ffpi2ITxezYF8pLchpNmWb8ql268/y4R9
 jldlKqGdD/G9Uj9N6UY5yKoghBkpG2okP0AGbASPq0zoBRnSIdWDk7oVZpRB+SYWAki1
 8Ht1cTcM23w+si3euzR9DX1kDAS4hAK0dxSJvJlANwELTKLtD11Th7t9KZFnYCxhoduH
 PR7DfFCweTrmNGKqpOi30dn+u4KvPgMiagt/Syx2C2ikJGXnxjrzZhlOfMj/lY5U8cRR
 C/LBNUx2+4wBu1K75Sz36sllF9nm0g6M2MwnLAD2madlDbOzCb0fW0F+XBYIlIERS0gJ
 nqzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx74UNPD1v2k9ajKeFW9Ob6rH/+fNP7v8fzXUs7SXjPZ7WPkDEtSg7Xxmy1KeN/kst72lfOudWcFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAuOfP4Q9kAb4SXIHStQCu5KEascBv1oZrgrmHLUEqo+BlzYVM
 OI9UEy4Tr7lh8tr5AOp2O/mdqP9VruzFObWJi+l6SgQMc00wS18yIxBzRjU6WnA56Q==
X-Gm-Gg: ASbGncv1wtwc7WHwgdqhYey+HqRv4GUutNotIr75H2qhFfJKTiWZE0EjoGDcM5hEFKI
 GFhgfI6aqqG0HAkpWpEt6dCMuaijDHyZugh+x3h9rw6jL9ulpPQbpLQQl91iAG2iTKo+RDcziFM
 2tIDmurlQaDvi5/klUkvLi5OJAKz6K4+V3WjveAcDzk926BR1xqZ5hml6ljjQ3kXQuLefx7sgRf
 Cl9IXErp1rQ166wS5xdDRctk/gPkdT7uibe0HhmAx5iiT55K3RDM0adYAEkUtAaVoqs6duZq+yw
 KnaR1HbJCY/HwREFUcqCDFiqEGBHqbS/+8VmMHjMpik5BrW675aizP06hG18p8lvQYHCkOtOt+6
 Y0SvMeVV4Aof/vg/YkF5PpkROOG4iK/9v0KjNh+y1A0DuL7PQqDMwao2muvgMKP2OJJt0CcPIGH
 gEM3Em8/x61yuiIsZVlyMRxpL2AGS12udmwGZzS6hNRwzyins7Cw==
X-Google-Smtp-Source: AGHT+IGLdHq84lPWuC9+6LJzgqfOJA4DO6nS6TVGXk5Ftt4X8sQj+LIHdpfQT0AOQR/zxEXR5CFwjw==
X-Received: by 2002:a05:600c:8711:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4773cdce892mr7234625e9.2.1762163860205; 
 Mon, 03 Nov 2025 01:57:40 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com.
 [34.140.140.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c11182e3sm19786186f8f.11.2025.11.03.01.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:57:39 -0800 (PST)
Date: Mon, 3 Nov 2025 09:57:36 +0000
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
Subject: Re: [PATCH 20/22] vfio/platform: Convert to get_region_info_caps
Message-ID: <aQh8kE9DrbxS2x1e@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:34PM -0300, Jason Gunthorpe wrote:
> Remove the duplicate code and change info to a pointer. caps are not used.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Also, I smoke tested this on Qemu.

Thanks,
Mostafa

> ---
>  drivers/vfio/platform/vfio_amba.c             |  2 +-
>  drivers/vfio/platform/vfio_platform.c         |  2 +-
>  drivers/vfio/platform/vfio_platform_common.c  | 24 ++++++-------------
>  drivers/vfio/platform/vfio_platform_private.h |  3 ++-
>  4 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/vfio/platform/vfio_amba.c b/drivers/vfio/platform/vfio_amba.c
> index d600deaf23b6d7..fa754f203b2dfc 100644
> --- a/drivers/vfio/platform/vfio_amba.c
> +++ b/drivers/vfio/platform/vfio_amba.c
> @@ -115,7 +115,7 @@ static const struct vfio_device_ops vfio_amba_ops = {
>  	.open_device	= vfio_platform_open_device,
>  	.close_device	= vfio_platform_close_device,
>  	.ioctl		= vfio_platform_ioctl,
> -	.get_region_info = vfio_platform_ioctl_get_region_info,
> +	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
>  	.read		= vfio_platform_read,
>  	.write		= vfio_platform_write,
>  	.mmap		= vfio_platform_mmap,
> diff --git a/drivers/vfio/platform/vfio_platform.c b/drivers/vfio/platform/vfio_platform.c
> index 0e85c914b65105..a4d3ace3e02dda 100644
> --- a/drivers/vfio/platform/vfio_platform.c
> +++ b/drivers/vfio/platform/vfio_platform.c
> @@ -101,7 +101,7 @@ static const struct vfio_device_ops vfio_platform_ops = {
>  	.open_device	= vfio_platform_open_device,
>  	.close_device	= vfio_platform_close_device,
>  	.ioctl		= vfio_platform_ioctl,
> -	.get_region_info = vfio_platform_ioctl_get_region_info,
> +	.get_region_info_caps = vfio_platform_ioctl_get_region_info,
>  	.read		= vfio_platform_read,
>  	.write		= vfio_platform_write,
>  	.mmap		= vfio_platform_mmap,
> diff --git a/drivers/vfio/platform/vfio_platform_common.c b/drivers/vfio/platform/vfio_platform_common.c
> index 3ebd50fb78fbb7..c2990b7e900fa5 100644
> --- a/drivers/vfio/platform/vfio_platform_common.c
> +++ b/drivers/vfio/platform/vfio_platform_common.c
> @@ -273,30 +273,20 @@ int vfio_platform_open_device(struct vfio_device *core_vdev)
>  EXPORT_SYMBOL_GPL(vfio_platform_open_device);
>  
>  int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
> -					struct vfio_region_info __user *arg)
> +					struct vfio_region_info *info,
> +					struct vfio_info_cap *caps)
>  {
>  	struct vfio_platform_device *vdev =
>  		container_of(core_vdev, struct vfio_platform_device, vdev);
> -	struct vfio_region_info info;
> -	unsigned long minsz;
>  
> -	minsz = offsetofend(struct vfio_region_info, offset);
> -
> -	if (copy_from_user(&info, arg, minsz))
> -		return -EFAULT;
> -
> -	if (info.argsz < minsz)
> -		return -EINVAL;
> -
> -	if (info.index >= vdev->num_regions)
> +	if (info->index >= vdev->num_regions)
>  		return -EINVAL;
>  
>  	/* map offset to the physical address  */
> -	info.offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info.index);
> -	info.size = vdev->regions[info.index].size;
> -	info.flags = vdev->regions[info.index].flags;
> -
> -	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
> +	info->offset = VFIO_PLATFORM_INDEX_TO_OFFSET(info->index);
> +	info->size = vdev->regions[info->index].size;
> +	info->flags = vdev->regions[info->index].flags;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(vfio_platform_ioctl_get_region_info);
>  
> diff --git a/drivers/vfio/platform/vfio_platform_private.h b/drivers/vfio/platform/vfio_platform_private.h
> index a6008320e77bae..05084212a76eb6 100644
> --- a/drivers/vfio/platform/vfio_platform_private.h
> +++ b/drivers/vfio/platform/vfio_platform_private.h
> @@ -86,7 +86,8 @@ void vfio_platform_close_device(struct vfio_device *core_vdev);
>  long vfio_platform_ioctl(struct vfio_device *core_vdev,
>  			 unsigned int cmd, unsigned long arg);
>  int vfio_platform_ioctl_get_region_info(struct vfio_device *core_vdev,
> -					struct vfio_region_info __user *arg);
> +					struct vfio_region_info *info,
> +					struct vfio_info_cap *caps);
>  ssize_t vfio_platform_read(struct vfio_device *core_vdev,
>  			   char __user *buf, size_t count,
>  			   loff_t *ppos);
> -- 
> 2.43.0
> 

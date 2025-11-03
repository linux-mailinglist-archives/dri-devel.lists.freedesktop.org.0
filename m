Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F93C2A237
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 07:06:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF1010E353;
	Mon,  3 Nov 2025 06:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gM1OvX9T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2510E353
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:06:18 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-27d67abd215so371955ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 22:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762149978; x=1762754778;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=daEhgCusceEtpwe81ptEC+bKqGITwloFYe7hKEHFGD0=;
 b=gM1OvX9Ttw+flCMj0pZRLbRhdMPBKR/u1W4HPuifagCBIFO5RIQ5ZBcSA2sDXICxJW
 FR9KpVlYOftZMzX1RyDVITZn8gS3gAznV6kNdk2DXYn3QhjHv14pO7FxEWQWYJOFSHhm
 3b83RGMI+TsOmaJNcbYN7jhZAY2Q5Ia3y+YhFGN5PigRQKhiHHqIUYzKDpCBLnFYAKOp
 VXnxWQLcmGCgkk0Xg75q016IXbqTBFRoGSfnRUBW/w4ofZ0ajeE+vVEJjxuDtwwE8+kI
 4qQ+Fc/A3rhrOvjvaOcLFHTvsxhFdtjlxPugWVKvOU4JYAlGufoK1X6PSGWb7W3rQ6GF
 VP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762149978; x=1762754778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daEhgCusceEtpwe81ptEC+bKqGITwloFYe7hKEHFGD0=;
 b=wpr5OXgDZ5fSu/Ae5qge41y/vaPzPmVKvGvMIvHka51YA4eCTLkcaI7PxDDVT6Qiaa
 d+m3Y+OGNeqaKH4SluhFR8lC/5zYcwDVhT0vuyKvQ0/8XGXwbakA/A7Yq8EkFxcAOjpq
 yIQ5eQHkBwEgR01DQbTRZqcyi7f5W6VeTAy7tidV4N9ETRrOoGSwsQeia+D62QyuF80Y
 LLw7g7QPemzwrNg89V7YpUA11Nan7vH99zIIMaBALi1Ryyhp5OCUO8GHiApstYM1wfEv
 CZ9ji8XEgosGxQXyy49EJ5B8U43nBm63hJbXexa5Ce1LnlNEe+TwESRUWPwMOAmhhc2N
 d9yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR828elt0EaI+v6dA3+a4kt0qrPbB4FLxwf+bUnrNs9nGp7e36eqGqE2I8WEKOn2U8h8Z1kYSvdWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT9gzFsGRr1DJ8Bf0euEq8OHIRzz0IjpR/PFQguW7k4RUP9psk
 6M0cL0GQ9RU5ch20zbb5GRyAXzUNOI2wHVB3FYcIIRjkUGkNDntUBXInzx9fYLvl3w==
X-Gm-Gg: ASbGncvQ7Sdgsssg/ZWU6cFbP+4A4nleYtlS4WIAtzCN3R2XvGsOvuh22XnB3oRozx8
 KEAoYivRMyfM8uMURF5ZrDt58ga5DpbZ44V/EPxfPQGU4J7CoLQDEhBqMenyS9l/IdX0H8CMxxT
 V+472XPm2DkfHglwOD1E2t0tdBzVQbj3M3uQdF95wsoQyeZ8qc2U/OvruuNMwTMQBkdAIPNCC3E
 +R+8OUUKXb2Qqg9e66otNhWjkzfXN6isylG+5aUH27BP/OaF7+X4OX+Nxex6T+nsMrJuAyICKsU
 12FVRelVyEs5JzrKqe6o0Zhds2SS96gmrNur4WbSj00yX40sPVQhX2iWs6MmlfGW1AQ7zGNrf84
 TJPuoRb8IlOonetsxJuh22n3gDrhLUADy2USIPrmdnLXNCi96BQUaHHwW8Wsih8eJw8zJ3jmUWe
 I/XFjFkQIxZbTPO3BeM4KBeAmgP/C+X3quQPqwDw==
X-Google-Smtp-Source: AGHT+IEluRFzLqUGHbmfa87kzbGcxD4xtCtUDt3Aesdz6fP5oqFYMacpJF/LHmpqMlg6+1lRT50KTA==
X-Received: by 2002:a17:902:ea08:b0:294:faad:8cb4 with SMTP id
 d9443c01a7336-29554b85496mr5533065ad.8.1762149977826; 
 Sun, 02 Nov 2025 22:06:17 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a9bad978c4sm5062872b3a.13.2025.11.02.22.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 22:06:17 -0800 (PST)
Date: Mon, 3 Nov 2025 06:06:07 +0000
From: Pranjal Shrivastava <praan@google.com>
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
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 02/22] vfio/hisi: Convert to the get_region_info op
Message-ID: <aQhGTwg4kpuP8pgF@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:16PM -0300, Jason Gunthorpe wrote:
> Change the function signature of hisi_acc_vfio_pci_ioctl()
> and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    | 57 +++++++++----------
>  1 file changed, 27 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> index fde33f54e99ec5..f06dcfcf09599f 100644
> --- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> +++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
> @@ -1324,43 +1324,39 @@ static ssize_t hisi_acc_vfio_pci_read(struct vfio_device *core_vdev,
>  	return vfio_pci_core_read(core_vdev, buf, new_count, ppos);
>  }
>  
> -static long hisi_acc_vfio_pci_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
> -				    unsigned long arg)
> +static int hisi_acc_vfio_get_region(struct vfio_device *core_vdev,
> +				    struct vfio_region_info __user *arg)
>  {
> -	if (cmd == VFIO_DEVICE_GET_REGION_INFO) {
> -		struct vfio_pci_core_device *vdev =
> -			container_of(core_vdev, struct vfio_pci_core_device, vdev);
> -		struct pci_dev *pdev = vdev->pdev;
> -		struct vfio_region_info info;
> -		unsigned long minsz;
> +	struct vfio_pci_core_device *vdev =
> +		container_of(core_vdev, struct vfio_pci_core_device, vdev);
> +	struct pci_dev *pdev = vdev->pdev;
> +	struct vfio_region_info info;
> +	unsigned long minsz;
>  
> -		minsz = offsetofend(struct vfio_region_info, offset);
> +	minsz = offsetofend(struct vfio_region_info, offset);
>  
> -		if (copy_from_user(&info, (void __user *)arg, minsz))
> -			return -EFAULT;
> +	if (copy_from_user(&info, arg, minsz))
> +		return -EFAULT;
>  
> -		if (info.argsz < minsz)
> -			return -EINVAL;
> +	if (info.argsz < minsz)
> +		return -EINVAL;
>  
> -		if (info.index == VFIO_PCI_BAR2_REGION_INDEX) {
> -			info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
> +	if (info.index != VFIO_PCI_BAR2_REGION_INDEX)
> +		return vfio_pci_ioctl_get_region_info(core_vdev, arg);
>  

I'm curious to learn the reason for flipping polarity here? (apart from
readability).

> -			/*
> -			 * ACC VF dev BAR2 region consists of both functional
> -			 * register space and migration control register space.
> -			 * Report only the functional region to Guest.
> -			 */
> -			info.size = pci_resource_len(pdev, info.index) / 2;
> +	info.offset = VFIO_PCI_INDEX_TO_OFFSET(info.index);
>  
> -			info.flags = VFIO_REGION_INFO_FLAG_READ |
> -					VFIO_REGION_INFO_FLAG_WRITE |
> -					VFIO_REGION_INFO_FLAG_MMAP;
> +	/*
> +	 * ACC VF dev BAR2 region consists of both functional
> +	 * register space and migration control register space.
> +	 * Report only the functional region to Guest.
> +	 */
> +	info.size = pci_resource_len(pdev, info.index) / 2;
>  
> -			return copy_to_user((void __user *)arg, &info, minsz) ?
> -					    -EFAULT : 0;
> -		}
> -	}
> -	return vfio_pci_core_ioctl(core_vdev, cmd, arg);
> +	info.flags = VFIO_REGION_INFO_FLAG_READ | VFIO_REGION_INFO_FLAG_WRITE |
> +		     VFIO_REGION_INFO_FLAG_MMAP;
> +
> +	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
>  }
>  
>  static int hisi_acc_vf_debug_check(struct seq_file *seq, struct vfio_device *vdev)
> @@ -1557,7 +1553,8 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_migrn_ops = {
>  	.release = vfio_pci_core_release_dev,
>  	.open_device = hisi_acc_vfio_pci_open_device,
>  	.close_device = hisi_acc_vfio_pci_close_device,
> -	.ioctl = hisi_acc_vfio_pci_ioctl,
> +	.ioctl = vfio_pci_core_ioctl,
> +	.get_region_info = hisi_acc_vfio_get_region,
>  	.device_feature = vfio_pci_core_ioctl_feature,
>  	.read = hisi_acc_vfio_pci_read,
>  	.write = hisi_acc_vfio_pci_write,

The change seems to maintain original functionality and LGTM.
Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

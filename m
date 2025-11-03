Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA0C2ADD0
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 10:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9090710E18B;
	Mon,  3 Nov 2025 09:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qobnO3qI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABC310E18B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 09:53:10 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-475df55f484so84025e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 01:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762163589; x=1762768389;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CJ4RrOu9uCN2bW8pg1KpsPpPzgZldv3XyNgHXUg1t1c=;
 b=qobnO3qI/CNrls2aqqtOINen/QaZJQn65i5pjvx+m2eLrCgq4hRwKUJbP9cRSlwHBX
 NlU7UQtn+NYLvBnYkG60f9uZ9D6/rcKeTQSzlaRz6/5aCozDm4WbjhmCprVK+M0YYkZ7
 KVj0oneZk3xlnt8hWW0qrbGxSSSDVFOzSKTrcMBDt56/0x1/wRfAQqhZbFppdp2VMUAc
 GQ/Hy8xxsktY8p53PKBKDk+GZecaOGXG785q2XPLBPOSuozuMqMG+I9Obn9+o6BkQxR9
 mM4iOBkoAcFuw4m1YXECR89oytI6T+xNgi11svWPHEaJ0peflSYK8ffLRVuoTIR6chjg
 ahoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163589; x=1762768389;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CJ4RrOu9uCN2bW8pg1KpsPpPzgZldv3XyNgHXUg1t1c=;
 b=AmQszNYGawBxThzrX1CRRTOKLVvZnZjH9RBdOQjJyIBXjcRqthVeCmHfxK5iSBjxT2
 ulHq5jXDg2yr98qq2ukTBQeUc/nzWOcc3Ku8grmu34PkROfzJlB8asgqRY4Qq/SlI0wL
 R6EgptelXGW/o7ScP3SWRAedgEtyChJgv5S47gnx9GR6sR7i7ihmZu5czcV1a63+xthx
 Iog5kykIGBnvriSokKySwCNqJVqUF2TOTnHhXHl41cZa6NOElWtfMVJoEO63BX0iyXSE
 sbszGr4GDWwRaPSlS3oKnNvvCPxe9nQwmhjmiCjUauHivw4HsucD5ltN/oroE/o9Rq34
 fKJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1rH+V916miUFvc4LrN6Rem96t8ccf6/1dzaI9gWdvKHqdRP6Qkjm25KER9pnZK/tR4YLhakcMBaY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyaeKtWIQTia1XrEC1DMjkSdB2mX6+KbuCLZBGJs3mspQ92OQv
 nvHpt8+fTqmqq4SAtSNs7A8ewaj1mSq5ZS+EYTz+PK7ov5YvCvqxfHNKmIpbxhpZtw==
X-Gm-Gg: ASbGnct31HoGTic7p5km2VYYcOowEegOE6xiPLCPu3+5tQ0/e/fjVX7Og/hxuquLh6i
 b98IEn2dqZ0s8tg7NOeBcAqZJjMS9biiRl8RyDL7Z4SkpW0i0o+LpeGR+1Ss1s/pDD0qE7zx86G
 K5NS1jqLsuv8RpC+oCu44qMahQbDyaALzh+axjQSudYh54w+PzMfEA7jfxcDcJaXltK+T2UfaVu
 yp9jVo9nqpKEjYLP4PZ/POO1doIhL+29Mg+HnEbxnNErxnnXdquyjNNtI2gVkyxFu0N9qasQ4VW
 GsbCQRSpwTD+EPjISqbzf4iA2KW6RV7Y1Xtemr3oeARKJbSEMLwny8Atrx5hy7gQNGhZ8YHBZQG
 t3aXskPtZq4+vW9cxkop/HEZsgILsJMhFTqP+dbkcrWoIMKEyvqSzLcbIIZKU1HiUqG2kFsyY+W
 tx6+8nPGaAo/Dap0G+TLsd1D2jAOeZZpnVaENf0HhG6eZqrszg/g==
X-Google-Smtp-Source: AGHT+IE1mff4da9I5vysNB0ob0JmOMr70AWi7AKZOtcSI5qvyyAXHktFY8REU7m0liVQkNgCELSSCg==
X-Received: by 2002:a7b:cb14:0:b0:46f:a42d:41f0 with SMTP id
 5b1f17b1804b1-4775268121fmr217365e9.0.1762163588833; 
 Mon, 03 Nov 2025 01:53:08 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com.
 [34.140.140.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429c13e0325sm20082715f8f.29.2025.11.03.01.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:53:08 -0800 (PST)
Date: Mon, 3 Nov 2025 09:53:04 +0000
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
Subject: Re: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Message-ID: <aQh7gG3IAEgEaKY_@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:14PM -0300, Jason Gunthorpe wrote:
> There is alot of duplicated code in the drivers for processing
> VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
> which provides a struct vfio_info_cap and handles the cap chain logic
> to write the caps back to userspace and remove all of this duplication
> from drivers.
> 
> This is done in two steps, the first is a largely mechanical introduction
> of the get_region_info(). These patches are best viewed with the diff
> option to ignore whitespace (-b) as most of the lines are re-indending
> things.
> 
> Then drivers are updated to remove the duplicate cap related code. Some
> drivers are converted to use vfio_info_add_capability() instead of open
> coding a version of it.

The series as a whole looks good.
However, I got confused walking through it as almost all non-PCI drivers
had to transition to get_region_info then get_region_info_caps then
removing get_region_info completely from core code after introducing
it in this series.

IMO, the series should start with just consolidating PCI based implementation
and then add get_region_info_caps for all drivers at the end.
Anyway, no really strong opinion as the final outcome makes sense.

Thanks,
Mostafa

> 
> This is on github: https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op
> 
> Jason Gunthorpe (22):
>   vfio: Provide a get_region_info op
>   vfio/hisi: Convert to the get_region_info op
>   vfio/virtio: Convert to the get_region_info op
>   vfio/nvgrace: Convert to the get_region_info op
>   vfio/pci: Fill in the missing get_region_info ops
>   vfio/mtty: Provide a get_region_info op
>   vfio/mdpy: Provide a get_region_info op
>   vfio/mbochs: Provide a get_region_info op
>   vfio/platform: Provide a get_region_info op
>   vfio/fsl: Provide a get_region_info op
>   vfio/cdx: Provide a get_region_info op
>   vfio/ccw: Provide a get_region_info op
>   vfio/gvt: Provide a get_region_info op
>   vfio: Require drivers to implement get_region_info
>   vfio: Add get_region_info_caps op
>   vfio/mbochs: Convert mbochs to use vfio_info_add_capability()
>   vfio/gvt: Convert to get_region_info_caps
>   vfio/ccw: Convert to get_region_info_caps
>   vfio/pci: Convert all PCI drivers to get_region_info_caps
>   vfio/platform: Convert to get_region_info_caps
>   vfio: Move the remaining drivers to get_region_info_caps
>   vfio: Remove the get_region_info op
> 
>  drivers/gpu/drm/i915/gvt/kvmgt.c              | 272 ++++++++----------
>  drivers/s390/cio/vfio_ccw_ops.c               |  45 +--
>  drivers/vfio/cdx/main.c                       |  29 +-
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  43 ++-
>  .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  54 ++--
>  drivers/vfio/pci/mlx5/main.c                  |   1 +
>  drivers/vfio/pci/nvgrace-gpu/main.c           |  53 +---
>  drivers/vfio/pci/pds/vfio_dev.c               |   1 +
>  drivers/vfio/pci/qat/main.c                   |   1 +
>  drivers/vfio/pci/vfio_pci.c                   |   1 +
>  drivers/vfio/pci/vfio_pci_core.c              | 110 +++----
>  drivers/vfio/pci/virtio/common.h              |   5 +-
>  drivers/vfio/pci/virtio/legacy_io.c           |  38 +--
>  drivers/vfio/pci/virtio/main.c                |   5 +-
>  drivers/vfio/platform/vfio_amba.c             |   1 +
>  drivers/vfio/platform/vfio_platform.c         |   1 +
>  drivers/vfio/platform/vfio_platform_common.c  |  40 ++-
>  drivers/vfio/platform/vfio_platform_private.h |   3 +
>  drivers/vfio/vfio_main.c                      |  45 +++
>  include/linux/vfio.h                          |   4 +
>  include/linux/vfio_pci_core.h                 |   3 +
>  samples/vfio-mdev/mbochs.c                    |  71 ++---
>  samples/vfio-mdev/mdpy.c                      |  34 +--
>  samples/vfio-mdev/mtty.c                      |  33 +--
>  24 files changed, 363 insertions(+), 530 deletions(-)
> 
> 
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> -- 
> 2.43.0
> 

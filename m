Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A43C2A29B
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 07:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C151610E14E;
	Mon,  3 Nov 2025 06:21:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="A71/hPl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4D1882B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:21:55 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-294f3105435so331735ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 22:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762150914; x=1762755714;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=nWlZBJWMNR3o5R9SijDhT22MNLu42EpPET2zOzK998A=;
 b=A71/hPl+17755ybqpc89yD/7EyZUXUiIpOQgJfriYgJnu8PNfS7GG2Z0puViSbTeQc
 V6jJe4Mm5HsO1vYLRpMUzenkCz/VXTkD2DYtfKK0mMLg5yovTU54Lm77J/VCu1BWKNKk
 LJJulKT9UEdpDagtgmqXXXc2BXbb4Bf5wJvRgaUDRWHphjR5cpGRLQX/wT6mB7mHUSqB
 c+bUELuQ9PPu5nIZp/pKrUtFqTiiIenqJxAAAOq6MOI2caZHDdydeW0mipZdZqfMKLZH
 dJIdFgTUGNzu6ZBCYiZFiMdmuTyzI1Uakwj9vAbRz7BrPboWOqF2yrsKjONTv5ILn1VM
 FSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762150914; x=1762755714;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWlZBJWMNR3o5R9SijDhT22MNLu42EpPET2zOzK998A=;
 b=AAC2AjX4dZgAYkeW1lXC7thQS6pNFNE2LFf/EKgeZjRRS7zMr+Cmj+h6unELJ4R0Q9
 LPPcE2SYq2OQGsFCTqfFM/CskD1vBqO1feSPV7LayDePZHLOsNX95dUdbq/kmjh1iGkT
 WfogiA6eVJrSO7YOMrJXFNFwT47FLDCwRqx3C1+bOls7/fAzWB05+SUqAuLpHD4/j0ra
 x9gfi9/0BdNDeJ6hkgNaOjOkfP5BRQuNQ8CzETAztmVOLOK52Dix8MMwpnFpqN3Qx3lU
 X6OAdVrdNqYaT9LpztYt/p7MpxTHRShIVkeimp32xM2Fkn6+DQVfbCohn8D2BKkqvxcj
 SCVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTveMkn3IPegAkm2+sfELNn5Zvzt/sV6P3o9Oni97GdwbQv1KT+QmBW1k3OWGh5uDr9EtyOOc6eag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE4Geh1mLfLJ4V67eGGu6cd3Fj/dITIbtNMPmjUe7mm9diAVvR
 STctHg8dzvyq3zyASG5x0JEMA02TMRssotBeDugvZi2if3keMnHwjlnxbOoroT7TZQ==
X-Gm-Gg: ASbGncsc6SZb1o3+1qfyG5mmLrVjqw4NNQGknYLDFWAlHAus4yzx4uWkK/FXiFA0RTL
 xDMhwC3rrpkIKmBDjIhavmH3Znx63Ucp+W8hXhf3AWQQAnDfA6Yv9daLCCMSWFoOzAJJUwnZy8P
 pwofWw1ZytQBnVYdC6z5DLr5c9FgPmVhRqQoW4z0kBEM76wT/NVsFHPhHaDZP/dAniZrpQVoGlQ
 fb+entZADr1XTHbqkBBLfkCNT0jZbD22/1uOtb8CI5IU8Cc7rRtcNlHbOGEH3TvKvMUkv4RgRT1
 7jNmezZFdwkUPzAyp1KI55yxNSrDBmagfdp6o3EBGWK6cNnVcVyxfEhbLrBxR1k3dk1WnrIO7wi
 1VpLW8G8L4rLxO0BRzylAck/GOJppTIPIsz20sGHyiSAidFBKBCsMtC/D+TkqauLoPhMf1HroD1
 FzpslfTxol5bj3glL1xfJfbUFc0NwtLCYWEJaWWQ==
X-Google-Smtp-Source: AGHT+IGruOwIqSOkw/c0UIqbUAnBCrsgVRvu/C4si6qjv3qWziT7RTJr58fgj5zqaOcpkLKvHmo5tQ==
X-Received: by 2002:a17:902:e891:b0:290:dd42:eb5f with SMTP id
 d9443c01a7336-29554be37d6mr5455555ad.12.1762150907195; 
 Sun, 02 Nov 2025 22:21:47 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a7db67cbdfsm9912363b3a.49.2025.11.02.22.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 22:21:46 -0800 (PST)
Date: Mon, 3 Nov 2025 06:21:36 +0000
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
Subject: Re: [PATCH 03/22] vfio/virtio: Convert to the get_region_info op
Message-ID: <aQhJ8OZiVYe06hv_@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <3-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:17PM -0300, Jason Gunthorpe wrote:
> Remove virtiovf_vfio_pci_core_ioctl() and change the signature of
> virtiovf_pci_ioctl_get_region_info().
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/virtio/common.h    |  4 +---
>  drivers/vfio/pci/virtio/legacy_io.c | 20 ++++----------------
>  drivers/vfio/pci/virtio/main.c      |  3 ++-
>  3 files changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/vfio/pci/virtio/common.h b/drivers/vfio/pci/virtio/common.h
> index c7d7e27af386e9..a10f2d92cb6238 100644
> --- a/drivers/vfio/pci/virtio/common.h
> +++ b/drivers/vfio/pci/virtio/common.h
> @@ -109,10 +109,8 @@ void virtiovf_migration_reset_done(struct pci_dev *pdev);
>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

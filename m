Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D620C2B0C9
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06110E0B5;
	Mon,  3 Nov 2025 10:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="i2nMaQim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D5FB10E0B5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:29:42 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-295c64cb951so124605ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762165782; x=1762770582;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gNHaVozbtXB8nI6t/qtWfMkb6Kn6PYTAjlMTSN+Ugyg=;
 b=i2nMaQimrsb1Qf4b/h9jQKAABIR/gEjvN+h5Oyosi84eYx88ANFY9c4ku1DXc8p7CW
 aX3qes/a9M3QFzqZKTJDO33n3isQXtkMQ7JvMInEdHrlYZoRwnvO2U+7Mc92Joezp3+c
 B1GRZOyOFAeteZTDyWJQePuUTJ+gg/Ucc9vUrlnhlz88XjaaYpnA1Iz0tVro1/nZgI8D
 bo9dfK4D6GoaLyYLUXcIQXZg3Nmv7AXbNp7a9faQOSxg51UxBTIdjK3J1gwDSVyJILjW
 L4DsqIQcXslMW+VYVDtxaOGgXlA1H1RkR+QGd4voq2J4ijY92KIsQhGvYNkUzNh31Lvo
 EHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165782; x=1762770582;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNHaVozbtXB8nI6t/qtWfMkb6Kn6PYTAjlMTSN+Ugyg=;
 b=c4DxtGCBaqgEiqkgaKynV1RilLBmPaQlqnjzmkEmUqWUnI880t9abZkyhUcNYl9Kht
 meYA7nOL6PeVpW8JdUw9sW4u3EKVGKT5NLnnkImJgiINs0EfcxOtuNxHLRumlA9DPi97
 iktVuK8PcrfQHATMAkE74BqMrNKkgkvEjcBSari6I0Q9GXzIrC7w0j6GTaWKrsSbrY33
 IHewTlT+enOCTAGSf+tVUov2KEomz/sv54/iuhiwr3duwcXb7xGUBBzHc6UipvhobqfG
 XPCehvA0jxiuNIyx/NRgHMaUFDDQitAE55dDgfMvaEX8lhumfSvaNWSlMKDnx5wWyrDg
 mxDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Mzai9MtH/momGR4SBaOvMVsq5h/zXpARqmwJ2H4MwZXufEsA1BK+rNe8FCUCnGHmuLoootdxuiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXqabfT/TbmLRgqx61lWE5VogZ+ArIPiJ34Uk1zC3yLkzB58qW
 DzAuz6r5BWzD+KUBhBUQSSISagT01GLwxt+DVERDVVVttA8cvRqvJzeQIYChAyKQaQ==
X-Gm-Gg: ASbGncuFfCqqTBKOPupFttVJPLad40LwZBl59ANtikZu7kYUc3uZeAl4XfH9en5oo0L
 kWkzzL83RoMt3PPHCqhx+S9LmxBmqv95CoupZkNpKSoL+Q0wL4/dsn/74KMAu4Dcf/Do9XbdVsd
 n441AdSlxMW3w3DEbLGpkvN9QSnR+T4vD4LB1q2jLkgS6l0ML9dOQdvyvhUf174X6xRRO+6ZJlI
 PsNi85wO73TbSEy9o7D3762Bu26q/BkSaFPp3sHiQDJNhhzl+1GeaO+JeiwK+uf3B9pljFLWAaA
 oAW9xGz1URMY+BFqYk68B0p0BKQjToqx1d/DL9ZD8IMdRdqw2NvZ0EcNXRW4Hw2Dy6H4SIL1sQJ
 YmSxCFT6MJg9Vsglf/QVCFuhNs09EOHgJ/ZZQ8sMBIrNizfKYF380jvXyl07wRMxzGecdyauauS
 +mz4Z3MDYhrBEh7w8WQqxoo8GRFeOKO0SKkeEAuA==
X-Google-Smtp-Source: AGHT+IE7RbmruVQhXsny/j8l+SFhjfD6jlGy79IZqby3HlHJSxLaU8PrnA03I6j8kd1hYd7zo15JRw==
X-Received: by 2002:a17:902:d2d0:b0:295:30bc:458e with SMTP id
 d9443c01a7336-29556477728mr6652975ad.3.1762165781842; 
 Mon, 03 Nov 2025 02:29:41 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7ab30909fccsm2991326b3a.20.2025.11.03.02.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:29:41 -0800 (PST)
Date: Mon, 3 Nov 2025 10:29:31 +0000
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
Subject: Re: [PATCH 21/22] vfio: Move the remaining drivers to
 get_region_info_caps
Message-ID: <aQiEC2Z3lqxAIY3J@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <21-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:35PM -0300, Jason Gunthorpe wrote:
> Remove the duplicate code and change info to a pointer. caps are not used.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/cdx/main.c           | 24 +++++++------------
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c | 26 ++++++---------------
>  samples/vfio-mdev/mdpy.c          | 39 ++++++-------------------------
>  samples/vfio-mdev/mtty.c          | 38 +++++-------------------------
>  4 files changed, 28 insertions(+), 99 deletions(-)
> 

Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

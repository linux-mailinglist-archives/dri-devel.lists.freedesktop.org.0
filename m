Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F85C2A566
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED5610E164;
	Mon,  3 Nov 2025 07:32:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="dQ1Y96nm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF74810E164
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:32:02 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-294f3105435so342345ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762155122; x=1762759922;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dADjXQcJVAcOBFwaI/JeQVroSWZH3kzmeM+gasunsjY=;
 b=dQ1Y96nmRj/phUcFRMWzJhSwF9V4dTEvRpM73TcGqOOgUSmM3wNpag5+lNHcf01UXU
 jD+NCUOttQGKfvGMzMxKx3iApkVJkcDoxLtGhhOuwvLwA3agpB5hyXIT9MEn3mnDvDcC
 ghW7nxYaTTQ4p2qhI+eekf86bmMyJtzGxr5Yw8fxtoCiZ3HHm48peSh+mBV2AMMLYGIQ
 ujusbznP30yW28hBxMxoiEaPmz4R7gWiI7I0+7JGDIe0TUYj2FpjoayGgKju5pdH93Zn
 zWx3JW7A5yAmx4RWReuP5+FU6cxp7luoC1QX9eCaX8km7ajYmegSeGl5Gj9c6F5JKFST
 Rc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762155122; x=1762759922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dADjXQcJVAcOBFwaI/JeQVroSWZH3kzmeM+gasunsjY=;
 b=nKXvf1YU6tcX8eY8/5taB9hN102YIZV7FZF8IS5FSOgMdFCeFzX1boVU9sKM9mog1F
 GvCMVi17a3zhzl6ziaOKCXEP3KdqEmcqwkfN8cb78guef8Io9Hxte2jxiIPdp/E39VQ0
 lThwznbCeRoyXo63zg/gny397VoRxbbT/4lRqXw/clmZoocv/HUyGX+k1Y4Y082KO3Cn
 fhSXni6tVgS1LPxxtOYIyyABZVzdjDJxAVgElumC2NX2JrXqayJimDNJzGvSq9Qs5k5H
 HGdSnRSM0Gg6jg4LfqfoN59RmTQLv4ljiD/QfSlm1QaMtAHQnufrBPNbchDCuAwsnPLm
 1mkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYM1oz1nW25IKpDhi5t5I1ojwIzLwW5aBZOMB8vMnh/ivCL1GsBERR/pwFu7XSRlCp/+AWqQhtWMM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKIHuowm3bGt2DvwpmoKbNFdgJ16saJ6VMaYnlb7Ppg7ma+c0A
 GSsJDZmonObfYw/AV3Y5+TOE/2YGjliFhOhxN3yYz7njWepxlmZVcsIZhRsajTCqbg==
X-Gm-Gg: ASbGncuUGuSw7RxbIcAvGYYcSXfyu40ppWNVLqRlfsC74EYVpjsA6a6qWLuuPiShjel
 k0gEMAeqfs3Ua+Wv8K3mj2ba+QoTzGRAYmmA9nZ6AjLm+14RndFwYjLy1aLSt0sD6Dn182oqHih
 m4J4CF+MCHRfx3QC04CfZudI2myGNiU2O1W7gejg779jqxxh3TIHLc6QSPsef8T+d+o1+2I05dr
 1lI1CbV5gRlS9cDzAxhRKkcAgoBEyKyEH0e6WnvpY/ur46eY6S3EJXfP+DPqn7KDHxT/v+CBPj4
 9445WcFkICdHEzs3LOubaEUHs4zV+QNdkoWxNMU2pb5zLVbDEE+NF0Qe5TQJi6U2OZiFopROX5V
 bq+LIeMRdK6N9Jhy6Rbjq7OCqu3JRpeU/keon17c3HB31Qb0yfyXF2Llh/5jrIq20YoQzUu/rXr
 g+6F9KeS8Ps35uVG3ns4CK7SOkcJ4J7nBrbFLhvw==
X-Google-Smtp-Source: AGHT+IHfrP3JzShs73f4Ou9j74BKdOau8otZ+u7WUYTtBZ6PInXsEFYOD9H0FiQHWOz2YtGspU3bog==
X-Received: by 2002:a17:902:ec8e:b0:274:1a09:9553 with SMTP id
 d9443c01a7336-29554bb5d5cmr6804875ad.6.1762155121865; 
 Sun, 02 Nov 2025 23:32:01 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-295512dedabsm82398675ad.5.2025.11.02.23.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:32:01 -0800 (PST)
Date: Mon, 3 Nov 2025 07:31:51 +0000
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
Subject: Re: [PATCH 11/22] vfio/cdx: Provide a get_region_info op
Message-ID: <aQhaZ2HvTTtanNdu@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <11-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:25PM -0300, Jason Gunthorpe wrote:
> Change the signature of vfio_cdx_ioctl_get_region_info() and hook it to
> the op.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/cdx/main.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

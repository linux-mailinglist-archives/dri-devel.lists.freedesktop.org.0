Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3476C2A52D
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7705410E129;
	Mon,  3 Nov 2025 07:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Q7Cdbhfv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D82210E129
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:30:28 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2959197b68eso196505ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762155028; x=1762759828;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=W00R51s/bFZ7FSKiqSW+6LDxOwjjTftHVYebWZvSUlk=;
 b=Q7CdbhfvNYbrATPS3FSLfK29pzvml1HhhE+8F99PGgDau0F4kUBirKe46A73UZ8ELK
 NAo9nWqdKAq6jSqVrTEGi6O9Jz2TB2uMhZaRWeWpUruRH+KtZWe4koArWxac+1kjSrdm
 m1wpDf8RuRLbjzK+kSMxNesGIAufkLSgthZBSXnow2GpgaEbvkd+ouyEozHTSkJ3ljvg
 FXpdKJtgFt1k1dtRMZqC9snfn45msr4FM0x/vjWkoR7b4PGAu5H0i+9pbquJ4rj8BYEN
 4A1IIPKMaVD3c8THu/BZB5QQNIVhGJbgMv7+9S76ivZDhyyhutJViQlGLwaAL5vDJ16D
 Zm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762155028; x=1762759828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W00R51s/bFZ7FSKiqSW+6LDxOwjjTftHVYebWZvSUlk=;
 b=EPR4Q8JZJvWHKgYnoWgKL+08f22KgQ9zyrl6SE0W/a9QseNNlo+K6l5csv7n5VBSjW
 Rr7iaon1GW1GOHny7pPP9l07o4UZRvI2rwrISNzqwuIo07cgMXuEq+mTjiDhrItRyJ21
 Nugp0XcA/9lk7wv6rsxVD7oeq+Y4dzSt3O32p0BZCjxUzbeucRiDsDNB6r3wxxRznonr
 c7xcaHbrBMMVVuOAh2MDx5+nq6GG0XJXw/wQQaDtqzgM5YTBNsNsYD0PGd0PsAt1doGh
 vYzD/PzCfPgSd1q7xEca+JxGlIT2HCiQwanepJaA3tsRJRypxCHVt0lLRHmsB1svAEtq
 Uhdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMmtvdrSe8cmsouO2mYDM63w0uOcmjgrp7Oi5pn1zU4AFO5KMKwruyyDdOl542a3yfhHB+6t2qtto=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyCh3ODGhtxjpHEAG8ZsxN7MHz2xvBq0U0n9IJA9n3hev2SFtV7
 97Nk1pE8eG2K41RRBbBKJWG4IJDNTRYVqRNdtOdEomPOHB0ZrZBeH8Knng0BRqfgZA==
X-Gm-Gg: ASbGncvDo73PcGtDfpI73/VClkgKuKV46MWa/jP5EKNRQGWs0ZtInSb1u8kvM5lkM4+
 a9BJHACBw7NI6U980zty1uyYxRCNusElH0ydn9M1LN8ZV5dU5qWAp91immncjqHRkvg5C59QhwQ
 INOJ+LWb7Y+6knE3hmgnxD/LB9jAsN+G+EnV97zTDotpf3Y8P34DS2z1G/MuHdmyIWERDR1gNZQ
 f9NOn0HLXvEFkMhd01uhEYxofBpyhRqLmzDbu7gy4NQu631/giwjSs5OP1I+/7gl1hRIOg5CN2/
 Z/MkK+GCWosTX8C0WMtNKGVorosEz6cKJVjs7EdrvndySUNF7yIQWuGUVXXfPx/U4M5bxFpV6hf
 WHEAVBlhI0lwHUnnf5pAPFlikptjNQzGd8HLlFwZZanmHdQFLg+1XLxmCh5r/PmOwpxPQxKFNdi
 wRmWQz8OIZUmwwXG2xpVwsMU7mhLNLQjctjeMvQQ==
X-Google-Smtp-Source: AGHT+IFjaXH+x0wDYP1YTleZ6beMQ7i4yOeGqaMcf/YJxMNIbFnQkDy7S1c8+nxpPDJ2MzqKvGx2GQ==
X-Received: by 2002:a17:903:1a70:b0:295:28a4:f0b3 with SMTP id
 d9443c01a7336-295549cab2dmr7007095ad.0.1762155027242; 
 Sun, 02 Nov 2025 23:30:27 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-340acfa77b8sm8320159a91.18.2025.11.02.23.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:30:26 -0800 (PST)
Date: Mon, 3 Nov 2025 07:30:16 +0000
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
Subject: Re: [PATCH 10/22] vfio/fsl: Provide a get_region_info op
Message-ID: <aQhaCAAliYQVNjgK@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <10-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:24PM -0300, Jason Gunthorpe wrote:
> Move it out of vfio_fsl_mc_ioctl() and re-indent it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c | 55 +++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 24 deletions(-)
> 

Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

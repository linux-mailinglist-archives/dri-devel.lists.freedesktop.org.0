Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437BC2A361
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 07:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D43210E359;
	Mon,  3 Nov 2025 06:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="gqch4w5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFC310E35E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 06:41:52 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-294f3105435so334035ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 22:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762152112; x=1762756912;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xy09bbBV2an4SjPwDAIo8320NA2LlnNWvmRboTY817s=;
 b=gqch4w5gnNix3wZ9ZhLfVOdTwPxxM14a5wtZ7h3QgfpaouOSd/oigWFx/FzXdAZoYI
 ozQM1ZPLBPLUwXSgnCuk7piLxb7qEGgJ6RX1D7OPfvhwgkbpDJBaOBLivPc2smLgX/MH
 MyrRMtxPqI2TDQgGOBdmH0Yonj8c6oZabhrYbY/kO1WIbOR4OQRywvA4MIQltw6aWhd1
 FLzi+82vmk5Ng2juxWXiIoWmQUnWVr/uwH3VoN+5JDDrzyzX/JrUbRejPcWWnGhRGQrb
 r0hGk/DqsgADaP02W1Jb7z2jW6YVs92J0sxsrnkGH4mjJJvP+dV6+T5Km5yzqds7Z+C0
 xnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762152112; x=1762756912;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xy09bbBV2an4SjPwDAIo8320NA2LlnNWvmRboTY817s=;
 b=xJp6/3LlCSSvG08lYG3WaV5MKP71/r9wbrIsL1tFkNGh6LYZU4VGLVanePF/1xO435
 zdJAvNC8/zmvtfIQhy7jWj69CbwT7MY+XnYrz5aAvSq77500ugbH7NOUe9QGcwT68v5B
 /IvVJAzEbFVEjBbhuW2XvEdKXJWtQKEaDzkgt7rqvwsJ7pSiBq24zAZmJGXsDUv0Lh54
 YpOUj814Gya0XHG3+tH4AXupIZDjUO/GcC4vb4u5GFPphHciQNH6yrRXO8UZOKSPIncO
 +DYzTOMPJqhx+bECmnCHjGwjkUj2LSE6xRDIPyFKTsXm0rwFsP+a+w8wFrpQJyCuEjNv
 PVSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfcrzJzqlpKzupTMypIOE6juUfDWrkcsNX3E+NAwBc6wcquIiPqkS/nYATtBSr2w6YBZ0sf4F3dOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi2Gl5QPaJ0oNknAls2m63AjPsIG5REYitvQdg0BBwjTKPE3uB
 3s/ix8CWaNCoeHaiKdA0vlg6j76ZHMes6CnoR51OW8SzRm+Utq2SYMh3b3rAj/SR4g==
X-Gm-Gg: ASbGnctS4jb7egabnaPGsmJx6SV1E2mOkFbkece7cA5cg8uka4H30G9G8TOlyxz8bxk
 eTb2rriprUeMoyHRsCtWQb+vSo7BANaYZxOedAdHIKR3JXf2X6//I0QGrnxMc1JUUe9q+qk0PqF
 euMiUl4TtRTE6VuZW6WWbW8cZcnFjjFtNXcrLgTamxh98RyxvG9K9ZFLIFFJFc2zrl+4Ba8bzE6
 R5M76V0+uVreWs8uL6seZOT5d2D9w4o92sNEl1z4rGgDu3aGbQc2hi9cKMwED4iaQrKIkaR1sv1
 TPgVepHr3L3MhrTFIBsOjHwyR+ZE/yLTPG6D3eJ0aoaLFWHeoxIVJW5zO32icHKhwrgaKfKHdYH
 JcisTarpZK8T9qaxwzv6TXdYsn1DBfWiAnI1mPqj+sG8cRcb8GVRmwgtELB8WgkxVKumaoWZk/0
 49WtnXfJIs5cjYpnmEYqY0wrmFUPGXTQCZaWSmlVtgZLa+K98S
X-Google-Smtp-Source: AGHT+IGU3X/bvekwg5vtQ6XJGr9uQJGWUTHzyQr+Es6KbcLgu8QfXVso61Ocr0oWX8j6FOttuRoGtw==
X-Received: by 2002:a17:903:1ce:b0:292:b6a0:80df with SMTP id
 d9443c01a7336-29554bb5aaemr5658455ad.10.1762152111810; 
 Sun, 02 Nov 2025 22:41:51 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2952696eb6bsm105902925ad.58.2025.11.02.22.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 22:41:51 -0800 (PST)
Date: Mon, 3 Nov 2025 06:41:41 +0000
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
Subject: Re: [PATCH 04/22] vfio/nvgrace: Convert to the get_region_info op
Message-ID: <aQhOpec7prJD3zKm@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <4-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:18PM -0300, Jason Gunthorpe wrote:
> Change the signature of nvgrace_gpu_ioctl_get_region_info()
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/nvgrace-gpu/main.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

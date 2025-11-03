Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F1C2A421
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 08:14:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D0110E360;
	Mon,  3 Nov 2025 07:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ieWBsyZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6324610E364
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 07:14:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-27d67abd215so381305ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 23:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762154090; x=1762758890;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=krxDO85tsubF5J6uxcbfpS+xA/eKw7o0+Vmbt9d1Ois=;
 b=ieWBsyZUNlAA1D4YhNe084VqV80x3mV+/8uTZw5DHgCA8ltiriktD6xU/nny+CfwV3
 vuMZNmXU6u2+Ypm7vc7gA7/7Xy7K8XaTDJkHdVz7jrpygPS9MYPSeg+Q620SKCakElLc
 5wCMC8FJX2Zpz47PYBwl8wlh++p0WnBD87+VEPqMyUd2jtEh4Nh/Ijoo42NDtfraVt/M
 dBOI+D/C0y3BeLci9iG2AseP72cLLPlj1jA0TXuMUt1m0P5M4t9JL5Hf77U4p3CQaR9e
 wFolPyeliUnlVIRI9MxjEqme1zohixGS9Bjr4azJ+Ni0vYpif/R1nWOT78xmEguaPdeJ
 zgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762154090; x=1762758890;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=krxDO85tsubF5J6uxcbfpS+xA/eKw7o0+Vmbt9d1Ois=;
 b=tD6peEKNiKWgOYlk2t1w/dXWkfYqP0VIZl2/7XbOx6edlYrZC5dVnNmamNHPtwDEVB
 ovOvubQfWNfkO8we9HOMr0ZXoUgUd1C6TttQ/K1FfyvgcWs5n3rucf3iOu0L1j11mARo
 2aN/7T+6fddRgTS0fxtArD/afRAvXiGro37rDgu0xXaNiS5jc6vyMftwbUFzoLNFTb+H
 QtqVlHf0G4k0NRSSHkddUHf/IUXWz+mcSGvBLa6nvXlWFnL2fGU318nsmooGl8/NEp4a
 V/q2dElYrNWAfiVTdUKLjo8siNlIej561/YbNQWLMqMN8GcwenG6NtlKbMLk1xhFTf8o
 4tNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnxykMdvNYmIgmI9BtnOez9Yi/e73UUcXaWBm8Oxy4tyVNVj5Fdcc9iQAnclUkM0PiSbcuAXAnETo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyACazeLOJhRSVgNjKNZPQhCWSU0xaSfCgCRCqA7fFANQfFCO2i
 QILVoUiJwX2q70GH/sYEl0zuiwXrFGCWVyO84io5Dmp3qNQqsn/O+GF4n+ACbs2xMg==
X-Gm-Gg: ASbGncuT+s7Bs6fK+6Iwa+gUv/Q0c62UMPo0QwZqPeYbT0gus9aMBm7EckJzhHAPKIJ
 pyLkzzREaBE+lZAfSdpFrmmWM3fo3zT6TXLZOlOi7A9/HV+Rkzc1WsPR7g9yX5DnrqVw1iKMqSX
 YlCbvV0pqP7BSY3IQdJe/SPC0S/KwOqld9kAf+XYXL35E5QGiZu80kHB16UMruiJtNuxST2MOwy
 CjxyR7WX/3T7ZeIsj8lteIy8Cq3jfIBUyx6InOaPRQuD/mTfecVNde6AbejJGJFk53S9FWcqWZa
 9QQKTkxCfxtNBEi8Ivb2yTiA8VxOi/pmWaGzNrWcFjnNEGzqZ0zQ5fv4yZIbfKZOREsb5lsvcYO
 39hjjjh+5vsKVMv+ioiTUy8iEmUem1vurHTGcD7RQMkALxzL6W4kzEXJthIKdIuekniUtGjAQnU
 Eeq4LtOPpYIK7JmmV4vFQmWEAju8R1dP31Of3jyQ==
X-Google-Smtp-Source: AGHT+IE97CemVwDodrlEsACTbu3ii+CcSlX4Mt/UH1nASQkOOWezhknbfsTfFcSLebBhaZ2a41/idw==
X-Received: by 2002:a17:903:184:b0:25b:fba3:afb5 with SMTP id
 d9443c01a7336-295565ad1aemr5343685ad.11.1762154089465; 
 Sun, 02 Nov 2025 23:14:49 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2952696eae8sm107020535ad.61.2025.11.02.23.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 23:14:48 -0800 (PST)
Date: Mon, 3 Nov 2025 07:14:38 +0000
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
Subject: Re: [PATCH 09/22] vfio/platform: Provide a get_region_info op
Message-ID: <aQhWXmluuFaU3XPL@google.com>
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
> ---
>  drivers/vfio/platform/vfio_amba.c             |  1 +
>  drivers/vfio/platform/vfio_platform.c         |  1 +
>  drivers/vfio/platform/vfio_platform_common.c  | 50 +++++++++++--------
>  drivers/vfio/platform/vfio_platform_private.h |  2 +
>  4 files changed, 32 insertions(+), 22 deletions(-)
> 

Moving the GET_REGION_INFO logic to vfio_platform_common.c and exporting
it for both the vfio-amba and vfio-platform drivers to use in the new op
looks correct. LGTM

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

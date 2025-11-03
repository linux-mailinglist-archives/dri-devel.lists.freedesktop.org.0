Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A9C2A1C3
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 06:58:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343B910E34C;
	Mon,  3 Nov 2025 05:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="21i4jf8E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8553410E353
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 05:58:06 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-295c64cb951so73745ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 21:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762149486; x=1762754286;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jNN38kSQW+Z67K4qsM9EOBHtmYi+rj4bbcXqoaYoYec=;
 b=21i4jf8ET0VQqwcye9vVm5w3xr3JcKTC46A6uY+zDcDI8UdbeB+5LuV/Fe3FHQcI/q
 41grUyUyRWqA3kLrgRuIzkoYW2W8gmuaGKZ3mUGrLxQmSke+7+nkKC4kwm/n7vyGFft2
 ISvsCLecckFnVJRxYkaNUeI+ze8oTjWFf+jHTw+WsiQPLYUeJMbD8DdmxTPt/xDSHdKE
 Ru/GytsfxJJ6JmblYkNdja3FJfpJ6/ZVgaRzspf7AF0Y+kP5zWfYeh6hxXK69AOqHdFQ
 BW9qUnLIJcb3/xObOj7RAQuzVD3me4aZ+QaiXq7HPTwVapKi1k5dAZWDvWcnLQklWYfs
 HKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762149486; x=1762754286;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNN38kSQW+Z67K4qsM9EOBHtmYi+rj4bbcXqoaYoYec=;
 b=NbPEDzMo2amkd7hoDmIA42r89d3oZ7oZ+ALReupTEAqWZkth4MOC28K28sZ7WTHOWB
 0WdKQFH2I4hvVIzEVNCmnkY6Yq8QyKz57CiOAIqo4hT5I7rTbzhjooSHaSnxgmkPHe08
 iGfdQYwKDQQLDlH36jq+du5+ZszyCXCtTqC1dBbp4QLvGAa0EbKl1OpPrL/yuh1b5BkD
 LZmZfL+mGeHPB7AjxmQkXcaxcRu10TzhrW7q1rIdK2wGedtbcFT/E5onG9q6w3WSvy0v
 cJpLYxJp+9UhsinDpAyMZ2Rt/6YsLWaHuQwwjQSonMEoekjoS2jQjBR7NlmH/n0A8vXN
 QhDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmn5o7O06cMXwVSwQV9ggFkQXwnZONvARMcEzq6Kp6gne4rht93P9af7aMDm5p9bPR4OVp90KlwuI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb6fntTfxE6XBNBzvouEq33cNPouiG3gRAqt4mxUgGd50H9WgD
 PMU+xY1KSIFxXhQ5GmnNagWqJRJcGhKD0lHSUXg3IQASmJn10RMAXg6T5JII3xkdZA==
X-Gm-Gg: ASbGncuctSWAQP93wZ6uWuoS8tBJugqZI/p+JDXkOD7nBoKmU3UCtuDmpxUQby1WHjB
 dl7l6UpalK8CZBTFeTr3CI8NZzB4MsyxrGiaVh84D3wt3UE3u9itXWV6rdaEuh3DBlQeUVgILlY
 NPfNXy+TvkqzMzfeYEfY6ojchLk9C3OCwyurepdhW7fb9mE7EJLigLhd73GNoLW0vjXNiWSj14I
 AYGDut+24OjfwTo7nXAkTEyodrMy4FomGEk7gbXwnS6Uoh4L7CsTx5AWp2LxJALAwjCwFV+YtZR
 4aAHfS3DRhIbzEgbsn3REnv3UOPr8pU+CXho3ebXeFQ62VrVK/+TsesY80cfh5+mZJVqzYULRc4
 exXbvXgru3/4eB7+a+3DapjdUQrwCrvyxqDBV9OiFIx7Jw2+b8YyfTMKCCmO3SpcMa9JEd9pKaI
 9SRmK0jQb+AB5MZpNl3xrsebqkI7N3WEQKhACiKpfXzxFcb4sb
X-Google-Smtp-Source: AGHT+IHe2S0n2gwZ091UPBX6ERfL1n+n8BtlVw9vlL1yBRvzccFZt3lfIo5NNtd6hxmzG7hv2JOREg==
X-Received: by 2002:a17:902:f68e:b0:295:5138:10f2 with SMTP id
 d9443c01a7336-29556599a23mr4787225ad.11.1762149485582; 
 Sun, 02 Nov 2025 21:58:05 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3407f26e0a6sm5783366a91.5.2025.11.02.21.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 21:58:04 -0800 (PST)
Date: Mon, 3 Nov 2025 05:57:54 +0000
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
Subject: Re: [PATCH 01/22] vfio: Provide a get_region_info op
Message-ID: <aQhEYq9YVzbBlWnC@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <1-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:15PM -0300, Jason Gunthorpe wrote:
> Instead of hooking the general ioctl op, have the core code directly
> decode VFIO_DEVICE_GET_REGION_INFO and call an op just for it.
> 
> This is intended to allow mechanical changes to the drivers to pull their
> VFIO_DEVICE_GET_REGION_INFO int oa function. Later patches will improve
> the function signature to consolidate more code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_core.c | 9 ++++++---
>  drivers/vfio/vfio_main.c         | 7 +++++++
>  include/linux/vfio.h             | 2 ++
>  include/linux/vfio_pci_core.h    | 2 ++
>  4 files changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

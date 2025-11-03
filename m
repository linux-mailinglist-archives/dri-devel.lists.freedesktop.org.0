Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A8C2AF97
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F71891C0;
	Mon,  3 Nov 2025 10:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tLDKZftg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB810E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:17:07 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-27d67abd215so417755ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762165027; x=1762769827;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+B58KtJn/bs233pgZmMdorp656WS5EnyOqIx/RHoAag=;
 b=tLDKZftgHKQQLVwaCKJ8JIkQGhrrlePOvpWm/156thXzlGEuzCyjW1Sb407/o+KV6V
 XWoigw2uNw4F6OaVeApYLVAiOipvh95aXFJMUvTVxsRsYu+pwsNH707GKPC2aAfPOnFr
 PWg3A54s61QRBEM3WaSYxp9jtDisZjSEyKIXecc/IGZrwbITX10GN26c/bFPMRcSkrLn
 e4Z+BxfvDXbm7g2MKI0H0AjIKLiPe3Hpyww+cDLKoqY8cA7ungDGCUpck5IL8lxUCmfY
 2bIBFngJnj/M3mLXlt3sRXI5aRJXd9r2HkP09+1/1xvHsv2dSgC20jOfAsoW/oei0Kv1
 XmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165027; x=1762769827;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+B58KtJn/bs233pgZmMdorp656WS5EnyOqIx/RHoAag=;
 b=v2PeDh1P7BeG75/hDPIzXkBD4/pIeDd60NiFdVeVwlOGxis6zevWSUVeWq9HrjA5sn
 kVAPxLWmG/5qLESHVQ4tFCpm/kPYvbYdM/Hx+rESXnAdQINDgjAY3HZ9Ymep8tAvqxq8
 LNk3bWAT2oUX1gjRjV6PsEn7ZNCdu297nrt5gEMx3CfESzh4UF8p4WmQW2oE6oGj5qw6
 DwTFBIHB8TU1yTbThhFSN+JLKJtxgZXyZpurs02s41BWUo+CpT4E4TYPdfSv78xvCKGm
 yH+jxESxW6qTz7lVZmHTcmGef90JBOFPVNuGLSNEQX3fHyxRvHJGmlBPp6yyYF15SqL8
 V5CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8afL/A9g/OhOw9ExqGAeO7g9Un39W5DnDA+AC2PYopAvd07+hXiYsD8X4Hmg20yUft5f1q/9YaLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyaP6ANd1S1bU8e/fRxfDxcJxRBtFe0utKR6xVNdDBxHr1KOTiP
 q+xty3UM3xYc3sE62yyiPv/dUsjs9eoWe2RUp2FV2pxM8dWsC1z50IXkheN2e1Ntkg==
X-Gm-Gg: ASbGncsU9xJKSwt2xwnc/p8Z6dTX9B1FB4Xw7XVaBrRmrCsyrYFtggReYMydxaWZh57
 /VbWcM8lSIg7xFIrXqx4g2IRBsdbNczZYzO8FIhXqZ26WfQKq6NGLy0NY7K8peCWj4IYkMdQ+Fj
 YSRGyDHBsQ2VtWho9SdXRzVQWL/AllUhysapoRFutdgrw+JWPWyt/bb+U+Sq4vk6ow4Kd9ZRi+v
 dpR2Cx1sUM8+MmW3QjdO85NWSeataMdfUp5MvmnEXtDdYXKCf5gY4tw2WNaWelMZG4l/XJtuOkw
 ZyNqv0BhIM5zTKlHMY101zlptIAdqACb4o7aJI/6QC8Q9RSAdzjMj3SxkbhXWtCFjnevisDsIXI
 L9Y41dH9DZzMRN6nbvlavp2XiCUwKkla+8+VlaJW55x2Swkf10SgNimPsyN1o7bFoHw1aYsUmzi
 wUzZKx1m37esoC0ZfRjGGxlTipd78ZSo4UVfdPhg==
X-Google-Smtp-Source: AGHT+IHxzXLAyCFx7IPmcOnpFb2vp8Rgf1l3Kna0V2OUhXGSl0YxnYi8nj1MD1lWW9qX+m9LVNsxvQ==
X-Received: by 2002:a17:902:e88c:b0:290:d4dd:b042 with SMTP id
 d9443c01a7336-29554bc5206mr7508255ad.16.1762165026873; 
 Mon, 03 Nov 2025 02:17:06 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7aa4f4c28easm4658013b3a.31.2025.11.03.02.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:17:06 -0800 (PST)
Date: Mon, 3 Nov 2025 10:16:56 +0000
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
Subject: Re: [PATCH 15/22] vfio: Add get_region_info_caps op
Message-ID: <aQiBGEgQ3vCpCvXM@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <15-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:29PM -0300, Jason Gunthorpe wrote:
> This op does the copy to/from user for the info and can return back
> a cap chain through a vfio_info_cap * result.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/vfio_main.c | 54 +++++++++++++++++++++++++++++++++++++---
>  include/linux/vfio.h     |  4 +++
>  2 files changed, 54 insertions(+), 4 deletions(-)

The newly added vfio_get_region_info seems to pull-in common boilerplate
code (like copy_from_user, arg size validation) into the core code,
removing redundancy across all other vfio drivers. LGTM.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

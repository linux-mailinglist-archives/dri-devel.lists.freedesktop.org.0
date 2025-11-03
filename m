Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B0C2B045
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 11:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2915C10E3A5;
	Mon,  3 Nov 2025 10:21:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="nMI/K8SL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4C310E3A5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 10:21:40 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-294f3105435so372395ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 02:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762165300; x=1762770100;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zM2bsN+XnlGuvDGqw1tQvaweGHKrw1JAZACa3YqST0c=;
 b=nMI/K8SLY4YtqSwaUrj1MCKb6229hgNVZjlAn/NiRDsDlLFMRJ7heYLW+mkmKWEPRA
 ady3HeBteN3rJI3JpdIJ5ggffn2fGMvUOOeCsoZhwGgF0+JAY5gVh10q3vBslOojnc6N
 8qXrxMDw5UpuMAQGgpBvFnf4TBGa4eE1kTi1HxeMs2VCtjIHooBXTRN33PCb5xrsGx2y
 WlmSbBCl4m/ruqfuElw/04jTuorqADtxA4sTT6ZGwp95oP56A4Wavz+JUlZBwXAhddgi
 hFwDofaIvwbeAG1VA4MdReVoZgVXrU+7mICxGCCI12ET/O2g2Kgf09GTDBDYw3f8FVSo
 vZ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762165300; x=1762770100;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zM2bsN+XnlGuvDGqw1tQvaweGHKrw1JAZACa3YqST0c=;
 b=XJSU49HiS3XnNAIdUZYhokB7c+wkM/8One1hfqhcibagcvtb/ReDjgqZpaXfKSiPmD
 fqvalXOkU/ReYmkWYY7CThmYj8BqVhRARJprWr9p7QLRxkmcaNOUVgKESG0zQDfs/YAX
 0RDh5pzt0PmBt2umchwLxW3giGiADUkZFUywvKUCpz1U8dcsXV0luZtnaHOCQCaxHIoG
 xVcllkzQfqkwFofnAkjbl7Gq7Ap2twHQBeJgy7axc01zv3tD1Ry1Ozw563uWbsBKbogd
 PUCcaDaV0kV1tZJN8+ok0X9gaFmy4rnDkV1eFcKVrxI7v02yTKlsR4/CFBsev66SD0oK
 9HBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6JPnBgM51v3F0icxS+pSNAdWAV1qElnxsdSfsiIrsyporiOAIJ960POKyH4XWrIXjlHmdePzoACY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywno3B4ZOa4ESTfTaSEKibv+3fIAzMBycEoqZoPqppW4NNJGdto
 1ME70irgbhjvqhaHtcucEuO/xVkYIlBjoKN/dEtUG0JQy8p/pEGk7X4TSCn6OjCoQA==
X-Gm-Gg: ASbGnctS/zQAYpBnHRRH9SLOK3QGfoxq+xkXTaRlVMbQupgrkHq8gsvaNh6NNMu7c3u
 j+R3lNFcrFZeKoICDy4vzEmmK/W98tnp+wdnSA1C+GPtgICNXVeXdC7xdniCfUZvbRfv9RFsKLe
 MZZ59ZFPd/bmEXYEGtjwsufZPekai8pTaSj++OcwX76yXK58xmDPqaTS+FCwP95268a4W4nRq4T
 W3GDGhcL7Z7xtPb2xdttUT6aN7Q9euCcAngmVT17YXOk8MPsKXAvSydinbeqjKoYANvhep+uB/o
 R+HeVzVwOSxIxLSYjMeanWdIRMihtEOv09mVk7rANXYiV1prs9MUOhkik+LI9V8VGxHRmJF6SrS
 naGHTl9LVFZ8E69djlT2rEvwJgdh3ibR0QF4jE+m7R8WL2xhlXqx51YP3GkXpqq+L0bFHAYWBIb
 8sIm9Mg3ykq/qgzyoh+i7+0hGFUyazJfe+H8pPzpyvMy+Us2Kc
X-Google-Smtp-Source: AGHT+IHDQYQU+xgcIcym40SdSIPVCJL4E/vz3sWG3WXd+xmfQ1K9iSuwfFgvjeHeyY3RCG42umC9MA==
X-Received: by 2002:a17:903:1a70:b0:295:28a4:f0f5 with SMTP id
 d9443c01a7336-29556476c7amr6429175ad.5.1762165299489; 
 Mon, 03 Nov 2025 02:21:39 -0800 (PST)
Received: from google.com (164.210.142.34.bc.googleusercontent.com.
 [34.142.210.164]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3407f26e0a6sm6205722a91.5.2025.11.03.02.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:21:38 -0800 (PST)
Date: Mon, 3 Nov 2025 10:21:28 +0000
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
Subject: Re: [PATCH 20/22] vfio/platform: Convert to get_region_info_caps
Message-ID: <aQiCKBl0ScO78Le9@google.com>
References: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
 <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
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

On Thu, Oct 23, 2025 at 08:09:34PM -0300, Jason Gunthorpe wrote:
> Remove the duplicate code and change info to a pointer. caps are not used.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/vfio/platform/vfio_amba.c             |  2 +-
>  drivers/vfio/platform/vfio_platform.c         |  2 +-
>  drivers/vfio/platform/vfio_platform_common.c  | 24 ++++++-------------
>  drivers/vfio/platform/vfio_platform_private.h |  3 ++-
>  4 files changed, 11 insertions(+), 20 deletions(-)
>

Removes all the boilerplate (copy_from_user, copy_to_user, argsz
validation) and lets the VFIO core handle it.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!
Praan

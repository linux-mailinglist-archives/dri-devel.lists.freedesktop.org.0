Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEED90F1DB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 17:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1B010E0DD;
	Wed, 19 Jun 2024 15:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="VeqsCkqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A719510ECFC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 15:13:46 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4405cf0cb1eso32560771cf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 08:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718810025; x=1719414825; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
 b=VeqsCkqymcU23En6ev+tCO80vKojfV30ULVCFJeJ+ow0ec4Xy2eCU6UYFhpJklrOGN
 48Jd7X1Kz0WxPzIbIEfiGKmFPMelxOsOW5wUuHhFQpvY1vVWs3rRuCX/caN52AQtCaMs
 eSDVS0TD6VqEI/VKPwzwqmDXb9VCkY8X48b6OXGZYm9UksPnsQEQBRrIE9joIcgZIS1R
 B8jmIwIkN3L/Kxq6w8Gv7ijtlmbozpA/yWr9AqOxSDRgXsfjqqDNqBLsudH2f1te+mAM
 /kp5CxC7fAmJzt4b5e2jwmL/+VOL9vFx2q7pDTuYw1OKEx+SwpOK3kgWLUJlQNGjSrK2
 RplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718810025; x=1719414825;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=moEdRVU3PoPlgPdcVkukT3vEmMSfRXd64UiQM7jDSSo=;
 b=sZbyDK8g7eegiQcawF0FcMi5r7sZog6qkUP2xwbtHIOi8y/MxodnBlOakvqjqr5mWp
 kgQx3MchRAjlGKlC/CFVNjfz/pKIK2pcw+6dZRzwch1sJbVVHr2Bux/cYDrUpTP7z7+O
 CdEJI5dhsn1ZCOv7NTjnQXYBlAaDnR9lfWXv8avwl5VeI9z1nu/FoITcjgWP1ICWmrZc
 qw0h6pLlwgs/h4FWJwBSwzlJah3ePDKexFUrnNaOaymWGiylc+i4ig0HzQyjcCRiKOcQ
 3JQngDZVpE8SKC/W0m+1aFAA5zCgdDnMRIhTIgX0JfE6Bi81pG/lavUFzJ6RuAUUQtbT
 LpdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2AYLF1cwLciWew1hFYIygbMbaaaH0SlC/F8+/aBrsqanaMqVfy7/+H8Lr2ub7j4XBzznCOctgdaSQ80Y4WnbXWPYocFI552TvmNiWgtNU
X-Gm-Message-State: AOJu0YxLt+Bs2TAB5qvkMIF4xfbSWPmRtFkunCGJ3z3ztD2eRFiJCbD8
 zrLctS6eumwUz4REawgiqgAcI3sobHS4800WSs1KIEvkNGrhwe4CDW6T8rISy0Q=
X-Google-Smtp-Source: AGHT+IEJkRZBkgVagiNpl/OtqoGC4d9ZaTPjOU1+2kFAPWdp2oRDjZmssY8YvGAEYa4O75oAH2+OSQ==
X-Received: by 2002:ad4:5849:0:b0:6b2:b3cd:c323 with SMTP id
 6a1803df08f44-6b501d22234mr29977206d6.0.1718810025609; 
 Wed, 19 Jun 2024 08:13:45 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2dea97206sm26986726d6.84.2024.06.19.08.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 08:13:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJx0K-004nTt-3N;
 Wed, 19 Jun 2024 12:13:44 -0300
Date: Wed, 19 Jun 2024 12:13:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/21] ARM: dma-mapping: Use iommu_paging_domain_alloc()
Message-ID: <20240619151344.GJ1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-18-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-18-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:51PM +0800, Lu Baolu wrote:
> Since arm_iommu_create_mapping() now accepts the device, let's replace
> iommu_domain_alloc() with iommu_paging_domain_alloc() to retire the former.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  arch/arm/mm/dma-mapping.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

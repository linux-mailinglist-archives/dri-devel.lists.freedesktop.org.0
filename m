Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 983778FB959
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBC810E55F;
	Tue,  4 Jun 2024 16:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="bAWgCigQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915FB10E55F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:45:02 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-250b1549b97so1827372fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 09:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1717519501; x=1718124301; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=13DrUW0wsjFsOLQQnsi9knf7av4PrVRrLk1t14myUlc=;
 b=bAWgCigQWx0uVI53QZygaEpGSaE8GnAJGjimCkyWoRFYo+FxvSm2j6Uz+aX0Pj1STq
 +9KDjgmzjIgxT6bF6oNfduqCe3IjRjbIIw+SnudmMhIxkbnmJDhGXx1+I2o/VpgImZKl
 pVq+6IIhcx5ee+9WSnqEeeHohxa+SAL8Zl3LccU0VwwbStF3RJdEGbwLmIFzwbQHhsim
 EVzeZUDqUr04WrRGODmZwf9uy70LA1FYQZZxHSaZQln+PiBY3lL0xRSpeLypQMHYmyUG
 pKnOpXY81Sek3f07B/c36wLnjoGIDevkxFLvKO9aRiaaUQmy3+dpd044fTRC6IPKmA5C
 /OjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717519501; x=1718124301;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13DrUW0wsjFsOLQQnsi9knf7av4PrVRrLk1t14myUlc=;
 b=fyYRHnSkZ7Ijk7Di5ktIkvHkS3SOUsIVeKQNHByfnJooUAghrfnVsmT+hai6BnJXIj
 8F94JPXPBla57Rn5yA3kIhuavTNDKackazYV8LbIwWukmILxqBqOftOkKN2mWuwwagcH
 IBb9u++ut7X5VKKJ9tX//l71w2w6gCJvR+BU7rf6IgUPRdNlJ8daZp1cHlSAK6Nn1ouG
 v73FYhx6cm0bG6IEVDY5Gv9GiPitngoidq5Y5maJ/exstVFCzQmbwtjv5ZYN54w2ZUe9
 jceZD+uUcoiNySxBbNLvJfSroUdl8jgAHEuWd5VizzneaeeCZCbHE822KM1RmmuWyIB3
 anvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMkhDtzbul4t65xr2XyHL0ktw58fSdTARhOeJnusL3s2UjAPnOWImOs7p7IP/PSpWAlGy06o5oTPJi/ehlVOEtik++ajDo26Q4WkxWRVgy
X-Gm-Message-State: AOJu0YxCokwmCVEgFQmeoHrvLsYx2WuL47kAvexNMXRTCgPvN1Nh+ghm
 j5nnzoPWu7J99zez6lID0RdgCpoaBqcEJ1KeaccDfcee4y0E6yAvGz8dnYcp78o=
X-Google-Smtp-Source: AGHT+IEfas1lnZdFNBRgqZxmKWv2oXN51AWEQ8aiqFcaC4Ca/kraXgYuVuAGXMg9aTheAhe7N7CZog==
X-Received: by 2002:a05:6870:4708:b0:24f:f297:3ff7 with SMTP id
 586e51a60fabf-25122a6d964mr33165fac.38.1717519501608; 
 Tue, 04 Jun 2024 09:45:01 -0700 (PDT)
Received: from ziepe.ca ([128.77.69.89]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44009a2902csm30190921cf.38.2024.06.04.09.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 09:45:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sEXHP-002tE6-4C;
 Tue, 04 Jun 2024 13:44:59 -0300
Date: Tue, 4 Jun 2024 13:44:59 -0300
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
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/22] RDMA/usnic: Use iommu_paging_domain_alloc()
Message-ID: <20240604164459.GC21513@ziepe.ca>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-16-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604015134.164206-16-baolu.lu@linux.intel.com>
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

On Tue, Jun 04, 2024 at 09:51:27AM +0800, Lu Baolu wrote:
> usnic_uiom_alloc_pd() allocates a paging domain for a given device.
> In this case, iommu_domain_alloc(dev->bus) is equivalent to 
> iommu_paging_domain_alloc(dev). Replace it as iommu_domain_alloc()
> has been deprecated.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/infiniband/hw/usnic/usnic_uiom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

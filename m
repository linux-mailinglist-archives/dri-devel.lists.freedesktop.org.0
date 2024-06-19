Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139990F08F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 16:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74F10ECBD;
	Wed, 19 Jun 2024 14:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="DTQYa3YE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F7610ECBD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 14:31:17 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id
 5614622812f47-3c9d70d93dbso4255257b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1718807476; x=1719412276; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
 b=DTQYa3YE5xYWojt90N883/fmf5dfaCuB1yf7Ro59k9gjgL7y0pOrMGFdLfsKm1MinA
 qB/39pG+DeZYCbZZGnmuaCK9hwWPr2VWH1VU9MElS/Ocg38qsE0FK+6PzhgIBXdflJQ7
 5yYF9tuS8h4fScpdTt0B4NLsUig6S0s0gIFg4lerBhqE3jVaKgVWus2cwUdhVw3P17OI
 V7dr4U6AlCh61n02vn87VzYCoKolQd8pvfCdKybioSXFH2gTayFnxzJlfpkMvQOSpo3Y
 dkM++q1vz2m/Rm7jEkecTa025M+AFIZRPvfJLM3tFoRUpJbsWTHAa6y2PbUzHU66JUFT
 vFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718807476; x=1719412276;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsT9hgFyZbBGkde271aluLYZILHDBPNQg1gpCGW3N38=;
 b=mUuZA0LRnLvduVB3Zqs50OGeVj2edVQ7ARO8716WzvT8t1U1qp4XQF2bbgTh+k+c0M
 yGL2JJlkN9rTYO8Aj+0iIwIabDjT7NQW/tkFvwEsB18gWx2cUbhqhsZ8fl1UE5pj6VTc
 QipFmFQe7TwjGLlMfhhokrtqbsqJTRyXzPA2PHu9xK5ceZpTYNSOcYcsXLNUuepuCrvH
 W1qaX8j6bJIuFl5W8MuDJgqL2rW1j6nmCxd2GKyQzlaLw0zmwPCh2OJl6oEbOp0KNRM5
 EUgz3ZcUfx/TJpQzX47ZSZCHA37O1Ugj8an7Hsn+Wbj+s06i+AKNCCi5x+RAOv/2818A
 wcHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW2FUaHgZE1o6AsagGyMJ8QQuNotdYA3AdtFNg4iZvlq6aACyUrw/phfiTdLaTdFNXA03KZg6ZNDdLblaD85Ny44xwoiBwmjW4Oer/T1oH
X-Gm-Message-State: AOJu0YwNflqstXCVEwX3r/3R+pphv5tWLrhWpaLv15Wcy65lSzZrU6iQ
 yjlUTA7atIWTgIfwKu2seuir18TzB6ADHi8Ssljh4YmVcgzQSgIbHrZR4Lc/EwM=
X-Google-Smtp-Source: AGHT+IHZayxzfwc1KZvF4t1SmwGVNV6P/gZQ5Mo6uiPN1/R0ej17zeeigaD/qQOHMYxQZ4opihlAhw==
X-Received: by 2002:a05:6871:592:b0:24f:ef6b:353e with SMTP id
 586e51a60fabf-25c94d106f7mr3066372fac.36.1718807476505; 
 Wed, 19 Jun 2024 07:31:16 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.80.239]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2a5bf23f6sm78142956d6.8.2024.06.19.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 07:31:15 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1sJwLD-004bUT-Gm;
 Wed, 19 Jun 2024 11:31:15 -0300
Date: Wed, 19 Jun 2024 11:31:15 -0300
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
Subject: Re: [PATCH v3 08/21] media: nvidia: tegra: Use
 iommu_paging_domain_alloc()
Message-ID: <20240619143115.GC1091770@ziepe.ca>
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-9-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610085555.88197-9-baolu.lu@linux.intel.com>
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

On Mon, Jun 10, 2024 at 04:55:42PM +0800, Lu Baolu wrote:
> An iommu domain is allocated in tegra_vde_iommu_init() and is attached to
> vde->dev. Use iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

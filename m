Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A46198FAC7F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 09:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FF710E1FE;
	Tue,  4 Jun 2024 07:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e0UbseZU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE02D10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 07:48:28 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52b83225088so4902909e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717487307; x=1718092107; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OlJzONumJ7hGmF7Lx8HSrbgepz7pi58FM6gnNMiUIJU=;
 b=e0UbseZUJCxOFXHLmZXrETZOwcNOoWu2UMTmIRC4Y4oI1HH/TMpls5cQzAUVcSTOCp
 6BMiCM72vmrElej1mRpIV7VMRoBobXeBtEs+Z9ieahbrrSbcRkx7Z8IakdDl8zsWxAGS
 CgOuwseZ59pdy8B4AdAEFfi6Tc7DTaNfCd0Z+PqG0X0Cj5tdELM0OSLrzCgZHf5IBwer
 Fosxcxi0GiR9PxIVOVjRH3wNBwfuiHmcRjHFkaPPsHVDaCg0np75c+buYJkUZaPOpwTh
 BUn0Xf3SaKFCSZFPZj6kKnPoOQJlXTq8O/DVtMOaF8zGKEJYaRpzfVHK43ahbM55dL/9
 bVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717487307; x=1718092107;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlJzONumJ7hGmF7Lx8HSrbgepz7pi58FM6gnNMiUIJU=;
 b=elRnpftD7p7XmCwZvXT0Nm62NFLUPYnsoxbXZTNLxjSJi64ZUfyI2BlSXU9R24grji
 5jmXwxHf0GPgPuxc1q26MgALx7pe1X9ZMzAW2wBS8I2RP71L8NMSW1/8gPFXIqA6HnEr
 VqsyGkUpBbzh54ysbde8KTFtMK7yk8Q/w3mclZMryuJ34DLh3YAG9py7ZLyxx4J0ghOx
 eqwnpcl3uQFtTEJPXHm+cgRMRl4pVzVCWSXF68r7kLovBpWj6SGGO9iEoNx3kWSHt4Mm
 C0szPGCkZIWiwjtcMKEOm4mCvEo9mASqR2GZma8v4knPMbJbji3ZXDvmcnDROTyTDBCh
 vyfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+OuOh/ZUojuMgoRqPUxcbBtyWcxOsdj9fE5OQebJCFtpSjs3GXR5ygihDk/zkfIO1HiyzeSzXd5dLK2DBhxCVZ4ZonAv97ZhQN8HgkfpX
X-Gm-Message-State: AOJu0Yz1IqPM4i+UewhM0U3wv6uARCZj01YgyRIWwmnWE4RIcHqxEHtq
 lw1WC+yqisBkAC8wLQJFWNi+aSxy76HI4b+dyIUVz+euz2mYCDdgTjOZBI1/QAw=
X-Google-Smtp-Source: AGHT+IGqL1YJgziLvhDKlAs/q9qv00KwD6G0YPzlvyHwSRHM2CF7Ig4MUCHZdylu6wx8bzJ0XpEuCQ==
X-Received: by 2002:a19:9110:0:b0:52b:8417:fa95 with SMTP id
 2adb3069b0e04-52b896b6e1emr6758126e87.41.1717487306746; 
 Tue, 04 Jun 2024 00:48:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ba4c99cb8sm142098e87.62.2024.06.04.00.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 00:48:25 -0700 (PDT)
Date: Tue, 4 Jun 2024 10:48:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/22] drm/msm: Use iommu_paging_domain_alloc()
Message-ID: <zm65wqngmcji4t4ox6ak7il7p5beup6a2yidytp376gbxkfq2w@duieucwqwj6r>
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-7-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604015134.164206-7-baolu.lu@linux.intel.com>
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

On Tue, Jun 04, 2024 at 09:51:18AM +0800, Lu Baolu wrote:
> The domain allocated in msm_iommu_new() is for the @dev. Replace
> iommu_domain_alloc() with iommu_paging_domain_alloc() to make it explicit.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index d5512037c38b..2a94e82316f9 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -407,10 +407,13 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
>  	struct msm_iommu *iommu;
>  	int ret;
>  
> -	domain = iommu_domain_alloc(dev->bus);
> -	if (!domain)
> +	if (!device_iommu_mapped(dev))
>  		return NULL;
>  
> +	domain = iommu_paging_domain_alloc(dev);
> +	if (IS_ERR(domain))
> +		return ERR_CAST(domain);
> +
>  	iommu_set_pgtable_quirks(domain, quirks);
>  
>  	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

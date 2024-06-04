Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914AB8FAD5C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 10:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACD10E073;
	Tue,  4 Jun 2024 08:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gwSFn6Te";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B2010E073
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 08:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8BBCFCE1087;
 Tue,  4 Jun 2024 08:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922FFC4AF0A;
 Tue,  4 Jun 2024 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717489177;
 bh=Cl26qCxo2UX/Hr4fxo+oX7S1ymUZ9Z3ZTZcmorokdoI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=gwSFn6Tebpx2FbyOPMGfXWm/Mu5F0chYv9oPxGYovid46Ggp4OhKt4lT+8wmWVGwZ
 bcSDSm3H+mOWpVCDwB+geWnkEcpvwZ12PaV9T7Kd/iceMQtXOQC+U1G1jzlBFszzgZ
 G2/yEUs619rFYWz0RU3p3kwmh7rmFm9UBxZ1RMfR9To7jTcp4dW4iaK77fhWhPwGBu
 Uh8ckP5yo3H6bMK8EXyKN6QsSAfNDn7Ue5UJkeH2pNe5M3VpFHRlt08g6N6AgIjupy
 A14Ws1BJ3YArVaqOrjOCwf85nHtxgxueN1dRTSS8LOwU/h2kSBXuI60MLEwcV2eW2Y
 K+lqvi8NWzRIg==
From: Kalle Valo <kvalo@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>,  Will Deacon <will@kernel.org>,  Robin
 Murphy <robin.murphy@arm.com>,  Jason Gunthorpe <jgg@ziepe.ca>,  Kevin
 Tian <kevin.tian@intel.com>,  Yi Liu <yi.l.liu@intel.com>,  David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>,  Bjorn Andersson
 <andersson@kernel.org>,  Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,  mst@redhat.com,  Jason
 Wang <jasowang@redhat.com>,  Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,  Mikko Perttunen
 <mperttunen@nvidia.com>,  iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org
Subject: Re: [PATCH v2 12/22] wifi: ath11k: Use iommu_paging_domain_alloc()
References: <20240604015134.164206-1-baolu.lu@linux.intel.com>
 <20240604015134.164206-13-baolu.lu@linux.intel.com>
Date: Tue, 04 Jun 2024 11:19:30 +0300
In-Reply-To: <20240604015134.164206-13-baolu.lu@linux.intel.com> (Lu Baolu's
 message of "Tue, 4 Jun 2024 09:51:24 +0800")
Message-ID: <874ja9t90t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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

Lu Baolu <baolu.lu@linux.intel.com> writes:

> An iommu domain is allocated in ath11k_ahb_fw_resources_init() and is
> attached to ab_ahb->fw.dev in the same function.
>
> Use iommu_paging_domain_alloc() to make it explicit.
>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/net/wireless/ath/ath11k/ahb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
> index ca0f17ddebba..a469647719f9 100644
> --- a/drivers/net/wireless/ath/ath11k/ahb.c
> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
> @@ -1001,10 +1001,10 @@ static int ath11k_ahb_fw_resources_init(struct ath11k_base *ab)
>  
>  	ab_ahb->fw.dev = &pdev->dev;
>  
> -	iommu_dom = iommu_domain_alloc(&platform_bus_type);
> -	if (!iommu_dom) {
> +	iommu_dom = iommu_paging_domain_alloc(ab_ahb->fw.dev);
> +	if (IS_ERR(iommu_dom)) {
>  		ath11k_err(ab, "failed to allocate iommu domain\n");
> -		ret = -ENOMEM;
> +		ret = PTR_ERR(iommu_dom);
>  		goto err_unregister;
>  	}

Adding Jeff and ath11k list so that they can review this as well.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

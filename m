Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9CE266A57
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 23:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD2E6E0ED;
	Fri, 11 Sep 2020 21:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Fri, 11 Sep 2020 21:52:24 UTC
Received: from a27-21.smtp-out.us-west-2.amazonses.com
 (a27-21.smtp-out.us-west-2.amazonses.com [54.240.27.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04E216E0D4;
 Fri, 11 Sep 2020 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gbvhytky6xpx7itkhb67ktsxbiwpnxix; d=codeaurora.org; t=1599860734;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=ugAF6M/Vv/bl8EUYaXGQWHTNSpMHFIh6qv//R/9KMqM=;
 b=B3bFtElseyNrthFY9tnVLgc0RwXhIxb23lipSXnJjsRn0Kp4UkTmjYWfK8nRBxN1
 /IO1EtMiiNAcpHqo1rA0HtLJ/D7yz63nLpuLrjhwvtkAXmT9zWPzC7sE+Q9Y7JpZpfg
 fNwYXLsFMcPcM/qdIZqCR88VnuGaWdgGsddbdQSk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599860734;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Feedback-ID;
 bh=ugAF6M/Vv/bl8EUYaXGQWHTNSpMHFIh6qv//R/9KMqM=;
 b=J5NuOFdIrpW8xbTKwnMjW3XV1P1dhe2z3tJs2yF3GLO8QLfeW5aAfzrv6nl35O0b
 Zx9CA1j4VJAgCu/ylnxrTGxzUt10kvjBX5lljj2O7gdHtQMs4xU1u/2DghPUlSVX7u4
 0bdEUo+wk7M+XCWZpP/GmNaPfhQxxo67oqy6oa6k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7004EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 11 Sep 2020 21:45:34 +0000
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] drm/msm/adreno: fix probe without iommu
Message-ID: <010101747f2178df-3200d9c0-89da-4ebc-b0b8-737b9eea9fb3-000000@us-west-2.amazonses.com>
Mail-Followup-To: Luca Weiss <luca@z3ntu.xyz>, freedreno@lists.freedesktop.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Brian Masney <masneyb@onstation.org>,
 John Stultz <john.stultz@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200911160854.484114-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911160854.484114-1-luca@z3ntu.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-SES-Outgoing: 2020.09.11-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 11, 2020 at 06:08:53PM +0200, Luca Weiss wrote:
> The function iommu_domain_alloc returns NULL on platforms without IOMMU
> such as msm8974. This resulted in PTR_ERR(-ENODEV) being assigned to
> gpu->aspace so the correct code path wasn't taken.
> 
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 862dd35b27d3..6e8bef1a9ea2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -189,10 +189,16 @@ struct msm_gem_address_space *
>  adreno_iommu_create_address_space(struct msm_gpu *gpu,
>  		struct platform_device *pdev)
>  {
> -	struct iommu_domain *iommu = iommu_domain_alloc(&platform_bus_type);
> -	struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
> +	struct iommu_domain *iommu;
> +	struct msm_mmu *mmu;
>  	struct msm_gem_address_space *aspace;
>  
> +	iommu = iommu_domain_alloc(&platform_bus_type);
> +	if (!iommu)
> +		return NULL;
> +
> +	mmu = msm_iommu_new(&pdev->dev, iommu);
> +
>  	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
>  		0xffffffff - SZ_16M);
>  
> -- 
> 2.28.0
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

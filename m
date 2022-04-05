Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F14F29B4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 12:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47CA10E5EE;
	Tue,  5 Apr 2022 10:18:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E8CE010E9FE;
 Tue,  5 Apr 2022 10:18:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B709D6E;
 Tue,  5 Apr 2022 03:18:31 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 971AA3F5A1;
 Tue,  5 Apr 2022 03:18:28 -0700 (PDT)
Message-ID: <00bcebba-4955-cbbd-e7f4-e344f9b932a0@arm.com>
Date: Tue, 5 Apr 2022 11:18:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm: use orig_nents to iterate over scatterlist with
 per-process tables
Content-Language: en-GB
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20220328125505.31605-1-jonathan@marek.ca>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220328125505.31605-1-jonathan@marek.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 dpiliaiev@igalia.com, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-28 13:55, Jonathan Marek wrote:
> This matches the implementation of iommu_map_sgtable() used for the
> non-per-process page tables path.
> 
> This works around the dma_map_sgtable() call (used to invalidate cache)
> overwriting sgt->nents with 1 (which is probably a separate issue).

FWIW that's expected behaviour. The sgtable APIs use nents to keep track 
of the number of DMA segments, while orig_nents represents the physical 
segments. IIUC you're not actually using the DMA mapping, just relying 
on its side-effects, so it's still the physical segments that you care 
about for your private IOMMU mapping here.

> Fixes: b145c6e65eb0 ("drm/msm: Add support to create a local pagetable")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index bcaddbba564df..22935ef26a3a1 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -58,7 +58,7 @@ static int msm_iommu_pagetable_map(struct msm_mmu *mmu, u64 iova,
>   	u64 addr = iova;
>   	unsigned int i;
>   
> -	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
> +	for_each_sg(sgt->sgl, sg, sgt->orig_nents, i) {

Even better would be to use for_each_sgtable_sg(), which exists 
primarily for the sake of avoiding this exact confusion.

Robin.

>   		size_t size = sg->length;
>   		phys_addr_t phys = sg_phys(sg);
>   

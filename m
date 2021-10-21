Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C276436E49
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 01:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D9C6E4F4;
	Thu, 21 Oct 2021 23:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702C06E4FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 23:24:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634858661; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eGXgAl/rLL3eeoTt7waQiUbv56ry1MTX0RnCfcNJG2M=;
 b=H46Pdv8H0l3PIqNFoD8zykqbbb9OEnvVKjlQ7SpK6wYAr4D/OHzVtDJfJeABM0hIWtVkCiTw
 bKmNds5JJfhJtzdhvy0ge69BwTmIdMoHO7sY4Yjjr8vC2zDB2eXB69+nlEeIqCsL1LBIod5v
 RbVY3YqgYgWPvH5/ZmrFFbm9Gz8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6171f69b3416c2cb705add5d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:24:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2260CC4361A; Thu, 21 Oct 2021 23:24:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2BED1C4338F;
 Thu, 21 Oct 2021 23:24:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 16:24:10 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 09/11] drm/msm/dpu: don't cache
 pipe->cap->features in dpu_plane
In-Reply-To: <20210930140002.308628-10-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-10-dmitry.baryshkov@linaro.org>
Message-ID: <632c6142a27970e43affee67d379fe18@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-09-30 07:00, Dmitry Baryshkov wrote:
> Do not cache hw_pipe's features in dpu_plane. Use
> pdpu->pipe_hw->cap->features directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d3ae0cb2047c..af403c0d3d7d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -100,7 +100,6 @@ struct dpu_plane {
>  	struct mutex lock;
> 
>  	enum dpu_sspp pipe;
> -	uint32_t features;      /* capabilities from catalog */
> 
>  	struct dpu_hw_pipe *pipe_hw;
>  	uint32_t color_fill;
> @@ -644,7 +643,7 @@ static const struct dpu_csc_cfg
> *_dpu_plane_get_csc(struct dpu_plane *pdpu, cons
>  	if (!DPU_FORMAT_IS_YUV(fmt))
>  		return NULL;
> 
> -	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->features)
> +	if (BIT(DPU_SSPP_CSC_10BIT) & pdpu->pipe_hw->cap->features)
>  		csc_ptr = &dpu_csc10_YUV2RGB_601L;
>  	else
>  		csc_ptr = &dpu_csc_YUV2RGB_601L;
> @@ -1012,8 +1011,8 @@ static int dpu_plane_atomic_check(struct 
> drm_plane *plane,
>  	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
> 
>  	if (DPU_FORMAT_IS_YUV(fmt) &&
> -		(!(pdpu->features & DPU_SSPP_SCALER) ||
> -		 !(pdpu->features & (BIT(DPU_SSPP_CSC)
> +		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
> +		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
>  		 | BIT(DPU_SSPP_CSC_10BIT))))) {
>  		DPU_DEBUG_PLANE(pdpu,
>  				"plane doesn't have scaler/csc for yuv\n");
> @@ -1439,8 +1438,8 @@ static int _dpu_plane_init_debugfs(struct
> drm_plane *plane)
>  				plane->dev->primary->debugfs_root);
> 
>  	/* don't error check these */
> -	debugfs_create_x32("features", 0600,
> -			pdpu->debugfs_root, &pdpu->features);
> +	debugfs_create_xul("features", 0600,
> +			pdpu->debugfs_root, (unsigned long 
> *)&pdpu->pipe_hw->cap->features);
> 
>  	/* add register dump support */
>  	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
> @@ -1613,7 +1612,6 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  	}
> 
>  	/* cache features mask for later */
> -	pdpu->features = pdpu->pipe_hw->cap->features;
>  	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
>  	if (!pdpu->pipe_sblk) {
>  		DPU_ERROR("[%u]invalid sblk\n", pipe);

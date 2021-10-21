Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7188436E53
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 01:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221F16E4FB;
	Thu, 21 Oct 2021 23:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BF66E4FB
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 23:29:09 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634858950; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q0ZeorRH7UFTVG5j7igB4tiSEnGqiW9rFq4LRLWJ4tA=;
 b=JBXfKILRsiQdAYBx2XiqwLT+6UOwRC+w27ocMIxnl7lENrvEngEcqIjCAW/pyb5x9iH8ZLN+
 FMB89gwEU+/f8/zOXetXOB26APgAuP+YnPScaX8/ycjI+LicR5Q6X0i7pXMcfYb+du5qS2cB
 AqUTzm47oMDfVeG5PScB3raO52Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6171f7c45ca800b6c1bc5e17 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 23:29:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1F748C43617; Thu, 21 Oct 2021 23:29:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 388A6C4338F;
 Thu, 21 Oct 2021 23:29:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 16:29:07 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 10/11] drm/msm/dpu: don't cache
 pipe->cap->sblk in dpu_plane
In-Reply-To: <20210930140002.308628-11-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-11-dmitry.baryshkov@linaro.org>
Message-ID: <73189f9aa0bb8df02b1cfd59bbb06623@codeaurora.org>
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
> Do not cache hw_pipe's sblk in dpu_plane. Use
> pdpu->pipe_hw->cap->sblk directly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 25 ++++++++---------------
>  1 file changed, 8 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index af403c0d3d7d..d8018e664925 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -109,8 +109,6 @@ struct dpu_plane {
>  	struct list_head mplane_list;
>  	struct dpu_mdss_cfg *catalog;
> 
> -	const struct dpu_sspp_sub_blks *pipe_sblk;
> -
>  	/* debugfs related stuff */
>  	struct dentry *debugfs_root;
>  	struct dpu_debugfs_regset32 debugfs_src;
> @@ -425,9 +423,9 @@ static void _dpu_plane_set_qos_ctrl(struct 
> drm_plane *plane,
>  	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
> 
>  	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
> -		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
> +		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
>  		pipe_qos_cfg.danger_vblank =
> -				pdpu->pipe_sblk->danger_vblank;
> +				pdpu->pipe_hw->cap->sblk->danger_vblank;
>  		pipe_qos_cfg.vblank_en = enable;
>  	}
> 
> @@ -982,10 +980,10 @@ static int dpu_plane_atomic_check(struct 
> drm_plane *plane,
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
>  							   new_plane_state->crtc);
> 
> -	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
> +	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
>  	ret = drm_atomic_helper_check_plane_state(new_plane_state, 
> crtc_state,
>  						  min_scale,
> -						  pdpu->pipe_sblk->maxdwnscale << 16,
> +						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
>  						  true, true);
>  	if (ret) {
>  		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
> @@ -1611,20 +1609,13 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  		goto clean_sspp;
>  	}
> 
> -	/* cache features mask for later */
> -	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
> -	if (!pdpu->pipe_sblk) {
> -		DPU_ERROR("[%u]invalid sblk\n", pipe);
> -		goto clean_sspp;
> -	}
> -
>  	if (pdpu->is_virtual) {
> -		format_list = pdpu->pipe_sblk->virt_format_list;
> -		num_formats = pdpu->pipe_sblk->virt_num_formats;
> +		format_list = pdpu->pipe_hw->cap->sblk->virt_format_list;
> +		num_formats = pdpu->pipe_hw->cap->sblk->virt_num_formats;
>  	}
>  	else {
> -		format_list = pdpu->pipe_sblk->format_list;
> -		num_formats = pdpu->pipe_sblk->num_formats;
> +		format_list = pdpu->pipe_hw->cap->sblk->format_list;
> +		num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
>  	}
> 
>  	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,

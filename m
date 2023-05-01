Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06BC6F3A54
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F8310E1FD;
	Mon,  1 May 2023 22:14:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6EB10E1FD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:14:01 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D671640E50;
 Tue,  2 May 2023 00:13:59 +0200 (CEST)
Date: Tue, 2 May 2023 00:13:58 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Message-ID: <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-30 23:35:54, Dmitry Baryshkov wrote:
> dpu_rm_init() contains checks for block->id values. These were logical
> in the vendor driver, when one can not be sure which values were passed
> from DT. In the upstream driver this is not necessary: the catalog is a
> part of the driver, we control specified IDs.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I was going to send this on top of [1] to prevent conflicts, but it
seems you beat me to it and also based it on top of that series, though
without mentioning the dependency in the cover letter.

[1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 34 --------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dffd3dd0a877..d5a06628885e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -122,10 +122,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  			continue;
>  		}
>  
> -		if (lm->id < LM_0 || lm->id >= LM_MAX) {
> -			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
> -			continue;
> -		}
>  		hw = dpu_hw_lm_init(lm, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -139,10 +135,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_merge_3d *hw;
>  		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
>  
> -		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
> -			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
> -			continue;
> -		}
>  		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -157,10 +149,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_pingpong *hw;
>  		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
>  
> -		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
> -			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
> -			continue;
> -		}
>  		hw = dpu_hw_pingpong_init(pp, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -177,10 +165,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_intf *hw;
>  		const struct dpu_intf_cfg *intf = &cat->intf[i];
>  
> -		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
> -			continue;
> -		}
>  		hw = dpu_hw_intf_init(intf, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -194,11 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_wb *hw;
>  		const struct dpu_wb_cfg *wb = &cat->wb[i];
>  
> -		if (wb->id < WB_0 || wb->id >= WB_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_wb_init(wb, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -212,10 +191,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_ctl *hw;
>  		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
>  
> -		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
> -			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
> -			continue;
> -		}
>  		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -229,10 +204,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_dspp *hw;
>  		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
>  
> -		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
> -			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
> -			continue;
> -		}
>  		hw = dpu_hw_dspp_init(dspp, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -259,11 +230,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_sspp *hw;
>  		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>  
> -		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> -- 
> 2.39.2
> 

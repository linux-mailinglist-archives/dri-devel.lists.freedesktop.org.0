Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BD70CD0C
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 23:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC110E062;
	Mon, 22 May 2023 21:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C889A10E062;
 Mon, 22 May 2023 21:56:43 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E4BC73EF03;
 Mon, 22 May 2023 23:56:41 +0200 (CEST)
Date: Mon, 22 May 2023 23:56:40 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
Message-ID: <tc35qb4qkzoanna5mqiibdfv5ascdm2wtcalbspr4u64nwkc3v@itowzdap5vjq>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
 <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Title suggestion: s/globally/on non-TE/DSI (INTF) blocks

On 2023-05-23 00:45:22, Dmitry Baryshkov wrote:
> Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
> INTF_SC7280_MASK) results in this bit (and corrsponding operations)
> being enabled for all interfaces, even the ones which do not have TE
> block. Move this bit setting to INTF_DSI_TE(), so that it is only
> enabled for those INTF blocks which have TE support.
> 
> Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We've always been setting flags globally but I guess it makes sense to
not only restrict this flag to DPU >= 5.0.0 but also just the few
hardware blocks that actually have these in their *enlarged* register
space (and have the interrupt).

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 1dee5ba2b312..162141cb5c83 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -101,7 +101,6 @@
>  
>  #define INTF_SC7180_MASK \
>  	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_TE) | \
>  	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
>  	 BIT(DPU_DATA_HCTL_EN))
>  
> @@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
>  	{\
>  	.name = _name, .id = _id, \
>  	.base = _base, .len = _len, \
> -	.features = _features, \
> +	.features = _features | BIT(DPU_INTF_TE), \

Now that we're more broadly switching to this pattern, should we do the
same for PP_BLK() with and without TE block?  That way we can also
forcefully initialize intr_rdptr=-1 similar to what I did for
intr_tear_rd_ptr in INTF_BLK() (vs INTF_BLK_DSI_TE) here, instead of
having the -1's floating around the catalog when I added them in commit
7952f5180eb3e ("drm/msm/dpu: Remove intr_rdptr from DPU >= 5.0.0
pingpong config").

- Marijn

>  	.type = _type, \
>  	.controller_id = _ctrl_id, \
>  	.prog_fetch_lines_worst_case = _progfetch, \
> -- 
> 2.39.2
> 

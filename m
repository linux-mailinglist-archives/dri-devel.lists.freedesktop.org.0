Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 397576F3A4D
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF6D10E135;
	Mon,  1 May 2023 22:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 452D110E143
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:09:49 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E890840E49;
 Tue,  2 May 2023 00:09:44 +0200 (CEST)
Date: Tue, 2 May 2023 00:09:43 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with IS_ERR
 during DSC init
Message-ID: <cmkvktebxu6ipw457ccvftyf5ongqccwcg4nabweihsty2zfom@gusuq2kh4zi4>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-2-dmitry.baryshkov@linaro.org>
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

On 2023-04-30 23:35:53, Dmitry Baryshkov wrote:
> Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
> the value is NULL, then the function will return 0 instead of a proper
> return code. Moreover dpu_hw_dsc_init() can not return NULL.

More specifically, it allows the init functions to return NULL when they
do their own filtering and return NULL (as I do in [1] inside
dpu_hw_intf_init for INTF_NONE so that rm->hw_intf for that index is
assigned NULL, rather than failing the entire dpu_rm_init).

[1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/

> Replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

It's just one, but that technically counts as "all".

> This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
> in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
> then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
> RM") added it back for DSC init.

Nit: it did not technically add it "back"; there was no DSC code to
begin with but I'm not sure how to concisely word that by explaining
that init was copied from downstream following downstream patterns (I
think) rather than observing local upstream context.  And not worth it
if there's no resend.

> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Regardless of the wording nits, the change is:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index f0fc70422e56..dffd3dd0a877 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -247,7 +247,7 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>  
>  		hw = dpu_hw_dsc_init(dsc, mmio);
> -		if (IS_ERR_OR_NULL(hw)) {
> +		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
>  			DPU_ERROR("failed dsc object creation: err %d\n", rc);
>  			goto fail;
> -- 
> 2.39.2
> 

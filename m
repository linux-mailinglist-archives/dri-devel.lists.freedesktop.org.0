Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186F16F3A63
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 00:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2490010E204;
	Mon,  1 May 2023 22:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538A810E204
 for <dri-devel@lists.freedesktop.org>; Mon,  1 May 2023 22:23:07 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A040540E5E;
 Tue,  2 May 2023 00:23:05 +0200 (CEST)
Date: Tue, 2 May 2023 00:23:04 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to dpu_lm_init()
Message-ID: <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
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

On 2023-04-30 23:35:56, Dmitry Baryshkov wrote:
> Move the check for lm->pingpong being not NONE from dpu_rm_init() to
> dpu_lm_init(), following the change to dpu_hw_intf_init().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In some way I also suggested this change in [1], but did not receive a
(N)ACK.

[1]: https://lore.kernel.org/linux-arm-msm/ecopixnagol7yd5znvmjanknqbv7vi4ayy36vchaeyyhuavu4w@rkdfllrd4uzb/

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 214f207ddf8a..d1c3bd8379ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
>  {
>  	struct dpu_hw_mixer *c;
>  
> +	if (cfg->pingpong == PINGPONG_NONE) {
> +		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
> +		return NULL;
> +	}
> +
>  	c = kzalloc(sizeof(*c), GFP_KERNEL);
>  	if (!c)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bf7b8e7c45b1..2ca3c666e22f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_mixer *hw;
>  		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>  
> -		if (lm->pingpong == PINGPONG_NONE) {
> -			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_lm_init(lm, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> -- 
> 2.39.2
> 

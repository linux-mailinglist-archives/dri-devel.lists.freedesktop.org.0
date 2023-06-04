Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 439CE721A8C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 00:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78FDB10E029;
	Sun,  4 Jun 2023 22:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D3810E029
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Jun 2023 22:00:29 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F38743E761;
 Mon,  5 Jun 2023 00:00:25 +0200 (CEST)
Date: Mon, 5 Jun 2023 00:00:24 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2] drm/msm/dpu: clean up dpu_kms_get_clk_rate() returns
Message-ID: <kpxutvwb57ufiveujewgzqotnnx6xgdcws5e5r6lpl6qipadh7@umn3l2l2z3j3>
References: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28644c5e-950e-41cd-8389-67f37b067bdc@kili.mountain>
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
Cc: Liu Shixin <liushixin2@huawei.com>, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-26 14:51:59, Dan Carpenter wrote:
> Static analysis tools complain about the -EINVAL error code being
> stored in an unsigned variable.  Let's change this to match
> the clk_get_rate() function which is type unsigned long and returns
> zero on error.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: In v1 I change the type to int which was wrong.  This is a different
>     approach.  CC the freedreno list this time too.

Just like v1, should we clean up the <= in
dpu_encoder_phys_cmd_tearcheck_config (to just `if (!vsync_hz)`),
because doing a <=0 on a u32 has a more limited meaning?

> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 0e7a68714e9e..25e6a15eaf9f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -979,13 +979,13 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
>  	return 0;
>  }
>  
> -u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
> +unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name)
>  {
>  	struct clk *clk;
>  
>  	clk = msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, clock_name);
>  	if (!clk)
> -		return -EINVAL;
> +		return 0;
>  
>  	return clk_get_rate(clk);
>  }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index aca39a4689f4..961918e5a5b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -201,6 +201,6 @@ void dpu_disable_vblank(struct msm_kms *kms, struct drm_crtc *crtc);
>   *
>   * Return: current clock rate

Or 0 if this clock is not available/present.

- Marijn

>   */
> -u64 dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
> +unsigned long dpu_kms_get_clk_rate(struct dpu_kms *dpu_kms, char *clock_name);
>  
>  #endif /* __dpu_kms_H__ */
> -- 
> 2.39.2
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A440370B7FB
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:48:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA410E278;
	Mon, 22 May 2023 08:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B0A10E278
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:47:56 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A203A3F2EA;
 Mon, 22 May 2023 10:47:51 +0200 (CEST)
Date: Mon, 22 May 2023 10:47:50 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: signedness bug in
 dpu_encoder_phys_cmd_tearcheck_config()
Message-ID: <wxfpgm77uxae5mhpht35m4kgrcx2givdp2duncxduz7hrlcofz@sp5wxfqx63fg>
References: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <897779a0-1a1f-4193-9dd3-bc4f87e73e3c@kili.mountain>
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
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <sean@poorly.run>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-22 10:48:01, Dan Carpenter wrote:
> The "vsync_hz" variable is used to store negative error codes so it
> needs to be signed for the error checking to work correctly.

Nicely spotted, but it it looks like we have more to fix then.  The type
returned by dpu_kms_get_clk_rate() is u64:

- Perhaps the int used in this patch is too small (though 19.2MHz vsync
  clock ought to fit);
- That function should also return a signed number as part of this
  contract.

- Marijn

> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 74470d068622..b29e6d1ba7f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -320,7 +320,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
>  	struct dpu_hw_tear_check tc_cfg = { 0 };
>  	struct drm_display_mode *mode;
>  	bool tc_enable = true;
> -	u32 vsync_hz;
> +	int vsync_hz;
>  	struct dpu_kms *dpu_kms;
>  
>  	if (!phys_enc->hw_pp) {
> -- 
> 2.39.2
> 

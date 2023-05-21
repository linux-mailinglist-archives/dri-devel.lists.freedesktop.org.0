Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BFD70B0DE
	for <lists+dri-devel@lfdr.de>; Sun, 21 May 2023 23:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA6F10E0E5;
	Sun, 21 May 2023 21:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B40010E207
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 21:32:11 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6169B3F342;
 Sun, 21 May 2023 23:32:09 +0200 (CEST)
Date: Sun, 21 May 2023 23:32:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE
 define
Message-ID: <blpuhpusgflnpshadkmbmrmxxd5yhrqsk27gxrk36vnvnrgfg6@o4jeuokwegha>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
 <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
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

On 2023-05-21 22:22:29, Dmitry Baryshkov wrote:
> This define is used only in one place, in dpu_encoder debugfs code.
> Inline the value and drop the define completely.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Even if this was a constant, always a fan of sizeof(name) versus
assuming that name has some length constant/define!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 2 --
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 --
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index c771383446f2..af34932729db 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2116,14 +2116,14 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
>  
> -	char name[DPU_NAME_SIZE];
> +	char name[12];
>  
>  	if (!drm_enc->dev) {
>  		DPU_ERROR("invalid encoder or kms\n");
>  		return -EINVAL;
>  	}
>  
> -	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
> +	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
>  
>  	/* create overall sub-directory for the encoder */
>  	dpu_enc->debugfs_root = debugfs_create_dir(name,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 66209e2448d2..c4f82180ad10 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -63,8 +63,6 @@
>  #define ktime_compare_safe(A, B) \
>  	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
>  
> -#define DPU_NAME_SIZE  12
> -
>  struct dpu_kms {
>  	struct msm_kms base;
>  	struct drm_device *dev;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 14b5cfe30611..ac75ba13aa01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -42,8 +42,6 @@
>  #define SHARP_SMOOTH_THR_DEFAULT	8
>  #define SHARP_NOISE_THR_DEFAULT	2
>  
> -#define DPU_NAME_SIZE  12
> -
>  #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>  #define DPU_ZPOS_MAX 255
>  
> -- 
> 2.39.2
> 

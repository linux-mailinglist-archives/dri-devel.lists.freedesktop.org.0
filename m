Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB6658BED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 11:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1426E10E25D;
	Thu, 29 Dec 2022 10:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490CC10E259
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 10:48:09 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D92023F114;
 Thu, 29 Dec 2022 11:47:31 +0100 (CET)
Date: Thu, 29 Dec 2022 11:47:30 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] drm/msm/adreno: Make adreno quirks not overwrite each
 other
Message-ID: <20221229104730.guopbgyleb6hif4h@SoMainline.org>
References: <20221229101846.981223-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221229101846.981223-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 agross@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-29 11:18:45, Konrad Dybcio wrote:
> So far the adreno quirks have all been assigned with an OR operator,
> which is problematic, because they were assigned consecutive integer
> values, which makes checking them with an AND operator kind of no bueno..
> 
> Switch to using BIT(n) so that only the quirks that the programmer chose
> are taken into account when evaluating info->quirks & ADRENO_QUIRK_...
> 
> Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Nice catch!

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

Not sure if it's the right Fixes commit though, as it would have worked
when ADRENO_QUIRK_LMLOADKILL_DISABLE was added with constant 4 instead
of 3 in 370063ee427a ("drm/msm/adreno: Add A540 support"), but then
using bitflags in an enum value type is invalid anyway, AFAIK.

- Marijn

> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index c85857c0a228..5eb254c9832a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -29,11 +29,9 @@ enum {
>  	ADRENO_FW_MAX,
>  };
>  
> -enum adreno_quirks {
> -	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
> -	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
> -	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
> -};
> +#define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
> +#define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
> +#define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  
>  struct adreno_rev {
>  	uint8_t  core;
> @@ -65,7 +63,7 @@ struct adreno_info {
>  	const char *name;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
> -	enum adreno_quirks quirks;
> +	u64 quirks;
>  	struct msm_gpu *(*init)(struct drm_device *dev);
>  	const char *zapfw;
>  	u32 inactive_period;
> -- 
> 2.39.0
> 

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B3669022C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 09:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9909110E948;
	Thu,  9 Feb 2023 08:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-fw-80006.amazon.com (smtp-fw-80006.amazon.com
 [99.78.197.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E63610E6C0;
 Wed,  8 Feb 2023 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1675880478; x=1707416478;
 h=date:from:to:cc:message-id:references:mime-version:
 in-reply-to:subject;
 bh=KBO2VYxNnhi+mYdSb2ex0Tcoin8hOOA965wqenytq3M=;
 b=ta0f7vNn3y46sTvHMfRNOGbg6JR0L3UVV3npQn4AXdIb7my5e+tgWPNJ
 Rs9a4JsC5J+eD4lJ1TamlUICVdFuUV3rNKOvrK8d2j45Mk+fP5uxMO0Qd
 63sgPhWMuLXuwrfyDdERln5yS4FPgcC+c53nxlnu0y2mmDK256o1L5Ike A=;
X-IronPort-AV: E=Sophos;i="5.97,281,1669075200"; d="scan'208";a="179809775"
Subject: Re: [Freedreno] [PATCH 09/14] drm/msm/a6xx: Fix some A619 tunables
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com)
 ([10.25.36.210]) by smtp-border-fw-80006.pdx80.corp.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 18:21:16 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1d-m6i4x-d7759ebe.us-east-1.amazon.com (Postfix)
 with ESMTPS id D2B4C42F67; Wed,  8 Feb 2023 18:21:04 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.45; Wed, 8 Feb 2023 18:21:03 +0000
Received: from amazon.com (10.43.160.120) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.24; Wed, 8 Feb 2023
 18:21:03 +0000
Date: Wed, 8 Feb 2023 11:21:01 -0700
From: Jordan Crouse <jorcrous@amazon.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <20230208182101.53ykatzah6zvpy76@amazon.com>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 agross@kernel.org, krzysztof.kozlowski@linaro.org,
 freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 Chia-I Wu <olvaffe@gmail.com>, linux-kernel@vger.kernel.org
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
 <20230126151618.225127-10-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230126151618.225127-10-konrad.dybcio@linaro.org>
X-Originating-IP: [10.43.160.120]
X-ClientProxiedBy: EX13D32UWA002.ant.amazon.com (10.43.160.230) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
X-Mailman-Approved-At: Thu, 09 Feb 2023 08:30:13 +0000
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
Cc: Sean Paul <sean@poorly.run>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, krzysztof.kozlowski@linaro.org,
 agross@kernel.org, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 26, 2023 at 04:16:13PM +0100, Konrad Dybcio wrote:
> Adreno 619 expects some tunables to be set differently. Make up for it.
> 
> Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 7a480705f407..f34ab3f39f09 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1171,6 +1171,8 @@ static int hw_init(struct msm_gpu *gpu)
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
>         else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
> +       else if (adreno_is_a619(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
>         else if (adreno_is_a610(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
>         else
> @@ -1188,7 +1190,9 @@ static int hw_init(struct msm_gpu *gpu)
>         a6xx_set_ubwc_config(gpu);
> 
>         /* Enable fault detection */
> -       if (adreno_is_a610(adreno_gpu))
> +       if (adreno_is_a619(adreno_gpu))
> +               gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
> +       else if (adreno_is_a610(adreno_gpu))
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
>         else
>                 gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

The number appended to the register is the number of clock ticks to wait
before declaring a hang. 0x3fffff happens to be the largest value that
can be set for the a6xx family (excepting the 610 which, IIRC, used older
hardware that had a smaller field for the counter). Downstream the
number would creep up over time as unexplained hangs were discovered and
diagnosed or covered up as "just wait longer".

So in theory you could leave this with the "default value" or even bump
up the default value to 0x3fffff for all targets if you wanted to. An
alternate solution (that downstream does) is to put this as a
pre-defined configuration in gpulist[].

Jordan

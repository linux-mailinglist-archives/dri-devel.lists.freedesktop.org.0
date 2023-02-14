Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F0697032
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 22:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7B10E036;
	Tue, 14 Feb 2023 21:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38AB210E036;
 Tue, 14 Feb 2023 21:56:24 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-16dcb07b805so14264631fac.0; 
 Tue, 14 Feb 2023 13:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KSatBS/MK7pWYdNv/VGlbNMDCcLZ1O3J6AhpFAuuvQc=;
 b=KOHGs9dCx/MV5ZSbYtdWT5FCwSTrVkX2xYV6S0HrXEr4H00koyiEhV1NXFgvu61Fne
 kxPQi+ZqgnPIpsXOq11R3ZCV9GkMCuAdxzdfFt0w99rPOPFvW6jg5qo3cUBbBxWCUGn5
 y6cyxVh/MBz6dVPj3nyEwUc7wZTw1Od0lYgqeQxrqwwFUCw9wf2CnvJxd38tY57sONk7
 9+p1YPMPH9hPUSbe5cXZMKYY/CGcFsfuXB5DjKjg1V1jx8GyfhLlq+6e2DpGN0HnphK3
 fVMqkGR6fQfswCa930JZoYgmd+Xh60/FFbRI2U2dqRX1jsuil4sgXdeFbOkW7SeU6VIE
 CO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KSatBS/MK7pWYdNv/VGlbNMDCcLZ1O3J6AhpFAuuvQc=;
 b=ZTQSB5RU0LdM7kmRfoFb/bU7pio4+C06BPaTVBVJ1lrHyHF6LXHSfY5PXSZBJSpw7f
 40nbSbhheu9QAu/iPxron4GhgPxYsET29kV54G1YemBVkuGpRzdjly2dULS8HYFdH69r
 7rWtwAhYUndtRDf++fstX1X7ApDGpDnshahTVsHKuYJPw02rvL2CrRl8LWgYGtK46U3o
 UmTWycVVxyCVPRQooCHBY7Eydc8CoWRPTF7TJMfyHC167ym9WZmiQDq53Ms4xsF7bEPS
 A15Ir/gwvAfHJC+ID81aHyDFRkduDn4GtMPeRDLMMwkc2lUjOEDWVCrVyt7WkeK2gNYD
 bMaA==
X-Gm-Message-State: AO0yUKUvGdlz0JLwvV5li6veptpR/5FE9r5wxAvR2YBii4u5qkkQ020b
 g6Pb41vKE4iX1ZOd3xQ5X97TRCSZxpzHZ0t9MGc=
X-Google-Smtp-Source: AK7set/1yYVnUjCEQyoiqfPka498lLP+fGlZ/ugd5TRwuKES936/s9KcP5OJ6pv2MK1r++0COFnb908+NObCmlnu0C4=
X-Received: by 2002:a05:6871:259b:b0:16e:2bc5:1601 with SMTP id
 yy27-20020a056871259b00b0016e2bc51601mr32544oab.38.1676411783384; Tue, 14 Feb
 2023 13:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
 <20230214173145.2482651-11-konrad.dybcio@linaro.org>
In-Reply-To: <20230214173145.2482651-11-konrad.dybcio@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 14 Feb 2023 13:56:12 -0800
Message-ID: <CAF6AEGva3ecxTOx3Yb+Wh-1K=jYA3tDo_aXg09jS9pzJupYExQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/14] drm/msm/a6xx: Fix up A6XX protected registers
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 agross@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 14, 2023 at 9:32 AM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> One of the protected ranges was too small (compared to the data we
> have downstream). Fix it.
>
> Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 503c750216e6..d6b38bfdb3b4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
>         A6XX_PROTECT_NORDWR(0x00800, 0x0082),
>         A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
>         A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
> -       A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
> +       A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),

Nak, this is intentional, we need userspace to be able to configure
the CP counters.  Otherwise this would break fdperf, perfetto, etc

(although maybe we should comment where we diverge from downstream)

BR,
-R

>         A6XX_PROTECT_NORDWR(0x00900, 0x004d),
>         A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
>         A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
> --
> 2.39.1
>

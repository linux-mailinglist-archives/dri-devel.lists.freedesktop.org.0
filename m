Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF329605D3
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2024 11:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C129F10E2C7;
	Tue, 27 Aug 2024 09:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JdQXMcf9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9E910E2C6;
 Tue, 27 Aug 2024 09:39:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 15081A40BE7;
 Tue, 27 Aug 2024 09:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38584C567ED;
 Tue, 27 Aug 2024 09:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724751593;
 bh=tTOdIYGEpUYrs7p5lDLezY5WL2wSjJff06XLjNySGvo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JdQXMcf9y+ZrimiTarq68UJig4tgGu8n6JaFX46gXQIF5W5t5Oy1Oe2VPjHl7h9h/
 JDLr7WsHFWSurjIcf5XRGIcW/Tnn4zEV3YijsbjVSuSn2RSQMEo0OLjKsf7BCqan5A
 //YhAZd0HHeNUtNmfR33PuDttndBa8vmcyTpGdcYKFxiw8BymoZrVjuEdpYjybPNVR
 01ufIm0CyAm6wA4tsWnUj7nTZQI1svsFDOKptC6m3qh7ZXxfTjlrC1ATLoVGNsqF5T
 DZMEn1K0GuwUw1eyaiGxwABan5lnvEy1lEyOdti8tKMXg1RcwuIbblIxYNqkt0aaSA
 zmmOyK4oeguYA==
Message-ID: <1efd71c4-3bee-4c71-9e40-1284b9483824@kernel.org>
Date: Tue, 27 Aug 2024 11:39:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jeykumar Sankaran <jsanka@codeaurora.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2.08.2024 9:47 PM, Dmitry Baryshkov wrote:
> DPU debugging macros need to be converted to a proper drm_debug_*
> macros, however this is a going an intrusive patch, not suitable for a
> fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> to make sure that DPU debugging messages always end up in the drm debug
> messages and are controlled via the usual drm.debug mask.
> 
> I don't think that it is a good idea for a generic DPU_DEBUG macro to be
> tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
> default it should go to the DRM_UT_DRIVER channel. While refactoring
> debug macros later on we might end up with particular messages going to
> ATOMIC or KMS, but DRIVER should be the default.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index e2adc937ea63..935ff6fd172c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -31,24 +31,14 @@
>   * @fmt: Pointer to format string
>   */
>  #define DPU_DEBUG(fmt, ...)                                                \
> -	do {                                                               \
> -		if (drm_debug_enabled(DRM_UT_KMS))                         \
> -			DRM_DEBUG(fmt, ##__VA_ARGS__); \
> -		else                                                       \
> -			pr_debug(fmt, ##__VA_ARGS__);                      \
> -	} while (0)
> +	DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__)

Should we just get rid of these macros at this point and use
DRM_DEBUG_DRIVER directly?

Konrad

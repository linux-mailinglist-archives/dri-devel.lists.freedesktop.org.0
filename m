Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F0C92734A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4CD10EA73;
	Thu,  4 Jul 2024 09:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mVl6ytLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B0910EA74
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 09:47:31 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ee4ab4076bso12752651fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 02:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720086450; x=1720691250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=35N2PrXzYxiJZwkwJHk2aUwLzMamAemczMI+Lfl3A9Q=;
 b=mVl6ytLFB9Q+vEQmWbnZJeIS7kluqybMrm6j7v5nGWWRBRMikLC/k4wljHR90ewdzg
 XibaA6ZT4V77CKoCASxYn8ZKaxhtgYSYp+EbkYLo9I6DwDu3SFAxqcmMg5w9S/hvwkko
 3nu7vGIlGSFsesaLctUFk6uV67ICcwtiiR5bsKvUGlpU0kFAdb5pjZiNPoPSKl9mySVY
 9O80iUBDmiIxtSleuAcW4TVJlMHZW3bC5RE9+VrxceaHUs/xC2oLSTpkjp2j6HxObn4A
 XQ+NtEgmU2/zX/Xj9n1+0+kicZgiLXnrHvoKY0HBMIp1RU+tYtFCVQCMsJ+NolpQXYL8
 DCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720086450; x=1720691250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=35N2PrXzYxiJZwkwJHk2aUwLzMamAemczMI+Lfl3A9Q=;
 b=l8pmaljY7VYZWTifkHVB0gryBtn+U0F3DsqLclygIK2uOqkoGu67w9Y/lHpTz0wcLr
 SLFz9GtQNc+xGEJLNRPeUVll5yuovGG8eVXsVbd3G6myrX12MaYEHRiS+mr4/uJAI1vI
 PkEgKplY19dstQjIdP0Ujk3+LsMod8n6riQDg0bTF7UBFZYpk9P2VO8JKvki3ZGYZxhX
 TwcTcw3kJo8Me01ocGDz5yQRtMkVE3fBx2M2OcYPDu1dE1ck7fSYj6bc92B0txOaOnDT
 7VC68Fr5jx+NSX24eYk32Ih0pv577h/rFhIj7xtqV9Y6EVu8SlucuTCjEnIqCGJAZ5jZ
 XHHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBIDhnYv2fTg4T6B2umpwSTsm94wlnv/vYDAqGArDC3zNUpF4Dzoc2eWR6+gtEVGzi+mpmMg/fjtXCIoNh2ctoOsvAizj0gPyDF6ZWL79/
X-Gm-Message-State: AOJu0YyCC1vb7UA74dEh1MtoBBsaRvWngE5OmqEuAKW8HOTFJiY36Wrx
 M8RiDp/ReFglIA+uEfEgcCJH8FfyghcqBHH2rRJt8jWy7d0J0Q4OzKqjMQ6Y5ZM=
X-Google-Smtp-Source: AGHT+IHY10vCx+yPAsfjMVF2tw9KVqfnRtV2MHnfk54hzEFRlKpMtmNraZr7IHPDg143p/NmuRLI2g==
X-Received: by 2002:a2e:3312:0:b0:2ee:8aa7:4885 with SMTP id
 38308e7fff4ca-2ee8f2bce1emr3526411fa.14.1720086449816; 
 Thu, 04 Jul 2024 02:47:29 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::b8c?
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5168cf96sm21284091fa.108.2024.07.04.02.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 02:47:29 -0700 (PDT)
Message-ID: <019146e8-25b3-474a-b433-c69d4fbe0ee0@linaro.org>
Date: Thu, 4 Jul 2024 12:47:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix incorrect file name output in
 adreno_request_fw()
To: Aleksandr Mishin <amishin@t-argos.ru>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20240704093002.15155-1-amishin@t-argos.ru>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240704093002.15155-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/07/2024 12:30, Aleksandr Mishin wrote:
> In adreno_request_fw() when debugging information is printed to the log
> after firmware load, an incorrect filename is printed. 'newname' is used
> instead of 'fwname', so prefix "qcom/" is being added to filename.
> Looks like "copy-paste" mistake.
> 
> Fix this mistake by replacing 'newname' with 'fwname'.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 9fe041f6fdfe ("drm/msm: Add msm_gem_get_and_pin_iova()")

Fixes tag is incorrect, LGTM otherwise.

> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 074fb498706f..0bb7d66047f8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -475,7 +475,7 @@ adreno_request_fw(struct adreno_gpu *adreno_gpu, const char *fwname)
>   		ret = request_firmware_direct(&fw, fwname, drm->dev);
>   		if (!ret) {
>   			DRM_DEV_INFO(drm->dev, "loaded %s from legacy location\n",
> -				newname);
> +				fwname);
>   			adreno_gpu->fwloc = FW_LOCATION_LEGACY;
>   			goto out;
>   		} else if (adreno_gpu->fwloc != FW_LOCATION_UNKNOWN) {

-- 
With best wishes
Dmitry


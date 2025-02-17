Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8813A38BFB
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 20:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C610E5BA;
	Mon, 17 Feb 2025 19:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vi51V+ky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A757C10E5BA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 19:07:51 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5461cb12e39so1615729e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 11:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819270; x=1740424070; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
 b=Vi51V+kycAm7oIDoFIpX1BulShUd9oAAHVm3hW+SPAIqZCVD5pwmjOaKAR7wNMPH0Z
 +k2kEiOAgt7TBJgnyfu3hfR3rC6g27qvkGwU/pW9kq/luKbtmDlKtetv5SEShDzpNScL
 jMh7XVVHD7IrCQieYnUBS+uheei9dAfn72DdqhQ43p5TyXv+PClC/ARLNZvbMuBWXHts
 JqoPuyb5cscqQjkCqFCLGHkaq7OsmKF2uS76AdJewXJKHLJRiA7oLKhmOAIFSCdsYYrd
 8d015s0rqN//HTjYy5mymhXPPKSuowFbOqKKcuQkhdt7fO2rSjAdwJZZuiKOXlSQZS2/
 FUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819270; x=1740424070;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ObUne2yQMezeKiKaLoIvFCZpEHW3DUQ78CPgFXgb8A=;
 b=EmRlH1DRWxymqf6MDPhZmWz81WDALU3qaqg9AERTDg92hDmfCFwvC6PGateEMTQeI0
 DoQbQeANs4W3jalL8N2lKMcz91ltVlr6mLlf13+ONVV/C2U7H/88bQbmkRD6qs7G6IZ0
 WjuWOmSHc5zMc7MO8zL2/Dy0iB/RCEeQE3bBPo5OgKmx/vxuQ8QLl/4DIyR9Dsu5J9O2
 fYaFGkfy2cOdGhYmK1DEFUa1Ji72Ij9Qkr7ycrpu7wOePzHlhQ4K1fpwSft/ba+SU3ke
 Np2dHTUES7rW6PD9ZB5qKz+J5Y99nzwp6UB30E/diH0EbOtHKaBaK3UriRyYXRhHb53O
 LQcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVA+ENI200CF/7lb8PFCofBm9ydKPYOGznOuaDiuHocSWmm8IWNSmsaTk2q+t+tweqKvtj0ZKYWO04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2VpXkWxJSdrYubu9Hs5AJiLWSwSHzIWoSjP92sZRC/A0DVbY8
 rm6ywHSbkK/RoKWMrGZe66wMlNM3LyM4K8g9ApjEA7jc4AVzPbpVsaTE1PllKfh4asJSaURFo7K
 7
X-Gm-Gg: ASbGnctPlkdMbd41gi4cGvdK0x7cRlmQXu25GZ8v56w46Ha3PDwgxJSfzx+Dh2x+58d
 6x8t9IB+kBUXXR9fHHWe1P8c+F5ivsBzue8CqXsyEt6ATJpm9/aMVsqYCn7mSxOPzUREFYhpIHO
 0KMCMeVgNg4/CavUfP0scd4SZ3MKRowohsTgHDt52wNoOVtBLVIncMq2pC59HcIbTeWMHr/IYfP
 kqwsmy1Wjtz0FjyPCCeHfbqT/AJZ3tnV2Z6pFUQzVEh/UUjOHxGFwVV2P7MYRysi5RKcXbvVpGc
 ixl6L67Zj7vaMRqpy4gCLRthVX4QUBXOMcToI8TWPkQawHcl811Su9dehLxhqNwp/zFMYS4=
X-Google-Smtp-Source: AGHT+IG9DynPxWNwdOmU6ii3AvcgWu++/3DPvh1LUYd7jp9CBTvIMdEBiRwbV324OAhQ4qab/et7NQ==
X-Received: by 2002:a05:6512:308b:b0:545:25c6:d6f5 with SMTP id
 2adb3069b0e04-5452fe96673mr2812097e87.53.1739819269896; 
 Mon, 17 Feb 2025 11:07:49 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461ee8341fsm612141e87.133.2025.02.17.11.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:07:48 -0800 (PST)
Date: Mon, 17 Feb 2025 21:07:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 13/16] drm/msm/dpu: Add support for SM8750
Message-ID: <qfbynkd3d5uqlzcgvcsfoi3muoij4ap3kkkwug5yd3ggxbhiic@6epod27ux5ai>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-13-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:34PM +0100, Krzysztof Kozlowski wrote:
> Add DPU version v12.0 support for the Qualcomm SM8750 platform.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Add CDM
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    | 496 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 527 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

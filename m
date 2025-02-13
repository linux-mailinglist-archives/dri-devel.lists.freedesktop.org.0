Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C779A34A4B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C6F610EB36;
	Thu, 13 Feb 2025 16:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IddctXV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FAA10EB36
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:42:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54508b026d1so898042e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464930; x=1740069730; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
 b=IddctXV1YqiGEAFIq7PDVggyIZzOK7nbH8xUJsFW2eo9ORikm1tbk/eQ+wpI/Q5s8I
 VzB2hGPM2tDra/arD+qBmvyAck7PdYCQRT7FiZAXV59yVKrSf/3HlC/5NPwNXEM/Eetq
 mgpN8dHcP9EEfkMsMAgfNeGJv8WoQlt38271gaRCKxC0Hl8eQWsJgIVgYmr5usq/YwZS
 vc3mFQGkRAK8JG1TalQpuMlI3eUYLdWNyy65LbdUiKk4dtHOj3s9I2gvhpGEl0fEQm3d
 CVKxphQrmCHa3OnxaQnmKV8tZ5wu76K6/aAXuOxhgBaEIqrfhCuhkQMGNmHbnHXYt6GH
 dB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464930; x=1740069730;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1RWxYWTxZAj0F+vDqmj/VMNxzXDPmkoI5uZXNhq06BA=;
 b=IL8wu8XEH3Raq61qJ9rLLE53l8WHWcHN4OuVB1jacySY8+nxUdB3AAe5HwFCW4jaqV
 /8cOnOh/Gz3xVOcvHWUVJ51iz7dz5d7HTE1iXGhjmu02TpWVJVpbp1qcGKssnCT6gTkX
 hewgs1qPFXZn7ybEvbwTs2iD/C4FGCnEO9l56x13lksFJ2GXKNptSlMmR0KWMX2NR4Y3
 NOb2IGLmKq+oTI1kDn+2jJwILtXpUdXE2P943TH5gWqyDOa8G2yjCpPlogWRLMSdD7gf
 W5KGEcUpqhtGJ7x1+uTlK6AJFtG8qzO7PW1FfB8G3QPTlajexV7ZzJhok6wSF+1ov4Is
 RD7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpB1Yy4KaByKn9PJO5/OCQZWdZ1jK30/1xDMBbYVCc7y5Bwil6YOLpn5UntK6yNGfx0sfei6lsDzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU/meFU+NPWyRvd1GCY8Vbs8tHbnHM+w1bla8X1RoOiGClhtYM
 tF0cVDqi+PN7QFKH133Q9JAL0MuMhaTL3vILFmmdgrp2MRhdNJ+yUzRV6rDECto=
X-Gm-Gg: ASbGncvxmTkyVZeBLCXhA6jMwPIeDOc/RvCLBY50+WCcqGNh7oOAG74DBmrXfIqMTkZ
 TMQI9gB77xac2VJlhw9BpFy8yjZFa2HItm9NU9SW2jB8yd5iMjcKm8kbrF3uMlMuFtZuGP3Mica
 boM2iNa/iwYmoEclpN7GN155FO4yyDmFvqQXG1tkLWWFrCYJm3mCnBXmLs0vl1yHrNtUcc6F01m
 uzRIssfoIYeu+IkepOjHNcizuI3QK7e3GwhI0tqKD07rmhGJ5HB8LD+9wxf7ScNltowlwYOa/eJ
 jPxYxWlo1idoRiLwEvhP42af+oBsS0j7seSqInTglO+6Swx0tOX5bXieb5iRSNgIvAB6rL0=
X-Google-Smtp-Source: AGHT+IEK8JK5DtZLaAkJMolAlSlboIjYitOyjK3vekr4hRL/4+W/nuknTnupS56IhVxnTVQaQLo3jw==
X-Received: by 2002:ac2:4e04:0:b0:542:2e09:639a with SMTP id
 2adb3069b0e04-545180ea26dmr2471042e87.10.1739464929907; 
 Thu, 13 Feb 2025 08:42:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f09d0d4sm218066e87.100.2025.02.13.08.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:42:08 -0800 (PST)
Date: Thu, 13 Feb 2025 18:42:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>
Subject: Re: [PATCH 0/5] EDITME: Support for Adreno 623 GPU
Message-ID: <wdeqpz7ckpzw5sx7pigcp7fjx7nf4irz23kvj6xwamv34vfyba@rwzavxd5o6o3>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
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

On Thu, Feb 13, 2025 at 09:40:05PM +0530, Akhil P Oommen wrote:

Nit: subject needs to be fixed

> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Jie Zhang (5):
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,
> -- 
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 

-- 
With best wishes
Dmitry

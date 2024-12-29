Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 745469FDD56
	for <lists+dri-devel@lfdr.de>; Sun, 29 Dec 2024 05:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB35B10E25E;
	Sun, 29 Dec 2024 04:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j1NrM8p2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE5A10E25E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Dec 2024 04:51:40 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5d3d2a30afcso14689536a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Dec 2024 20:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735447839; x=1736052639; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=chdPQNE/j8Xw45cOV5VKgoIPj08nYhEDdCs+/0/t6qw=;
 b=j1NrM8p27X6+SlEmpVwEthYS+fYWLg4H7stA1PjQQEn497kZnpDWQWfSt0Yspn07H4
 XXvR+1cB+gsjATrfRWWiQYk7IfdnJ6wLtnzl1PNa7XrEZdkyjM4z6ueU/50cfWzRNZ5Z
 rTfj+0u7VVxOOAvDBJXMPZ9SbK6+HeEcIXKlriXxQcMG+eACuId6s+NFtDo2KM9JHq4j
 LMc9r0c/+OGJtzP367Bj606SSaeP1mI2VX3ns3jPtc+ZkkvRCXI3vanYLJMBN5TVajiM
 izPHRJdJJqDYXJT2V6+9h4WS8IT6w+VjPaiT+cuKZR/gEVXdK1qTG5AwLhRYl5Vc5rT2
 t1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735447839; x=1736052639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=chdPQNE/j8Xw45cOV5VKgoIPj08nYhEDdCs+/0/t6qw=;
 b=VHuC/rrvxsnZlxdpt+o+v/kxoYQ3Uwc5FQS7fzbcmGx25/N34Gun2jrC4PExkJQLHW
 Yc1o1gxPANCZDbYv5LSUGQU7fxKLG3A7QCUsbcqppAfPnJ1YjDoNNASTFOE1FqMbEpAx
 Yh0g+twSB5U7YGtCYz46TYatvaDokoC2wtaVm2TXn+NEqwGKlDo7eYoezlQaEKE6cdK/
 DwJjgtUXfXF3FfuuIeSvjx0Ijx5+SYkaKavK42ZMo+V2OSedTYlE46GY/3FcvR/4ix13
 1GiTkmRQC4HcIoKjC7/Ih1xEW8M73TAzLitLnkjrP0WQdpYWEO8g9dQsEMo+Ao+01Nr/
 Tlhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkPX2HOFS7tv2Jk4LYzWPHvp2sTniuG/2pKQ8tGxilxdL2Tb6REcSH3NxihfMDPg30GB1+WaPYBzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvWEB5VhvJgg+JnBJUgz3Z1ge5a19ulIb18sJkavnuAGjwQ2fo
 kG1wyd+cNe1qc/Sr9S5YtceiCvz5wnz9Xu4kccX/zNChzovTUqe0/00G4Qv/DEp7zowaxWSZMUX
 D
X-Gm-Gg: ASbGncs05CcZMimWoC4uFoHphIVWkxSgIZ43rU/rEubaVypSEjPB92zpg9RFzjsZD8k
 D40lX68mFsDi2fnKAy8Ravmpvkh1S8OHAcWCc5ro4sY2bhPZHKGi12/2HCFRbGiHBeYhzyGEXzt
 riGGAbTvYEUtMmx0B2VCc5FAz5yaw4HNpotrs62ReDJjMjuile8xjbKNMkQhYDfqzLVJK2uj7Z3
 cdX+LM6jX+77Y//IfSu2sTvKeYWscLXy/yk1YaL2+GypXIJxewtYYpHDptWpb3GTyw/EHwZXPGa
 vVOxvGtlZHMZX8WP54m1K0SBLWRcA1dIZdnT
X-Google-Smtp-Source: AGHT+IEqnOJCZfEtqq/hxEXbpXGiUtUrPmZ/EuQZbNs9DkS0CE7apf881FhBeAE8931EuWeeqm9PqA==
X-Received: by 2002:a05:651c:60e:b0:300:360b:bc36 with SMTP id
 38308e7fff4ca-30468579f57mr84634791fa.23.1735447478652; 
 Sat, 28 Dec 2024 20:44:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adad6dcsm30120291fa.60.2024.12.28.20.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Dec 2024 20:44:37 -0800 (PST)
Date: Sun, 29 Dec 2024 06:44:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Message-ID: <mha5mg3yyco2dm6g4nw5xfufuhqataoyiw6arkjalsu5caswth@vblodqj3ldcp>
References: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com>
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

On Thu, Dec 26, 2024 at 05:40:44PM +0800, Yongxing Mou wrote:
> This series introduces support to enable the Mobile Display Subsystem (MDSS)
> , Display Processing Unit (DPU), DisplayPort controller and eDP PHY for 
> the Qualcomm QCS8300 target. It includes the addition of the hardware catalog,
> compatible string, and their YAML bindings.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
> This series depends on following series:
> https://lore.kernel.org/all/20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com/
> https://lore.kernel.org/all/20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com/
> https://lore.kernel.org/all/20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com/
> https://lore.kernel.org/all/20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com/

How does it depend on all those series? Does it have any intersection
point at all? You should have decoupled all bindings from those series.
If you did, please update your cover letter. If you didn't, please do
your home work.

> ---
> Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
> - Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
> - Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
> - Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
> - Correct formatting errors and remove unnecessary status in MDSS
>   bindings.[Krzysztof]
> - Add the the necessary information in MDSS changes commit msg.[Dmitry]
> - Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
>   20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
> - Package the DisplayPort controller and eDP PHY bindings document to
>   this patch series.
> - Collecting MDSS changes reviewd-by Dmitry.
> - Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
> - Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
> - Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
> ~
> 
> ---
> Yongxing Mou (5):
>       dt-bindings: display/msm: Document the DPU for QCS8300
>       dt-bindings: display: msm: dp-controller: document QCS8300 compatible
>       dt-bindings: display/msm: Document MDSS on QCS8300
>       dt-bindings: phy: Add eDP PHY compatible for QCS8300
>       drm/msm: mdss: Add QCS8300 support
> 
>  .../bindings/display/msm/dp-controller.yaml        |   4 +
>  .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 244 +++++++++++++++++++++
>  .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  13 +-
>  .../devicetree/bindings/phy/qcom,edp-phy.yaml      |  19 +-
>  drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
>  5 files changed, 280 insertions(+), 11 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241224-mdssdt_qcs8300-11b7883dc60b
> prerequisite-message-id: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
> prerequisite-patch-id: 33f2488a8eb133431f200e17aac743598508dcf3
> prerequisite-patch-id: 7b653ebeaf1ca3f87620ccf7d876e3d1fe496c4a
> prerequisite-patch-id: e1b60af8a64332e5f0ecbd3a4ea2b6e090bd97cf
> prerequisite-patch-id: b823d744d2fb302e2496eaf0cf0c9c66312dcf2a
> prerequisite-message-id: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
> prerequisite-patch-id: 367d9c742fe5087cfa6fb8e7b05ebe9bc78d68f3
> prerequisite-patch-id: ee0513c070ab96e63766d235b38ee53ca9b19181
> prerequisite-patch-id: 970974160bcdc837ccbe5ea3b5dcac582e90bc0d
> prerequisite-patch-id: 5b2bd9cc44a529b0b9e5d73128dca5d2ff9f2f44
> prerequisite-patch-id: 6a0a81242e1d0f051e3102533bf0191615c6e96b
> prerequisite-patch-id: 322540ce6d45c32f813ecef50e5135c6f08d9019
> prerequisite-message-id: <20241114-qcs8300-mm-cc-dt-patch-v1-1-7a974508c736@quicinc.com>
> prerequisite-patch-id: 8faad5c6d8ca255935d3e4d317dcbcc32b8261ff
> prerequisite-message-id: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
> prerequisite-patch-id: 81378ec66ab6e569bd828401c43c4f5af55db32c
> 
> Best regards,
> -- 
> Yongxing Mou <quic_yongmou@quicinc.com>
> 

-- 
With best wishes
Dmitry

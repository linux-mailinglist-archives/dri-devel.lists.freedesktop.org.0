Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B5804502
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 03:34:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7AC10E474;
	Tue,  5 Dec 2023 02:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC88110E46C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 02:34:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50bef9b7a67so2756959e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 18:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701743650; x=1702348450; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uUs2VYvk6Ti9rO4s4jPnLIpH7Phymi/5Rx2uYOP145Y=;
 b=taItFEwV6cT/rK7mCDANCwqxFkjJFWswMfh4wIOw/86dLGhKuLrEvHFvGSHCtOArmQ
 0B0PLXX8c1POktGjBtxzL7K528CdotSQhIgSsivZi6QLd5ngXgl6dXY94rRs2ekGMZ3k
 31bXlpaVb4tiWPrr8wPaw59Fm6DlTgbJioPvzraAS0YM6UaEfpI1nvNWW98WkJNbgluZ
 eSFvdn0lQSCnrCA7FSpuCiyZhXUeMrvmGuL6k1Iqc8ApGdEd//1qkw+atddb6aHJ9fwA
 grYgsaWDNVPhYJHEsHefMl2IzLLDFZxZQUlWaej4INOobyZs5EGMclf/9b7bK2+VFWSI
 5jjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701743650; x=1702348450;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uUs2VYvk6Ti9rO4s4jPnLIpH7Phymi/5Rx2uYOP145Y=;
 b=XuzhfIXh1NvCmz1MLRHWTKH5A+MiP7N3XFLBph4PeLk3Y7eZSNuWfrcvLv91LgVEO7
 G8IIVN53x2hkoYPSd9KBD3XMg3s6x9hmVHia+z/C1/xpRJeHqVeXakcExJxdRfTzf9I9
 QsZ4PEZOIatJ+H04pqgducYYhHdPfocLhlVtA0qq4pRYsqE7tHUVPVm7gKfn5zg/ycwW
 Hx7OfowMC+z8t9aMSOKLJAV8qwUpeOQ2sRURc0DDWQSCQF3XWUyvq1/X0voHXPNkvhYQ
 F9PPkDTlcG9MH4btrjX7V1HewUT8l73K8pgNfix+iOLfMPOKk/lzfTelVJC6UzpMS91L
 pCKQ==
X-Gm-Message-State: AOJu0YzDTizsYb7kWbfcFe0Uh5MCy1A7NiLfWnv3fjN+0wNGisKR+Z1K
 +/5eH/bH6xEylZT6K0DwTxgoZA==
X-Google-Smtp-Source: AGHT+IE30tkOKHs/2LeruE1buPYxVdVFdUT9POrsHNxulaN52CoGY5B35l52Wgkk0pxu8LTzdgUPHA==
X-Received: by 2002:a05:6512:3da1:b0:50b:ec8c:6697 with SMTP id
 k33-20020a0565123da100b0050bec8c6697mr2021251lfv.128.1701743650074; 
 Mon, 04 Dec 2023 18:34:10 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 bi3-20020a0565120e8300b0050aa6bd6d8csm1415483lfb.178.2023.12.04.18.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 18:34:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/8] drm/msm: Introduce display support for SM8650
Date: Tue,  5 Dec 2023 05:34:06 +0300
Message-Id: <170174354263.1582017.12643932401792527185.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
References: <20231030-topic-sm8650-upstream-mdss-v2-0-43f1887c82b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 30 Oct 2023 11:36:22 +0100, Neil Armstrong wrote:
> The SM8650 MDSS is very close from the MDSS 9.0.0 found
> on the SM8550 SoC, with the following difference:
> - DSI PHY 2.8.8, no significant differences
> - DPU 10.0.0:
>   - Enhanced max_linewidth to 8k
>   - PINGPONG_8 & PINGPONG_9
>   - MERGE_3D_4
>   - DSC_4 & DSC_5, DSC_NATIVE_42x on DSC0/1
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: display: msm-dsi-phy-7nm: document the SM8650 DSI PHY
      https://gitlab.freedesktop.org/lumag/msm/-/commit/0014a4ad6c08
[2/8] dt-bindings: display: msm-dsi-controller-main: document the SM8650 DSI Controller
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8adc26fcebae
[3/8] dt-bindings: display: msm: document the SM8650 DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3e135a7700f9
[4/8] dt-bindings: display: msm: document the SM8650 Mobile Display Subsystem
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cbcef056fa40
[5/8] drm/msm/dpu: add support for SM8650 DPU
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b94747f7d8c7
[6/8] drm/msm: mdss: add support for SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e6488c2a3541
[7/8] drm/msm: dsi: add support for DSI-PHY on SM8650
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3a73e376cff3
[8/8] drm/msm: dsi: add support for DSI 2.8.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/fec254cc752d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

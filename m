Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A796CD4E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 05:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F6810E649;
	Thu,  5 Sep 2024 03:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E17UN+Mg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A0D10E649
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 03:33:44 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5334879ba28so273674e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Sep 2024 20:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725507223; x=1726112023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
 b=E17UN+Mg6Fk33rxKs9O+I9HPWVyuAurNVDObTygVJSKfyHPCF2IB2PkNJHjmOTmtjx
 /ABp5pT2OsF1rZk/5F7ZCAXFUEeDsqpvKXZhRLk99IrdJqCJl02j/CWkPGHdzV7DizEU
 QxSZBS4r4HCdIcotC8BJtU5kq+fmz9X3yoKFWzn/Obzc4e3tupctylr9HwaBdE4ZVjt4
 5HpjbmHrG+7/g7Lq68yxOXPu95oAAPZsWrzjwOyKAiTHBJwkyo1NG7bGpZW/3II8ABFr
 Sr10WfpZnNzTHD3jlOb0x4q4gHvsbz5V1xwJC5zYvr3ezCqthTeixjwIugMVr23hKgEi
 QCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725507223; x=1726112023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGI49nIoainLFaa1TPUEgnROODaXfiT1w+95Y7KXH0A=;
 b=lyZfzhCrhwg5gfr4bakNELpoHEwmBzu9eBDx76YK7ylJuFpLE28iRoNWDvQBmRBw03
 BatM9VYIMi8LjAJYH2xKSqLVFucT7+RH1LnaJht/WEhqNL6i2z1GPWQVG79GPZ4UDmUo
 UznXJ2yxhW3gdqSk9nDvx9W6nZ+3weYpEpQU6iUSpXakUmTyJ2eiqOi6UciCASHg2bmc
 5vbov0sWE1oHMoEvS0/x4Gk6Z8+lI0sYPhhCE5rQGSc16YD/m0QcQMOjuozUEfPYeQgn
 SqOL9tivVPXf5nsGlicPM/t6nsx6PXeiP/OfdWol++CNYe9ST0KuJyqFPMZfsNf2JnLO
 YHrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOTcSTSUI78Dtm6SClAwXcalEMI1L/o4DRd3TWrHVpK7TeNfVH3nai7wfunHojQVULnVXyDnZXpx8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWOIJ9AuVPEhz48bWlTcxx+cK8cmYHtV2wIFh9Mi18mQQ9swv+
 uyt1OCNLgAOBR/0BYST7r8536TTgV8unsaYaMSWg3tKqGHCd1nakjoPW53XcZN8=
X-Google-Smtp-Source: AGHT+IGI1ThGNwiYzgjZpB38Gzh3Kii8Shn3E44t5s6JycEWNTDgK8ZwOGUE8abD1/FHADwkhMcSXg==
X-Received: by 2002:a05:6512:6d2:b0:533:44c6:1ef1 with SMTP id
 2adb3069b0e04-53546baacc4mr12832555e87.56.1725507222640; 
 Wed, 04 Sep 2024 20:33:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53565f6d409sm389165e87.35.2024.09.04.20.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 20:33:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 0/6] HDMI TX support in msm8998
Date: Thu,  5 Sep 2024 06:33:36 +0300
Message-Id: <172550712143.3299484.1580127137460046609.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
References: <20240724-hdmi-tx-v7-0-e44a20553464@freebox.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 24 Jul 2024 17:01:33 +0200, Marc Gonzalez wrote:
> DT bits required for HDMI TX support in qcom APQ8098 (MSM8998 cousin)
> 

Applied, thanks!

[1/6] dt-bindings: phy: add qcom,hdmi-phy-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/8886def25eef
[2/6] dt-bindings: display/msm: hdmi: add qcom,hdmi-tx-8998
      https://gitlab.freedesktop.org/lumag/msm/-/commit/656810411b1d
[3/6] drm/msm/hdmi: add "qcom,hdmi-tx-8998" compatible
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a61eb17f40e8
[4/6] drm/msm: add msm8998 hdmi phy/pll support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/caedbf17c48d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

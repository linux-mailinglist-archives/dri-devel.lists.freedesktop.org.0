Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DC7A349C9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7302210EB21;
	Thu, 13 Feb 2025 16:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="t8MdI4+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B42A10EB2A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:28:07 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43965592e1bso4787785e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739464086; x=1740068886; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=iDc93kMEYWIE43KW8M1DQx0zrLSt7yqt1TtwJm30k9Y=;
 b=t8MdI4+5u+U2mHDINWC6lMycDuhUZf9l2QjWqRpUNJLfS+ptBk4sGijzuy/YD34PtJ
 v4zNXcTXKQA/phV0rXF8xVVAG+vAwNrmdk0HH95BB/1AvR8sSx0mZvVHOFAPWQFtsAfp
 zxzsn47Xk/dDCeVZsSGzcESFHMJhP8sqxc19q2tKePQcRM5f9Dz7/xW5h7UAmLYnahfU
 1B29WzlSezBnSmxCkatD5Lz2CsE4gHYWSJYRWQ5YpqHMevxoAyUPPCMUlzopr09Ku+gX
 iSOW+g4YPUsv+NyLJrN9Y4ObFkCsCykv4D2mgVlZOitRvMay35p421FZnOc+oK4jeyGc
 /shA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739464086; x=1740068886;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iDc93kMEYWIE43KW8M1DQx0zrLSt7yqt1TtwJm30k9Y=;
 b=g2WOqk5iKthRMRE4oB4q4cG5uR1A6QFbZI+oLXWGmPaPCuRvgKNosSUvVcfYeObP/9
 oZ6MU8puavDiZ6VM7cj7NIugkU0+D40K13o05OVnUMqr2B2Ree/IUsqAnImHKKIyNy5E
 uT0b8FUAlA200H6zeBHMTaDP28eGK52UbIByr4WByWmvPbSpBKeBQo2MXe4MHMQ+txhL
 GKRuoHCe0hPrN2eFSkbBIBRdnIrElzOcm0KW2qSBCDf8aNb/u0bticYv6Be3DyH23vD4
 dmOcfhA+xuc2UebTgFsuhydgCUOTRyzTuhtESY4/WMARHHrA9YYyJ37xNz4Zl221F04F
 qD8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4OaeKWI9BI4gAJKHqfXgduJGpeAkijIZTprQ2vaCzWtsnEmtb6AQDQAyYYSSaHcUIOeMoJvpQZKQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbFnV/wLyFNSBHWb680zzriANSUj5DYf82SvtDnWWBpqHm5MSb
 kIw7fcJ6wkMdlFrq3c00ey0DaB2pTLZhWsp4qHMVvp4fGOhn0gCnvcROnF6rWeRV206aEYy7mEO
 L
X-Gm-Gg: ASbGnctZCCndmuiK24HddXcd+kSZHWzieMfj7kncJU02SG6lmnntrNtaD2pouScf9h6
 MT8uhsEghpPPyKVM00BzAfj0xxFdUuT1yEjTLMvQ9GrND+fDM/pl4LQntG/xiAxqqtKqAmP5pV0
 sNe3Cnedqpge4jupg/8G1YhxWbfEdyLRFc+e3xTJmRgeT066bq70OUcYEJr/hy5Fe0Z3X+pnU7g
 yFB6WxZFGxSsTozDcToPW+41mVwszvzqGRqcs0rnWC8HWoHLRIvE88O5mAzC3/UUr34h4Z1R7r5
 NZybKOeL7COR8lrg5Y+Lc6OPLp05QC5mWtO7
X-Google-Smtp-Source: AGHT+IFU/9Ezw9WpHOEwKFHI3agr//zJrArAr/XSAw2dHqAeOMUzEQHlgonTqcBFZjTTclKxtAjURw==
X-Received: by 2002:a05:6000:186d:b0:38d:dffc:c134 with SMTP id
 ffacd0b85a97d-38dea2eb4bfmr8227417f8f.39.1739464085999; 
 Thu, 13 Feb 2025 08:28:05 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b412esm2274382f8f.1.2025.02.13.08.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 08:28:05 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 13 Feb 2025 17:27:59 +0100
Subject: [PATCH v4 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=my+RB9Jrip9aPGRvZHAD/1/UpXRs0+h6VzBYQ3PsJO4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnrh2RyIwuxEyQJnCqN4BQzwBgsz22oIe5p3/foBpN
 3ycZJKeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ64dkQAKCRB33NvayMhJ0Z4JD/
 9QWqppUyEnVCwdINgX9VFB0i8zoyuyZeu6IuDCoC9ZEqWoOs8NkpPN3ASdQr13S8PSIYLl377Y1oyp
 5eeA6/WQAaEysK6t2aXfsQ3/ReD0a5Ac3DdRrNmleh6ZlEeaU0+AmQIoTygKbsAwZPRni9ZA9K98fl
 /NQ8weA+fwoAs+dY4XyM1Mh3m1kA/oq27fC/jiAe8K4S3OS2WaLDRZ3B0SmJMkY82b2fjv73YjqBRV
 3htFOiOZTllEcFeMvAT7w+fE13umvRgT/kXrTsnd36VAvyDaZFltGUz6ymHB4kJVzytzc0UwLEMDmL
 E4z5cc4mtjo6iEE2Xlc0uY3OQz9pQ/Ni6m4RckyzTQ2ZackPXKh8WuINx/IwLSGFtY4K6i7OgB+YlV
 49QaGlZgn4Ns7+BI/r8wuaAZHnijxZ17M1a0871JFon21oS/3XOfIDj+PIqVQH9bWGnV1erkdHce7R
 XJK8ffMPB/BQitgVl+Mm3J4mGbVgoTgfO9yjSi3fsoejYJGmspR9wnA5mDszU6zgeLiqYpeOD+hPSy
 hlcMhtnhos8K5RDwdhWfZ7yj/fYr9K4Rv5hxb8jbgxyLbaBMVqXVI6MgSA1Ya5MJnGDI/7uioYE4wW
 GTZlXhTPjsoFcf9wfs4Ga5/nJ/HJjdfx/ymjSsOzPSybrYUrT5wB+dYZxK6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
add the missing cpu-cfg path to fix the dtbs check error.

Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 483ae63e6032823e8cc13e8aeb6db70e3948f02d..1737265d364601494c329e79174c082c98e4d0ec 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3997,8 +3997,11 @@ mdss: display-subsystem@ae00000 {
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
 			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
-					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
-			interconnect-names = "mdp0-mem";
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			power-domains = <&dispcc MDSS_GDSC>;
 

-- 
2.34.1


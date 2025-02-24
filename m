Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0C9A412DF
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 02:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2126910E11B;
	Mon, 24 Feb 2025 01:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=mainlining.org header.i=@mainlining.org header.b="Gcp2Z0lg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091D10E11B;
 Mon, 24 Feb 2025 01:56:34 +0000 (UTC)
Received: from [192.168.34.162] (254C2546.nat.pool.telekom.hu [37.76.37.70])
 by mail.mainlining.org (Postfix) with ESMTPSA id 769E2BBAB3;
 Mon, 24 Feb 2025 01:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
 s=psm; t=1740362193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z246zezQsbXmW6ySsE8/P5ydLD0Q9o6QEpyka1CHFOY=;
 b=Gcp2Z0lgC92GtnKQ3u+EkmFbx3vqOsqlHTIZrTJ/j342+kw5FHfdezZf+KHFIFMp16RBgM
 kre0XSfKJVm414MNKR0zPn2+7ZTI/fdu3IUlo6uasLo3aFgdNgNJO5Lvx0JdQaDiLXzpnO
 0AinScW1U3JmYHAzsZE8vw30V1M/g9Q7qWO18I1PkypgOsQD1bNoF+O/zfdwOQuqTKwcSK
 gGPElg5cUpN4wPLhTn+vmZdxHJ7FRHPxKcgxixfrZ6jJPqbD1RYHODYFnEeoahmP5nun46
 9ZP+jYzPle3fNYtiIi/EahoSSuJP+2UHhm6HaZFlTRfmqHEmYIkeGoOQoaS9Vw==
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
Date: Mon, 24 Feb 2025 02:56:19 +0100
Subject: [PATCH v3 4/8] dt-bindings: iommu: qcom,iommu: Add MSM8937 IOMMU
 to SMMUv1 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-msm8937-v3-4-dad7c182cccb@mainlining.org>
References: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
In-Reply-To: <20250224-msm8937-v3-0-dad7c182cccb@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740362181; l=1026;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=LjF/wuS0Kp0a3fx8BedXAUUREYCxLDlQzoS7oLz29U4=;
 b=h2Xcqip7z+v+H5IKRvjj9mn6BYjbqk67B8Syj+9UIu+A5WZmiMc19afI3UjX/Px3gQ4zmN9tl
 34ZvPRSNG7kAP9HPkiImgAOeHdn0d05EQxgFnfNlaVYfBb39pz+NvjD
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
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

Add MSM8937 compatible string with "qcom,msm-iommu-v1" as fallback
for the MSM8937 IOMMU which is compatible with Qualcomm's secure
fw "SMMU v1" implementation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 Documentation/devicetree/bindings/iommu/qcom,iommu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
index 5ae9a628261fd251c1e991a70662c6d37ef2c4e3..3e5623edd207abbfbd2ba80f51db7829f02eb7b5 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - qcom,msm8916-iommu
               - qcom,msm8917-iommu
+              - qcom,msm8937-iommu
               - qcom,msm8953-iommu
           - const: qcom,msm-iommu-v1
       - items:

-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B16913DB6
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 21:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA2F10E0AE;
	Sun, 23 Jun 2024 19:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zz4ClLMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09310E0AE
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 19:34:26 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3608e6d14b6so2363566f8f.0
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 12:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719171265; x=1719776065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jlJ9HKaPN5zKWsVg50zksinAvfEscvtSvPK9OhtidXw=;
 b=Zz4ClLMMEdcgJtbzoKlQnFr9rSJZlKudAAxQj6wpYLP1z+/1GcbWq7qwklU0F+joZZ
 eYvHhhd6wCd3JBO/wLeNYUH/01rm0gh+yE9HRYWRYrRJkCp+nXGrH8igj6P5FMjPxdUn
 iLv1L/VUXoke2dp5yiBDkOVidS+45jSdRmeAB7QNLvTX6HsmPf9QF29qW6o2fmSXxqEo
 G93YsiXiE4uKQAsCpo+lrYs4Wy7skdWeb+qe3QYwuoGZDAYkL5xxr7R7P8imwJL/WIXm
 UafeFp8xJUABweZH+2nWAFhhRtlrR9vDQ5COyX2oB47qWCEEaMtTIKBCi7HUBSpQorhr
 WiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719171265; x=1719776065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jlJ9HKaPN5zKWsVg50zksinAvfEscvtSvPK9OhtidXw=;
 b=OgJoBo8Z8OmrhnkBB5mOQuye+XUOG5yp8UwtLY2iYqIAf7KbjnkF1j2+wgTkOOvoxX
 qAd5dYjJMZn8Px2vue4w7FkzICkMnqAQZsiMBm0Bc39pFjEWcfmSfxkcfvkexF/W2EyU
 Fq0DK5gZ2jB8HbcMCyfaAa75hdFUAQ9UPjo/aHL5E53OANNtepRFikX+UCIwE7jvROKh
 +D6hhjHW5G7CF/00pIbB0QFmJDxiqTn1rgqLE3wt6XePLSekDkGevj8aeK9hDwjvy/Bq
 dId+IRVQEHcLy+M96diNb5lyy1SCvbur/LjofGnTYxW5HsxutKmzX8Ok/Osd1alzp+0Z
 Om0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB7pgiJsiuEAnf2Qt5M7OuyV4+P/Y8OTutkClFvb8065AtNquZR076a2zR3FFauJBa66sLo77wPdtHj6glwfw2+QFMgnUNQFRCe5Zirt7e
X-Gm-Message-State: AOJu0Yx1eFEXn54fz7TB3vdaBGag2S+Ey4ew9O/mLCMvwe+ZSiYrRwV8
 9dYPi72bHc2ECTuiQu8LVTt6QEoy0aoyiQUs7MLCTIPMojjBI2WoXsTWCYe7/Ms=
X-Google-Smtp-Source: AGHT+IHxnvgnCBnVOx5YrWZI7IIYL0JKxRUHUwFMlSq0RLjcqe7o5RxhbPGXRRATXFAddTNZRIxxnA==
X-Received: by 2002:adf:f003:0:b0:365:b695:ef76 with SMTP id
 ffacd0b85a97d-366e94d148amr1518807f8f.36.1719171265098; 
 Sun, 23 Jun 2024 12:34:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d1fdsm114756015e9.7.2024.06.23.12.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 12:34:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] drm/msm/adreno: allow headless setup on SM8150 MTP
Date: Sun, 23 Jun 2024 21:34:19 +0200
Message-ID: <20240623193420.333735-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Commit f30ac26def18 ("arm64: dts: qcom: add sm8150 GPU nodes") re-used
amd,imageon compatible for the SM8150 just to enable headless mode due
to missing display controller nodes.  This work-around was later
narrowed to the SM8150 MTP board in commit 1642ab96efa4 ("arm64: dts:
qcom: sm8150: Don't start Adreno in headless mode").

This was not a correct solution, because the Qualcomm SM8150 SoC does
not have an AMD GPU and the SM8150 MTP board does not have magically
different GPU than SM8150 SoC.

Rely on board compatible to achieve the same in a Devicetree-correct
way.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index c3703a51287b..a8afe0b6429b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -838,7 +838,8 @@ static int adreno_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    of_machine_is_compatible("qcom,sm8150-mtp"))
 		adreno_device_register_headless();
 
 	return 0;
-- 
2.43.0


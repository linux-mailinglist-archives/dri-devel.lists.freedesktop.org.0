Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7DFA3F85F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1509F10EA96;
	Fri, 21 Feb 2025 15:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u1RSmE4v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C8510EA89
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 15:24:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ab7f9f57192so32103066b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151495; x=1740756295; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ve17j3mm/abtdUOwnmohJ1b3/R5tZ1e+gOy6d8tNk6E=;
 b=u1RSmE4vWWaevnJULdD2FWAfnj+u26XVdKM2GLavdX6mAHYHnPsczm0lF6H65N5LN+
 tdN32mNv93O87REXTh4HBrqALz2Kk5pF0awHMA6JGCz6xnwmU0C+S5FDf2Fg+8ozRSXn
 Nw/08cZGpSezZ3k/JSzU00bmD4S3VXPJrdYcgA8HcBBZ3sSmq5ySZxaSU7i4hLe6LlSA
 qZV/GvmHc2yQVVS9B2D+eQXgXRb7PtdHbg+O+LkG8/I29FDZE2FXtejpJBGIBe4OMrDf
 UNoWyS8tfUMxrEsqUpIWI23YzdsPKJq9+qV85YyX0VeZY2RZHLYgv5OJJ2URQfJe3CjM
 3ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151495; x=1740756295;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve17j3mm/abtdUOwnmohJ1b3/R5tZ1e+gOy6d8tNk6E=;
 b=FB5jHohPGWB3/UoCqDdNL/o7z7suzsclw9lawoIlyBW33J1wOFzqNAdfnIcqYnhqWB
 TB2FmKG2yQq8xLJVKx0NXoOk5b9HHa5GmGnlzui3d13qbVk5mq35loRI3cZlnYzLwaWE
 11NMHNJv6Mtb74FxL9usA6iUiuOG3DLtq/BVfBJu/GmazXs6oUX2R1sdDGaKZvJ5A9Iy
 SyMSsZX4pTA1Z+TSxsN/u6yr3m6g3QzVCv6TPJBP92DehCD8N5ysCJoihdut3E+9WCsS
 kbcfhX86AcYqQs6B+tLWKAepUl4PqGuZhFHWlx0UTAUrSZHB/xsfyW4X/tlY48H2JnoL
 /xLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoSY0c4aNoNkyryL7WNVfDJMY1ZYRF7ivpYTNcWzV0FRPTY3mvUIZ9HGQYLCUXFJ8N6L97vvij100=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhN5hZ+qotBbfKAW1OiLpH8iIjCCMESwAG4Xj90sDZxRMmI5lr
 wpJAE6c1R6gJ3uK68wlVwCI8ssWHxektfT3wFUytVY7RZG+PomgyktCtiMg0xjE=
X-Gm-Gg: ASbGncsqHg/kzbWuNv5O0ZJV86ozQw9sKa6WcGOSLyp9+fcx9HYKF5hKZOWlXH2kwg1
 0vDL+mAnc4L1nx+tX0quTg4GJr8TCYKlDAkv/eA+SAwkxmVFsE50JM0LonNWF0qZ9hfWOQLARzs
 1coo6FMgEoxFginq/Y6Av9h9Xe1XQXAQFtehM02AHjnDr0hvnOQIsI6MHIqf5uBspAj8uZSCj1I
 RM5bXAUm2LPIvQ4CumjYsteSmel4Yf+QvcxFwVKXqaYkkuoZjrdveeJ7SO+WVxGyC4ErTbTzIhP
 onnJivAEbibtIjc+LDzd+v3+3BltSisGEuEZUoGKuHf68vYNr4rUSc6ghr6GKg/HmoiB0wzjhgC
 8
X-Google-Smtp-Source: AGHT+IGThcFZG5h6nyf0Wo4R9pbuzagN/g7Q86hCwRQ07ocY0fsI/LnRjCQ+ln/jckB/H3+qTrieVA==
X-Received: by 2002:a17:907:7f17:b0:ab7:63fa:e35a with SMTP id
 a640c23a62f3a-abc099e1dafmr140767666b.2.1740151493681; 
 Fri, 21 Feb 2025 07:24:53 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:24:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:12 +0100
Subject: [PATCH v3 02/21] dt-bindings: display/msm: dsi-controller-main:
 Add missing minItems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-2-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1931;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bIJmVQhUPgDWhOxkXZXr441zWOXIC11HBHyQtQ4C9AI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJqtl/dJu9saPm64cDkotdIPNx/NMuosAvWNm
 I2ba2uSO8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iarQAKCRDBN2bmhouD
 168UD/4soLQMowTp96PKFERzDIPLIBRahxZNBzCNEQBX0rlr1gS10d2jJqUplfH8osgbTis/4sU
 R3B15+PKFAy2ol7Fb8eO9svK7dbJWZ3aNLVQ1DjHKxryodaeai4UhmRFSEe2mVKoVncQ5Phdzi6
 HF9gJdr0ptsIsalibfNCEiXevMyu5rBtcz0TsmeY7BimEG6qWlsuWYyfclVjAlkXHMsV4LYl6kY
 RbqDDsatU6wIw/ft8Z7Rt/L4MjKrF0LibxtmKdp5hTXi10by2V2PS05ysEJ37QUzFvTntouZMPs
 /35sGIrCSBFtujJ8THjXdc3n4dL8ifDigHXraiOa10Qbe4C46tEFP+saQYBKMwr4I0KMLG9g4Vh
 PhhSva15QOGSw+83ZVNv7Ozu8sZDcwd3OYaeMn8tK5bONBjSKCJacXk607YFllITGbV//rJl05j
 J7sUmaG1jo1AYlUeGRv8QkFNqh25b/z7Ir/Xnd8F4u53RnOjAnFCBIIQuk1pB5e/hAqXvyfCrxS
 hm71NzAq7XTyR9gU06Z0Sl9lJAnoEkGUck4PkrzQ99FRsOrUre0qDqe7q5Zyai9viRPuHnAyfSk
 vYnIZyjYq3lg6Mr3SvySVbMx5blM7ZgW3u4rjbA9XOyciLbs2m4DdeLuBgket3YHcCEaY5qeMta
 87c/5O7v0NKq0mg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Specific constrain in if:then: blocks for variable lists, like clocks
and clock-names, should have a fixed upper and lower size.  Older
dtschema implied minItems, but that's not true since 2024 and missing
minItems means that lower bound is not set.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml        | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e496e5430918d54b2f07f1d5b64de85d29256951..2aab33cd0017cd4a0c915b7297bb3952e62561fa 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -231,6 +231,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -253,6 +254,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -273,6 +275,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -293,6 +296,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 7
           maxItems: 7
         clock-names:
           items:
@@ -328,6 +332,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 6
           maxItems: 6
         clock-names:
           items:
@@ -347,6 +352,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 9
           maxItems: 9
         clock-names:
           items:

-- 
2.43.0


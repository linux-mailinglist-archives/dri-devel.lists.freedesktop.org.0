Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A834913A45
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 14:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CCCC10E214;
	Sun, 23 Jun 2024 12:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="haTFACx1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A8E10E18E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 12:00:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-421eab59723so25295255e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719144031; x=1719748831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
 b=haTFACx1p1xFvTBE67WuaBCq7zDCWwlmGqZUiCQS3fDknEuogt/BlFsxFAjbtV4GXW
 WBtkPlVd+3tFXmJiFKYPU0A1HCtG4pIevuCx/RxwRtj0XGsuyVbTVbtdD5Du8iBf8p4P
 qs2K75Q72aKzla7BHGbUitI5rbPVarUIPsKDRMWgWpNQPs8hOQUeSYAnHOlnGClKESh7
 j4pss8fRsanWTkw27FT+G/GyalHsdOWVgS1O7V2T7kYZZC5KhvLGjNqTCF48kpo2+MoF
 J+ndui26NMmyY2ORNTIGQsoaJ7yo1WVy8rvQtivZpwzRIKkkSK/gjuZOvqkt+Hz7TeSd
 /wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719144031; x=1719748831;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D5pRySu+ARf8jWv+YeotUn57i8P3KF+qPMZ7wIjslP8=;
 b=rlVdcV5FjNO1ZCKs5FObklMM9VKGL90TFFJpKpmbGjLH/3zGpDU4wqgT1/KSHfKZAs
 SAYzMtS2oPDa8r28FVbf2IPduESZbAswWYh5NhpYl7nlXeCAZVKn0DxxR42MvhWWlFgK
 x9Z3XIYi5jj9j8PnGrHJVaNtGSwm7CFBTYYvrQFYnzT6ux3M+dM99poyqxUJtUbCifFJ
 7eyR/7W/GoY2bsVgEMe/5w9gLejLhs+al95dEJ6hVGBaC7aPReyLU7ZQsQjv2cI4ciTP
 nAngirFiNhM5KkhrNY4pUA5jXmwZV4q6NYma2WVqkFy/QwUAFKzsadHX5F+o753rnTI2
 x6Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+zlyBJptVHTJvHEXZTPw3iD3LdGaZFwJjg1b8R+BpMKE04syqgWxbEAG6RgH94vG4K9F9TXoD0B3J/6V6gv1miJkiOAyOqjmQsVgyI2FV
X-Gm-Message-State: AOJu0Yw0zLa5mjxfF+0KC98eA4grMei6V2BriMFrJn+88z2mKhv6Si/n
 rcAm9LmrcwkTLqoUrjK9cPsxqFFS4PfXnKLzTVkTs5dALCPOiFMFpopl8Bq5e+s=
X-Google-Smtp-Source: AGHT+IEXP7AJ8wGYP4P3O8ghUgKEsx/NMem41iq5obFqMs7hv1GsRgZtKTmlmuq84/7vHtVQVzL0xQ==
X-Received: by 2002:a7b:c4d3:0:b0:421:7c1e:5d70 with SMTP id
 5b1f17b1804b1-42489e3ab62mr20397615e9.16.1719144031293; 
 Sun, 23 Jun 2024 05:00:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248179d3basm105465515e9.4.2024.06.23.05.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 05:00:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: display/msm/gpu: define reg-names in
 top-level
Date: Sun, 23 Jun 2024 14:00:25 +0200
Message-ID: <20240623120026.44198-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
References: <20240623120026.44198-1-krzysztof.kozlowski@linaro.org>
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

All devices should (and actually do) have same order of entries, if
possible.  That's the case for reg/reg-names, so define the reg-names in
top-level to enforce that.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 253e68d92779..baea1946c65d 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -46,7 +46,10 @@ properties:
 
   reg-names:
     minItems: 1
-    maxItems: 3
+    items:
+      - const: kgsl_3d0_reg_memory
+      - const: cx_mem
+      - const: cx_dbgc
 
   interrupts:
     maxItems: 1
-- 
2.43.0


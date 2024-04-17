Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3538A8C7E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 22:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DD11137BA;
	Wed, 17 Apr 2024 20:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W/XYQxtK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE79F1137B7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:07 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a4702457ccbso1274166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713384186; x=1713988986; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YvZYT8UoRgpyqJ3Vaw4KePRJPRlpkh8fBDgHRFBePWw=;
 b=W/XYQxtKCE7rC3z+G54cwzrUBYnYrrS9xF67dJOFAD/jS8u+3Bpqljsm6TxMHQwxjW
 Xg28JfFvAy9FFs1ObnQOj1B1vYu4KZQ8cCICMRzCsw+ii2BENqJq1O8ztVNTdzS5Kqko
 x6rW9CHSnKqsYNRLn5e409Zfra3lTMJ9+93XzzgfB/tjA+3chtbQcsrj4sdPKnEk3E5G
 r3g0V5eVqjZ1PlHV5s6idRjLL6X1xvZFTxJrQ8y8HmvWofMDRVOrE7keO8EiHN2B7gNX
 YfqjGE2/br1raD1vff+k5JgZKEMYPw38sYmeNfu11a19gGuYce5NxLTyfe7+R5IPzwhH
 EAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713384186; x=1713988986;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvZYT8UoRgpyqJ3Vaw4KePRJPRlpkh8fBDgHRFBePWw=;
 b=kiR2qo9+08an/z/5fHI8X5QVWRLchgW351OXGtKvbaQDezMYyG+dbQIt1rn/fbB3Lj
 eGm84mZAXd6wrLDwjNth7lB1xfBzklI2Q/dY1gjdR8qKnma5B67/D77kPWKTFUy3eigZ
 l4/1HjAlq5fzJWYeHKxE650dvnTvXQOkS+2VIv4HF1fFUy5gBIvXa8sIjwP4Qip6SpnC
 EdVtL+mRh/0bAkrq/5wwC8+WaE1E2r/N5Il9ihEn5wXTBpRqaI2hJDea/+qWlqB5HVEW
 XIvfYsIqXqnfQU5mDWzoAE9msaqa5JRK4yupS38vvGYZIx8JH6JOH3DUbPKxAwG5Aoja
 4nRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhM7dwvAaHWf0dZ8hepsTaw8OCzwNM5Lv0BmKaVGCCDlJUD/7zebkADSmIO478lHDXZzg4CvQDrzany7x/utkUT9gWE/XwLpu+YJh6Not3
X-Gm-Message-State: AOJu0Yz4+LiEmlIAPm2oh7MVocP7/z8EAJNugdGiUPrfFEaIfjN8IkTP
 Jjmuw54xK3SZLS9MSK8zV86JpvYqHGW/i84dbgxL6NkZ8XQP0ALVh7QRom+0wqY=
X-Google-Smtp-Source: AGHT+IHeJx63U2SuWBabsr+jnCDt7p8kxECw4gkXzhp91g5G2n4sqYEssjkAMSGbTC/y0ce7j6eT7g==
X-Received: by 2002:a17:906:194d:b0:a55:63d3:7499 with SMTP id
 b13-20020a170906194d00b00a5563d37499mr308331eje.59.1713384185935; 
 Wed, 17 Apr 2024 13:03:05 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 13:03:05 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:53 +0200
Subject: [PATCH v2 1/7] soc: qcom: Move some socinfo defines to the header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-1-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=1887;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SzNP2N4/yEVPoBdiAdbUx+XCYML6c4ZGxmfNNn0BMu8=;
 b=HgK/hwJTnwdfBrYSRApX3bQaZFhSAeY+XugDa5UFxUJvYlnKS2mim2xdU0ygmIAUd1o8H5PKe
 hoI7SCi+pXUDqscrBcSuw569pKZD2VnMeWCfsnjxuDqUJ6dYW4fAVhS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

In preparation for parsing the chip "feature code" (FC) and "product
code" (PC) (essentially the parameters that let us conclusively
characterize the sillicon we're running on, including various speed
bins), move the socinfo version defines to the public header.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/soc/qcom/socinfo.c       | 8 --------
 include/linux/soc/qcom/socinfo.h | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 277c07a6603d..cf4616a468f2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -21,14 +21,6 @@
 
 #include <dt-bindings/arm/qcom,ids.h>
 
-/*
- * SoC version type with major number in the upper 16 bits and minor
- * number in the lower 16 bits.
- */
-#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
-#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
-#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
-
 /* Helper macros to create soc_id table */
 #define qcom_board_id(id) QCOM_ID_ ## id, __stringify(id)
 #define qcom_board_id_named(id, name) QCOM_ID_ ## id, (name)
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index e78777bb0f4a..10e0a4c287f4 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -12,6 +12,14 @@
 #define SMEM_SOCINFO_BUILD_ID_LENGTH	32
 #define SMEM_SOCINFO_CHIP_ID_LENGTH	32
 
+/*
+ * SoC version type with major number in the upper 16 bits and minor
+ * number in the lower 16 bits.
+ */
+#define SOCINFO_MAJOR(ver) (((ver) >> 16) & 0xffff)
+#define SOCINFO_MINOR(ver) ((ver) & 0xffff)
+#define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
+
 /* Socinfo SMEM item structure */
 struct socinfo {
 	__le32 fmt;

-- 
2.44.0


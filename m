Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D26B8FD723
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 22:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3432910E804;
	Wed,  5 Jun 2024 20:10:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DXZ609p7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEC610E38F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2024 20:10:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-57a52dfd081so211386a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2024 13:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717618224; x=1718223024; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9Vw9DX3CSwtkdBUffdnArBNjtVj7mHBTphGyv2QQ9qI=;
 b=DXZ609p7vFLMnMOZGitlQVagy9fmYRCpExrR6hXKif7Mil1FodwwFRoaG7ojGEV2mU
 LwAzYlrKLMXq1XLtioPEH7vRZ2dz/X2s/PotJ/LaOEmP+tBoBR8FflmMXJCgx+ZzwSga
 0YQnmjbDMXYeIxDDpzxQv+upePG3D6OJeQonv9kB7r6zBypzQQG/xx+8xMP/+m9svi6u
 8ZRRah1nalupaiFGSQ4XLENVxK8HodKO2hpwnPuwBqiu/oHclhEqEieduz9C9Ab/irqZ
 5CgtCLEXZwJHxxRi2tPp2bMzuWKq/zHAgVBFo3/hCHmS4oOayiYtZrTi/BCygCr+zr1B
 nwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717618224; x=1718223024;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Vw9DX3CSwtkdBUffdnArBNjtVj7mHBTphGyv2QQ9qI=;
 b=qiEnLySUkd3PDrfOb70LKvFa08OtCz/SzhhUnmx8S3qMZDShpDBy7s4fe4UuEscPhb
 rIRsh80b3luJFSY9BFF0Xpkr1vqcMP+FVuUjmmkv4Dlw/5pQ0mT9lbPbYkmNZbWfn4v0
 T4DJMyAL03gKFf4ni0VJAWIeg8oQc15M1QBOj/yFnOFLVg80UETB5YyyyTVYdscuEWNs
 0P/B+jLMGFGua16uoRXCLzqLSEKwVkFdcn34SkclQ2qPmLHGmoH03i9uPbPbPQ3DzfSt
 fF0mU4rgKiayyh07JCq/jpAaqtJ6Tu1Aw0te4dIC5daG1M9jDlOXkuHq7qaNm6ukGf4b
 tmSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Egh+WQV7gQzOIVgp2URTA475iTvRSECoY6VRYt72TvF9kYDWSoqKKR+Dbu33RKFKGLUWgewwdFNhvoVQNVIiO2Z32MTldH+mlciy+G+v
X-Gm-Message-State: AOJu0YyF67OCeJWaLueJBNlu13PF3oNKQN6bW5HB+xoLewzayGnLat9H
 VnoATArLCwv2rZpzwK/13oDPiAnas4STja+/ZA16iQ1ffaVLrJb1o29fOdLCKdUA28H4oC+GHwp
 QGgA=
X-Google-Smtp-Source: AGHT+IEqlV2I5Db8a+ZFkhPsAYnoI1F1oliPNdAwUP8AaIYo4Qee83CiizfDot/q8uaYVI2GD+cyRg==
X-Received: by 2002:a50:d497:0:b0:578:6198:d6ff with SMTP id
 4fb4d7f45d1cf-57a8bca263cmr2379893a12.33.1717618224135; 
 Wed, 05 Jun 2024 13:10:24 -0700 (PDT)
Received: from [127.0.1.1] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31be4e36sm9717473a12.53.2024.06.05.13.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 13:10:23 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 05 Jun 2024 22:10:14 +0200
Subject: [PATCH v2 1/7] soc: qcom: Move some socinfo defines to the header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240605-topic-smem_speedbin-v2-1-8989d7e3d176@linaro.org>
References: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
In-Reply-To: <20240605-topic-smem_speedbin-v2-0-8989d7e3d176@linaro.org>
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
X-Mailer: b4 0.14-dev
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
index 8087941a7887..beb23e292323 100644
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
2.43.0


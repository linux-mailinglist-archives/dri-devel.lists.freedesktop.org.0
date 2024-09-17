Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B2B97AF57
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 13:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE1610E404;
	Tue, 17 Sep 2024 11:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WiQUpDbf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F28810E404;
 Tue, 17 Sep 2024 11:14:22 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5c275491c61so254301a12.0; 
 Tue, 17 Sep 2024 04:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726571661; x=1727176461; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=WiQUpDbfC3DzuAKBpvP7n0AzbDsLjQtbx3H17kASBVboExbewhMpwgV4Ls58BWWSmi
 sPzAjW2cf6fp02iUA480Iqvas6fH5VYhV6WlBa8tQ7fS8UWg7zRI4t2BWuJr8xbNv7Dd
 hVSHy67BRm2F0v615F+gOXPlmDPzQPvmgnKpZncJJ++UJ8AnIT1EhQRkCKPafDcAxVbH
 f8OK47CvWzgvzj/UW/LX0jOobWYf0eLMAtor1I9N7KzRJtCXt4AAZozRUvX/CFXQWHQM
 JKYI/5j2UjvWVkeZLM0sYF5pPO+WXV58CnV8rSlx3GXuLBCQe9sMkYvNwWbdueqk1FG6
 fUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726571661; x=1727176461;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=d30hn4jALW0Z6PAvA6+/koAuiaQOk7p4ArUcnhQStWpr5uantpcBq7UQva2YFQxDJF
 zc9RQr1PD82OlNXLSlv1q0cELy0LY4G9wJMsH+J6L4kgY1jdUFA4nQ8uQoUAVzOTNOEM
 AYv+eheW3IppVdmwsHlQW/OaO8Hnk4n7xNeM5Vxf6EF6SgZD3z+ijLSMwta5udgc2wu3
 SnVmH8+XtXoxTMO076b8RNpMPzqIbgF3tpCINICHLvXhpm05rdv7Q/BzlEPj8ApfeO15
 0RpPT9Uh1DcTuxm0Z1ID2XcdQZC59fxhPs5dqW7DTH4lAJo11Q4ODFc8VJETw8XCUKZ7
 n9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9rcFjcn9tCZShoYQ2qx7UE3E5nDXcaNWDyyuigjGDyKFxt5VI7xdI7gr5y0JUza40Km9o8JNyC7A=@lists.freedesktop.org,
 AJvYcCXzxt8bnxTgghPT4jEWukT1D1NbBEPwOHefU7mZvhC/VWNp+s5/2CqzKga/F5uuY8KkwG13G/tsK3Mn@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLG0SyaTKSqriduTiUBaDg5tHEO2QcFjVtK5NlpGBDz19LErn4
 vBHNM1b5A4OouQ6d0JV/jxW4HPGY4qYfoTE/L8bex9UvdOFzH36S
X-Google-Smtp-Source: AGHT+IE8z5aVwlOc9iGi4Y4TMmapv34hJLB0tZlzJM+QSdbd9q/583IQr+kTvYfVBfS4mqbYuVvrew==
X-Received: by 2002:a17:907:6e88:b0:a86:7b71:7b74 with SMTP id
 a640c23a62f3a-a90296789b0mr2225124366b.55.1726571660336; 
 Tue, 17 Sep 2024 04:14:20 -0700 (PDT)
Received: from [192.168.1.17] (host-82-51-105-30.retail.telecomitalia.it.
 [82.51.105.30]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90612e1a55sm430745166b.157.2024.09.17.04.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 04:14:19 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Tue, 17 Sep 2024 13:14:13 +0200
Subject: [PATCH v4 03/11] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-preemption-a750-t-v4-3-95d48012e0ac@gmail.com>
References: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
In-Reply-To: <20240917-preemption-a750-t-v4-0-95d48012e0ac@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726571652; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=b3QMWPdvUro0RG0S1sUpKNLT+ur6G1ARTv9UYcpbY0iLkKkrGUxFa439U3BXNgLIXwbTC0PSo
 XWvSHZhlz6pAQOtBHxenEOqRHCjGZnCX54zMrv+ISKm4hFx9UZnrvAs
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Adds a field to `adreno_info` to store the GPU specific preempt record
size.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506..316f23ca9167 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1190,6 +1190,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.protect = &a730_protect,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 2860 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050a01), /* "C510v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1209,6 +1210,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7020100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43050c01), /* "C512v2" */
 		.family = ADRENO_7XX_GEN2,
@@ -1227,6 +1229,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7050001,
 		},
 		.address_space_size = SZ_256G,
+		.preempt_record_size = 4192 * SZ_1K,
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,
@@ -1245,6 +1248,7 @@ static const struct adreno_info a7xx_gpus[] = {
 			.gmu_chipid = 0x7090100,
 		},
 		.address_space_size = SZ_16G,
+		.preempt_record_size = 3572 * SZ_1K,
 	}
 };
 DECLARE_ADRENO_GPULIST(a7xx);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..6b1888280a83 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -111,6 +111,7 @@ struct adreno_info {
 	 * {SHRT_MAX, 0} sentinal.
 	 */
 	struct adreno_speedbin *speedbins;
+	u64 preempt_record_size;
 };
 
 #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }

-- 
2.46.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAA996DC6C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4110E8DA;
	Thu,  5 Sep 2024 14:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lpm8eCEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FC410E8DA;
 Thu,  5 Sep 2024 14:51:31 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5c3cdba33b0so959933a12.1; 
 Thu, 05 Sep 2024 07:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547890; x=1726152690; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=lpm8eCEe28IgIRRLBxmZdUFX89oosWN+J5Q4s4l4Ink5QvY3Uh0nrZ0lYYREfidU0D
 iyvB8jfRvC3k5CC2PFw4UbqYnsU7QYfMRcXNJJa0P1I89LROcTGCMXccP1p+HIlEoSSL
 jAzbuuzXd6w5TenJFXHrzBDKguWHdhM0yUXRLX1fv+yJeo2hv9f8kOEkUgI+LiQ3JTAM
 w6u945dk0Yo15GxeoIKDn1AdnUl2DeG6IlwvTNeGh1EjXe/dV2yMsGgvte9TI/bG8MUt
 tFE9Atke7bxOjZgFrtAsZNLvz+dk5FgIt/6C/15cHPaITwKEw8sNbwNhbY8SU/kQ+eOM
 DwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547890; x=1726152690;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OJMYlnyS1LZRaHdNncK1wWBqiV76KGsJGAYtBN7J5io=;
 b=wWGUY7cu34VbQl5d1R5gW4mjTrn9ZP/whe/nmILg3b6ZI2/rPcKimPfEjepHS+9nHy
 2uGd8L57teo68gwusWtcwxU4rFFDGM++gI9Rzw0b/abrLKt/KqlKgMnwTEa8uac++1jn
 z4DSj8LKsiNth8zcM7RlIPZyhRi2E8YbFjliao6IbukQHqZb0HdQsnenqF/DMb+MUefc
 Pul6LODUjGM/wjW1oYNkGRiZWMQjpYb32s8VD08jxRDwh4k5kQNxwxQ08SQfyKXh+s+H
 kUxYJtbThlgaxysfRwzWkUiLcrNVEyipLC+IRVPIqKQCoC5O06V76tS3wLvtQc5TT+sB
 QoYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Zn1j+0Ieu/B4rrmV0XIc8Mh8F2IjH0B/Vic34hGjF8P1+oGCLqF1eMEj8U64NaolzBHqXbQkXWY=@lists.freedesktop.org,
 AJvYcCW+DLg/OXRcZA9RlgwRJ2jMF+GeVGC46TvMYsGxlSTEeOLT6UqmS2ceqk/VjnFs75d/w/nvpe1HxXMC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRRZJyMz4stwYKmHcp0Snuq1CzyxVhMNePZPQUY+pYBnDJkbE6
 JfoZxM7AgSTsuvmwazcuvR2YHRcZesAvYbpSWZZbYCkp/GRZPLHV
X-Google-Smtp-Source: AGHT+IGdnG7dj/5Tshtbk3mhz2YNXaa/23+G//BXf7FfdlMZtjcrVX+UjO/SvoF8PF7ftj0ON7Qt7A==
X-Received: by 2002:a05:6402:2809:b0:5c3:c543:aa12 with SMTP id
 4fb4d7f45d1cf-5c3c543aacbmr4078105a12.0.1725547889146; 
 Thu, 05 Sep 2024 07:51:29 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:27 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:20 +0200
Subject: [PATCH v3 02/10] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-2-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=2182;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=xA2R7+V+qAfyd3M9fHuSXLIyku8IvZQlPct7Zfu1oEw=;
 b=QpK2MFB9mTSoRExGE4vT1AK7PoDs+4vH4tw6W/j0/E3WEinYYwvw1yBeQM3PAAip0T6RTmIRj
 +vmQTNXEAzlBIHnXdoRgnlST9t6rsCgC7kdNf2b52TaRU9pLHb3aG1Y
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


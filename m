Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1216A98F3C1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 18:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7384A10E8B3;
	Thu,  3 Oct 2024 16:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J+4ttf73";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98D10E8B5;
 Thu,  3 Oct 2024 16:13:04 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so156921366b.2; 
 Thu, 03 Oct 2024 09:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727971982; x=1728576782; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
 b=J+4ttf73g3t1UhPL8YS3+itSzmEV0gjZ8YxaE9n4Ktwj2nPOwfLOWAfqEVOThcuCAs
 YBHudf8vtfLBs7xL+GtZOCAGuLPvgjDUxAtyoNKPUCvIGeyd+lMMeCLcLaNZlsDoTg1t
 U2hZi4ahWQY1pZAN+rXKk8NYNzKMN/UUlEWqVrqmy32nIQkMfCPtJDMlbqacBrkQ9Um+
 GjuvtbGec7AZvM+BjT6+YZc8ywlSI78WAhrkx+Hizgj3Hn6y8hAbBuzQvteDfEBDgHN9
 TXi8+1kVZL1nrU1dzlNte058FbiLJRAHJhbfSw2mOuwndUp5ISyco1Caq2bWrA1m8W3l
 hbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727971982; x=1728576782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wyb3geUIdOaiHlo8mwWpCyJKar3stgK5wmtiUF5Pomg=;
 b=Q3a8vwjRWJRzE8ipaPHSRzMC9yuQYAqFiTVgGo6xQ/yluDDweyjJ2RMlSeIK7b9fpL
 2VTTMLoZE3xStYv1uDuYwb9oEbuTlEdSnJCr3XNQUrcSQArkHosJGHojKTCCxlluE0B6
 yAYzemM/n++JLkXHno/ZyHxuKX8e4b3IgqF2K/kR8AXjByIdjVcqJqiF72hIyxHWwDm6
 NjI276bFMUIZrzlFyGL5DyVUyo1/oTI8JEeZxEN0lUlnmiEB1oFbkR350WkaLOBnvWPi
 m7mAx4Kesuudz4nTmkEroTi+T2yYsb6lEGtbxT7tYtcw5/ZgSC4tFfyZgYFNZd5XaNAc
 vB/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ+pCJH+46+HMpXWTuMZBTAUyetu+WijmjyZNl0CY/YbU+6hc5Td554YBuxtkDlnaSbNDo28mFo/Mk@lists.freedesktop.org,
 AJvYcCVVL/0sZ1+6PvrXIMgmPNHgFKLInZ9t0XKGucXGhcRk74Iypc8Sos0jz4zWnP8oRSgNYJ3UUiag7io=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfSgGN6VyVmJI+un4kyhYO9MS7fhT/jYz2k54ZvDYxgtLxas9n
 G8tLnrVYvIv+x6+mWfq1LQ1qnWACurSh9JzueldaaE932zEzyn6AKHG19I5ZK/S19Q==
X-Google-Smtp-Source: AGHT+IGfZEdpncoLihfFB8ebzwOnEY+Udb2v0k7UqgH0GTJchQuHmXd0rMuPF5wDpj9ySOR443QKlg==
X-Received: by 2002:a17:907:7fa5:b0:a90:c411:24e0 with SMTP id
 a640c23a62f3a-a98f8250998mr675116666b.23.1727971982159; 
 Thu, 03 Oct 2024 09:13:02 -0700 (PDT)
Received: from [192.168.1.17] (host-79-12-161-203.retail.telecomitalia.it.
 [79.12.161.203]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99103b314asm102382366b.103.2024.10.03.09.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 09:13:01 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 03 Oct 2024 18:12:52 +0200
Subject: [PATCH v8 03/12] drm/msm: Add a `preempt_record_size` field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241003-preemption-a750-t-v8-3-5c6cb9f256e0@gmail.com>
References: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
In-Reply-To: <20241003-preemption-a750-t-v8-0-5c6cb9f256e0@gmail.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727971975; l=2480;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=mw98QEzBIwYx44vG8hfTrLa/RurlCEDImHR+oHkKWF4=;
 b=z+/TNgc/HPX9gfeh5PlsvknjTcGVNf8DSg7n/ZXpQRoD7DYcCFOy5ZKWUWnxKEuLXuL7m92bs
 92Sdo8PrHFaCVVaxCYxlJoFortKUOrShPVLahPPteVCI9FpX7tfmpvb
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

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Tested-by: Rob Clark <robdclark@gmail.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 68ba9aed5506ea2f367ff0282a73fdd1122f2526..316f23ca91671d973797f2a5b69344f376707325 100644
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
index 1ab523a163a00b333a85b099e9eb9209e6a2e646..6b1888280a83e6288c4b071733d5d6097afe3a99 100644
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
2.46.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE645CF2A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 22:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48AE6EDC1;
	Wed, 24 Nov 2021 21:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4492D6EDBC;
 Wed, 24 Nov 2021 21:37:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id np3so3540421pjb.4;
 Wed, 24 Nov 2021 13:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rsnpDwaJzIRJCyQqwB8iuw0EmHd8v8ZYDZV9W/QzeME=;
 b=O/8XmrXsh4O9XIJ5DpVYV6ww891AjtBT055DETWhfxE3qZjrtPSfObN3pzlKqXsaic
 qPOsZQC7/DwN6g+ikJND7BrWkBa4hGf2RNciP7B7kIi/sNA74PF326vCW1MhaWSERra2
 NwILWI/7YY23bZ9e094A8FkBZNP0tAw5iZ8c22ykgglKXRj/T3Hhvs+we/0T2SD4B19H
 i4uFe9HvaWMf285w5PlKA8IfYhmu9QCj4VeoXPni+L5uTq3CERU1ayDBq4X5wI88kmeG
 EYQdY8pmomlTTg50VctkiusuWYVqV/z1d9/Z62a/pRJTy2B/GsglCG5vLXXSHhwX8CVj
 Xw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsnpDwaJzIRJCyQqwB8iuw0EmHd8v8ZYDZV9W/QzeME=;
 b=IEjyE4w0nzpbXlWifQxSJCFl5vEWdAwxNObXGpTEoErZXHVKfginFEVm5dCo2jVZ0L
 VabAsuirXpEaAiuvF/A0QG7WcjHoboNJIqnXHTOnVJ+e+hvk2GTbmIknVlR9qRf/wsaU
 84Hwurwuid4HrI6POFvE0aQPRo2TApG+MzSq2jhapMRgMqwC4EXKdPahCNYUwEV01MG5
 K2yjkySakhf5JlzyviRYwgx5fALEVrGk92fe8ztZnXvbWH8M135ICsrV0DP/ECK20Q5I
 VfmYBQOa2Fxf0DbjnY43xseWfYWMdU4zyJU6fCNNXWx9dyxYO6KW9TYad3F9F0KkFRaX
 1RZw==
X-Gm-Message-State: AOAM533nOr9rSIrkuaTANi5deVWTdbFQPorhBeMFTwLo9sCkrkZj2fDi
 ZVxWoUMrZMVZ5qZ7KW4xHBkU2BP/G6w=
X-Google-Smtp-Source: ABdhPJwnSL0wUM7AYUCkvmJlm4x5ldzNMZeJrUCC6hJj9rQ9UFjvkEXhuxtFVifBNIsgBZfuLiWByQ==
X-Received: by 2002:a17:90b:11c1:: with SMTP id
 gv1mr255103pjb.208.1637789827178; 
 Wed, 24 Nov 2021 13:37:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 r16sm501945pgk.45.2021.11.24.13.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:37:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm/a6xx: Capture gmu log in devcoredump
Date: Wed, 24 Nov 2021 13:41:26 -0800
Message-Id: <20211124214151.1427022-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Akhil P Oommen <akhilpo@codeaurora.org>

Capture gmu log in coredump to enhance debugging.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 41 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  2 +
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 6e90209cd543..f1b1a9bffb37 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -42,6 +42,8 @@ struct a6xx_gpu_state {
 	struct a6xx_gpu_state_obj *cx_debugbus;
 	int nr_cx_debugbus;
 
+	struct msm_gpu_state_bo *gmu_log;
+
 	struct list_head objs;
 };
 
@@ -800,6 +802,30 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		&a6xx_state->gmu_registers[2], false);
 }
 
+static void a6xx_get_gmu_log(struct msm_gpu *gpu,
+		struct a6xx_gpu_state *a6xx_state)
+{
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	struct msm_gpu_state_bo *gmu_log;
+
+	gmu_log = state_kcalloc(a6xx_state,
+		1, sizeof(*a6xx_state->gmu_log));
+	if (!gmu_log)
+		return;
+
+	gmu_log->iova = gmu->log.iova;
+	gmu_log->size = gmu->log.size;
+	gmu_log->data = kvzalloc(gmu_log->size, GFP_KERNEL);
+	if (!gmu_log->data)
+		return;
+
+	memcpy(gmu_log->data, gmu->log.virt, gmu->log.size);
+
+	a6xx_state->gmu_log = gmu_log;
+}
+
 #define A6XX_GBIF_REGLIST_SIZE   1
 static void a6xx_get_registers(struct msm_gpu *gpu,
 		struct a6xx_gpu_state *a6xx_state,
@@ -937,6 +963,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 
 	a6xx_get_gmu_registers(gpu, a6xx_state);
 
+	a6xx_get_gmu_log(gpu, a6xx_state);
+
 	/* If GX isn't on the rest of the data isn't going to be accessible */
 	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
 		return &a6xx_state->base;
@@ -978,6 +1006,9 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	struct a6xx_gpu_state *a6xx_state = container_of(state,
 			struct a6xx_gpu_state, base);
 
+	if (a6xx_state->gmu_log && a6xx_state->gmu_log->data)
+		kvfree(a6xx_state->gmu_log->data);
+
 	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
 		kfree(obj);
 
@@ -1191,6 +1222,16 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 
 	adreno_show(gpu, state, p);
 
+	drm_puts(p, "gmu-log:\n");
+	if (a6xx_state->gmu_log) {
+		struct msm_gpu_state_bo *gmu_log = a6xx_state->gmu_log;
+
+		drm_printf(p, "    iova: 0x%016llx\n", gmu_log->iova);
+		drm_printf(p, "    size: %d\n", gmu_log->size);
+		adreno_show_object(p, &gmu_log->data, gmu_log->size,
+				&gmu_log->encoded);
+	}
+
 	drm_puts(p, "registers:\n");
 	for (i = 0; i < a6xx_state->nr_registers; i++) {
 		struct a6xx_gpu_state_obj *obj = &a6xx_state->registers[i];
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 7bac86b01f30..a379f98aca54 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -630,7 +630,7 @@ static char *adreno_gpu_ascii85_encode(u32 *src, size_t len)
 }
 
 /* len is expected to be in bytes */
-static void adreno_show_object(struct drm_printer *p, void **ptr, int len,
+void adreno_show_object(struct drm_printer *p, void **ptr, int len,
 		bool *encoded)
 {
 	if (!*ptr || !len)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 225c277a6223..676230862671 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -306,6 +306,8 @@ void adreno_gpu_state_destroy(struct msm_gpu_state *state);
 
 int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state);
 int adreno_gpu_state_put(struct msm_gpu_state *state);
+void adreno_show_object(struct drm_printer *p, void **ptr, int len,
+		bool *encoded);
 
 /*
  * Common helper function to initialize the default address space for arm-smmu
-- 
2.33.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E788774A5A4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AF710E4DC;
	Thu,  6 Jul 2023 21:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8902610E4DC;
 Thu,  6 Jul 2023 21:11:17 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666e6ecb52dso771827b3a.2; 
 Thu, 06 Jul 2023 14:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677876; x=1691269876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aJfhffobAvS4fPeFK5+vNHvDypE+Znk5cG3u/ZHpWrQ=;
 b=qlSZIASj3TAvTFsG5mWkoHyIe28Y3BJCJYslxRe+NFlXV0iUXXBACu5VblExGyw7m1
 0LlPfDxcBFjmM9T+JfFYUkjUFTXwVZlxxkjsVA6UWoDzhF7FvpTx/RE2zrP0r3nK7Is9
 uTvL23ZOirsiXeKKwNsaJOEnRcxVTBCCegHwIB0mzxDkMUOuc67/4EiycMyVLZ5d1FWV
 1uy4QNTY4GphL5rjbJGgeNs8vAZLgu5FN7KHADq0Q+DrZyzueZ4tGAcSoJji1Ds7LVZJ
 5qXP1v0/Me/gFQgO9wWzhBDErfurPX0vtR8/VnrKM+9H7LvJ1ZU72lRVNXnM+BvLWxRk
 58qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677876; x=1691269876;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aJfhffobAvS4fPeFK5+vNHvDypE+Znk5cG3u/ZHpWrQ=;
 b=RlYCPTnl/lc3E7sHAshrblNrKsRu9VG1dzk2DroItWhCaBhEvl81dptsvubE7ij9Sb
 B5WD+1hTBWZhUICWl3DFqO3J/2BL/YZwC7DrTzQoG6XXVWBQddrcbABUX6nPnUiTfHhR
 axZx2DQ8N4+sra4I6PMcz697wC3s9iTnle6GN7NaU+8Mtd6J01F0rjqcedqYilgz0S5c
 XwqxXP+m3bwBTs2T+WI6uaYZ9Wkcotlqjg8MbyWH0FotZhgDHvH//JumqTfsm2u2IdwX
 +Ab6s8qhP/bATDmMI6k51Sezkq43qoFuUanFikisFjYa8XMhukO+R41NkO43AycBE+/L
 u50w==
X-Gm-Message-State: ABy/qLZORKGYo2EwscU+xfSCmIam6XZujmHCRaP3yUivZcQNB8tx1EuW
 fDy53AVOTalO1i3lNpZJaywvwhkHUrU=
X-Google-Smtp-Source: APBJJlFs/92o4OHExwCe74IPOUNwGT9I/K2yc7xwKRb1jGdURuCQvtrQiURUjBvdMJPfsfDbmv95kw==
X-Received: by 2002:a05:6a00:b4c:b0:644:d775:60bb with SMTP id
 p12-20020a056a000b4c00b00644d77560bbmr2747265pfo.20.1688677876416; 
 Thu, 06 Jul 2023 14:11:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a62e30f000000b00682a16f0b00sm1653068pfh.210.2023.07.06.14.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:11:16 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] drm/msm/adreno: Add helper for formating chip-id
Date: Thu,  6 Jul 2023 14:10:43 -0700
Message-ID: <20230706211045.204925-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706211045.204925-1-robdclark@gmail.com>
References: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This is used in a few places, including one that is parsed by userspace
tools.  So let's standardize it a bit better.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  8 +++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 19 ++++++++-----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index dcd6363ac7b0..fd2e183bce60 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -661,14 +661,12 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 	info = adreno_info(config.rev);
 
 	if (!info) {
-		dev_warn(drm->dev, "Unknown GPU revision: %u.%u.%u.%u\n",
-			config.rev.core, config.rev.major,
-			config.rev.minor, config.rev.patchid);
+		dev_warn(drm->dev, "Unknown GPU revision: %"ADRENO_CHIPID_FMT"\n",
+			ADRENO_CHIPID_ARGS(config.rev));
 		return -ENXIO;
 	}
 
-	DBG("Found GPU: %u.%u.%u.%u", config.rev.core, config.rev.major,
-		config.rev.minor, config.rev.patchid);
+	DBG("Found GPU: %"ADRENO_CHIPID_FMT, ADRENO_CHIPID_ARGS(config.rev));
 
 	priv->is_a2xx = info->family < ADRENO_3XX;
 	priv->has_cached_coherent =
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 75ff7fb46099..1a982a926f21 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -847,10 +847,9 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	if (IS_ERR_OR_NULL(state))
 		return;
 
-	drm_printf(p, "revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	drm_printf(p, "revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 	/*
 	 * If this is state collected due to iova fault, so fault related info
 	 *
@@ -921,10 +920,9 @@ void adreno_dump_info(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i;
 
-	printk("revision: %d (%d.%d.%d.%d)\n",
-			adreno_gpu->info->revn, adreno_gpu->rev.core,
-			adreno_gpu->rev.major, adreno_gpu->rev.minor,
-			adreno_gpu->rev.patchid);
+	printk("revision: %u (%"ADRENO_CHIPID_FMT")\n",
+			adreno_gpu->info->revn,
+			ADRENO_CHIPID_ARGS(adreno_gpu->rev));
 
 	for (i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
@@ -1105,9 +1103,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		speedbin = 0xffff;
 	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
 
-	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
-			rev->core, rev->major, rev->minor,
-			rev->patchid);
+	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
+			ADRENO_CHIPID_ARGS(config->rev));
 	if (!gpu_name)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2fa14dcd4e40..73e7155f164c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -66,6 +66,12 @@ struct adreno_rev {
 #define ADRENO_REV(core, major, minor, patchid) \
 	((struct adreno_rev){ core, major, minor, patchid })
 
+/* Helper for formating the chip_id in the way that userspace tools like
+ * crashdec expect.
+ */
+#define ADRENO_CHIPID_FMT "u.%u.%u.%u"
+#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_r).patchid
+
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
-- 
2.41.0


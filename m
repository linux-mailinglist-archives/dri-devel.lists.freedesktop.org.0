Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38150805E43
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 20:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 963BC10E5FB;
	Tue,  5 Dec 2023 19:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0340A10E51C;
 Tue,  5 Dec 2023 19:02:39 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6cdcef787ffso6281329b3a.0; 
 Tue, 05 Dec 2023 11:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701802958; x=1702407758; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gr71sNINRYPArpI+CNr5Fv+CLv1NDL4SnaWZ3f+C3cc=;
 b=FRHWTZcBtb3+m4FJK3zI7iYgkQxZy9qOBZMPltmUl7HWY4CGq9kNiWAVLLAN6N3zZT
 oMq5BTcugnfw6SaIa1OWijTxEDtXtOCGbagjTshdrfGIM9SOdoaiy/aYKmajuypkINtm
 TDpt3Y9mkXzMwyKYYREdPqcwVu9dQqYN2HALCQQOoMAZXo5mdZNdcqm0sscdB84bfFJs
 +384/OtELlZcUjpZKPfM/IFQlvoeWHt8fGOK2CRgeFvffYZHU1McoDmiyL2OXGI1DYf0
 l7jg11DJWGRDt2Ydacfu2H+KvoNp34jzBKXzoZXlCwLGxlBp29YBfiiIKdKTGQDpxjUz
 j5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701802958; x=1702407758;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gr71sNINRYPArpI+CNr5Fv+CLv1NDL4SnaWZ3f+C3cc=;
 b=nL925jnAIdPMd4jzTiRWcC+GAil58WL4yW3ffziz/Fk3du0FS/GjuUxPX4AO+7b/tt
 Q5yNFUwQ9n/Ccgst2yhDOooK/WooFFebFfkcAJIjQXSIy/z3GOwT0XEsTBOZRFUXjKUG
 gyBIWAF1ua/FH4DdW/De7Br+MsM7SmAISOEbDDJVgrNGZirXgbHr+FO/B6ll5n4uMZ3U
 dSYwS/J3sTK67qxswQ8rxTLkhdpXJR8KfEfU73l4B6Hd28pKEd3c6IPkEXds3DuUOBNs
 So4kfMVIHRByahribTzyk+Nm4jtsRkDbvm+EAMlBccR/GZfEZ53Bn5hG+WnilGj/ugEC
 WcZQ==
X-Gm-Message-State: AOJu0Yy2xJWk0X/fh1dP3oie0cQOWgEYdGe/AU+0eUtK0joOCA2IMrHm
 H+xj9stwysONe6DcUUmC+7C5WQP7lSs=
X-Google-Smtp-Source: AGHT+IHU2ya8bSn4bAfwtnCaBXtL2UTM+QfuRrIn5PJLt281Wya4plXg44RgEht3EFWm/rTyANJk7g==
X-Received: by 2002:a05:6a00:1806:b0:6ce:3f02:10a3 with SMTP id
 y6-20020a056a00180600b006ce3f0210a3mr2331731pfa.8.1701802958385; 
 Tue, 05 Dec 2023 11:02:38 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 r14-20020aa7844e000000b006ce467a2489sm4867944pfn.175.2023.12.05.11.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 11:02:37 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/scheduler: Unwrap job dependencies
Date: Tue,  5 Dec 2023 11:02:33 -0800
Message-ID: <20231205190234.371322-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Rob Clark <robdclark@chromium.org>, Luben Tuikov <ltuikov89@gmail.com>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linaro-mm-sig@lists.linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_?:buf|fence|resvb"
 <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Container fences have burner contexts, which makes the trick to store at
most one fence per context somewhat useless if we don't unwrap array or
chain fences.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 47 ++++++++++++++++++--------
 1 file changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 9762464e3f99..16b550949c57 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -52,6 +52,7 @@
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/dma-resv.h>
 #include <uapi/linux/sched/types.h>
 
@@ -684,27 +685,14 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
-/**
- * drm_sched_job_add_dependency - adds the fence as a job dependency
- * @job: scheduler job to add the dependencies to
- * @fence: the dma_fence to add to the list of dependencies.
- *
- * Note that @fence is consumed in both the success and error cases.
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int drm_sched_job_add_dependency(struct drm_sched_job *job,
-				 struct dma_fence *fence)
+static int drm_sched_job_add_single_dependency(struct drm_sched_job *job,
+					       struct dma_fence *fence)
 {
 	struct dma_fence *entry;
 	unsigned long index;
 	u32 id = 0;
 	int ret;
 
-	if (!fence)
-		return 0;
-
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
@@ -728,6 +716,35 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 
 	return ret;
 }
+
+/**
+ * drm_sched_job_add_dependency - adds the fence as a job dependency
+ * @job: scheduler job to add the dependencies to
+ * @fence: the dma_fence to add to the list of dependencies.
+ *
+ * Note that @fence is consumed in both the success and error cases.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_dependency(struct drm_sched_job *job,
+				 struct dma_fence *fence)
+{
+	struct dma_fence_unwrap iter;
+	struct dma_fence *f;
+	int ret = 0;
+
+	dma_fence_unwrap_for_each (f, &iter, fence) {
+		dma_fence_get(f);
+		ret = drm_sched_job_add_single_dependency(job, f);
+		if (ret)
+			break;
+	}
+
+	dma_fence_put(fence);
+
+	return ret;
+}
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
 /**
-- 
2.42.0


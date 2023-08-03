Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3376F563
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB4E10E690;
	Thu,  3 Aug 2023 22:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F9510E67E;
 Thu,  3 Aug 2023 22:02:36 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-563f752774fso808446a12.1; 
 Thu, 03 Aug 2023 15:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100155; x=1691704955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pMDPDTveGL0XcUxjW8MDNhSNAkJwzlTE+WboD+rmGEU=;
 b=K5i3GJH74VyDW/Jnmr2wdrMdRA/gKgvGuAvzOT8myorsO3NeQaBOBreJNBjYoNQWNg
 uzoHb2SP+NRSGHO7/22vPzxXQV+u8VN76aNFfqtsNOH1UumHIyncxW/opHtvgwLqAhGv
 C6O52woALbRk0uYz3G0YUjWZrJKL86vzOlH4m2uEdRh8JfyoslqeDVIb4+PGbuPaxl5f
 DsoYpsylrR0sfvi7OsSDYYhOjiWlTjFqF5ByTmRbfsDV2I/dZ2tdGz+iIptnSarAUdAC
 a4TV+bBzWzsO44QV8hF3UQ/LK7fLhxNs8xs7ym/47qJspRqsZDpqStaRtavsfzElDyXx
 NSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100155; x=1691704955;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pMDPDTveGL0XcUxjW8MDNhSNAkJwzlTE+WboD+rmGEU=;
 b=SYsodrhbCr8DeQsbntja+Sj9vg76nWXAJsok+ElHjCHftW01gTKwwS7khLdlHiqv1k
 uhXh7TGL5OSvwZEXDZohmNpl+UyRnEkWDqvL1itphPFyTiseYF5EEZJfPnsibRX2AH3/
 HD+NcX7bCibcWG73eb+/O+kj6IfrYUDvpqssE+7GXndKvDnMEP/Omy1N5EOxBn7zYnKt
 D1LIzaLPZiypQinjTc4PRlVBl5O50H8OhX+qF8rEprCdk0EQgJsWdU9zZvXbqJNBfDY7
 KtuoG1WvmUfA+l2S3jmLxQskqCT8kmqenfEOA2F3OJ4pmtd9SXUMLyXWtJEKvxE9AdTD
 Aq4g==
X-Gm-Message-State: AOJu0YwITeiq0e29qzygCMvbKV2rxJiDYpBZCmgzLls3GNwQLw5wR6L8
 y8Gw3GGWJKQ4PN0XJWE2gG3Sz19fTmw=
X-Google-Smtp-Source: AGHT+IGxaayfkSbW7gr+exgp8ER/palrd0d4li5a+dZz8brgaJjEo3IxY3Az+mnAuhnhmiF9IO4AzQ==
X-Received: by 2002:a17:90a:9482:b0:268:23d7:21c with SMTP id
 s2-20020a17090a948200b0026823d7021cmr8394pjo.30.1691100155002; 
 Thu, 03 Aug 2023 15:02:35 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a17090a654300b002641a9faa01sm2946613pjs.52.2023.08.03.15.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/9] drm/sched: Add (optional) fence signaling annotation
Date: Thu,  3 Aug 2023 15:01:56 -0700
Message-ID: <20230803220202.78036-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Based on
https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
but made to be optional.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++++
 include/drm/gpu_scheduler.h            | 2 ++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 7b2bfc10c1a5..b0368b815ff5 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1005,10 +1005,15 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	const bool fence_signalling = sched->fence_signalling;
+	bool fence_cookie;
 	int r;
 
 	sched_set_fifo_low(current);
 
+	if (fence_signalling)
+		fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -1064,6 +1069,10 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	if (fence_signalling)
+		dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index e95b4837e5a3..58d958ad31a1 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -493,6 +493,7 @@ struct drm_sched_backend_ops {
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @dev: system &struct device
+ * @fence_signalling: Opt in to fence signalling annotations
  *
  * One scheduler is implemented for each hardware ring.
  */
@@ -517,6 +518,7 @@ struct drm_gpu_scheduler {
 	bool				ready;
 	bool				free_guilty;
 	struct device			*dev;
+	bool 				fence_signalling;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
-- 
2.41.0


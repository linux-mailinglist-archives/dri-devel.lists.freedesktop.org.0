Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2A963837
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 04:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0083D10E021;
	Thu, 29 Aug 2024 02:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EKGC8m+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B9C10E021
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 02:32:50 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20212f701c9so73165ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 19:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724898770; x=1725503570; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5rGIMaZIlS+uYoamxpeB6aDyElxjZF63C2u5eChs7sA=;
 b=EKGC8m+Wk//qjp2ypwV9NGTWdFstRqav3WyI+r0lyu5BSGMVjNjuNVTKqVWbpbb3H/
 c1t3ZIm+R84lbo8WiyllQNUlVfSKMG+XsrOes5giQh7XUj9+xF7lNt31clbQ3gphua10
 sLEMQKMTyQnX4aaEdoR3N0xuIZsB73lPK13Q8+xeKEkwFM7VwqZNUQ7D5nQRTHbCBteM
 b4px/y+4H16k1awUeJezxC6QbdG2klqkI2+gp2TCfIwRUxvoMAsNuaIZpIgSlFfTFold
 3rPYHrUW2A5XntbtosgxKW7w1tONo0nSsHQGAlFJwd1Wknj+U96dIJ/T8blPNJws/XB/
 YRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724898770; x=1725503570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rGIMaZIlS+uYoamxpeB6aDyElxjZF63C2u5eChs7sA=;
 b=PIAVUyawGmz6nwntdcYyUn1851j8dmXR9QbLJhtsU/ogpu5F8L/ZZ/NFgyLYqiHf07
 2nzGMdngmjTwzCcG4uVbiVVrmrfbj7/mEnFh/1kdl6GraVTnzP/uLoAtWfM3vfblX2ii
 G2xuRZX9JzSL9eZa+VYDQekYFI9cJaMYXkReY1V6OBKyJL2+x0oSgIbaSsep8E834ACU
 rxFrhAygs49j47jvEu5/1m3yW6BM9dTu6jmGo96YwG/YxNJkrPTt4A5jlAWJudn744yO
 tklBl+azj8Q3zam3ftNRCjgQ6Woj88fO7z1inlhDdICKCL+gMihaJf2E7wVA8aDTX3Mb
 /fXA==
X-Gm-Message-State: AOJu0YylhVuAHqCaz4zy5VY6pq4gXIqrgLIHlqaNYR+w+uCxlHGpt/VD
 99lNm5F1SkeqwCLHEPeJbyzbsp+tjVDVKXSPlNwD6Tv7B/4NSKsc
X-Google-Smtp-Source: AGHT+IGQHvu+cnPJ6a1QdizBA5u3ZH/efwyfT1xu4ykAr0DVKpuVEGiBrjP8b9EGaukHWAc8sFm0Ug==
X-Received: by 2002:a17:90b:1e12:b0:2cb:4382:99f1 with SMTP id
 98e67ed59e1d1-2d8565339c6mr771970a91.6.1724898769543; 
 Wed, 28 Aug 2024 19:32:49 -0700 (PDT)
Received: from localhost.localdomain ([182.148.12.132])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d84462aec5sm2693131a91.32.2024.08.28.19.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 19:32:49 -0700 (PDT)
From: qianyi liu <liuqianyi125@gmail.com>
To: Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 liuqianyi125@gmail.com
Subject: [PATCH] drm/sched: coding style fixes: miscellaneous
Date: Thu, 29 Aug 2024 10:32:40 +0800
Message-Id: <20240829023240.1871078-1-liuqianyi125@gmail.com>
X-Mailer: git-send-email 2.25.1
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

This patch fixes the following checkpatch:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
WARNING: Missing a blank line after declarations
WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable

Signed-off-by: qianyi liu <liuqianyi125@gmail.com>
---
 drivers/gpu/drm/scheduler/gpu_scheduler_trace.h | 2 +-
 drivers/gpu/drm/scheduler/sched_fence.c         | 3 ++-
 drivers/gpu/drm/scheduler/sched_main.c          | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
index c75302ca3427..ea7059886d2a 100644
--- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
+++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
@@ -90,7 +90,7 @@ TRACE_EVENT(drm_sched_job_wait_dep,
 			     __field(uint64_t, id)
 			     __field(struct dma_fence *, fence)
 			     __field(uint64_t, ctx)
-			     __field(unsigned, seqno)
+			     __field(unsigned int, seqno)
 			     ),
 
 	    TP_fast_assign(
diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 0f35f009b9d3..0d60d585dabf 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -90,6 +90,7 @@ static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
 static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
 {
 	struct drm_sched_fence *fence = to_drm_sched_fence(f);
+
 	return (const char *)fence->sched->name;
 }
 
@@ -221,7 +222,7 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 void drm_sched_fence_init(struct drm_sched_fence *fence,
 			  struct drm_sched_entity *entity)
 {
-	unsigned seq;
+	unsigned int seq;
 
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index ab53ab486fe6..ceddac09829c 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -667,7 +667,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
 	 */
 	cancel_delayed_work(&sched->work_tdr);
 }
-
 EXPORT_SYMBOL(drm_sched_stop);
 
 /**
-- 
2.25.1


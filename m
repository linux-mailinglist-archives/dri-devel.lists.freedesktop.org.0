Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB2D19D48
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 16:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CDC10E4FD;
	Tue, 13 Jan 2026 15:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j5CDjJ1U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7CE910E4F7
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 15:21:37 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so77361885e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 07:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768317696; x=1768922496; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDOfduCvUazAGXO7sE9B3QJ7Rvq+vtVVo2kOgC2agQM=;
 b=j5CDjJ1UEovmavAqyTFIrZnuip/Xku06JTdmikQdvWDLc6ce7PdAnSrK4Wbt8Q3Uxe
 E66z8PvnFA2Khnu92I10969HwCEsG6nWfkvemhwsWlu96cpg/n/HmVfgcMKuLhTGM345
 QWPzCcUeb1JvT8wdVYy6BrhgbYHmW8wAEtxmjpkP+AWNbwIpEsx6t/IK6oz2C15bq89I
 Ge4WnW2DtxyqxO1SkNsy7KlA0Vse8jVd6qjfXalrSuxRaQCqbodFhaNS10xozxuIeoDm
 OMoiZHqVr2IgHXUD+jVdduExMoDzvtbI2G0hoaOL9V+6Niswjm5r6cvez7H7Wd+U6uBH
 LK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768317696; x=1768922496;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PDOfduCvUazAGXO7sE9B3QJ7Rvq+vtVVo2kOgC2agQM=;
 b=LWxk/uS9yKbOtsv0EYOImleNbUDYYlZW2bWPjieEW2nzwqzYoqQzDaoRewdgCbQGgw
 +z1twBmig2GQu9zhY4nd5sQag0nKfmYlocxP6Z1diWmkM7sM2a27wK5mbjmdmALy63v3
 4OZt4X1xujqrzzlG8YFQYZ2ggLaTgN1PRoo47Ky3tCp/HLkZw67CKYaFkAthU2baX961
 Kc0urlZtrP5WIp7SIrHLc1lM8y2WdughBf0Z/gnNFYG4p3Wadcrx8ATp6CMISFyyo1wr
 n6Ho8zne/vOFU2yWDjvhL+A3dslk3CtGQySZ0ow7EmSsD9RSuk+aqqL8EgZQWUN9SG9F
 QDlQ==
X-Gm-Message-State: AOJu0Yzyf7FXXXQOUI4SP1ocB4L8UZrUlhqstrTt9aKMjnAFkATe0olT
 dErNtnPU+Kn1XFU2zw3+RQALis+doNnYgarpvukvrQLjxQbXAfG2tPPU
X-Gm-Gg: AY/fxX6H2YHQIHxvKyi6ti5A5KDSVsWd5Zhx5C2YwqOq5PgvdRhxFJIOpHpOXxHRslO
 lt+DRqCq5FyzSYfFIGG+CTAUtOiS0CKA5ufm+KqqmfS+I/OwTyAN1nBdge2LGc+AsSiJVwNc//s
 biHD88EY+eF8wdR5ASYmRNqjTRY8XUd4KhcrdXoKqS7JK1/CKikGMwZrpxosTEfLbqtjyDU4OcU
 /F/arB0PH7it4BM2t+qODVHXnDn2QsQom4VOLHjaDgKhU2dPJM3vWxo1S2D4uoaNJmsbF8b+Zig
 VsyW7jWQTg3cPTEdQ2McTGk88NyuyFJ0nDNpiSXnmL4SlecSHjzOHWi/3dtDrKU7NrT6BL8xqge
 IqeI1tmwvx6heLvYZrmbWfam8iZqgg9vRt0jyBHr3bdMFdPjd+9znPnv2DCxWl9vLBrkqupYOdY
 xG0FunoinPUScLhrDlch6i/Y8dvTVcjfwSYA==
X-Google-Smtp-Source: AGHT+IHqCCMXA+YjTGBi/Hga0jizyr4ShDi/Djt4mhEwm/2S1qQx5Qge/+BgXRm7uSEN7200l+8OoQ==
X-Received: by 2002:a05:600c:3b90:b0:45d:d8d6:7fcc with SMTP id
 5b1f17b1804b1-47d84b3864cmr268354705e9.27.1768317695905; 
 Tue, 13 Jan 2026 07:21:35 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:141c:9800:1651:dfa:9e48:25d5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47ecf6a5466sm129518405e9.11.2026.01.13.07.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 07:21:35 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, tursulin@ursulin.net, matthew.brost@intel.com,
 sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/10] drm/sched: use inline locks for the drm-sched-fence v2
Date: Tue, 13 Jan 2026 16:16:17 +0100
Message-ID: <20260113152125.47380-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113152125.47380-1-christian.koenig@amd.com>
References: <20260113152125.47380-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Using the inline lock is now the recommended way for dma_fence implementations.

For the scheduler fence use the inline lock for the scheduled fence part
and then the lock from the scheduled fence as external lock for the finished fence.

This way there is no functional difference, except for saving the space
for the separate lock.

v2: re-work the patch to avoid any functional difference

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 6 +++---
 include/drm/gpu_scheduler.h             | 4 ----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 724d77694246..112677231f9a 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 
 	fence->owner = owner;
 	fence->drm_client_id = drm_client_id;
-	spin_lock_init(&fence->lock);
 
 	return fence;
 }
@@ -230,9 +229,10 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
 	fence->sched = entity->rq->sched;
 	seq = atomic_inc_return(&entity->fence_seq);
 	dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
-		       &fence->lock, entity->fence_context, seq);
+		       NULL, entity->fence_context, seq);
 	dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
-		       &fence->lock, entity->fence_context + 1, seq);
+		       dma_fence_spinlock(&fence->scheduled),
+		       entity->fence_context + 1, seq);
 }
 
 module_init(drm_sched_fence_slab_init);
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 78e07c2507c7..ad3704685163 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,10 +297,6 @@ struct drm_sched_fence {
          * belongs to.
          */
 	struct drm_gpu_scheduler	*sched;
-        /**
-         * @lock: the lock used by the scheduled and the finished fences.
-         */
-	spinlock_t			lock;
         /**
          * @owner: job owner for debugging
          */
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E35FEAD8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5085510EAA5;
	Fri, 14 Oct 2022 08:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8E210EA9F;
 Fri, 14 Oct 2022 08:46:58 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id q9so9128033ejd.0;
 Fri, 14 Oct 2022 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCbxXocJQnXwu3iji5cPcGCLsWdkXkr+U1iyhGD62e4=;
 b=ANT3l1Qxq+dz/boDWBmM83o4HvZZ33IVVhxT/kO+qNEq1Lc4gX98Eiu6YSIOzNkNnE
 h58PUaPeCGwWJuG6Gd6tq/rGNNVbO2gc+YfQ4o3d9bRTT4OZcGD88OugD+9GlHO8h13S
 tLfHhXtIkr0Wo6NPXB+xRglZGUftwIW08o6p7XtsZANeRlRMGofB3exB0u+orFLyIxLt
 uiu0P74gk1svzQR1b6ZvXIYEGdhtpkVJqrxKT/iU4AIy69U3yzhuj1Tci8yiwAsSVFu7
 +iPMtURiN/vZZQNMMnpSpbUvHtGy3+wFpBQHlwOeVW/48yFl1nu77SxKCcYQ8+wa0Ali
 /3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCbxXocJQnXwu3iji5cPcGCLsWdkXkr+U1iyhGD62e4=;
 b=prrAK4ihEV78ngtdvajgICYopoDRxsoG6CMP9xgI+EgafwdJdR/wRRO6QeMx6Uc3TG
 Xivdb3QNcMROnkap0dSttfIfRo7+Ko684YM33pGik3BaCTIUBfd8SWG4jukeA5MWNmQI
 GGyMrzzAsx381kKkHZ+TS+XRmtEi6ripZzntJ2buZNwTOA9lYFWU95gqTpCcA7MgeJpk
 srpDAr9TfxSM6MhOHcy3aNd0d1InX5IQ/veFG9sCMXvmxCmokAyd3FtcNdhYXveeIpog
 ev2MDau1nPqghZwWHROQo5UZ3tKHXtEKkZDe2nbWtPTzOeHXIsargbK9mot1GfDyCXSe
 ersA==
X-Gm-Message-State: ACrzQf2TTmxHMxLudg8JqUSgJUtxXdVH9x12OzPCt+n8w1s8mPfTB6be
 WPcEkf6z5HKUr73R6Ul8e1s=
X-Google-Smtp-Source: AMsMyM4BGQY04ESJZDg3DpwfN/7Z+W7TxACzuIW1gpxDF3I9iAmlWp1tgf65Tv7vUxEEZ/OjmhAqgg==
X-Received: by 2002:a17:907:ea6:b0:782:1ace:9d5b with SMTP id
 ho38-20020a1709070ea600b007821ace9d5bmr2616948ejc.770.1665737216653; 
 Fri, 14 Oct 2022 01:46:56 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 11/13] drm/scheduler: remove drm_sched_dependency_optimized
Date: Fri, 14 Oct 2022 10:46:39 +0200
Message-Id: <20221014084641.128280-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Not used any more.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 --------------------------
 include/drm/gpu_scheduler.h            |  2 --
 2 files changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6e2cd0f906b2..ae4aac6eb26e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -197,32 +197,6 @@ static void drm_sched_job_done_cb(struct dma_fence *f, struct dma_fence_cb *cb)
 	drm_sched_job_done(s_job);
 }
 
-/**
- * drm_sched_dependency_optimized
- *
- * @fence: the dependency fence
- * @entity: the entity which depends on the above fence
- *
- * Returns true if the dependency can be optimized and false otherwise
- */
-bool drm_sched_dependency_optimized(struct dma_fence* fence,
-				    struct drm_sched_entity *entity)
-{
-	struct drm_gpu_scheduler *sched = entity->rq->sched;
-	struct drm_sched_fence *s_fence;
-
-	if (!fence || dma_fence_is_signaled(fence))
-		return false;
-	if (fence->context == entity->fence_context)
-		return true;
-	s_fence = to_drm_sched_fence(fence);
-	if (s_fence && s_fence->sched == sched)
-		return true;
-
-	return false;
-}
-EXPORT_SYMBOL(drm_sched_dependency_optimized);
-
 /**
  * drm_sched_start_timeout - start timeout for reset worker
  *
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 2a6e261ea01e..b1698819ad38 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -506,8 +506,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max);
 void drm_sched_increase_karma(struct drm_sched_job *bad);
 void drm_sched_reset_karma(struct drm_sched_job *bad);
 void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
-bool drm_sched_dependency_optimized(struct dma_fence* fence,
-				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
 void drm_sched_job_kickout(struct drm_sched_job *s_job);
 
-- 
2.25.1


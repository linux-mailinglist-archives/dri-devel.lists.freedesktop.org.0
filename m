Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA9938C2B4
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556FC6F5E6;
	Fri, 21 May 2021 09:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D5E6F5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x8so20285109wrq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yVWSlGL2Hpz14S1Fkp555Pckov+fFR6Eatz2yqiKHw=;
 b=C9UOjTXq3RfiK4CPhPMiqEkLmxgWoaB3bjXw/o0NF4G2k9qI87GYEQbVZg0xlv8+uF
 5CkVdh9G9YWhH3iqwQUUBuVYC1Ykpksdd6EhjVyo43NVMyv0aAT8/VZIPvbQOcvEO8KT
 9bXHr1mSIXC8shD0mSh+ZC3bX66WtL61XkEj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yVWSlGL2Hpz14S1Fkp555Pckov+fFR6Eatz2yqiKHw=;
 b=ExMHK3xBMtY1hXJeFuctwHLVwyk1T1NRZnF1eKD4+oEgit7luSNpSykixV6VfFVa92
 HtutTMxUyFJM3hQrJSxBveScNP2+4AdCZ7RDNyOJcW8t8/w5GvZ2xDjUXYB29PGTjUp/
 G+MAc1kGzOhj3Y4n38kiVVb4ivBO5TCX3qfN0pMtCkoEuR68E7MwGW6TuhCHcfEvwFph
 jGHZshrPqiSqkZ0vPvMMc2rWYm2TiAkU0AYBwDUpy4qDUUJLXW0kZ8AUTgUYCuUuD1Oy
 sxxRYer+zDH+CXGxTFpaoxqGO1iIXzkeTbRdKe1ZlsIU0UH4IEnKKrtBbdX3b6LRlRL3
 XiMw==
X-Gm-Message-State: AOAM53258O8omaDYmEAi2buGjR3iKlxK7GDUTW3AlbcZ4cG2I/anKGGX
 DlyJqxp2ZLfXYJYeaz3KglNa4V++VeTZ4w==
X-Google-Smtp-Source: ABdhPJyl95nLaJNarlAx9kEFKDv4SMNcTaUaxqL5qY/XBGf4Rm4BMGgZA36ENUDNmuAnQPA/K3TDCw==
X-Received: by 2002:adf:ebcc:: with SMTP id v12mr8669121wrn.389.1621588206414; 
 Fri, 21 May 2021 02:10:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 02/11] drm/panfrost: Remove sched_lock
Date: Fri, 21 May 2021 11:09:50 +0200
Message-Id: <20210521090959.1663703-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Scheduler takes care of its own locking, dont worry. For everything else
there's reservation locking on each bo.

So seems to be entirely redundnant and just a bit in the way.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.c |  1 -
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 --
 drivers/gpu/drm/panfrost/panfrost_job.c    | 13 ++-----------
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 125ed973feaa..23070c01c63f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -199,7 +199,6 @@ int panfrost_device_init(struct panfrost_device *pfdev)
 	int err;
 	struct resource *res;
 
-	mutex_init(&pfdev->sched_lock);
 	INIT_LIST_HEAD(&pfdev->scheduled_jobs);
 	INIT_LIST_HEAD(&pfdev->as_lru_list);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 597cf1459b0a..7519903bb031 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -105,8 +105,6 @@ struct panfrost_device {
 
 	struct panfrost_perfcnt *perfcnt;
 
-	struct mutex sched_lock;
-
 	struct {
 		struct work_struct work;
 		atomic_t pending;
diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..f5d39ee14ab5 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -218,26 +218,19 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
 
 int panfrost_job_push(struct panfrost_job *job)
 {
-	struct panfrost_device *pfdev = job->pfdev;
 	int slot = panfrost_job_get_slot(job);
 	struct drm_sched_entity *entity = &job->file_priv->sched_entity[slot];
 	struct ww_acquire_ctx acquire_ctx;
 	int ret = 0;
 
-	mutex_lock(&pfdev->sched_lock);
-
 	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
 					    &acquire_ctx);
-	if (ret) {
-		mutex_unlock(&pfdev->sched_lock);
+	if (ret)
 		return ret;
-	}
 
 	ret = drm_sched_job_init(&job->base, entity, NULL);
-	if (ret) {
-		mutex_unlock(&pfdev->sched_lock);
+	if (ret)
 		goto unlock;
-	}
 
 	job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
 
@@ -248,8 +241,6 @@ int panfrost_job_push(struct panfrost_job *job)
 
 	drm_sched_entity_push_job(&job->base, entity);
 
-	mutex_unlock(&pfdev->sched_lock);
-
 	panfrost_attach_object_fences(job->bos, job->bo_count,
 				      job->render_done_fence);
 
-- 
2.31.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA43839FCF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 04:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77AB10F5D5;
	Wed, 24 Jan 2024 03:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFA010F5D4;
 Wed, 24 Jan 2024 03:01:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so54393765e9.3; 
 Tue, 23 Jan 2024 19:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706065214; x=1706670014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CPOuKECiwusygEzLYMH/0TGCGdxpS/EWgBvieVarlTc=;
 b=fwpbw2QL19AE6zHPOoj9KkEjQph6x3wR1s6AWIq1OJsaCPbtEwXS4TI8duFjNeS48t
 CWhj+U7qTYrKTJ3j5eNZ5jWNEb0ZKtpvo+RyYZWTq/GcVrARnCBvXAvx0EeOHwCT7B2x
 YkA/swSeg5BIM7f7boTz1uK7BC+ofDMSCdRNN/uyHj7m8rbmrTi/JvWbu9EDQ58Urz+w
 zVM72MGYGThp2ouSqxOj5YV/ELsig/fNWlw2ZJseh7HmVrqt64oBN590ZUmWghXwCUDG
 THI0VdMpBA+jVn9JDazJUzBjbiwigNR3UaWfqrH08ca6gX2TRkSbxFBBXVTvR7pBJXqT
 DrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706065214; x=1706670014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CPOuKECiwusygEzLYMH/0TGCGdxpS/EWgBvieVarlTc=;
 b=C4ZWHEqkVBCfJY2UTsordnVBbv+SuiVVfHERkHnkXo5eFVpW+ZIFE2PKp/WcH4bqt0
 UgUMsAK7GsNG4lLKZU5xNiZ4JJs5vXOsAfg2/FpcunKeWu2F+m+zNugnAzYwzZfDbJWK
 WfCMo9o9s3dD+KF5N2HdvfZTYUZGDIFhzem4mKmPsq/HWwE4DHXeLU24+rEYMRVSDOMN
 thKAE3AOKFQ9+tBII/GeoLkbKF7JUld3bLQU3mKvECZXEiSXEW14fItZYYkqC5/YvtmU
 /Xh48zuO3mUWWWknShQLu6PKmpykw1pzLg5GmMUs4/zRU/mJ+TnLh7LJs0wkNXi27D4V
 q56Q==
X-Gm-Message-State: AOJu0Yw8j/dTvcAT6vJuhwPbVazvDdrZzIt/VSwIW/poWQFAxh2yvQOq
 8WffjBARL2vTXcTvUj04RwZzK4+gTVbNXULdVg7RfABDW4jzirR/
X-Google-Smtp-Source: AGHT+IH9nwxT639jdbbzp4/DS6PQHGpdpzVCBa61wucVXmalZ7SmRPk+J63hGBQfS46wwyrTbkMVXQ==
X-Received: by 2002:a05:600c:45c9:b0:40e:6238:e9e8 with SMTP id
 s9-20020a05600c45c900b0040e6238e9e8mr642304wmo.1.1706065214435; 
 Tue, 23 Jan 2024 19:00:14 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 dj17-20020a05640231b100b00559bb146ecbsm9637914edb.6.2024.01.23.19.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 19:00:13 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, anarsoul@gmail.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/lima: remove guilty drm_sched context handling
Date: Wed, 24 Jan 2024 03:59:45 +0100
Message-ID: <20240124025947.2110659-7-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124025947.2110659-1-nunes.erico@gmail.com>
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Marking the context as guilty currently only makes the application which
hits a single timeout problem to stop its rendering context entirely.
All jobs submitted later are dropped from the guilty context.

Lima runs on fairly underpowered hardware for modern standards and it is
not entirely unreasonable that a rendering job may time out occasionally
due to high system load or too demanding application stack. In this case
it would be generally preferred to report the error but try to keep the
application going.

Other similar embedded GPU drivers don't make use of the guilty context
flag. Now that there are reliability improvements to the lima timeout
recovery handling, drop the guilty contexts to let the application keep
running in this case.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/lima/lima_ctx.c   | 2 +-
 drivers/gpu/drm/lima/lima_ctx.h   | 1 -
 drivers/gpu/drm/lima/lima_sched.c | 5 ++---
 drivers/gpu/drm/lima/lima_sched.h | 3 +--
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
index 8389f2d7d021..0e668fc1e0f9 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -19,7 +19,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
 	kref_init(&ctx->refcnt);
 
 	for (i = 0; i < lima_pipe_num; i++) {
-		err = lima_sched_context_init(dev->pipe + i, ctx->context + i, &ctx->guilty);
+		err = lima_sched_context_init(dev->pipe + i, ctx->context + i);
 		if (err)
 			goto err_out0;
 	}
diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
index 74e2be09090f..5b1063ce968b 100644
--- a/drivers/gpu/drm/lima/lima_ctx.h
+++ b/drivers/gpu/drm/lima/lima_ctx.h
@@ -13,7 +13,6 @@ struct lima_ctx {
 	struct kref refcnt;
 	struct lima_device *dev;
 	struct lima_sched_context context[lima_pipe_num];
-	atomic_t guilty;
 
 	/* debug info */
 	char pname[TASK_COMM_LEN];
diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 814428564637..c2e78605e43e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -154,13 +154,12 @@ void lima_sched_task_fini(struct lima_sched_task *task)
 }
 
 int lima_sched_context_init(struct lima_sched_pipe *pipe,
-			    struct lima_sched_context *context,
-			    atomic_t *guilty)
+			    struct lima_sched_context *context)
 {
 	struct drm_gpu_scheduler *sched = &pipe->base;
 
 	return drm_sched_entity_init(&context->base, DRM_SCHED_PRIORITY_NORMAL,
-				     &sched, 1, guilty);
+				     &sched, 1, NULL);
 }
 
 void lima_sched_context_fini(struct lima_sched_pipe *pipe,
diff --git a/drivers/gpu/drm/lima/lima_sched.h b/drivers/gpu/drm/lima/lima_sched.h
index 6a11764d87b3..6bd4f3b70109 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -91,8 +91,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
 void lima_sched_task_fini(struct lima_sched_task *task);
 
 int lima_sched_context_init(struct lima_sched_pipe *pipe,
-			    struct lima_sched_context *context,
-			    atomic_t *guilty);
+			    struct lima_sched_context *context);
 void lima_sched_context_fini(struct lima_sched_pipe *pipe,
 			     struct lima_sched_context *context);
 struct dma_fence *lima_sched_context_queue_task(struct lima_sched_task *task);
-- 
2.43.0


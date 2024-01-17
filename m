Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134882FF31
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 04:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4196710E623;
	Wed, 17 Jan 2024 03:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289E010E612;
 Wed, 17 Jan 2024 03:13:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5534dcfdd61so18622370a12.0; 
 Tue, 16 Jan 2024 19:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705461144; x=1706065944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TurR4TSqa7pH4YQLivqIMoaxRqWtz6E/dts/c6GuzZE=;
 b=XbF8Nz9OTblTvyFKBDhL2/xsjEgZXqL2jalwSNso8KoBs8Lf8uRy4qNYSJ8cxQ8Zux
 4SxDEBBqanenWNiMJyatYno9sTyjsAcEWwvz2uPFWCZU1zn8gA/5mfwS01rGTdwxWVkd
 vyvz8Md9TLzJ1QyxENjcTD07fXxSoVw85mEKbQJLmax475jWhh2qe8PWYl4qLXYvZ/yX
 wdFEqSQs1t9kwp4v6EG7AbvB7A+j+DyyGCg0KczKAMcfd44udPB99KFNH/8y4UQmBMf6
 V0zPwCzcBGojhQhqpP3snSXU0WG/OCzcLY2svN0VByAc+LFoEOTrrpqsx5jciBRQh7A+
 gD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705461144; x=1706065944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TurR4TSqa7pH4YQLivqIMoaxRqWtz6E/dts/c6GuzZE=;
 b=SDbSiFzygt2I+CFul4ayngKErzMGf1PBOxw1YPPvbUAHHICjXC3KzE8PLkImB/R7Cl
 wx6Zk1l0Eq8RzfPVEpwreaR+SeWSk+2U3OGEUPx0hpB2imLi4urn2pokIecpnrMuhwdk
 bmhnjGEXjsUiRCLDmKAg3+jA15k6wq+WbYnTtdv+lprr5QkrQx0lnclGaSj7GfhVcS4n
 2tehfX9C4zQp+dgaTl6/wIGgCulCoQaxLe3n4i96Y2T5Xfel4cwHjd5b3dggZQa4ouHq
 TTsbBcVUtow+e/jc32Am+L6c0SAGC3nmidwLVPIIGTnYTLW1J4+4njeiVfzyjJTxBSIa
 ZKYQ==
X-Gm-Message-State: AOJu0YzFyVKhNHtvlJaVr2o0ha5J+MQq0CDJ0aUeeB6zNJSSJT7l9vLJ
 /aM2kjWj24DqypFi5hAuyfo=
X-Google-Smtp-Source: AGHT+IGetluui/FySPGgoTIPulAjmlBnWc8jvnBGs+ZlVHD0WYWX+lScQaqSVrFsrUDD1HER0F64yg==
X-Received: by 2002:aa7:d84d:0:b0:558:308f:db04 with SMTP id
 f13-20020aa7d84d000000b00558308fdb04mr153546eds.18.1705461144164; 
 Tue, 16 Jan 2024 19:12:24 -0800 (PST)
Received: from mosaic.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05640204cd00b0055971af7a23sm2258418edw.95.2024.01.16.19.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 19:12:23 -0800 (PST)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Subject: [PATCH v1 5/6] drm/lima: remove guilty drm_sched context handling
Date: Wed, 17 Jan 2024 04:12:11 +0100
Message-ID: <20240117031212.1104034-6-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117031212.1104034-1-nunes.erico@gmail.com>
References: <20240117031212.1104034-1-nunes.erico@gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, christian.koenig@amd.com,
 anarsoul@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
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
index 9449b81bcd5b..496c79713fe8 100644
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
index 34050facb110..677e908b53f8 100644
--- a/drivers/gpu/drm/lima/lima_sched.h
+++ b/drivers/gpu/drm/lima/lima_sched.h
@@ -93,8 +93,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
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


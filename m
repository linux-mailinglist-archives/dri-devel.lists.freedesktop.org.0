Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A51FFA8108E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 17:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9FF10E6F7;
	Tue,  8 Apr 2025 15:48:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ciBcXxe2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191DC10E6F0;
 Tue,  8 Apr 2025 15:48:24 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf7c2c351so5231255e9.0; 
 Tue, 08 Apr 2025 08:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744127303; x=1744732103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMCa4mYnL9/jZeEpICSWWjgokdOUsHJ8MFHq70ctWwg=;
 b=ciBcXxe23Me3ehN8pyLqLJRevzXl9699UgFJKun4f/7ueetSssYNEz03w4UaiwbS8x
 DBfohp/Vy4nN2PvRHlj5CScN0voZ0fD8ErME/Ob/ZhmJnjAat9Bzur8Y+qDouMWkAJUI
 pW7LcXdWeQIq/AedZa9uQHoxbjbgTTiGcpJvpDjoeNaRAs9XRmzpJhUzD0PZ1CDoKB+I
 qgrvX/tzoRLfyqciWkyiWPkZ6UoT8/mKakW14e7S4X2kVgT3EiVUL64oHF1QH9sW7RBj
 gpjR0o43DBgmBPe5yx5CrNA652ccjqTCI9JNQEey6di+kHDrQv3bLCywZ/L8vWqiSFUC
 bpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744127303; x=1744732103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMCa4mYnL9/jZeEpICSWWjgokdOUsHJ8MFHq70ctWwg=;
 b=wt0+7+qusa+0e5l1DLLpQiy06IKUfl29QV6IpMVwDKigA6JKt+Kly8HVLcA1jOAPvN
 UrRVGUs1qI08VQVosGeHBaiJL51vyS+raOxIsejZ62XpI2iQor6D6ntvdsR46/E2sBVe
 rI+q4D0mNeO0NXxj7FIp87HUnEDwDKr3AXt6o1xqmdeh5UqFZReH8xmYdAP1GnkERRfb
 B3NEmc1OeAsiPNVzmUqfWSQXioJPDmSQEOydviNvKNIYbviIWSmQkMo41ngkIm5qV4so
 ui4dfxEMqmDKLXf64YvBtx+YzWHIXInDUY7cxu0ZYwVGV2jJ2VmEAjPt3j4N87csvjsu
 UZJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFCA0UIqa+4xcIEsm57qTyP5HPcfNALKGw0FdnQYW2XPJTypcls3t/vvR+agla0AzRkyvN0Q==@lists.freedesktop.org,
 AJvYcCV6vetVMPwRbAosyy6DfEhGc3xsCA9mFSweoFCepdz2wqVCBwUFb0E4JBKpkH5mG1f94RGxvaqlQPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYX6gUABcTPt02EWfRIAno3tL7YPl7nVSuVoJXj95h+Luj+1Oo
 E2nSgQk5K5MCQr74uCltEGVJBq3EvSpeMH42//dwE6vaD/GhyFp/
X-Gm-Gg: ASbGncv+2vOMT0dB9CIF48UrLcuvGm3cAvREr933qNUSD+P/45zJRzBYXl+R5J3W1it
 9ys6qWYjsZe2xdx0b6Ok9OXuto4UO7q7LrL/YC+0NpCaCRV5/mDpHmtuSk95VoFWwu7Rw1fHxG6
 dKhsp01KUMcK7D3SSqXNNySaFlPlv+IN3JtQfjRKWxkseC71uk7s+TtbYAwFjGpodlN0Fonsu6s
 AqIGHM6gNsIdBWvJf+yGzg0Xk5c/s4VPJ0ixPIjjJ54yCBYNBo9tYgISeXv9b3rk3cZPerol6rM
 +hrkc+4gGW25gdxhi/iEzinG7FSB1pfT7PDoRo/gZOqrwzfU+2C/MfqH
X-Google-Smtp-Source: AGHT+IEJza/VE3KBD99Of28IXNQNtvTH+ABObaWU5NenBD0MKdnhctsS+DNaE8DwiFwsLSovcTMx3A==
X-Received: by 2002:a05:600c:4fc6:b0:43b:c0fa:f9bf with SMTP id
 5b1f17b1804b1-43ecf85fec7mr55367495e9.3.1744127302549; 
 Tue, 08 Apr 2025 08:48:22 -0700 (PDT)
Received: from mosaic.enunes.eu.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec366b571sm166903995e9.40.2025.04.08.08.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 08:48:22 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: Qiang Yu <yuq825@gmail.com>
Cc: christian.koenig@amd.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Erico Nunes <nunes.erico@gmail.com>
Subject: [PATCH 1/1] drm/lima: implement the file flush callback
Date: Tue,  8 Apr 2025 17:46:37 +0200
Message-ID: <20250408154637.1637082-2-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408154637.1637082-1-nunes.erico@gmail.com>
References: <20250408154637.1637082-1-nunes.erico@gmail.com>
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

With this callback implemented, a terminating application will wait for
the sched entity to be flushed out to the hardware and cancel all other
pending jobs before destroying its context.
This prevents applications with multiple contexts from running into a
race condition between running tasks and context destroy when
terminating.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 drivers/gpu/drm/lima/lima_ctx.c | 18 ++++++++++++++++++
 drivers/gpu/drm/lima/lima_ctx.h |  1 +
 drivers/gpu/drm/lima/lima_drv.c | 17 ++++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
index 0e668fc1e0f9..e8fb5788ca69 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -100,3 +100,21 @@ void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr)
 	xa_destroy(&mgr->handles);
 	mutex_destroy(&mgr->lock);
 }
+
+long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout)
+{
+	struct lima_ctx *ctx;
+	unsigned long id;
+
+	mutex_lock(&mgr->lock);
+	xa_for_each(&mgr->handles, id, ctx) {
+		for (int i = 0; i < lima_pipe_num; i++) {
+			struct lima_sched_context *context = &ctx->context[i];
+			struct drm_sched_entity *entity = &context->base;
+
+			timeout = drm_sched_entity_flush(entity, timeout);
+		}
+	}
+	mutex_unlock(&mgr->lock);
+	return timeout;
+}
diff --git a/drivers/gpu/drm/lima/lima_ctx.h b/drivers/gpu/drm/lima/lima_ctx.h
index 5b1063ce968b..ff133db6ae4c 100644
--- a/drivers/gpu/drm/lima/lima_ctx.h
+++ b/drivers/gpu/drm/lima/lima_ctx.h
@@ -30,5 +30,6 @@ struct lima_ctx *lima_ctx_get(struct lima_ctx_mgr *mgr, u32 id);
 void lima_ctx_put(struct lima_ctx *ctx);
 void lima_ctx_mgr_init(struct lima_ctx_mgr *mgr);
 void lima_ctx_mgr_fini(struct lima_ctx_mgr *mgr);
+long lima_ctx_mgr_flush(struct lima_ctx_mgr *mgr, long timeout);
 
 #endif
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 11ace5cebf4c..08169b0d9c28 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -254,7 +254,22 @@ static const struct drm_ioctl_desc lima_drm_driver_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(LIMA_CTX_FREE, lima_ioctl_ctx_free, DRM_RENDER_ALLOW),
 };
 
-DEFINE_DRM_GEM_FOPS(lima_drm_driver_fops);
+static int lima_drm_driver_flush(struct file *filp, fl_owner_t id)
+{
+	struct drm_file *file = filp->private_data;
+	struct lima_drm_priv *priv = file->driver_priv;
+	long timeout = MAX_WAIT_SCHED_ENTITY_Q_EMPTY;
+
+	timeout = lima_ctx_mgr_flush(&priv->ctx_mgr, timeout);
+
+	return timeout >= 0 ? 0 : timeout;
+}
+
+static const struct file_operations lima_drm_driver_fops = {
+	.owner = THIS_MODULE,
+	.flush = lima_drm_driver_flush,
+	DRM_GEM_FOPS,
+};
 
 /*
  * Changelog:
-- 
2.49.0


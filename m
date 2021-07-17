Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B53F3CC61F
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 22:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50C56EACD;
	Sat, 17 Jul 2021 20:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39C76EACC;
 Sat, 17 Jul 2021 20:25:34 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id y17so14238234pgf.12;
 Sat, 17 Jul 2021 13:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cpu/JXcQKTfGv+/P4wjqVns0dJiJutHghvO5fiTylFw=;
 b=SKchqjYpnhWqYce+ZM8vBpYTL8UUHhB3i8icGIUJcuaxCNqWQQcFTnoUr8flGM/232
 HkOxeqfslU7kvDft6DFVZ4UF91lrIc2/nb9B/1kpqDJjxvK3Unp0itEIVlQAw+IoYXfK
 qTP0ik3gKwmexsYt4bm279OyJKQHoJH6Iy4M9BE0TNCd7jTmFSwcDdy/XnhuR09sHIGZ
 JNB7XlYy8T7zxdc4+mu8PP43vrYFXSrVCF+7YZ0sR4KD/8nYKErSD6aGt66mRqLvCciR
 5dknzXqQKEVUrraXAWp+K/0FxelryRUuUhmnn73paKkdgckZ4VoqcmoY1ZDBxb2rDcDP
 yu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cpu/JXcQKTfGv+/P4wjqVns0dJiJutHghvO5fiTylFw=;
 b=cwxy4GhrnrDIfbtsw2tbtl4oIZyGdU+X/FzZDb8HzfmM6tRCNPx9QP4dbcu8ZzDeMD
 9oZ+tuUb/90tTt0+fMAJK2t2eAfkgsiGCCDQbpHGvRI87nDzuiC9JOwXaKwC0j1w20dE
 GUkgoF25REu43G0aZ4k6jREpmk5GBIDJX8scHxJKRdC/qbREQmq54MWYQBDHtvv5TdxI
 tJauxF2hh5cSGGId0uue9wjQUxfeq2SmrNhad57qaTLaFMNE45wMt+WlceCHyWaHLgue
 TsdXV+ahWMQn6J9mBEg0HTsi2Wdql/SomFH2n4iLkiaFV1VEgnY28Ra9QzgphZDeaxDy
 Kbjg==
X-Gm-Message-State: AOAM5305JKXNmJteRKrSP8Dc8AcQk6nj/TxnHnH54T7hTBOHv2YEHiHV
 e7a5JQARF0ZOvSMEbNWEJ4GzWzlSLFYufA==
X-Google-Smtp-Source: ABdhPJxPGfbeZkXZO9yaxHD9xyVvR4MtcykxFtJLF8TY8HMqasAjFB/Goyt3keWPdHn07/3qnxpFhQ==
X-Received: by 2002:a62:3542:0:b029:332:c821:1ef3 with SMTP id
 c63-20020a6235420000b0290332c8211ef3mr16819007pfa.33.1626553533753; 
 Sat, 17 Jul 2021 13:25:33 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i18sm14869351pfa.149.2021.07.17.13.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 13:25:32 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/11] drm: Drop drm_gem_object_put_locked()
Date: Sat, 17 Jul 2021 13:29:06 -0700
Message-Id: <20210717202924.987514-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that no one is using it, remove it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem.c | 22 ----------------------
 include/drm/drm_gem.h     |  2 --
 2 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 9989425e9875..c8866788b761 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -974,28 +974,6 @@ drm_gem_object_free(struct kref *kref)
 }
 EXPORT_SYMBOL(drm_gem_object_free);
 
-/**
- * drm_gem_object_put_locked - release a GEM buffer object reference
- * @obj: GEM buffer object
- *
- * This releases a reference to @obj. Callers must hold the
- * &drm_device.struct_mutex lock when calling this function, even when the
- * driver doesn't use &drm_device.struct_mutex for anything.
- *
- * For drivers not encumbered with legacy locking use
- * drm_gem_object_put() instead.
- */
-void
-drm_gem_object_put_locked(struct drm_gem_object *obj)
-{
-	if (obj) {
-		WARN_ON(!mutex_is_locked(&obj->dev->struct_mutex));
-
-		kref_put(&obj->refcount, drm_gem_object_free);
-	}
-}
-EXPORT_SYMBOL(drm_gem_object_put_locked);
-
 /**
  * drm_gem_vm_open - vma->ops->open implementation for GEM
  * @vma: VM area structure
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 240049566592..35e7f44c2a75 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -384,8 +384,6 @@ drm_gem_object_put(struct drm_gem_object *obj)
 		__drm_gem_object_put(obj);
 }
 
-void drm_gem_object_put_locked(struct drm_gem_object *obj);
-
 int drm_gem_handle_create(struct drm_file *file_priv,
 			  struct drm_gem_object *obj,
 			  u32 *handlep);
-- 
2.31.1


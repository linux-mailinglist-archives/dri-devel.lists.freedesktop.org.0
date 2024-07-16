Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC19326AE
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625B310E6CA;
	Tue, 16 Jul 2024 12:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SC2T/VVL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04FF10E6B4
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:35:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4266fd395eeso37786875e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721133329; x=1721738129; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LykI1nF63lWlLsFFvIKkwMpZmHfJV1Q5emaNF4tGSBg=;
 b=SC2T/VVLzAwv3ILOOyQrvATIRx2rr9Wxu8+BrB7dwPqEUxTrQML4XC9WKi8hFFIz18
 POP59dyjMwWWohlvhYf7/ANbfq4MSoQkzQR9Zm5+sRsg5OzQT/APA7WW413vSdEeiOJ3
 /DLnO1e6bMZpqdJ1Op/iHiUddldJQPbRk0mt7FBpo6dVSbFnE7FQzBRSibKfkebyBHEY
 aTQrSpNQkWM2bx1nGlZW+rNfNpACgAV8V/a26fY/yVXxkoqNMZ/uBzsCrmIOeUGZSJDU
 e8hSSAMYuREcSusiEo763bll9DLNh+404NWeyFpnV9Eps5+JZkoGr6ZV8Z0EjjdkY0l+
 9lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721133329; x=1721738129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LykI1nF63lWlLsFFvIKkwMpZmHfJV1Q5emaNF4tGSBg=;
 b=CKlA5iOQVl45zl4w7LnzQdmyDeSEwolB4i/c+wJOYW6xDk89dLJ49gag21d4xzEvu6
 x/C03ir0Fy1kKKmycm4NrIAB3uslsHFkdDaPabhqz+pOFx2tQ0uA6PiBV0BJyKsjBcsa
 r9GaBIz8ncI9Wj5G4LGbrypY14MtZHLL9pGehJnNXd0hy0WLr+rCZSeKMppVH/yFWYo7
 +oFs/Uk9zc8dQnARTmHXObAbxqcegd2Jvk+ndlALGGedu4JiPPRKO6RxBVv9EghXHcvd
 JeK2fjifOlJXlw2llzpm71zBnXh5uP6MDk5VXp9R/FLd8eAv169SIpYsOa9+8Jy+quxq
 UiLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwFp/ETm/bl3sI94CgPJ6czAAtiLfHojHDk6tb5PN7Ht5dBZxJqTxHRWYjzGEJv3op+vF1c/eoNeXaoARX+D9zH+k0quVJNU5/BpNlr5SA
X-Gm-Message-State: AOJu0YyxsmY9gAAVVvm7FWwilN8aH8CNvK4CnVHGbXRivZpdPz7qv8Yf
 nkwo5N/YW0L6QsGQ5n//ULzBM+lyHgN3kL3+JzBxFOV31km7N9Xi
X-Google-Smtp-Source: AGHT+IHSoDQWfuNUvE4rHK6RvmogqovhsNOZ9yXpD9MgtJVoO2p1XwZ8mzQ2UZt9+0xFmtdbJXjMHQ==
X-Received: by 2002:a05:600c:1989:b0:426:59ec:17a9 with SMTP id
 5b1f17b1804b1-427ba66cc9bmr13186095e9.22.1721133328838; 
 Tue, 16 Jul 2024 05:35:28 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1592:7f00:1c98:7fd3:7b80:1cc1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e77493sm127058225e9.7.2024.07.16.05.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:35:28 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/ttm: make ttm_bo_get internal
Date: Tue, 16 Jul 2024 14:35:19 +0200
Message-Id: <20240716123519.1884-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716123519.1884-1-christian.koenig@amd.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
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

Prevent drivers from using this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_internal.h | 10 ++++++++++
 include/drm/ttm/ttm_bo.h              | 10 ----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
index 6a7305efd778..9d8b747a34db 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
+++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
@@ -27,6 +27,16 @@
 
 #include <drm/ttm/ttm_bo.h>
 
+/**
+ * ttm_bo_get - reference a struct ttm_buffer_object
+ *
+ * @bo: The buffer object.
+ */
+static inline void ttm_bo_get(struct ttm_buffer_object *bo)
+{
+	kref_get(&bo->kref);
+}
+
 /**
  * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
  * its refcount has already reached zero.
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 31ec7fd34eeb..8c1577d8793c 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -229,16 +229,6 @@ struct ttm_lru_walk {
 s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
 			   struct ttm_resource_manager *man, s64 target);
 
-/**
- * ttm_bo_get - reference a struct ttm_buffer_object
- *
- * @bo: The buffer object.
- */
-static inline void ttm_bo_get(struct ttm_buffer_object *bo)
-{
-	kref_get(&bo->kref);
-}
-
 /**
  * ttm_bo_reserve:
  *
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5048C92D1D6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 14:43:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886BB10E78C;
	Wed, 10 Jul 2024 12:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nPE8q17X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 590EE10E782
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 12:43:08 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so8233155a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 05:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720615387; x=1721220187; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wqDOtib2IWFavjXl6U2wSV2USEnbi4NLN6orparHipU=;
 b=nPE8q17XQqFqmOPuw/Xq3Zix7h+W2AZwpf1fdyMOyK/LZg0rYwPqEqjH+LYClVvQyW
 v6I2kLpXcAU+rJd+WjObq/1++M/08SoNzSav7s/KGc17Gr5bvpTV9FEfnnCTXqIGU1qe
 1FUp3nJaJ/B6WJlI38HI7yqtoGNxe7AQS0TwLLeNy0Eko3QQYwdPH/6geRjZ4/F0Pkyr
 gCaJOpjJOwIPXUcR4Vi30xCjGD20nnoNQSTiNw+j3PzDc9NZtw0obrAeboSoOAoe2ZaP
 x3ERM7qAcnHheOPMboLPr8E3NECAvIY1vpG5t1vGNVxHcPd3raKqbGGSwXWCdw3whcL4
 5hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720615387; x=1721220187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wqDOtib2IWFavjXl6U2wSV2USEnbi4NLN6orparHipU=;
 b=Omz9p5wlY+55QIjakIvJo/uHHx2OIaZFCLqQVhslgVQiOY+lPxP8x3mv2UKIsxXu6E
 sokKYip3o3fNoGQNJ8HP3vPhepqomtUUo0/geupfIqm27D14pZInhMb2oDrCZR9owyoE
 1CMHdGTvqsOv6NSfRWtwmdoTTkfXB0H5cWkqOhqf6XnkgYvwC26k22/MGHVP3X3oBoZz
 XxPzPk1qtKzf0JTO0SslvnrigbjJmZvFfiMP5wsCVQtMW9XeB0eTDaerpGQIo80xiqxD
 MhkQvMDvRk8SodeXWyUYapA/SZn1J8AfXRm3jMEMzYRfu2RtjiZvcrf1O/XmxS7tUOzc
 gtnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdfbcAY9B9gKkrG0WMNkkO01qg8HYp1IFsow1hN6UzzAo5hzI8arnYYV78X5kTEPyMHwQxg+Siifz8dsaNvUcuoUQJohb8B3HZjMjpPlgz
X-Gm-Message-State: AOJu0YzzANBe2mSSjhKjGTM8NNxT1MiA7Q/5mLB04atCSCL66zNMAzpr
 0MwuwwYY6rHjDx1dWTUQXhF7T3CuGy5u0475GlkIYNJ2nKiozsY3
X-Google-Smtp-Source: AGHT+IGcx69p4kp6QNhNGYGbH73egDV++LmAtMPL1ckgtdLk9nkGBW/Fed8DLcwIk6L3HRFlvOxTrw==
X-Received: by 2002:a05:6402:2106:b0:57c:6d1c:3cee with SMTP id
 4fb4d7f45d1cf-594baf91661mr4275662a12.14.1720615386322; 
 Wed, 10 Jul 2024 05:43:06 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1504:6f00:b310:1e44:6e5e:7646])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm2171868a12.15.2024.07.10.05.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 05:43:05 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/7] drm/exec: provide trylock interface for eviction
Date: Wed, 10 Jul 2024 14:42:57 +0200
Message-Id: <20240710124301.1628-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240710124301.1628-1-christian.koenig@amd.com>
References: <20240710124301.1628-1-christian.koenig@amd.com>
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

The TTM eviction path has some additional requirements which make it
necessary to trylock an object and then eventually keep or drop the lock
again.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_exec.c | 77 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_exec.h     |  5 +++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 220df336fbd9..b81bf5a92d97 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -336,5 +336,82 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 }
 EXPORT_SYMBOL(drm_exec_prepare_array);
 
+/**
+ * drm_exec_trylock_obj - try to lock a GEM object
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Try to lock a GEM object but don't grab a reference yet.
+ *
+ * Since we can't handle contention here it's illegal to trylock the first
+ * object.
+ *
+ * This function is suposed to be used from atomic context and we don't
+ * know if the GEM object will actually be used or not. So we don't grab a
+ * reference yet.
+ *
+ * Returns: True if the object could be locked, false otherwise.
+ */
+bool drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
+{
+	if (WARN_ON(!exec->num_objects))
+		return false;
+
+	if (exec->prelocked == obj)
+		return true;
+
+	return dma_resv_trylock_ctx(obj->resv, &exec->ticket);
+}
+EXPORT_SYMBOL(drm_exec_trylock_obj);
+
+/**
+ * drm_exec_keep_trylocked_obj - keep the trylocked obj
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Keep a trylocked object in the drm_exec state object. Grabs a reference to
+ * the object and adds it to the container of locked objects.
+ */
+int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj)
+{
+	int ret;
+
+	ret = drm_exec_obj_locked(exec, obj);
+	if (ret) {
+		dma_resv_unlock(obj->resv);
+		return ret;
+	}
+
+	if (exec->prelocked == obj) {
+		drm_gem_object_put(exec->prelocked);
+		exec->prelocked = NULL;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_keep_trylocked_obj);
+
+/**
+ * drm_exec_drop_trylocked_obj - drop the trylocked obj
+ * @exec: the drm_exec object with the state
+ * @obj: the GEM object to trylock
+ *
+ * Used to drop a trylocked object in the drm_exec state object, drop the
+ * reservation lock again and cleanup all references.
+ */
+void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
+				 struct drm_gem_object *obj)
+{
+	/*
+	 * We can't drop the reference of prelocked objects since we might still
+	 * be in atomic context. Additionally it makes sense to keep the
+	 * prelocked object around since we might need it again later on.
+	 */
+	if (exec->prelocked != obj)
+		dma_resv_unlock(obj->resv);
+}
+EXPORT_SYMBOL(drm_exec_drop_trylocked_obj);
+
 MODULE_DESCRIPTION("DRM execution context");
 MODULE_LICENSE("Dual MIT/GPL");
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..a3943057a3e8 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -146,5 +146,10 @@ int drm_exec_prepare_array(struct drm_exec *exec,
 			   struct drm_gem_object **objects,
 			   unsigned int num_objects,
 			   unsigned int num_fences);
+bool drm_exec_trylock_obj(struct drm_exec *exec, struct drm_gem_object *obj);
+int drm_exec_keep_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj);
+void drm_exec_drop_trylocked_obj(struct drm_exec *exec,
+				struct drm_gem_object *obj);
 
 #endif
-- 
2.34.1


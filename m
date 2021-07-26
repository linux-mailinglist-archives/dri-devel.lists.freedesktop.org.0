Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C73D5C52
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3591F6E15D;
	Mon, 26 Jul 2021 14:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621C6FC11
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 14:56:43 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id i1so11900920plr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Mpo+wl5fFAaPwy9LhhWqMdEGPZHP7/RgunVOfmhcQvA=;
 b=m+xar5oljPu5b7j1i+Pnq36g4tJO/HABAejzytqbbTTAAr5Er089Rs9dCuiMpOsnvr
 A83/KtP9V4mX0EGZNOTvPz8o/jZgswQidJkFjGISCJljbPMyPsKsB08DiMU7tcTxoyQV
 vp12ETq4ELVeiFlEijR02lfCzsaXtXJRvVl/qTq+6D7Fz+Qm6owWAcwXOUXxTUM/yUFx
 lLWxCUjwfcl0FTJD1pm6CXmnAp1WpS52Y6JvekAYO1RkARlSNFpAMQwuWowAUkVOPuiZ
 v7LrZjWd3wQCe1aI1ci8jcJVCGGZIfe/6jrWnf+fZQOU24iuNcJdzSDqweKwFQ7YQntd
 ChgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Mpo+wl5fFAaPwy9LhhWqMdEGPZHP7/RgunVOfmhcQvA=;
 b=MFLVivb0pTBSm3x8b+spLnyzcdW+iq3Cuif2xxYiZB6GOIMDkA2WCFKx9BIzT/Yqgw
 Q9a9QqRvwAQutWQvfRiINTeevtBCUxGWi27Lm60wGl6nvaXjg62mtm90Sb8Gaz/ZMV3K
 +QA7vVpdsKCjqVxEyw+1R/h14DXrOjc2flCqpFQeyN/VueCSj+2aVINua/FWQi1lIXej
 GUhNvVyU/n+sv5GZADKMq5iUzQ3JtKQvB2+dPTf9mb5NRnj62B7jsFd+ZhswVTjOO5/o
 Ywk/8WFWb8Cw8cxjnfVf6EpO2iZ0AwLow3gkVoPimPmP635TqAXeltAn8aRCjGSq1iEO
 kJmw==
X-Gm-Message-State: AOAM532XOoHIOEEKzs4ImG2+wLtntYXJHO13IuogejoZE0IK/g815uKv
 ewNOG0NckHbsNxEthLSt27mA93sK+QVspA==
X-Google-Smtp-Source: ABdhPJzV0hJboRK/ViXBzFZMeD86kD6NbVVHPyQfPoyu+yBjPb9rek/658SULrll+AaDkwO+QlV6xA==
X-Received: by 2002:a65:40c6:: with SMTP id u6mr18965527pgp.390.1627311402803; 
 Mon, 26 Jul 2021 07:56:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id s7sm268020pfk.12.2021.07.26.07.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:41 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/12] drm: Drop drm_gem_object_put_locked()
Date: Mon, 26 Jul 2021 08:00:18 -0700
Message-Id: <20210726150038.2187631-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that no one is using it, remove it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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


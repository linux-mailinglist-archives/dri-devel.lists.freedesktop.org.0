Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D45A53D7BAF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B1A6EBD0;
	Tue, 27 Jul 2021 17:07:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06B86EC04
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 17:07:50 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 pf12-20020a17090b1d8cb0290175c085e7a5so5355905pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=HuAxCLAcCntmvHPS5xPXkjg85XFoiQAtEot6LSWDBjoxwI2326UscNbdG86m9dU3u6
 oiZoymfKW26Byw/rg6OixHW6lPsWfFVhqw1plyGU5BDCVL24wTVhm3tjU3q9brAyw8fb
 dtDDG1psSkiI/mF0yc7I6JBg6+RCVSIx2WvfYdtPOhFlMRrPtikiIOViLPuFPnCxGcki
 y4pKC1jFP9bejSsHw8VtyOXwe4XB6P9vkc623GvJZhjpr5ah78wk8FIrg6f0wEtWDCrt
 xaIbcahHw+fI4NivXgO3/QNc7MuTWaS0jIGCWps3HD3VYMeKwbtX1GvGKub/8EH08K1+
 3XNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWHAAuOhk3NUAyAh/B2dsoKf1PQoiLne1nY0lFgXP48=;
 b=GMrh0QLyQfXGLCfrnYeoTonBIH6kSosiu9THmdGRWhDmC15F6Mi4JvafsbgMxUN4qn
 AHjj+6DolyLrp0Yv2XgnkVKJnFnb6em6cnkmUEOR0C7AA46kMHbKR9AC7PBDqyeVGM8z
 9w2CDlTmGslleZTF92A3r0dykZwWJi+8kj0NCCVDI+v4GZwPTVpE1Unx+i7reUwUWfIU
 ixFwEmHnSXmHGR6qlc+f+s0+YIVfUkAAKQdPNGUWdeV6h0/jGFcr3EPZxYPYljGjgi87
 nrtFjXu+U2DqdcEC4eam+7yznCHU7esxuePLyqFJcYxU2NMRNuHMoTIV18xzCrvnW3iE
 uKXA==
X-Gm-Message-State: AOAM532OHMBp/NRWH6SojVPVXkxodm9MgkFd449Zv3DGxxeOHkmPLD/R
 b5liQR8CfEXDLuoHS5fzLngWnT5ib73UZw==
X-Google-Smtp-Source: ABdhPJyU60w2Ipm/wjWxUhwrlRU+SS/A8y9U+gaRP8f+ttHRP7zb8Esy7FS8MT3LzNZ9kG7kr7KCVA==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr4603271pjo.22.1627405669745; 
 Tue, 27 Jul 2021 10:07:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id 33sm4978043pgs.59.2021.07.27.10.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 04/13] drm: Drop drm_gem_object_put_locked()
Date: Tue, 27 Jul 2021 10:11:20 -0700
Message-Id: <20210727171143.2549475-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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
index d62fb1a3c916..a34525332bef 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -973,28 +973,6 @@ drm_gem_object_free(struct kref *kref)
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


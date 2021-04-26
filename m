Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D699436BC5B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 01:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692AF89C9D;
	Mon, 26 Apr 2021 23:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B767789C9D;
 Mon, 26 Apr 2021 23:49:59 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id 10so4677321pfl.1;
 Mon, 26 Apr 2021 16:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Kj0SXA9vsOtoPJRmbl9kO6maA5cV9sB7CgScAwXMzI=;
 b=PFvUwvqW69maGIZ5IE53RvvUM+/kvn8XSEdtYOjbhbPlzT0Riuw8w7Ts1JFVxIDqpQ
 hkN+WE+9gKJKaxtoiRgHMpvs9sljBPxeoFTD8nkotwJ/goVrvSwQUvwMUdX0MB/hLWnu
 MHDlhhg8N/JbcQAJZ2Db5qaoK6tdTEf1BouwU/gi3Jg6UZCryIRDm9+uZZRvWjQ+QUb2
 +OMRwFtjC+RQpFVbk6gyUexFskpIjmkRZODzFO+vpHsN+PWjGIOYxdVwKcYgAWrvOR92
 EyGQlT0paeIxMRnpQ59hRd6/qHmCbR/KDJxaMA02Q6ibFopq2uKIiC6xQzJoLcSwHQ+0
 bIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4Kj0SXA9vsOtoPJRmbl9kO6maA5cV9sB7CgScAwXMzI=;
 b=oXus2M5YfJF3D9arcgUWrLdbvANpc4xdULB3YGvgsbbirUhrYNKV8jIzRKhAIhy2Zj
 XWuA7f4K1vX6Ip4UtqLFFp2yt6r2CvaRqK4MMCj9YEmTDleDk/qew10W4ii7kOiX//Tc
 y3iUPrq0AP/P5MOhtZWtL999z4p4U+02UVPmz12xw8FfDeLbWQi6bIPRALOor426/D9e
 ONhbxMK6E9o+GKfN3VRFC7Gr+9Vaty2Yi2Q7WNDR/r+D/sWA0OqEgtHbPVv5cIyd+E98
 oCn/raidSnUrZu3n6H1u8GHeiAsqQk91fGSfjshqsrMcqxGLYEGB9tR+3dylx0mqof10
 ZX7g==
X-Gm-Message-State: AOAM532LFCKavhNUiZCzJ9EbxTdV/jRT+UiEJRUUfrtmrRCZyxN55HWK
 hYin5jQ80zOw/QXiwmK6dK9uHQvX/70=
X-Google-Smtp-Source: ABdhPJzlJCZjMw1AMpMrqCCtVcFtp5ga8BJTa2+1W/jHgDQCNHWITvuZXAkIlz5HiSTjiD6+Kb+v/A==
X-Received: by 2002:a63:eb46:: with SMTP id b6mr4060320pgk.199.1619480998570; 
 Mon, 26 Apr 2021 16:49:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w189sm646315pfc.31.2021.04.26.16.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 16:49:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Do not unpin/evict exported dma-buf's
Date: Mon, 26 Apr 2021 16:53:25 -0700
Message-Id: <20210426235326.1230125-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Our initial logic for excluding dma-bufs was not quite right.  In
particular we want msm_gem_get/put_pages() path used for exported
dma-bufs to increment/decrement the pin-count.

Also, in case the importer is vmap'ing the dma-buf, we need to be
sure to update the object's status, because it is now no longer
potentially evictable.

Fixes: 63f17ef83428 drm/msm: Support evicting GEM objects to swap
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++++++++++-
 drivers/gpu/drm/msm/msm_gem.h |  4 ++--
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09ef4ec6eb34..17f85d2f23ab 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -190,13 +190,25 @@ struct page **msm_gem_get_pages(struct drm_gem_object *obj)
 	}
 
 	p = get_pages(obj);
+
+	if (!IS_ERR(p)) {
+		msm_obj->pin_count++;
+		update_inactive(msm_obj);
+	}
+
 	msm_gem_unlock(obj);
 	return p;
 }
 
 void msm_gem_put_pages(struct drm_gem_object *obj)
 {
-	/* when we start tracking the pin count, then do something here */
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+
+	msm_gem_lock(obj);
+	msm_obj->pin_count--;
+	GEM_WARN_ON(msm_obj->pin_count < 0);
+	update_inactive(msm_obj);
+	msm_gem_unlock(obj);
 }
 
 int msm_gem_mmap_obj(struct drm_gem_object *obj,
@@ -646,6 +658,8 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 			ret = -ENOMEM;
 			goto fail;
 		}
+
+		update_inactive(msm_obj);
 	}
 
 	return msm_obj->vaddr;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1b519fcd8418..66fb40b87122 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -228,7 +228,7 @@ static inline bool is_active(struct msm_gem_object *msm_obj)
 /* imported/exported objects are not purgeable: */
 static inline bool is_unpurgeable(struct msm_gem_object *msm_obj)
 {
-	return msm_obj->base.dma_buf && msm_obj->base.import_attach;
+	return msm_obj->base.import_attach || msm_obj->pin_count;
 }
 
 static inline bool is_purgeable(struct msm_gem_object *msm_obj)
@@ -278,7 +278,7 @@ static inline void mark_unpurgeable(struct msm_gem_object *msm_obj)
 
 static inline bool is_unevictable(struct msm_gem_object *msm_obj)
 {
-	return is_unpurgeable(msm_obj) || msm_obj->pin_count || msm_obj->vaddr;
+	return is_unpurgeable(msm_obj) || msm_obj->vaddr;
 }
 
 static inline void mark_evictable(struct msm_gem_object *msm_obj)
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

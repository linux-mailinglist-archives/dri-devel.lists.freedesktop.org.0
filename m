Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280D46BB4E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F71EAFED;
	Tue,  7 Dec 2021 12:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A96E7B864
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:33 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q3so29145736wru.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=NyRHc2dOyMR8UYFZOds4WJULS6HB3ElXGKZ69Du75Uu7X8lwJw2c6YS3Lqqq76LaSo
 5g6ZRF6UN306GmoUH+2742aTkbVh4r/vdQkJ/GoIJ6d0HxpzBKH2FvxpborgKrRgsnis
 +en0SrdQGibK0Muu/NinBnCEBdqIvrBy5RthG7C/nwoGVP2FT7rjDk/9sjqnDGdES/Hk
 zYbsZH3yTb/6wjSXkDTkQKJMAJBt/aEyd5UnbR7jc+sUE7ySksV+2a8M7HH1K47RG6zA
 V+g/WWigMHFMNG7jdv0gJIt23gBLif/PjFswpFdWWYr9m7vkL7371FvkYilGiWQDYj1D
 Uw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xR1nHIQR+HY5rurJTXhG523nepCCoi6AKz+ZxgPV9e4=;
 b=OUrD/uZZBLgYfnQeBdbQKsAiwEtHLdHZKId2mmNSm/qy2BuQpVDsXgKx62Xj5Lff21
 hx3xUJfpD6ikPoZbQzVQ/sI2BtHvlrxRcbYjLh2Ehp9N9b+yp3J8H010NWlIwccf6c89
 H1bU73BX1gJzsXwIvS/CMlf2m8wFwxyM0WBRETIn/QPME+dHy8BiuDUVNVc6baeph3yv
 v7Z0lRntBO8rCJyeL+qRKKY4x1ldo9XvzVlxa6cwOhnk0V6niDl1f7a2DAgv+pKwrHFm
 3pP24mCINm6Qoqp/551UZg6zp8nVRfh8cooCI8LUqm2IHaIv9FcoUIha5Gjv5Ek1MkP6
 BPEA==
X-Gm-Message-State: AOAM533xZBQ4UzNiVXSSyoWoVzcRv1zUEsEjsebOSxkNkPEsItmEeP7W
 pFUSYXkZzDL+KzGXhAGwlRA=
X-Google-Smtp-Source: ABdhPJy4tl8FIQpZCC9417zbGijuKU9nqOQh49XTjL+wYdTPclCUj4l3tT+GEq1uPihLl6SujlSYbQ==
X-Received: by 2002:adf:cc91:: with SMTP id p17mr51127729wrj.589.1638880472551; 
 Tue, 07 Dec 2021 04:34:32 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:32 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 15/24] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Date: Tue,  7 Dec 2021 13:34:02 +0100
Message-Id: <20211207123411.167006-16-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1


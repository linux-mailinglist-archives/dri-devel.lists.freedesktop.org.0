Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ACD40F7CF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 14:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792456EC56;
	Fri, 17 Sep 2021 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FA3D6EC48;
 Fri, 17 Sep 2021 12:35:34 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6800381wme.0; 
 Fri, 17 Sep 2021 05:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j7dWmZ5SavrHHTbVPyl3pWrCBr/RL2bOHTMMTnJ649k=;
 b=DvS8f4lkWP+ukbTxyx8NLbmQo0JecP0yTi8V9mwXk8o/IbJTNYe2YlDalIWzkkzPUw
 04+S2IxOxKqG1cfDvcj3sEGgbOCb291u4pgMCfHuRqCVqUG8OoCwrsAbfoR/BR8IJN7z
 g9E9N681nC+EN7/SGXphQws8tHfev5dO8iyAgUq5vQol3HZodnKlyXikemRwLbfkjmd4
 AjQQaIGoSUiEbLxMScL5evZgyevkbC1uRjJXdRgPQ0Al8ohm0ldx5WcB0ebTbS3HiKkJ
 aLqd6Fj6y7lK2tBtIBe/ZN6pznqMKkycu1wWp3NfPEeiok7Ge0yHY+cvWnC8jTEVCoTq
 ktpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j7dWmZ5SavrHHTbVPyl3pWrCBr/RL2bOHTMMTnJ649k=;
 b=DQ5GOBK6KWCTTZA8JnoLK5cSs18xsw6Q28/qb9FlC9USxJcTaNz/hiwyv3vSQ2Jn33
 x64siNMXd33ZadR+KRiVI0AwJ/eI7neZmsss+bz+xs0nXflDeQsvogjRlywAamSTWPyT
 J3OW7Hq0/9qysKJVXahEJQO/PcJ5vn54M80eowuxFmqk62UxKy6zPS46Cclc5D7qDTVa
 yMug8OFp4AgxPKLDV1fdwoGps0kl0hz5XMUqDJZnS+aX99dTdEZrqsBoMF+v9LqxKoKe
 2p8JQqjj73jxnC3B4HfowcT6SJ8iT5tgLxLn+5MA13ztHT4Kwa6BaibS+52iyqrDQg08
 SyhA==
X-Gm-Message-State: AOAM533MzHhMPMR+o37IRtBHInrYNb6GjB4Y4mSIvWwkP0LiRp9LXHfs
 fNgrARwnCxmc43vaDxsuEwE=
X-Google-Smtp-Source: ABdhPJyUPm27pFXNdl4Rlzw33QBSbUFZ4QLV1vHG8Ty6t+fL7l1sHDIbj5v4mOUBXGv6CbVZZrTv8g==
X-Received: by 2002:a05:600c:4154:: with SMTP id
 h20mr14745069wmm.172.1631882133129; 
 Fri, 17 Sep 2021 05:35:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l21sm6122049wmh.31.2021.09.17.05.35.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:35:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch
Subject: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v2
Date: Fri, 17 Sep 2021 14:35:07 +0200
Message-Id: <20210917123513.1106-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917123513.1106-1-christian.koenig@amd.com>
References: <20210917123513.1106-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..c2c41b668f40 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
+
+	rcu_read_lock();
+	dma_resv_iter_begin(&cursor, obj->resv, write);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		rcu_read_unlock();
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		rcu_read_lock();
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
+	dma_resv_iter_end(&cursor);
+	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1


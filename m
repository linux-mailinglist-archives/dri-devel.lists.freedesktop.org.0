Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169D422543
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 13:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF396EB5D;
	Tue,  5 Oct 2021 11:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406126EB56;
 Tue,  5 Oct 2021 11:37:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id m22so31347031wrb.0;
 Tue, 05 Oct 2021 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svmFiiyBNTOLlFWjgaUjcSSYX7QcL0TbCV34MdRHULg=;
 b=D0WgB+II1eRgAH07ZmG09EaNq5ijM+dWU8gLHbYnQ6hfCiwtC9VDz44a9qzcFZTb3I
 dOqHSCphqY+nXEo4tdXjfBzIYdApZffzTEHbWvS9PnwxZzpXxMs3XrWXmKfd116Kph/P
 7demlF3nkJT/T0ePnbKAU46yOOsj5069iEk4st7zd2+2+TRLkEBrto5VGbet/1mm0AS0
 1s3uoN5qIoXDotRlDuM8vMrmIC7TvKVU92/k4UNEznNfkyPmtcRNfCud3vv9zYyrCUaV
 apJ7vQlqWKKUQogmo+EQZsQv7J9kC71jEgdv10JuliYrv49zGz9s1Fhc+rKeQmd7nfEB
 nSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svmFiiyBNTOLlFWjgaUjcSSYX7QcL0TbCV34MdRHULg=;
 b=oUy6BA6OssAwQ85jB/B9FmMTIt1FrtTjogJeE5N5GSk/1TVm/JIws9ZqRZUTF8lN5D
 wAz01SCrXnzkGiwYmbPv8TKLyFNV1UqpaxDfL/xLRGMVQsNOt+qurdEzM3Pl4dx4KyY/
 LbMRb7JRNIovGCXF888VK/KD0rTj3Op3sYQqJXQKfUYNwMut9dtvn2YJlGZ+r9C9dk/K
 AMNDa8s4oDzptHn7vqvlNMgnsaEyENGqc5SBx3aHaVwxyHqRssM4U26a3ZZmnHfewR5D
 ggK/2SC4/WRDFEZpHNUh+6E6T2ngTDQAs9tY+oxTLLULwRacjxPvcnmDM06rwUlk5iSJ
 8e5Q==
X-Gm-Message-State: AOAM532PkFhvW0eDUhhSxrkZmUsS+7CpfnwN9349M5KROOIvQuR2wArV
 EK8smRf+euVTTNDJT1P6Nqs=
X-Google-Smtp-Source: ABdhPJx0/JVRov9Wd4qwLwsNNo2H4eKQ6mk2i3bZTjifx/MjL7C8Y4FtxSwIUMZ39yTG61fxHtl8Jw==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr21434985wra.296.1633433877783; 
 Tue, 05 Oct 2021 04:37:57 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c5sm1739912wml.9.2021.10.05.04.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 04:37:57 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 14/28] drm/msm: use new iterator in msm_gem_describe
Date: Tue,  5 Oct 2021 13:37:28 +0200
Message-Id: <20211005113742.1101-15-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005113742.1101-1-christian.koenig@amd.com>
References: <20211005113742.1101-1-christian.koenig@amd.com>
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

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 40a9863f5951..5bd511f07c07 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -880,7 +880,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -955,22 +955,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(&cursor, robj, true, fence) {
+		if (dma_resv_iter_is_exclusive(&cursor))
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1


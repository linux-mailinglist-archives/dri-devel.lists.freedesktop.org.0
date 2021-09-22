Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F2B4144BA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A136EB34;
	Wed, 22 Sep 2021 09:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FB06EB27;
 Wed, 22 Sep 2021 09:10:58 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id g16so4727180wrb.3;
 Wed, 22 Sep 2021 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
 b=p7WAnkjoVfQgL/EfL1Mpq6ylSS4qMkMDw2JPO+KstqU0ffx/A42eUDDzFGmiNAlLIy
 gVW+NMxVbw6bF8yJAd5zyJaMmVJB5BTOcFGXjTPUb+2l58MD6RBnH9Kdyh5jEFPjskc8
 3uJGAofPN1C0JqlcOj84GzjouzUbk1alFl5/6sddInbjNHR/2T/JfpF5+1afxf2/wfoO
 ln85lRvvxeWbb5npSV45JP2GeIgqU+/P/gZyVKjd4FYKWH9+2LsgEzMLOgx6JXRTeytM
 +ufhBejDCzE2tSDA6vEkyEhVbiZ/7IuRb0+I/tVFVyRQRJlj1M8D85PbBmpwurrtd6dQ
 Qvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xs3urb+CfK37NrDBLos1427ZQKhaGuo6xOveDYDdwk4=;
 b=16n0GhX4WarzsgDi04pjFPDDkw49BaIEHhSegtx/ZDqw+nu6yQfxl03BWlR23L7RsP
 +VI7skztL4WBNEsQOW0ol/qcwzv9egZ4GECqLr34O8GM5Bfw2Fs90YvXmJvKMgG43Gpe
 qKAKoefpOyAkh+QBKSDPexa5gWJ2sU+BZ7PL+lnLRDC2W1QJILzYsgZqxQVjI6fRKAqx
 5Wh6cLm0tTQ9ZozwkGJWprLf4Xqk1Z9CeufkUvFfnvuMo6Xpwvm4Dt1jkmd4z2YBYghc
 PQVYr6LYxkyFhdY050IhtSNVv2HeauX1Q6PN5glGELw7o5KX0xxmv6DkYehiC3BVWgdI
 WRbg==
X-Gm-Message-State: AOAM532pOVg3H4NpjY5biID5+D8+S30gFzOz/WA3h8xL8nuAlqfrvEV3
 khMm+15Xe3yQGXQBj27EZFI=
X-Google-Smtp-Source: ABdhPJyVxLiD0ZQqAZZuVAbIuyKWPspNQoHWqmjtviHpXw7fP8OkMR4fQWvYU2Zmsx5B1WRQGFyX8A==
X-Received: by 2002:a1c:4e11:: with SMTP id g17mr8990009wmh.130.1632301856839; 
 Wed, 22 Sep 2021 02:10:56 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:10:56 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date: Wed, 22 Sep 2021 11:10:28 +0200
Message-Id: <20210922091044.2612-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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
index 22308a1b66fc..14907622769f 100644
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


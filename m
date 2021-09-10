Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46A740686E
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276886E996;
	Fri, 10 Sep 2021 08:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E956D6E994
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v10so1453928wrd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=AF9j13vF2C40YiZF8YnlmkRI+2y0Zgx5gxsyI8poos90I9FQMyjQftYcu/PQQbKRid
 qbgd2bSNKqUg3uORGqVR3m7f44omguz6cGmpda84jTegLUf6kT9iGnfiiMCKVxGpozGt
 4DkOkj8JqIxYhcy+Rr+gGXH4WA060kafbhcNNdhGWWVehKlZ9gj/F8BgSvTTUyTPsQe5
 V2k5ZBmi2Rg2/UiszoM7SXqfPfEp1yQVwjHSCgWMRZjh8ZMnmEuNrI3xnBZxt3f7DFRD
 yv8Chc8CTkXgJgzEe9h+eMgYid1dfBUqacTAw9N4IkxYm0gzfAl1auYyqd4X66ZoZHkn
 o4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6hl7Kj0yqQ18nUKlg1tjNnt1DaG6v6UQcKSpcEHFSE=;
 b=TfXhNWu2PQmewKUa5FsJ6THQQqGZMPK+3w83MT3z5O5eG62Ua1CjUREZ/cLrIAfCR/
 OW4ZyP9l6NTelI8QoKZO9BkT1V6iyy0Y8PpHTOmK2ULsADM4Y6q6GLTmpPh6k3sf8Ng7
 2I8mIn5XVQqRd9lh8UzMDGcUbwFbrVWFxP3MMNAh/AcCHxWmhCCyH+YMmtChsEYFsapf
 HGG/Mvi3UVrnc3pT7fZWPsiNcGKcMYgzWl4wfK47oRvykupqTj0zYwXO7Uw51LS2WaUj
 cHl8MPc27chXygjQs0H48YGcyNg3RAXyzLn99mdmxa97ZKWBpBGh77rtGpA7NDHabXfo
 u1EA==
X-Gm-Message-State: AOAM531q1ac3Mi4UqATCCCKMhyWlqTek0N6HuT91ZKXIHQ38aMtNS+3K
 r+sqyUBEIulCAR6PE8ti33w=
X-Google-Smtp-Source: ABdhPJwY9+avZrDVp15kV3L6A7ao2zBHMwJf/F8q7CwTgO/k1/czo3Esq+RiUn9i7G+1GaBzEM4rZA==
X-Received: by 2002:adf:f08d:: with SMTP id n13mr8365190wro.339.1631262430440; 
 Fri, 10 Sep 2021 01:27:10 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 14/14] drm/radeon: use new iterator in radeon_sync_resv
Date: Fri, 10 Sep 2021 10:26:55 +0200
Message-Id: <20210910082655.82168-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_sync.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_sync.c b/drivers/gpu/drm/radeon/radeon_sync.c
index 9257b60144c4..14a4d8135bad 100644
--- a/drivers/gpu/drm/radeon/radeon_sync.c
+++ b/drivers/gpu/drm/radeon/radeon_sync.c
@@ -91,33 +91,17 @@ int radeon_sync_resv(struct radeon_device *rdev,
 		     struct dma_resv *resv,
 		     bool shared)
 {
-	struct dma_resv_list *flist;
-	struct dma_fence *f;
+	struct dma_resv_cursor cursor;
 	struct radeon_fence *fence;
-	unsigned i;
+	struct dma_fence *f;
 	int r = 0;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	fence = f ? to_radeon_fence(f) : NULL;
-	if (fence && fence->rdev == rdev)
-		radeon_sync_fence(sync, fence);
-	else if (f)
-		r = dma_fence_wait(f, true);
-
-	flist = dma_resv_shared_list(resv);
-	if (shared || !flist || r)
-		return r;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
+	dma_resv_for_each_fence(resv, &cursor, shared, f) {
 		fence = to_radeon_fence(f);
 		if (fence && fence->rdev == rdev)
 			radeon_sync_fence(sync, fence);
 		else
 			r = dma_fence_wait(f, true);
-
 		if (r)
 			break;
 	}
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B98A39CE83
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jun 2021 12:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FB76E48C;
	Sun,  6 Jun 2021 10:03:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1633B6E02D
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jun 2021 10:03:18 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id l1so21585503ejb.6
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Jun 2021 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1e/SbMbCf5qJDsFem7oEWojdln1rq60P/UViM2oZ51I=;
 b=gfJo3HTpg6/Uk1bPNKYgIL3167J+T27XMYd6YiuZBt6YfWXbWiw9sQLbgq33lEAfUU
 HXFP6vZYuJ/7nqOAnxlecIpekp7uMOYmRcj83RCqemlv94aEN0jbsQVwdFfLycQsRsYt
 l8aAEeLPpgb8qBfZyzKeJssmsKPmFdeXw8aW6K1MEy3T+u8OfDw7udrgJADW4vpN0Ej6
 a7zNaPAvDvthpY1aJsaC6qKpXd+pOKSuUpnngohSf6wZ263urSup2Gj6CUs9vm3nuwhE
 WXESBlNhoNxgz36n9CgFkCVajs9sMbE51rfX0uxRG/Y2w+k03vkhlaNjU73pi1DzlDQg
 U8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1e/SbMbCf5qJDsFem7oEWojdln1rq60P/UViM2oZ51I=;
 b=kxBkA6y+nKn7y1FX5jkXzS3AFDE+E72Bah3YHi+e66XVBJVFVOw49rLMhdrr7ZImeK
 4rJoAH32SDv+zs55adgivsCyRjJaApbu1wrtdXxTXFXFEsmeImsSPArOIqao7+mQYdys
 Rnfy/vwpI3aBivwVHgFkSKUkonHSxzWKLBGa/bCafW5sEkPdLteRsFjePzRLYgDdPUAk
 JBkhdugmOPfz9NKuoDLPeOL67XMKL3qBQDBxCfF2MM+EJfbge/XCmXCxW7tG9YSPv+RD
 C1fyFbmtMkxLVHOk/Z0CK0c9iAZv2j35dtKhj4q1L1qra5FO1CDPHvz0fczpUDjvqq+C
 uD0w==
X-Gm-Message-State: AOAM5302guOQWWGqRORw/YvoieKtqRQ6B/0W3pTQ+CYttACNvLn5FYT9
 gHSetr5bKbpYD69D7cyJeuI=
X-Google-Smtp-Source: ABdhPJzXwQasFBmS9OJTiDy75zOxC8lpSyGJ/pk3/irDOFRI5wMnZw/WqHWDXUGslrMkpzFLU4zX/g==
X-Received: by 2002:a17:906:606:: with SMTP id
 s6mr12762894ejb.206.1622973796774; 
 Sun, 06 Jun 2021 03:03:16 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:78a4:bc57:b741:16b2])
 by smtp.gmail.com with ESMTPSA id r12sm6077531edv.82.2021.06.06.03.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 03:03:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] dma-buf: fix dma_resv_test_signaled test_all handling
Date: Sun,  6 Jun 2021 12:03:10 +0200
Message-Id: <20210606100312.119176-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210606100312.119176-1-christian.koenig@amd.com>
References: <20210606100312.119176-1-christian.koenig@amd.com>
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

As the name implies if testing all fences is requested we
should indeed test all fences and not skip the exclusive
one because we see shared ones.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index f26c71747d43..c66bfdde9454 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -615,25 +615,21 @@ static inline int dma_resv_test_signaled_single(struct dma_fence *passed_fence)
  */
 bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 {
-	unsigned int seq, shared_count;
+	struct dma_fence *fence;
+	unsigned int seq;
 	int ret;
 
 	rcu_read_lock();
 retry:
 	ret = true;
-	shared_count = 0;
 	seq = read_seqcount_begin(&obj->seq);
 
 	if (test_all) {
 		struct dma_resv_list *fobj = dma_resv_shared_list(obj);
-		unsigned int i;
-
-		if (fobj)
-			shared_count = fobj->shared_count;
+		unsigned int i, shared_count;
 
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; ++i) {
-			struct dma_fence *fence;
-
 			fence = rcu_dereference(fobj->shared[i]);
 			ret = dma_resv_test_signaled_single(fence);
 			if (ret < 0)
@@ -641,24 +637,19 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
 			else if (!ret)
 				break;
 		}
-
-		if (read_seqcount_retry(&obj->seq, seq))
-			goto retry;
 	}
 
-	if (!shared_count) {
-		struct dma_fence *fence_excl = dma_resv_excl_fence(obj);
-
-		if (fence_excl) {
-			ret = dma_resv_test_signaled_single(fence_excl);
-			if (ret < 0)
-				goto retry;
+	fence = dma_resv_excl_fence(obj);
+	if (fence) {
+		ret = dma_resv_test_signaled_single(fence);
+		if (ret < 0)
+			goto retry;
 
-			if (read_seqcount_retry(&obj->seq, seq))
-				goto retry;
-		}
 	}
 
+	if (read_seqcount_retry(&obj->seq, seq))
+		goto retry;
+
 	rcu_read_unlock();
 	return ret;
 }
-- 
2.25.1


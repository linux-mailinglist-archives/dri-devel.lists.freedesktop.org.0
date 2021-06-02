Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D61398B60
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184316EC9D;
	Wed,  2 Jun 2021 14:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CE46EC9D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:04:02 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id o5so3080929edc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4BZxJN8dcYDKgqr/JxEdF9JDtH0BmEgV/hXLRgXBKo=;
 b=fByvcKC7d9/Ue20Maxqu3cV6qcERKlrudBi5c3YaKkaSDYkAhF6Z6dY+XF+QYz8Zfk
 X5On5PPTCxXJuplq3g+mWHPpLP0NmnILC/hIlPAS55X4T7JvPgHnQzQoRlkkRoUM6cwi
 tTE4M1CWNfHARV/HuwCU7xtonz6A8tN6CVOLl/yL3hTLd9wAZpa99F6tZiliBo6VidGu
 Runm8b4bJWofzWZLyy7izcN+8Szvygrlfma5ti9OWcVlUwYfQWZVCjIYIGuv54ZJUszi
 LPJGhuva9n21ugj+mfuwXz8U4rPWPIM+7sCPbwozj5kmoxqZrdylVdE2+VCNolBzfAwg
 inWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J4BZxJN8dcYDKgqr/JxEdF9JDtH0BmEgV/hXLRgXBKo=;
 b=WVYoOBklfA2AinpCQEiPyKXSOQd7/Ab2TqWgH+331tH9C/3+ZxigHBPIroHHU1Mx2D
 hT2wajkVURZKQ6VSy17Sx3iX4IANqjWUtasvDu27bvt/KsFRagbPr1mwIlD0OY4+4zNa
 1rXApeHQAirTxfssApFYSvXSB0yzY7puJ1cmoo90hKPVlf/14LGaHOc6ZLlK1tUHauyx
 7JrqASoiEJ6taxOFYZAlCuZxT0LRF53y8g/cZrPsW2Q7FfyusU9C6qMSyszVLBXGr038
 AMqyfZNIOmahISAw36lrii5jwAhaYUUf0wGKuLpukSQ9YBdASGZpGPHluqjYb/4lJTvB
 tYEg==
X-Gm-Message-State: AOAM532pLgHLGjcXGVbifdZUDoQGVL6MikeQ5Id0z+MdaDT1epv1S9+v
 EOXL2UuHeniEqd3V0iMCt933SWWtvZA=
X-Google-Smtp-Source: ABdhPJzRJnzHcyS+HUgjX9B9nUY3/6qvvBvXGArVIkSitK636hRPLA3cCZdzFKwpEp//EvhLamBGUQ==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr38979600edt.194.1622642641281; 
 Wed, 02 Jun 2021 07:04:01 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e6a4:731d:6be0:e698])
 by smtp.gmail.com with ESMTPSA id gw7sm82327ejb.5.2021.06.02.07.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:04:00 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 1/2] dma-buf: fix inconsistent debug print v2
Date: Wed,  2 Jun 2021 16:03:58 +0200
Message-Id: <20210602140359.272601-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the whole rcu handling since we are holding the resv lock anyway.

v2: drop all rcu handling instead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index eadd1eaa2fb5..ee04fb442015 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1349,15 +1349,14 @@ EXPORT_SYMBOL_GPL(dma_buf_vunmap);
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
 {
-	int ret;
 	struct dma_buf *buf_obj;
 	struct dma_buf_attachment *attach_obj;
 	struct dma_resv *robj;
 	struct dma_resv_list *fobj;
 	struct dma_fence *fence;
-	unsigned seq;
 	int count = 0, attach_count, shared_count, i;
 	size_t size = 0;
+	int ret;
 
 	ret = mutex_lock_interruptible(&db_list.lock);
 
@@ -1383,33 +1382,25 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 				buf_obj->name ?: "");
 
 		robj = buf_obj->resv;
-		while (true) {
-			seq = read_seqcount_begin(&robj->seq);
-			rcu_read_lock();
-			fobj = rcu_dereference(robj->fence);
-			shared_count = fobj ? fobj->shared_count : 0;
-			fence = rcu_dereference(robj->fence_excl);
-			if (!read_seqcount_retry(&robj->seq, seq))
-				break;
-			rcu_read_unlock();
-		}
-
+		fence = rcu_dereference_protected(robj->fence_excl,
+						  dma_resv_held(robj));
 		if (fence)
 			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
+
+		fobj = rcu_dereference_protected(robj->fence,
+						 dma_resv_held(robj));
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
-			if (!dma_fence_get_rcu(fence))
-				continue;
+			fence = rcu_dereference_protected(fobj->shared[i],
+							  dma_resv_held(robj));
 			seq_printf(s, "\tShared fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
-			dma_fence_put(fence);
 		}
-		rcu_read_unlock();
 
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
-- 
2.25.1


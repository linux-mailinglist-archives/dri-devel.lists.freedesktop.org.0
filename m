Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE9382EE1
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 16:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027D56E976;
	Mon, 17 May 2021 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377216E976
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 14:11:34 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id t3so7080068edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 07:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gn9n1CRWcynBJZ+ZbJ5qdWJBZgGNYvGrzX9b9xb/C9U=;
 b=jsH7DtkUOG3mSu/xsOqnceNM8D0RYfH2NOLhWVBbOIsiCYn9Ieq1own5Hdhtukbhvs
 WhBLHPiaxtajZznrVUwkLxufaD5GS7oVrN3VenzI0HoHpalMW2tsqk/ple9aBkiteZPc
 bU8pNVZtKf6iVobiky7HvH1jKAEmhQOw1pUX59skfFNLR4AzoRJTq7Z0h2Bss0VmsgK3
 IWSsDXNFLOnIs3R13qZh9essbZeLcFoij4uQr1QUckQF+Mne4UZ63C/RqB+jwTwYExZV
 R4dBHhJPOXuAlTWlDPEyFuAIyA4HlBGUDbpZ2+xqmSvQtovIzcnHaqdAfwEgBjA4dh9m
 JbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gn9n1CRWcynBJZ+ZbJ5qdWJBZgGNYvGrzX9b9xb/C9U=;
 b=ssZ3ntb8iL65iJAw0AVZ9gJtvObXzgvazEZOXU5rgV3DCq1oCR0eyXhU3LVpARe2lr
 e3gSCZfoGEjH4j1tmB2xz6E9UlA+zb/6ZNwvmKnZPSD5vbOkXdMe+mZecg7ONogojFjK
 qbKOvHd/wgC7eBBtmwUQTGJaKPvxiH/s4l1ACNNSIORBceh3uUUtMDCuaAc0A0N3zQ5a
 Gn2si+yaXcPjePQwWfS/2oS6Z6+smh4ZJ1fdHg3M5V7flaWXzO6FY8yOfdGGOUxlEUe2
 M1rNaueVyYYMGAjDF22yn8IXbBDQrId131YFj0UKUXVhT+grBbABAkq7Xs5jj+bzZjV8
 yd4w==
X-Gm-Message-State: AOAM5338NxWUA7kmTi309QWZqVlaoNHYdrRINvWa1qK/zq30QydPm5RN
 yuO2a+/xtM5wo2W+DwVQ52U+Rrdqn30=
X-Google-Smtp-Source: ABdhPJxMUGFTk+WZNErNHcw3JxBYEeRmZ5u9qkNiHIc9NaZccxBoFIVEdRwQ0lWb8N715Av6V1xnmg==
X-Received: by 2002:a05:6402:1649:: with SMTP id
 s9mr244521edx.35.1621260692877; 
 Mon, 17 May 2021 07:11:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1df4:c5b6:b8fd:3c4b])
 by smtp.gmail.com with ESMTPSA id b9sm2419624edt.71.2021.05.17.07.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 07:11:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 01/11] dma-buf: fix invalid debug print
Date: Mon, 17 May 2021 16:11:19 +0200
Message-Id: <20210517141129.2225-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517141129.2225-1-christian.koenig@amd.com>
References: <20210517141129.2225-1-christian.koenig@amd.com>
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

The code tries to acquire the rcu protected fence list, but then ignores
individual fences which has been modified while holding the rcu.

Stop that madness and just note cleanly that
the list was concurrently modified.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..468c282b8a06 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1383,22 +1383,17 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
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
+		seq = read_seqcount_begin(&robj->seq);
+		rcu_read_lock();
+		fence = rcu_dereference(robj->fence_excl);
 		if (fence)
 			seq_printf(s, "\tExclusive fence: %s %s %ssignalled\n",
 				   fence->ops->get_driver_name(fence),
 				   fence->ops->get_timeline_name(fence),
 				   dma_fence_is_signaled(fence) ? "" : "un");
+
+		fobj = rcu_dereference(robj->fence);
+		shared_count = fobj ? fobj->shared_count : 0;
 		for (i = 0; i < shared_count; i++) {
 			fence = rcu_dereference(fobj->shared[i]);
 			if (!dma_fence_get_rcu(fence))
@@ -1410,6 +1405,8 @@ static int dma_buf_debug_show(struct seq_file *s, void *unused)
 			dma_fence_put(fence);
 		}
 		rcu_read_unlock();
+		if (read_seqcount_retry(&robj->seq, seq))
+			seq_printf(s, "\tFences concurrently modified\n");
 
 		seq_puts(s, "\tAttached Devices:\n");
 		attach_count = 0;
-- 
2.25.1


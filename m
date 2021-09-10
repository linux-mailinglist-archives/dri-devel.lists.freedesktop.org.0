Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA5406869
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA296E998;
	Fri, 10 Sep 2021 08:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF346E98C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:05 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u16so1449789wrn.5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQf+EG1LqOYQqT40zZYv5ISTQOpig8QPja/gK5mvSkk=;
 b=KWztHsb21w2it84cyHjC8FeFPLylec8BzPNdnnOAyMTcQFQvrL3Iphclm4QJJZDNY3
 USh7eCwk5QhBrruugl+vnG0zMSXsO13CTBLDKslniTxOaJVtfYs7rKOKsYErSqvPcjD4
 TB/wXN0YbSOQ+jJolf3+e/xGFvb9UzZ4renfdtmpogVZD1t2tDKSbOw7Eic3v95/zTYT
 ksVo+L5+rZQLvXxkicZlQmoPI3Cjb4segzer8T6r6MsO1LAJMapEIRAAqBov5nmivbbn
 r7RfobGfU50paoaXQ3qhW9fD4cxFkPOOkM1wprcyGTEMWGK404bnGwZ7L+wvx76UF0AX
 6tAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQf+EG1LqOYQqT40zZYv5ISTQOpig8QPja/gK5mvSkk=;
 b=UC5mTGIoGhyIQaOwWEGg9Mkr040NdQ3qqZMhPU1VT6HUISB2IiP794X3NoUJ8nss/l
 35ogrAA0OG613uPHD7FartuPlsBkXbvXWi1YeR5Q6Al4+NB8k4/tlGF8xzHv/3CKo5R3
 MEwY2wCRoR6GdSSYpQC56iHLtwe+uBmohBp1V0pJ7sQhfX4upIBWjKehA2Bhe05LrWt4
 pzgguinkeTWwdZ9Yk3Ym8kP9lIQT2YPoOd7dh7/becahlxQqE2NRZmeZDwG9sziKSavt
 Jnyq4j3jX8GGjMJEmSLivlX2Tbge5KzHOf9FsIyW5aQTp0RYUFb9oaJzRn13WmKS7O4b
 qdOA==
X-Gm-Message-State: AOAM531kBt5ImehOsaaoyQyv+o+a54cMbvnDbUInRkeHJ8dqxeGwbd5M
 DAKWeObK49Pr8TgdSIt5ZZE=
X-Google-Smtp-Source: ABdhPJy68Z8lYN7Y274ina8jZFGUbeYevbUiZ29MIqcoqNjsNlZswRucR0lzTahDGThht/diqI0B7w==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr8424261wrn.111.1631262424189; 
 Fri, 10 Sep 2021 01:27:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 08/14] drm/ttm: use the new iterator in ttm_bo_flush_all_fences
Date: Fri, 10 Sep 2021 10:26:49 +0200
Message-Id: <20210910082655.82168-8-christian.koenig@amd.com>
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

This is probably a fix since we didn't even grabed a reference to the
fences.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 0a3127436f61..5dd0c3dfec3c 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -269,19 +269,11 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
 static void ttm_bo_flush_all_fences(struct ttm_buffer_object *bo)
 {
 	struct dma_resv *resv = &bo->base._resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
-	int i;
 
 	rcu_read_lock();
-	fobj = dma_resv_shared_list(resv);
-	fence = dma_resv_excl_fence(resv);
-	if (fence && !fence->ops->signaled)
-		dma_fence_enable_sw_signaling(fence);
-
-	for (i = 0; fobj && i < fobj->shared_count; ++i) {
-		fence = rcu_dereference(fobj->shared[i]);
-
+	dma_resv_for_each_fence_unlocked(resv, &cursor, true, fence) {
 		if (!fence->ops->signaled)
 			dma_fence_enable_sw_signaling(fence);
 	}
-- 
2.25.1


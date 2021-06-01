Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2E7397329
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:25:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4366EA15;
	Tue,  1 Jun 2021 12:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1946EA2E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:25:33 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id h24so17456688ejy.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8ATXqz+QjI7OCkP7Gnudo3PRDCh8x4oJ8vFszvYpuBk=;
 b=G4HTYbjSbDxAWD1OA5JfLxwb+zeP7nQ06Po9Q2vLg/UwH8CA+Wpoyt7eCsY4kL1M8J
 f2IrQk8kZ4isqH+uAwm3dQUFoFhzWLx3WghhZdyMVovdPcZXZfmzbQH5E1zk4lx+XIAG
 2UGe05Yk3RY3XNWQV/W8gNSa9+504QUnBSR0tY5y63pjFXBijO/WMBrubG4T7kpXDB2q
 ZLMD5E+Jbz7FETd25ro+y0hdtdNTbZfEetgV5Alt4ArTW9ND3+szLJeK8O/xORv7NP34
 IQnNRO/VrUWfwmBtXxpDo7hO56uUyiQLzRwdhbBOjJOx2ffASg7q+bjplHpi93gepmtt
 C9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8ATXqz+QjI7OCkP7Gnudo3PRDCh8x4oJ8vFszvYpuBk=;
 b=ZdV3ojrVztsntX9eGTL2DptZDpZZLLlhtErJA2+UgJVRycdOH3Rzo+BtguWWn+BPNk
 NcBBjMQQyEKGmECJEhnccNSQUREOlg0V0WslPCbkdnfMYWuhoe5PHxqgrxTHycwdU9su
 pGZTwYNoxs9clF2Yu5mDerVDdF2zQqVmp0LFMwTiRofyMIisZuRMUJXcpBi6EJASH2Ld
 RCiOSs/GVPABw9kBHZqvoIyCa/RykA0+U/TE8fGBEJEDJr4UDoPU8cEjxevGV3gzpnpm
 uEW/jidrm1SrTMyrQ7OUufrOS2GFZveAPItQV7T6sIMcP+iLQkAizm4sSBmzBVqwt+eh
 du0w==
X-Gm-Message-State: AOAM533BOoMI0s8qpurqJPbXgkbdK6IWfSeoLHPxRYRyoxV5LwnRl6ZL
 H2b9aC/rD1BRPHbErII914VqtOPoFB8=
X-Google-Smtp-Source: ABdhPJyG36/BDOWGVDkr4Ogn1i5UhsieW8jV1lAACPWmu1TWjD0xl9TBOSXkDQFkFzVxRU/7U8lI9Q==
X-Received: by 2002:a17:906:b253:: with SMTP id
 ce19mr12289531ejb.379.1622550332568; 
 Tue, 01 Jun 2021 05:25:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fba0:a784:4c4a:8bc0])
 by smtp.gmail.com with ESMTPSA id f7sm8534845edd.5.2021.06.01.05.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 05:25:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Lang.Yu@amd.com,
	thomas_os@shipmail.org
Subject: [PATCH 4/4] drm/amdgpu: switch gtt_mgr to counting used pages
Date: Tue,  1 Jun 2021 14:25:28 +0200
Message-Id: <20210601122528.1643-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601122528.1643-1-christian.koenig@amd.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
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

From: Lang Yu <Lang.Yu@amd.com>

Change mgr->available into mgr->used (invert the value).

Makes more sense to do it this way since we don't need the spinlock any
more to double check the handling.

v3 (chk): separated from the TEMPOARAY FLAG change.

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 26 ++++++++-------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  2 +-
 2 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 5e6b76441449..4d7e34a8d3fd 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -121,14 +121,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	if (!(place->flags & TTM_PL_FLAG_TEMPORARY)) {
-		spin_lock(&mgr->lock);
-		if (atomic64_read(&mgr->available) < mem->num_pages) {
-			spin_unlock(&mgr->lock);
-			return -ENOSPC;
-		}
-		atomic64_sub(mem->num_pages, &mgr->available);
-		spin_unlock(&mgr->lock);
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY) &&
+	    atomic64_add_return(mem->num_pages, &mgr->used) >  man->size) {
+		atomic64_sub(mem->num_pages, &mgr->used);
+		return -ENOSPC;
 	}
 
 	if (!place->lpfn) {
@@ -164,7 +160,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 
 err_out:
 	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
-		atomic64_add(mem->num_pages, &mgr->available);
+		atomic64_sub(mem->num_pages, &mgr->used);
 
 	return r;
 }
@@ -191,7 +187,7 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 	}
 
 	if (!(mem->placement & TTM_PL_FLAG_TEMPORARY))
-		atomic64_add(mem->num_pages, &mgr->available);
+		atomic64_sub(mem->num_pages, &mgr->used);
 }
 
 /**
@@ -204,9 +200,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 uint64_t amdgpu_gtt_mgr_usage(struct ttm_resource_manager *man)
 {
 	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
-	s64 result = man->size - atomic64_read(&mgr->available);
 
-	return (result > 0 ? result : 0) * PAGE_SIZE;
+	return atomic64_read(&mgr->used) * PAGE_SIZE;
 }
 
 /**
@@ -252,9 +247,8 @@ static void amdgpu_gtt_mgr_debug(struct ttm_resource_manager *man,
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
 
-	drm_printf(printer, "man size:%llu pages, gtt available:%lld pages, usage:%lluMB\n",
-		   man->size, (u64)atomic64_read(&mgr->available),
-		   amdgpu_gtt_mgr_usage(man) >> 20);
+	drm_printf(printer, "man size:%llu pages,  gtt used:%llu pages\n",
+		   man->size, atomic64_read(&mgr->used));
 }
 
 static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
@@ -286,7 +280,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
 	drm_mm_init(&mgr->mm, start, size);
 	spin_lock_init(&mgr->lock);
-	atomic64_set(&mgr->available, gtt_size >> PAGE_SHIFT);
+	atomic64_set(&mgr->used, 0);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
 	ttm_resource_manager_set_used(man, true);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index b2c97b19cbe1..64a78da33805 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -51,7 +51,7 @@ struct amdgpu_gtt_mgr {
 	struct ttm_resource_manager manager;
 	struct drm_mm mm;
 	spinlock_t lock;
-	atomic64_t available;
+	atomic64_t used;
 };
 
 struct amdgpu_mman {
-- 
2.25.1


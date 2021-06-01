Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917E9397327
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 14:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648766EA27;
	Tue,  1 Jun 2021 12:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781886E81A
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 12:25:32 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id k7so11834825ejv.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 05:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6t7o/v++kUreKh+BqmcXqVMGRXaQhdTiSOndd5rOlTc=;
 b=TfAdEMF2rD1xgWTtU/Y2KvYcRDFQW32F8sHbMBs1X1BCCWj4Nz3sQ5jlLqXrS3bXAU
 CGB1iPaxWbmRPaX02xphFvaPx56OUy5NOYFTyg4aQSXQfpb2op2dREV5hTdtLetiCXfz
 SFj9ywF4Ui1l+ERBC5nxc+03EKOScGRMrL+JqoHGpQcG7w7JEvmauDvP8GzEkLTPEPFM
 R+s2H/scYt/qgGHfH6O/fFd2XnHlLt0BtVcRs0PimRiTzpznux2snlQxWBMhRX4BmKIn
 Nk2VrmOa4qNzKUklU/fy7E+VZih8vjNNrzJVrSl2upx9r46pg/mNZS3Opz2+q+UR23s5
 05RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6t7o/v++kUreKh+BqmcXqVMGRXaQhdTiSOndd5rOlTc=;
 b=LfyF/wWHdJYeNZyubarYXhwKZ7ldlKb4sXgPVZ65UyitDUTvJnOKO3GUoM+DrRuuyX
 MpUbfHGHSOPKJk+/1fvRo/jNEwUWr+uYa3VQS+CZnbEHA727vtI/vyfeaghli3rIrHYO
 tkxHAdijxdVhX9CShekwH6RaVlhFpW/fn4g8SVSshR2jHbqfg5Zt8xxrWDREH5+n5HXT
 6DzyHbGoW6L5zdmdIwRWG086jiMLtFCn++PvoMgiDmBtoqRz0eOPjc7m+v7iEvNvEX3g
 OYGRqnH3Hz0+nO8NE0eDEtLYLFEyKXDBqlgZ2AvicoDdmvkkh6AFq5irmHZss0jJWcKV
 N+/w==
X-Gm-Message-State: AOAM530u1RkIVdhC3BtoTK1eXARgPBpdpEhdhPL9tbDB+zqABlDZrBRF
 +QONiULon5Fh9ErUgu/1hMRA8EmwhgU=
X-Google-Smtp-Source: ABdhPJxn/4kbfYtdVDrFUnDbLpkv/UP1HJidJMJmtXqyaI5tCiWxQ6Fv/Gn2HePPB7XvVMWd14E7/A==
X-Received: by 2002:a17:906:1591:: with SMTP id
 k17mr29397524ejd.401.1622550331088; 
 Tue, 01 Jun 2021 05:25:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fba0:a784:4c4a:8bc0])
 by smtp.gmail.com with ESMTPSA id f7sm8534845edd.5.2021.06.01.05.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 05:25:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Lang.Yu@amd.com,
	thomas_os@shipmail.org
Subject: [PATCH 2/4] drm/amdgpu: user temporary GTT as bounce buffer
Date: Tue,  1 Jun 2021 14:25:26 +0200
Message-Id: <20210601122528.1643-2-christian.koenig@amd.com>
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

Currently, we have a limitted GTT memory size and need a bounce buffer
when doing buffer migration between VRAM and SYSTEM domain.

The problem is under GTT memory pressure we can't do buffer migration
between VRAM and SYSTEM domain. But in some cases we really need that.
Eespecially when validating a VRAM backing store BO which resides in
SYSTEM domain.

v2: still account temporary GTT allocations
v3 (chk): revert to the simpler change for now

Signed-off-by: Lang Yu <Lang.Yu@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 19 +++++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     |  2 +-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index 6a84c9778cc0..5e6b76441449 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -121,14 +121,15 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	struct amdgpu_gtt_node *node;
 	int r;
 
-	spin_lock(&mgr->lock);
-	if ((&tbo->mem == mem || tbo->mem.mem_type != TTM_PL_TT) &&
-	    atomic64_read(&mgr->available) < mem->num_pages) {
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY)) {
+		spin_lock(&mgr->lock);
+		if (atomic64_read(&mgr->available) < mem->num_pages) {
+			spin_unlock(&mgr->lock);
+			return -ENOSPC;
+		}
+		atomic64_sub(mem->num_pages, &mgr->available);
 		spin_unlock(&mgr->lock);
-		return -ENOSPC;
 	}
-	atomic64_sub(mem->num_pages, &mgr->available);
-	spin_unlock(&mgr->lock);
 
 	if (!place->lpfn) {
 		mem->mm_node = NULL;
@@ -162,7 +163,8 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
 	kfree(node);
 
 err_out:
-	atomic64_add(mem->num_pages, &mgr->available);
+	if (!(place->flags & TTM_PL_FLAG_TEMPORARY))
+		atomic64_add(mem->num_pages, &mgr->available);
 
 	return r;
 }
@@ -188,7 +190,8 @@ static void amdgpu_gtt_mgr_del(struct ttm_resource_manager *man,
 		kfree(node);
 	}
 
-	atomic64_add(mem->num_pages, &mgr->available);
+	if (!(mem->placement & TTM_PL_FLAG_TEMPORARY))
+		atomic64_add(mem->num_pages, &mgr->available);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 80437b6ba5f3..6bdff9005a47 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -514,7 +514,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
 			hop->fpfn = 0;
 			hop->lpfn = 0;
 			hop->mem_type = TTM_PL_TT;
-			hop->flags = 0;
+			hop->flags = TTM_PL_FLAG_TEMPORARY;
 			return -EMULTIHOP;
 		}
 
-- 
2.25.1


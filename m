Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63EBA6CCAA
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:29:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E11D10E181;
	Sat, 22 Mar 2025 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Z3LtJmV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DC110E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:29:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742678955; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=juaxAJCrvrgSeb48itlacxngBqXwLrekvexnPpvTbbu7R8QTqwhtr5zawhmjfbKxWTyykbx6oKcHxDuHdjWE+04cg5krCppUy1RHUM7Htf4C9gm8SRn+8ATNq2Zk+VGnKRfE3snUVU/M9sVVxP4Sa8Er0ijoHSiGbMK9nBa8NmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742678955;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D8skzeqwalBI3wYRwszZe+VNe6TDcBK3mAxl50TBKew=; 
 b=grsGYVO2TEDWJLi+expl4QKgARf+MdWS5heR+R8nnvPo6Pe/NOaQ42E/ey4eRWMnChVQ4OuF+ap4hLGMJsfSGLri6CDdKgg5oODmhmna/+FO8ZB6r9TpmIdAS7lbSXadSWKJH/uiL7OcTEyjMgZ81ozF/uRgRHLbrqxput21j64=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742678955; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=D8skzeqwalBI3wYRwszZe+VNe6TDcBK3mAxl50TBKew=;
 b=Z3LtJmV1Duqg51kpfxHWZuqIMGJnLXbhss9hp6cHm7HfwA1OC/JJ0kagavWCG97g
 oe0LY9LxI9fnBL4EURSRotfVdVeE077avC2FGSrjzZYjkGv44xj+Z+D7GSRToTPWmLV
 unPbTZwBzR5Atrb6z1FkAjs8foxjWcDSRMzEPeHA=
Received: by mx.zohomail.com with SMTPS id 1742678953019135.32721424030217;
 Sat, 22 Mar 2025 14:29:13 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: [PATCH v20 02/10] drm/gem: Add _locked postfix to functions that have
 unlocked counterpart
Date: Sun, 23 Mar 2025 00:26:00 +0300
Message-ID: <20250322212608.40511-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Add _locked postfix to drm_gem functions that have unlocked counterpart
functions to make GEM functions naming more consistent and intuitive in
regards to the locking requirements.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c | 6 +++---
 include/drm/drm_gem.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 27778e5ce0c0..1e659d2660f7 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1543,10 +1543,10 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 EXPORT_SYMBOL(drm_gem_lru_scan);
 
 /**
- * drm_gem_evict - helper to evict backing pages for a GEM object
+ * drm_gem_evict_locked - helper to evict backing pages for a GEM object
  * @obj: obj in question
  */
-int drm_gem_evict(struct drm_gem_object *obj)
+int drm_gem_evict_locked(struct drm_gem_object *obj)
 {
 	dma_resv_assert_held(obj->resv);
 
@@ -1558,4 +1558,4 @@ int drm_gem_evict(struct drm_gem_object *obj)
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_gem_evict);
+EXPORT_SYMBOL(drm_gem_evict_locked);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 13c312ca07ae..43cf3c2c7ca0 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -561,7 +561,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 			       unsigned long *remaining,
 			       bool (*shrink)(struct drm_gem_object *obj));
 
-int drm_gem_evict(struct drm_gem_object *obj);
+int drm_gem_evict_locked(struct drm_gem_object *obj);
 
 /**
  * drm_gem_object_is_shared_for_memory_stats - helper for shared memory stats
-- 
2.49.0


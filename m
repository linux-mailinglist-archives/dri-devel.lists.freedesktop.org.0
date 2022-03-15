Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A214DA1F4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 19:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90A910E480;
	Tue, 15 Mar 2022 18:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 057EE10E43E;
 Tue, 15 Mar 2022 18:05:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id AFB961F430BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647367509;
 bh=sv/7BhTnXU6OwO9t2oOn1ya2zRweojAD5yK19Y9oJaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KWQuk6MPHbAKO5FzGNeyNlRjlMXMJx9ygW1wM4ODTJQnqvFAtUVmAA77md3vmPiAZ
 4Jz9gf2jApf32RWcb+GXbHeDnWrWc40dQOoh95XPSJYoollakbeM/cZ68+iboqTOWA
 Jq95cjGryzWLuSO7ry1sP+CIDurxFOIQ4V4HA7xqdgN3eCL3992dgdQ2a+hIJaW5/X
 GEFfzReBsMP4DwwgJYTVtBTfdkDSGVuuWKTMkCUE8lOl+s7tDCjbM604pjE3GvfauU
 JKwc+O/shZgc0xZJSdu644hZgIk1KJBR/wWkOv01KLptaAkFPysfHyPBuMWqpEEOgI
 979RtP1a6pU1Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Date: Tue, 15 Mar 2022 18:04:42 +0000
Message-Id: <20220315180444.3327283-6-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220315180444.3327283-1-bob.beckett@collabora.com>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
MIME-Version: 1.0
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
Cc: Robert Beckett <bob.beckett@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFC: do we want this to become a generic interface in
ttm_resource_manager_func?

RFC: would we prefer a different interface? e.g.
for_each_resource_in_range or for_each_bo_in_range

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
 include/drm/ttm/ttm_range_manager.h     |  3 +++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
index 8cd4f3fb9f79..5662627bb933 100644
--- a/drivers/gpu/drm/ttm/ttm_range_manager.c
+++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
@@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
 	return 0;
 }
 EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
+
+/**
+ * ttm_range_man_range_busy - Check whether anything is allocated with a range
+ *
+ * @man: memory manager to check
+ * @fpfn: first page number to check
+ * @lpfn: last page number to check
+ *
+ * Return: true if anything allocated within the range, false otherwise.
+ */
+bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
+			      unsigned fpfn, unsigned lpfn)
+{
+	struct ttm_range_manager *rman = to_range_manager(man);
+	struct drm_mm *mm = &rman->mm;
+
+	if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn + 1) - 1))
+		return true;
+	return false;
+}
+EXPORT_SYMBOL(ttm_range_man_range_busy);
diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
index 7963b957e9ef..86794a3f9101 100644
--- a/include/drm/ttm/ttm_range_manager.h
+++ b/include/drm/ttm/ttm_range_manager.h
@@ -53,4 +53,7 @@ static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
 	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
 	return ttm_range_man_fini_nocheck(bdev, type);
 }
+
+bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
+			      unsigned fpfn, unsigned lpfn);
 #endif
-- 
2.25.1


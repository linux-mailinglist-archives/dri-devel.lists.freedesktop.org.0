Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE13AAE601
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 18:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8D110E84F;
	Wed,  7 May 2025 16:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NjcXwgyj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FFE410E84F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 16:07:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746634051; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Rzd9BFgNj9vhGBLtiiw34XLbpocHGUekDyINuAjN26RKZskCH3jUK6p6rMdW0F/++CtfVRHnEDJ3Upgd7NZ4s/S58kF40chqOKcKBdpFEnSYq+hpBXRgI7F3ifpRpvsVGdZwZXoarAea/ApoJE3o9E9VQRqNJWYWqGS/1pFW6D0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746634051;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=5hGgHfm9gUWZAq9fadCtGnwyYhdZQyxGLtv/ziBgvs8=; 
 b=hGu1PXr2TpAyw2lMx0Vhsf3N7jOiSrG4fY0c/X0NYl+TX2RVLuj5weCMHtwU7r62ymZRyMn4wsc5VF3lDx8TTw+LXWLBnn/3cHi4NSpVQ6Tcr/iQjWml8o4UWfq9NaCTb+RQRaM+Z3rizx+/ItEf3pfBLH4dMBMHViw4dgDHK0U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746634051; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=5hGgHfm9gUWZAq9fadCtGnwyYhdZQyxGLtv/ziBgvs8=;
 b=NjcXwgyjweAyjbp1F/EGnmv9yddo+CLW596n1VOQYfpTuesssQo/5WaRlYw/V3nI
 QEU7ZoJSlV3ZJ48zhZh8yAlmgr882CGJHFcJMG2Cc+3kzyTXEcMReK9F52nz3bi6OHD
 yxQsaQEfHWfC7HxXoclSFonrF0CwrpYIo6ObNv/8=
Received: by mx.zohomail.com with SMTPS id 174663405055819.910230509735243;
 Wed, 7 May 2025 09:07:30 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 1/3] drm/panfrost: Add BO labelling to Panfrost
Date: Wed,  7 May 2025 17:07:07 +0100
Message-ID: <20250507160713.1363985-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
References: <20250507160713.1363985-1-adrian.larumbe@collabora.com>
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

Unlike in Panthor, from where this change is based on, there is no need
to support tagging of BO's other than UM-exposed ones, so all strings
can be freed with kfree().

This commit is done in preparation of a following one that will allow
UM to set BO labels through a new ioctl().

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 19 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h | 16 ++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 963f04ba2de6..a7a29974d8b1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright 2019 Linaro, Ltd, Rob Herring <robh@kernel.org> */
 
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
@@ -35,6 +36,9 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 	 */
 	WARN_ON_ONCE(!list_empty(&bo->mappings.list));
 
+	kfree(bo->label.str);
+	mutex_destroy(&bo->label.lock);
+
 	if (bo->sgts) {
 		int i;
 		int n_sgt = bo->base.base.size / SZ_2M;
@@ -260,6 +264,7 @@ struct drm_gem_object *panfrost_gem_create_object(struct drm_device *dev, size_t
 	mutex_init(&obj->mappings.lock);
 	obj->base.base.funcs = &panfrost_gem_funcs;
 	obj->base.map_wc = !pfdev->coherent;
+	mutex_init(&obj->label.lock);
 
 	return &obj->base.base;
 }
@@ -302,3 +307,17 @@ panfrost_gem_prime_import_sg_table(struct drm_device *dev,
 
 	return obj;
 }
+
+void
+panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	const char *old_label;
+
+	scoped_guard(mutex, &bo->label.lock) {
+		old_label = bo->label.str;
+		bo->label.str = label;
+	}
+
+	kfree(old_label);
+}
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7516b7ecf7fe..c0be2934f229 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -41,6 +41,20 @@ struct panfrost_gem_object {
 	 */
 	size_t heap_rss_size;
 
+	/**
+	 * @label: BO tagging fields. The label can be assigned within the
+	 * driver itself or through a specific IOCTL.
+	 */
+	struct {
+		/**
+		 * @label.str: Pointer to NULL-terminated string,
+		 */
+		const char *str;
+
+		/** @lock.str: Protects access to the @label.str field. */
+		struct mutex lock;
+	} label;
+
 	bool noexec		:1;
 	bool is_heap		:1;
 };
@@ -89,4 +103,6 @@ void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
 int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
+void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
+
 #endif /* __PANFROST_GEM_H__ */

base-commit: 9ff4fdf4f44b69237c0afc1d3a8dac916ce66f3e
-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B3FA99EC0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7A110E709;
	Thu, 24 Apr 2025 02:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Q9gXzDlZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E61510E709
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745461315; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=LOAGuQ3z24pLe/roGTdfJWBgqf42GXUqz7VsaThx3NwDRA9IxzjAgcVQhe5p3fFekXTeojlR3ukrYk0kjV+dOlV+DiS3kayWR8xFdH13U4oJCNwP/4BogZLu32oFIAGMV8n64QQO7zKQVjVwj5LnDBmVEH6KqtJAmfre0V9sO0E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745461315;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=g9IobpGuuvB/dgl6xQ8rhNJU5JH9HoZYQPiz/QDc+LA=; 
 b=cdagPpIXGw5qVXOXDTAiCpbpDaYr0knSRqmO5yH4PGKq2Ac26gpImW5C7c2ybjIwIOyC8hwUo6yh8dANFOWTM7JThT438NMfyC1ES1bw6vwRnm31HrjxQB/QzJkyNKREb1badcmKMcPqSsYUY86V68o6hbg/mGq0MYN+UZu9LBU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745461314; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=g9IobpGuuvB/dgl6xQ8rhNJU5JH9HoZYQPiz/QDc+LA=;
 b=Q9gXzDlZhwTttdwjnMzadNb0PTAgPn9IP7SM8Du/4ZXe89g7L9+bj3hQM6TBcLhr
 vAoYheYLIDptm/bZaLkzqC/i0WFz3XZZpEpwmx7qgqFW82RlDZhuXJUNRhbaDa62r2/
 KNemk3nraNjAAOWkd0Xjc7PLlnHhu35HvZV1uh+A=
Received: by mx.zohomail.com with SMTPS id 17454613129331021.9890690851771;
 Wed, 23 Apr 2025 19:21:52 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 1/3] drm/panfrost: Add BO labelling to Panfrost
Date: Thu, 24 Apr 2025 03:21:30 +0100
Message-ID: <20250424022138.709303-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424022138.709303-1-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
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
-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A9F6E4DC8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A2D10E24D;
	Mon, 17 Apr 2023 15:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 536BC10E24D;
 Mon, 17 Apr 2023 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681747000; x=1713283000;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=19F6hSCCQIYmXYRORvRZl/lUhx925hpUlhZPRAIaMVk=;
 b=akBK+o/39On6CXUwUtBIOny13k5g1RH/6Q12KRPglUqeOhis4lmGxix5
 5ll/d2NsTF0j47svN3kbkb+RUUXPo30ftwR5wP84k8MxKYN1YCuTbmnen
 tJ/p+328MAlhBe0PxwzuwVZpDxT3U9ORijoBON9y8EUhJrd/h9SIeCTZ/
 ox65csvOfjcldijOFH85rw7IoELucmtVt7g5Up5gNSd1VstQuB+llxrr1
 S5wWFXbn6rbfyiJbT3QEJ7TKRZitatI8xNWHNSUnobxrLJFrVHtc5vQhW
 FUKBgo27B6+zLt6sw7ltc7LSKWt63WAlycbddduZd0jz8ekCk1xMOvyMY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372804649"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="372804649"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690718313"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="690718313"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.232.210])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:32 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 4/6] drm: Add simple fdinfo memory helpers
Date: Mon, 17 Apr 2023 16:56:11 +0100
Message-Id: <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

For drivers who only wish to show one memory region called 'system,
and only account the GEM buffer object handles under it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_file.h     |  6 +++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e202f79e816d..1e70669dddf7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+static void
+add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
+{
+	u64 sz = obj->size;
+
+	stats[0].size += sz;
+
+	if (obj->handle_count > 1)
+		stats[0].shared += sz;
+
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
+		stats[0].active += sz;
+
+	/* Not supported. */
+	stats[0].resident = ~0ull;
+	stats[0].purgeable = ~0ull;
+}
+
+char **
+drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int *num)
+{
+	static char *region[] = {
+		"system",
+	};
+
+	*num = 1;
+
+	return region;
+}
+EXPORT_SYMBOL(drm_query_fdinfo_system_region);
+
+void
+drm_query_fdinfo_system_memory(struct drm_file *file,
+			       struct drm_fdinfo_memory_stat *stats)
+{
+	struct drm_gem_object *obj;
+	int id;
+
+	spin_lock(&file->table_lock);
+	idr_for_each_entry(&file->object_idr, obj, id)
+		add_obj(obj, stats);
+	spin_unlock(&file->table_lock);
+}
+EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
+
 static void
 print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
 {
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 00d48beeac5c..dd7c6fb2c975 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
 	u64 active;
 };
 
+char **drm_query_fdinfo_system_region(struct drm_device *dev,
+				      unsigned int *num);
+void drm_query_fdinfo_system_memory(struct drm_file *file,
+				    struct drm_fdinfo_memory_stat *stats);
+
+
 /**
  * drm_is_primary_client - is this an open file of the primary node
  * @file_priv: DRM file
-- 
2.37.2


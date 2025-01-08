Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BE5A066CD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5128810EC84;
	Wed,  8 Jan 2025 21:03:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="XEbvqacW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF07110E94B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 21:03:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736370211; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mbMYkKrgulUJO/cMu9wZhHnYi9GjRfqnG3EUtH5+qd//koB3GpsmSDylqdSPEgybsm07nTt8aPXCYxfL5u31nx3q4IY5F9RwTRGoxeWGJt7LGpFPUpnoYUhoXOttE7dqxKzb8CPE7r/Kj1Q5xH6ETds/rrpyStsZbXXkrPWlMRE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736370211;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IeOb8w72JN8I9izYPyP3tyjwcOsCNYfWtXN1cZKj9x4=; 
 b=fDUfzlcq1k+Dgz2G6dAGdzz/dZI2Auwnukxxwlfbqdn7kYj0uihxwAEAp6w8xzImsvF04okkZ4j57NH/jT8kaFIlTVuIz01A2DnhKABph6jxiXaSfQmbrJ+a28Tu5YVeD7vv6VrIEVWUI984PamFrzZVkTG69bdLBibbme9E9wk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736370211; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IeOb8w72JN8I9izYPyP3tyjwcOsCNYfWtXN1cZKj9x4=;
 b=XEbvqacWWUaJEH4XEL7rMq4HwVL3wdTyI+bPg0PNOhLXuUQF2VKfWIV0lc3/ssUj
 cHw+i8gqpYnlpbiSCUELleYyRPXuQWlxz1YWWtq8aS9VYaSbZpAJWA2yO1R3nogfvo1
 LfapPp6/c+ndrs3DaUx6zMbKOvUUkSwwxvpJi7ro=
Received: by mx.zohomail.com with SMTPS id 1736370209212598.6316543311995;
 Wed, 8 Jan 2025 13:03:29 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/4] drm/file: Add driver-specific memory region key
 printing helper
Date: Wed,  8 Jan 2025 21:02:39 +0000
Message-ID: <20250108210259.647030-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108210259.647030-1-adrian.larumbe@collabora.com>
References: <20250108210259.647030-1-adrian.larumbe@collabora.com>
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

This is motivated by the desire of some dirvers (eg. Panthor) to print the
size of internal memory regions with a prefix that reflects the driver
name, as suggested in the previous documentation commit.

That means a minor refactoring of print_size() was needed so as to make it
more generic in the format of key strings it takes as input.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
---
 drivers/gpu/drm/drm_file.c | 60 +++++++++++++++++++++++++++++++++-----
 include/drm/drm_file.h     |  2 ++
 2 files changed, 54 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index cb5f22f5bbb6..5deae4cffa79 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -830,8 +830,7 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
-static void print_size(struct drm_printer *p, const char *stat,
-		       const char *region, u64 sz)
+static void print_size(struct drm_printer *p, const char *key, u64 sz)
 {
 	const char *units[] = {"", " KiB", " MiB"};
 	unsigned u;
@@ -842,9 +841,54 @@ static void print_size(struct drm_printer *p, const char *stat,
 		sz = div_u64(sz, SZ_1K);
 	}
 
-	drm_printf(p, "drm-%s-%s:\t%llu%s\n", stat, region, sz, units[u]);
+	drm_printf(p, "%s:\t%llu%s\n", key, sz, units[u]);
 }
 
+#define KEY_LEN 1024
+#define DRM_PREFIX "drm"
+
+static void
+print_size_region(struct drm_printer *p, const char *stat,
+		  const char *region, u64 sz)
+{
+	char key[KEY_LEN+1] = {0};
+
+	if (strnlen(stat, KEY_LEN) + strnlen(region, KEY_LEN) +
+	    strlen(DRM_PREFIX) + 2 > KEY_LEN)
+		return;
+
+	snprintf(key, sizeof(key), "%s-%s-%s", DRM_PREFIX, stat, region);
+	print_size(p, key, sz);
+}
+
+/**
+ * drm_driver_print_size - A helper to print driver-specific k:v pairs
+ * @p: The printer to print output to
+ * @file: DRM file private data
+ * @subkey: Name of the key minus the driver name
+ * @sz: Size value expressed in bytes
+ *
+ * Helper to display key:value pairs where the value is a numerical
+ * size expressed in bytes. It's useful for driver-internal memory
+ * whose objects aren't exposed to UM through a DRM handle.
+ */
+void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
+			   const char *subkey, u64 sz)
+{
+	char key[KEY_LEN+1] = {0};
+	char *drv_name = file->minor->dev->driver->name;
+
+	if (strnlen(subkey, KEY_LEN) + strlen(drv_name) + 1 > KEY_LEN)
+		return;
+
+	snprintf(key, sizeof(key), "%s-%s", drv_name, subkey);
+	print_size(p, key, sz);
+}
+EXPORT_SYMBOL(drm_driver_print_size);
+
+#undef DRM_PREFIX
+#undef KEY_LEN
+
 /**
  * drm_print_memory_stats - A helper to print memory stats
  * @p: The printer to print output to
@@ -858,15 +902,15 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    enum drm_gem_object_status supported_status,
 			    const char *region)
 {
-	print_size(p, "total", region, stats->private + stats->shared);
-	print_size(p, "shared", region, stats->shared);
-	print_size(p, "active", region, stats->active);
+	print_size_region(p, "total", region, stats->private + stats->shared);
+	print_size_region(p, "shared", region, stats->shared);
+	print_size_region(p, "active", region, stats->active);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
-		print_size(p, "resident", region, stats->resident);
+		print_size_region(p, "resident", region, stats->resident);
 
 	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
-		print_size(p, "purgeable", region, stats->purgeable);
+		print_size_region(p, "purgeable", region, stats->purgeable);
 }
 EXPORT_SYMBOL(drm_print_memory_stats);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index f0ef32e9fa5e..07da14859289 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -494,6 +494,8 @@ struct drm_memory_stats {
 
 enum drm_gem_object_status;
 
+void drm_driver_print_size(struct drm_printer *p, struct drm_file *file,
+			   const char *subkey, u64 sz);
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
-- 
2.47.1


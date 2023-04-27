Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2A26F0B90
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:54:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3B010E03D;
	Thu, 27 Apr 2023 17:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2043E10E32B;
 Thu, 27 Apr 2023 17:54:06 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b78b344d5so6923703b3a.1; 
 Thu, 27 Apr 2023 10:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682618045; x=1685210045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p73C15js764dzQJEgbWBx+7QNMsWovIoyzGPpjczgNY=;
 b=kCxBda4dX0v9+KBOw3q745gxPj6sZv6R2ayxpdDPKEgoo5SEdRuB63GjusADcmhym3
 dwk+FD/2zxoUdKFhPkBpIioo3kSpRwziJ8SHPBqIkUsAp/Aww4Km6iE/ZF+/qKjwEIcP
 BZopZG6XHUscKCfj2SOJU9rO73+xOjUa4shfwY6YA36QbWcERYDtEkxMvnTm4QQ0RX+y
 9z8HZFFAewmbZFIFYwKq/VpgRdjxEMdN4xNBZ64SNcxr42LqMzR2uzrhw6R3hk9tqXu8
 b2ym0VtpRaZVr8+BhPc72xSXoGQCq0NUfMo+A9mfF0wUD8z3XpW1OQg5HcbJTgvnSuuk
 hBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682618045; x=1685210045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p73C15js764dzQJEgbWBx+7QNMsWovIoyzGPpjczgNY=;
 b=B1fWmht1jj+fCCz8lQy3RC3FdY4V35XckzouJN9PBM3Ke0fOjpfLp4nWgcAK/F9Wxp
 v2oODT4tIJ0kxybq7MzoYCT2XaVAQi0aD+Al8ZIAZmJ7Qk2voAGJQMov9Svw9eLg8sIm
 oB2tmlGEZSrYP9wawujeAq3mSlmiz9RecrjhcMm0TxIXURCeheDTM22bWAY2oBnSp63h
 bD//t+9rFuIFk3Vx7Y/cGfOt9tku3kpT+hmvFRmK4Sme+Z+ZyeJme4+AO2oaZNMBd6Qp
 Ha+6hF3z/r+szH0XcmoO7NiLVic/Grq2pY7J/e1HbRoBY/YN4NUD21Frr8GG3Zrh0PLW
 qf6g==
X-Gm-Message-State: AC+VfDzF/Bf6vFpFXWORhumHHYzh5I2yWWn95xDm7mqUpK7x28e77OsO
 uJYg24YC7ZSVoUOrGq9IgtkpNSIFKik=
X-Google-Smtp-Source: ACHHUZ53SdbC+GkAvFXw8H5V9YJK9MOfeVPqmP/O5m4zpTSne+FvC+0QNJsFZFXd++qOvmCi+EqtEw==
X-Received: by 2002:a05:6a00:b52:b0:634:4dea:81c6 with SMTP id
 p18-20020a056a000b5200b006344dea81c6mr4015210pfo.0.1682618045198; 
 Thu, 27 Apr 2023 10:54:05 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 o76-20020a62cd4f000000b0063d6666ee4csm13514749pfg.34.2023.04.27.10.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 10:54:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/9] drm: Add fdinfo memory stats
Date: Thu, 27 Apr 2023 10:53:29 -0700
Message-Id: <20230427175340.1280952-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427175340.1280952-1-robdclark@gmail.com>
References: <20230427175340.1280952-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add support to dump GEM stats to fdinfo.

v2: Fix typos, change size units to match docs, use div_u64
v3: Do it in core
v4: more kerneldoc

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-usage-stats.rst | 54 +++++++++++----
 drivers/gpu/drm/drm_file.c            | 99 ++++++++++++++++++++++++++-
 include/drm/drm_file.h                | 19 +++++
 include/drm/drm_gem.h                 | 30 ++++++++
 4 files changed, 189 insertions(+), 13 deletions(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 552195fb1ea3..bfc14150452c 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -52,6 +52,9 @@ String shall contain the name this driver registered as via the respective
 Optional fully standardised keys
 --------------------------------
 
+Identification
+^^^^^^^^^^^^^^
+
 - drm-pdev: <aaaa:bb.cc.d>
 
 For PCI devices this should contain the PCI slot address of the device in
@@ -69,6 +72,9 @@ scope of each device, in which case `drm-pdev` shall be present as well.
 Userspace should make sure to not double account any usage statistics by using
 the above described criteria in order to associate data to individual clients.
 
+Utilization
+^^^^^^^^^^^
+
 - drm-engine-<str>: <uint> ns
 
 GPUs usually contain multiple execution engines. Each shall be given a stable
@@ -93,18 +99,6 @@ exported engine corresponds to a group of identical hardware engines.
 In the absence of this tag parser shall assume capacity of one. Zero capacity
 is not allowed.
 
-- drm-memory-<str>: <uint> [KiB|MiB]
-
-Each possible memory type which can be used to store buffer objects by the
-GPU in question shall be given a stable and unique name to be returned as the
-string here.
-
-Value shall reflect the amount of storage currently consumed by the buffer
-object belong to this client, in the respective memory region.
-
-Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
-indicating kibi- or mebi-bytes.
-
 - drm-cycles-<str>: <uint>
 
 Engine identifier string must be the same as the one specified in the
@@ -126,6 +120,42 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
 time active without considering what frequency the engine is operating as a
 percentage of it's maximum frequency.
 
+Memory
+^^^^^^
+
+- drm-memory-<region>: <uint> [KiB|MiB]
+
+Each possible memory type which can be used to store buffer objects by the
+GPU in question shall be given a stable and unique name to be returned as the
+string here.  The name "memory" is reserved to refer to normal system memory.
+
+Value shall reflect the amount of storage currently consumed by the buffer
+object belong to this client, in the respective memory region.
+
+Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
+indicating kibi- or mebi-bytes.
+
+- drm-shared-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are shared with another file (ie. have more
+than a single handle).
+
+- drm-private-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are not shared with another file.
+
+- drm-resident-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are resident in system memory.
+
+- drm-purgeable-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are purgeable.
+
+- drm-active-<region>: <uint> [KiB|MiB]
+
+The total size of buffers that are active on one or more rings.
+
 Implementation Details
 ======================
 
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 6d5bdd684ae2..9321eb0bf020 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -42,6 +42,7 @@
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -871,9 +872,105 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+static void print_size(struct drm_printer *p, const char *stat,
+		       const char *region, size_t sz)
+{
+	const char *units[] = {"", " KiB", " MiB"};
+	unsigned u;
+
+	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
+		if (sz < SZ_1K)
+			break;
+		sz = div_u64(sz, SZ_1K);
+	}
+
+	drm_printf(p, "drm-%s-%s:\t%zu%s\n", stat, region, sz, units[u]);
+}
+
+/**
+ * drm_print_memory_stats - A helper to print memory stats
+ * @p: The printer to print output to
+ * @stats: The collected memory stats
+ * @supported_status: Bitmask of optional stats which are available
+ * @region: The memory region
+ *
+ */
+void drm_print_memory_stats(struct drm_printer *p,
+			    const struct drm_memory_stats *stats,
+			    enum drm_gem_object_status supported_status,
+			    const char *region)
+{
+	print_size(p, "total", region, stats->private + stats->shared);
+	print_size(p, "shared", region, stats->shared);
+	print_size(p, "active", region, stats->active);
+
+	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
+		print_size(p, "resident", region, stats->resident);
+
+	if (supported_status & DRM_GEM_OBJECT_PURGEABLE)
+		print_size(p, "purgeable", region, stats->purgeable);
+}
+EXPORT_SYMBOL(drm_print_memory_stats);
+
+/**
+ * drm_show_memory_stats - Helper to collect and show standard fdinfo memory stats
+ * @p: the printer to print output to
+ * @file: the DRM file
+ *
+ * Helper to iterate over GEM objects with a handle allocated in the specified
+ * file.
+ */
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_gem_object *obj;
+	struct drm_memory_stats status = {};
+	enum drm_gem_object_status supported_status;
+	int id;
+
+	spin_lock(&file->table_lock);
+	idr_for_each_entry (&file->object_idr, obj, id) {
+		enum drm_gem_object_status s = 0;
+
+		if (obj->funcs && obj->funcs->status) {
+			s = obj->funcs->status(obj);
+			supported_status = DRM_GEM_OBJECT_RESIDENT |
+					DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (obj->handle_count > 1) {
+			status.shared += obj->size;
+		} else {
+			status.private += obj->size;
+		}
+
+		if (s & DRM_GEM_OBJECT_RESIDENT) {
+			status.resident += obj->size;
+		} else {
+			/* If already purged or not yet backed by pages, don't
+			 * count it as purgeable:
+			 */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
+			status.active += obj->size;
+
+			/* If still active, don't count as purgeable: */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (s & DRM_GEM_OBJECT_PURGEABLE)
+			status.purgeable += obj->size;
+	}
+	spin_unlock(&file->table_lock);
+
+	drm_print_memory_stats(p, &status, supported_status, "memory");
+}
+EXPORT_SYMBOL(drm_show_memory_stats);
+
 /**
  * drm_show_fdinfo - helper for drm file fops
- * @seq_file: output stream
+ * @m: output stream
  * @f: the device file instance
  *
  * Helper to implement fdinfo, for userspace to query usage stats, etc, of a
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6de6d0e9c634..1339e925af52 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -41,6 +41,7 @@
 struct dma_fence;
 struct drm_file;
 struct drm_device;
+struct drm_printer;
 struct device;
 struct file;
 
@@ -440,6 +441,24 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e);
 void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
+
+
+struct drm_memory_stats {
+	size_t shared;
+	size_t private;
+	size_t resident;
+	size_t purgeable;
+	size_t active;
+};
+
+enum drm_gem_object_status;
+
+void drm_print_memory_stats(struct drm_printer *p,
+			    const struct drm_memory_stats *stats,
+			    enum drm_gem_object_status supported_status,
+			    const char *region);
+
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 189fd618ca65..9ebd2820ad1f 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -42,6 +42,25 @@
 struct iosys_map;
 struct drm_gem_object;
 
+/**
+ * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
+ * @DRM_GEM_OBJECT_RESIDENT: object is resident in memory (ie. not unpinned)
+ * @DRM_GEM_OBJECT_PURGEABLE: object marked as purgeable by userspace
+ *
+ * Bitmask of status used for fdinfo memory stats, see &drm_gem_object_funcs.status
+ * and drm_show_fdinfo().  Note that an object can DRM_GEM_OBJECT_PURGEABLE if
+ * it still active or not resident, in which case drm_show_fdinfo() will not
+ * account for it as purgeable.  So drivers do not need to check if the buffer
+ * is idle and resident to return this bit.  (Ie. userspace can mark a buffer
+ * as purgeable even while it is still busy on the GPU.. it does not _actually_
+ * become puregeable until it becomes idle.  The status gem object func does
+ * not need to consider this.)
+ */
+enum drm_gem_object_status {
+	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
+	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+};
+
 /**
  * struct drm_gem_object_funcs - GEM object functions
  */
@@ -174,6 +193,17 @@ struct drm_gem_object_funcs {
 	 */
 	int (*evict)(struct drm_gem_object *obj);
 
+	/**
+	 * @status:
+	 *
+	 * The optional status callback can return additional object state
+	 * which determines which stats the object is counted against.  The
+	 * callback is called under table_lock.  Racing against object status
+	 * change is "harmless", and the callback can expect to not race
+	 * against object destruction.
+	 */
+	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
+
 	/**
 	 * @vm_ops:
 	 *
-- 
2.39.2


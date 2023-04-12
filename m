Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 525CC6E0213
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 00:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D4D10E9EB;
	Wed, 12 Apr 2023 22:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F07C10E9E7;
 Wed, 12 Apr 2023 22:43:38 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-514156b4976so1063443a12.3; 
 Wed, 12 Apr 2023 15:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681339417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geumVPtdfdeonNbJRvQRqI8DZnvMBPVyWVWG9NtZCuE=;
 b=ATps2cQzsHjp2Awpl3uuwTjgh7vygigJUTrlBrNgwlzPytl1gYSdhpkH8e0PjnFWFU
 kAODEM4CPn0vunvQGMwPw7W57CANlRTN1eMEB4bs+TZCtsxhR3IPkrXpyzbPCWSW8tRl
 BdzHrm1X3RWXwDmNOOYE9+H/tAHvcxxdxVHEC8r0m5E/4zTcwnonBVaM4WMB9ry8c7Lv
 6ENttFGk7zdFWXvyOm3iV4/XAKOvg8e+4NV3H6CViKepyJmEcq8Jghxkx56OoH+Qpiyr
 ZJhYOTLji+bvvBtrK+mNGoDMQiCoPlOdkOzceBZ6+s8tpxQBezB4/x93lIJCmhfpilrz
 lRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681339417;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=geumVPtdfdeonNbJRvQRqI8DZnvMBPVyWVWG9NtZCuE=;
 b=PM4ZloFXHKmeOQYkrKdKky0vUb/Z6QA4bRLyQnSlNOBArwByafJfnWd3o/I1mrsfCi
 e4fWlQoaCFMTvB3uY5HjJa+cU3mVrADS2iinv3oxEDi74t6aMNC5UvxG/9GLwQJrEwI5
 Cd537dZbvWIEngKjgMSfh1ZgCcTvfGmsFHtnv0PxPcYBgLNY4l3OVHC0xdQzqp11BCP8
 sHlDSzKlNsYwmgIX+1rI3KzyjO5qoTAF3j+kdy7kn+C03hZoorFfFEiK70bKYF21lNBU
 01kG4HsaOUsyJRXqYUBcy2a5zcjwEj+gkG0v7MRlXGBrwF0pDF1/w/SOKZ+nKLoTJKgm
 3Wbw==
X-Gm-Message-State: AAQBX9esXwi8/R7HwdH9ya/SszYXzZrVOw0xClMRwCFGxJTPDJEUOqwE
 olXEm+WGc9Ym5ueBPjRl+NNFtvQ5xGU=
X-Google-Smtp-Source: AKy350aOV/Fin4M6YfXrVzZWWWswebj4K8aE7I12k8VMTPKtnpPu4nJTC6zaJQYB+P+9v/Ma92/e/A==
X-Received: by 2002:a05:6a00:244c:b0:63a:65a9:10db with SMTP id
 d12-20020a056a00244c00b0063a65a910dbmr634262pfj.7.1681339416832; 
 Wed, 12 Apr 2023 15:43:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 t22-20020aa79396000000b00635d381b57csm7144133pfe.205.2023.04.12.15.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 15:43:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/6] drm: Add fdinfo memory stats
Date: Wed, 12 Apr 2023 15:42:57 -0700
Message-Id: <20230412224311.23511-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412224311.23511-1-robdclark@gmail.com>
References: <20230412224311.23511-1-robdclark@gmail.com>
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
 linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, freedreno@lists.freedesktop.org,
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
 Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
 drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
 include/drm/drm_file.h                |  1 +
 include/drm/drm_gem.h                 | 30 +++++++++++
 4 files changed, 128 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 2ab32c40e93c..80003e27e28e 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
 Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
 indicating kibi- or mebi-bytes.
 
+- drm-shared-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are shared with another file (ie. have more
+than a single handle).
+
+- drm-private-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are not shared with another file.
+
+- drm-resident-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are resident in system memory.
+
+- drm-purgeable-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are purgeable.
+
+- drm-active-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are active on one or more rings.
+
 - drm-cycles-<str> <uint>
 
 Engine identifier string must be the same as the one specified in the
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 6d5bdd684ae2..04a7ed7eba8e 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -42,6 +42,7 @@
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+static void print_size(struct drm_printer *p, const char *stat, size_t sz)
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
+	drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
+}
+
+static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
+{
+	struct drm_gem_object *obj;
+	struct {
+		size_t shared;
+		size_t private;
+		size_t resident;
+		size_t purgeable;
+		size_t active;
+	} size = {0};
+	bool has_status = false;
+	int id;
+
+	spin_lock(&file->table_lock);
+	idr_for_each_entry (&file->object_idr, obj, id) {
+		enum drm_gem_object_status s = 0;
+
+		if (obj->funcs && obj->funcs->status) {
+			s = obj->funcs->status(obj);
+			has_status = true;
+		}
+
+		if (obj->handle_count > 1) {
+			size.shared += obj->size;
+		} else {
+			size.private += obj->size;
+		}
+
+		if (s & DRM_GEM_OBJECT_RESIDENT) {
+			size.resident += obj->size;
+		} else {
+			/* If already purged or not yet backed by pages, don't
+			 * count it as purgeable:
+			 */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
+			size.active += obj->size;
+
+			/* If still active, don't count as purgeable: */
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (s & DRM_GEM_OBJECT_PURGEABLE)
+			size.purgeable += obj->size;
+	}
+	spin_unlock(&file->table_lock);
+
+	print_size(p, "drm-shared-memory", size.shared);
+	print_size(p, "drm-private-memory", size.private);
+	print_size(p, "drm-active-memory", size.active);
+
+	if (has_status) {
+		print_size(p, "drm-resident-memory", size.resident);
+		print_size(p, "drm-purgeable-memory", size.purgeable);
+	}
+}
+
 /**
  * drm_show_fdinfo - helper for drm file fops
  * @seq_file: output stream
@@ -900,6 +974,8 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
+
+	print_memory_stats(&p, file);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6de6d0e9c634..919284bb4f1d 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -41,6 +41,7 @@
 struct dma_fence;
 struct drm_file;
 struct drm_device;
+struct drm_printer;
 struct device;
 struct file;
 
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


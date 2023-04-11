Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216456DE7B4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A1B10E6C0;
	Tue, 11 Apr 2023 22:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2C10E00C;
 Tue, 11 Apr 2023 22:58:00 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h24so9547094plr.1;
 Tue, 11 Apr 2023 15:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681253880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x+Y9rFqb6JFNxJRIVkTus3EfCZpjMTDt8LZNCNaQpSk=;
 b=Gnjl7xlKzgOD/FJhGOxJSatQoxNL92VZh1T010f+KMpLHbiNZMjI7OWmHq276109UH
 4K8CKrZ4DPT8+9EnkvzjFKLuqWTJR53DQkzE3hdWTh1SlyJmD7d38SELk6BIrnX1brXA
 T9czLy89UglFKjNxrn0eVWxN1wjrlCFqELBa0XskKNZzlgC+ogr2fv0eq4XVr12hhuUi
 B9HQrOatX0K1+5FJRTnv3bQbV/yZfGXLpzAUGKOv60Aye+TC0bNkXJiC7H3U6A/2bS0q
 XQ4IL8tKObllfWhuXE5QlVCU0yd0nMtqs5ZpgdS4dtO6yKpHQvx90a/rzYX85bTvam7Q
 QJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681253880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x+Y9rFqb6JFNxJRIVkTus3EfCZpjMTDt8LZNCNaQpSk=;
 b=vfRyg48/g/ekCpCv9RcumTl+wJqmJdZiYUA/NDpWYylVBbbeY8Wezmra56KOfo9LSp
 2OdAEk+fhe1RmoZfeuwSSVBzsPQH2smml1hvoLCYIpO+h8ZIVOxUvPW4UVmiRGEtKKhI
 b0a9MAM9qFVGXb1wccevu1QXnIO8Soj6ftyyTgYCmznmuIiR4/zbwudyMCcN1Z6mU0XF
 wv/HjJeQJxvuI61LLeY2O2fqXp/6lhEltXoVikuvyg6E3o9v25PuKd+5aFju4elYqpaG
 ps6rP1+kTE/psH5mYnow2T5Q2pSDtn/zhBTAg0MgbeKOC+k/csi42tRMkyujBg+WiIHo
 Tjag==
X-Gm-Message-State: AAQBX9eB+uxca6IMoxhr8+THEpfKADqX3k1sx14J5ISUSrC4lajn5woP
 uQnW0fnIGa6JWcr95Np7BPJakG0exn0=
X-Google-Smtp-Source: AKy350ZV8ggQN6BVMgCuSSsJXeTi9lsYz/FHoIFgXYmD7SwhxOmNXUaQ+6yjVlQd6SYy9rt71Gz2yQ==
X-Received: by 2002:a17:902:e38b:b0:1a6:4689:fc79 with SMTP id
 g11-20020a170902e38b00b001a64689fc79mr5681467ple.20.1681253879710; 
 Tue, 11 Apr 2023 15:57:59 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a170902d34200b001a1abc93eabsm10220811plk.226.2023.04.11.15.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 15:57:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm: Add fdinfo memory stats
Date: Tue, 11 Apr 2023 15:56:11 -0700
Message-Id: <20230411225725.2032862-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411225725.2032862-1-robdclark@gmail.com>
References: <20230411225725.2032862-1-robdclark@gmail.com>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add support to dump GEM stats to fdinfo.

v2: Fix typos, change size units to match docs, use div_u64
v3: Do it in core

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
 drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
 include/drm/drm_file.h                |  1 +
 include/drm/drm_gem.h                 | 19 +++++++
 4 files changed, 117 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b46327356e80..b5e7802532ed 100644
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
index 37dfaa6be560..46fdd843bb3a 100644
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
  * drm_fop_show_fdinfo - helper for drm file fops
  * @seq_file: output stream
@@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
 
 	if (dev->driver->show_fdinfo)
 		dev->driver->show_fdinfo(&p, file);
+
+	print_memory_stats(&p, file);
 }
 EXPORT_SYMBOL(drm_fop_show_fdinfo);
 
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index dfa995b787e1..e5b40084538f 100644
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
index 189fd618ca65..213917bb6b11 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -42,6 +42,14 @@
 struct iosys_map;
 struct drm_gem_object;
 
+/**
+ * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
+ */
+enum drm_gem_object_status {
+	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
+	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+};
+
 /**
  * struct drm_gem_object_funcs - GEM object functions
  */
@@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
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


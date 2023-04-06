Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 284A96DA51D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 23:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562BB10ED36;
	Thu,  6 Apr 2023 21:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EC910E26F;
 Thu,  6 Apr 2023 21:59:34 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 lr16-20020a17090b4b9000b0023f187954acso41948793pjb.2; 
 Thu, 06 Apr 2023 14:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680818374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c6L5ENPI75XNzxj2+ZIEkRc54Pl4hiK3xelpisJ84I0=;
 b=AnAkUdnHDzYKT97ng+g2R/yROgrNHBiakRRrw+nsrbwnxApR/yjxOJdHyK168NDqRI
 3n8MQXqz+MHMZFXNLoFoAqwPcdY4Ha1DZLzLKP9WPLW2W6m3QqfYrvcDJfec/x2BNYOF
 nhTvTBfHwdPiM4zr9MXWPyn3DKhjQglGC22qJM2mx+1y2bj6gYP8tOYzPPSkkdUA3puM
 cAIGHzgz+SJpzEIJF2sG/wzLcgxhjUwwh315IIxqMWCHoP4tEabxOZd08q+Yujp23ww6
 Cb4HlAEpaVmQxmOvnUvKvlqgzs+1zrtM7nB1fLyttJXocpQB522eg0ixh0mYVycxcDhc
 KuZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680818374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c6L5ENPI75XNzxj2+ZIEkRc54Pl4hiK3xelpisJ84I0=;
 b=qDvnZKGtPYHTH/vihGMpuzI8eitciIBxYf220GYE2ArE0vG60dOSjtijwQZwVqCfr/
 Tz6aKPmzOvfOWgnYpw6XmlZ8+zYi2fhow4exgC1PupLcsj5XWdma/Lkn5w0Xn4o5XJdl
 sgj2fmo2vRlqTTE7HQTLl2vpWirh6meLWqVmVu4ZpsdYDDHvRZYbWpWrBbLrHWQ1d/Db
 rERaX4FLp5/fzzgDwwArFNMHIsgrpX8M6RrGQAUIp8Gni1rdGvJf+E03j91NGFVZAGnt
 V75ufXEL0jjMWwzmECIDKIz/RRB/gui0hveDXhQMZrqphlVpM46ncGDLamvsUPfC0C/h
 sBwQ==
X-Gm-Message-State: AAQBX9ctwJLtQ4ZsZqudHSVPDWu8VN37abmAFNSywddr5EMpuCqV28MO
 UIss8AyAF04etPR3yKVMkKTSVu6tTMc=
X-Google-Smtp-Source: AKy350a3Dxbhpp10Xwx9B8AMZVnumZvl4Zrhg3p3wx5sI9TNreng7qrPlNBDenob6BEbClj6yW/BGA==
X-Received: by 2002:a17:902:f986:b0:1a0:549d:3996 with SMTP id
 ky6-20020a170902f98600b001a0549d3996mr5050194plb.25.1680818373990; 
 Thu, 06 Apr 2023 14:59:33 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 v6-20020a1709029a0600b0019a6cce2060sm1813770plp.57.2023.04.06.14.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 14:59:33 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 1/2] drm: Add fdinfo memory stats
Date: Thu,  6 Apr 2023 14:59:16 -0700
Message-Id: <20230406215917.1475704-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406215917.1475704-1-robdclark@gmail.com>
References: <20230406215917.1475704-1-robdclark@gmail.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Christopher Healy <healych@amazon.com>,
 open list <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add a helper to dump memory stats to fdinfo.  For the things the drm
core isn't aware of, use a callback.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 Documentation/gpu/drm-usage-stats.rst | 21 +++++++
 drivers/gpu/drm/drm_file.c            | 79 +++++++++++++++++++++++++++
 include/drm/drm_file.h                | 10 ++++
 3 files changed, 110 insertions(+)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index b46327356e80..56e3c95b6e0a 100644
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
+The total size of buffers that are purgable.
+
+- drm-active-memory: <uint> [KiB|MiB]
+
+The total size of buffers that are active on one or more rings.
+
 - drm-cycles-<str> <uint>
 
 Engine identifier string must be the same as the one specified in the
diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index a51ff8cee049..21911d6ff38d 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -42,6 +42,7 @@
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_crtc_internal.h"
@@ -868,6 +869,84 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
 }
 EXPORT_SYMBOL(drm_send_event);
 
+static void print_size(struct drm_printer *p, const char *stat, size_t sz)
+{
+	const char *units[] = {"B", "KiB", "MiB", "GiB"};
+	unsigned u;
+
+	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
+		if (sz < SZ_1K)
+			break;
+		sz /= SZ_1K;
+	}
+
+	drm_printf(p, "%s:\t%lu %s\n", stat, sz, units[u]);
+}
+
+/**
+ * drm_print_memory_stats - Helper to print standard fdinfo memory stats
+ * @file: the DRM file
+ * @p: the printer to print output to
+ * @status: callback to get driver tracked object status
+ *
+ * Helper to iterate over GEM objects with a handle allocated in the specified
+ * file.  The optional status callback can return additional object state which
+ * determines which stats the object is counted against.  The callback is called
+ * under table_lock.  Racing against object status change is "harmless", and the
+ * callback can expect to not race against object destroy.
+ */
+void drm_print_memory_stats(struct drm_file *file, struct drm_printer *p,
+			    enum drm_gem_object_status (*status)(struct drm_gem_object *))
+{
+	struct drm_gem_object *obj;
+	struct {
+		size_t shared;
+		size_t private;
+		size_t resident;
+		size_t purgeable;
+		size_t active;
+	} size = {0};
+	int id;
+
+	spin_lock(&file->table_lock);
+	idr_for_each_entry (&file->object_idr, obj, id) {
+		enum drm_gem_object_status s = 0;
+
+		if (status)
+			s = status(obj);
+
+		if (obj->handle_count > 1) {
+			size.shared += obj->size;
+		} else {
+			size.private += obj->size;
+		}
+
+		if (s & DRM_GEM_OBJECT_RESIDENT) {
+			size.resident += obj->size;
+			s &= ~DRM_GEM_OBJECT_PURGEABLE;
+		}
+
+		if (s & DRM_GEM_OBJECT_ACTIVE) {
+			size.active += obj->size;
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
+
+	if (status) {
+		print_size(p, "drm-resident-memory", size.resident);
+		print_size(p, "drm-purgeable-memory", size.purgeable);
+		print_size(p, "drm-active-memory", size.active);
+	}
+}
+EXPORT_SYMBOL(drm_print_memory_stats);
+
 /**
  * mock_drm_getfile - Create a new struct file for the drm device
  * @minor: drm minor to wrap (e.g. #drm_device.primary)
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 0d1f853092ab..7bd8a1374f39 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -41,6 +41,7 @@
 struct dma_fence;
 struct drm_file;
 struct drm_device;
+struct drm_printer;
 struct device;
 struct file;
 
@@ -438,6 +439,15 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
 				     struct drm_pending_event *e,
 				     ktime_t timestamp);
 
+enum drm_gem_object_status {
+	DRM_GEM_OBJECT_RESIDENT  = BIT(0),
+	DRM_GEM_OBJECT_PURGEABLE = BIT(1),
+	DRM_GEM_OBJECT_ACTIVE    = BIT(2),
+};
+
+void drm_print_memory_stats(struct drm_file *file, struct drm_printer *p,
+			    enum drm_gem_object_status (*status)(struct drm_gem_object *));
+
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 
 #endif /* _DRM_FILE_H_ */
-- 
2.39.2


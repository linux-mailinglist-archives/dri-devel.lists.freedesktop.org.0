Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209F4358D5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 05:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE1C6EA32;
	Thu, 21 Oct 2021 03:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C096EA32
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 03:10:33 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id q19so4648938pfl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 20:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iomAEfnd3OwzO0h9BQWpBoAtIo/GmoHhZ2/ejzvPfUE=;
 b=QUESbRhj9yWZP2GZbuJp41+MMItocA8OGFUq1MqFPD1JNinO2aEvqkLAEH+poAK+CS
 Fygq9FmSbFDFK2h6tNHIHVLCa8W1rYABKZ+v4ywYw+G+A6zQWv/2W+S/w5yG0ji91xNi
 Z2LI68LbHK8EmPfMmCntG+06rG7hCP0Jq9Uks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iomAEfnd3OwzO0h9BQWpBoAtIo/GmoHhZ2/ejzvPfUE=;
 b=M1jQaFvfb/Xx+RzrQvPzAg5/jJF+E11MrxeT411IGJs5xywjX/SSVgIO4j5okO+Hfk
 euWZk1bMSsH2mqTQlL1dZ5cRZlsXLjqAjS2Wx4mjLRw9wsJvlyCHGk0BBh+tq/fyo68a
 FWfjhXhZJOiJE6lAMzr/Sa5RZoGaqW0dZI+7xASp/8gxeaEoxAlHu4+1NzbMhArRsYWz
 FFTDSbh/MDGcNmyF952JNOOTmF3CbhjcMjtcd2STEXSCALtIWzFjH4facEAhsRtkEAhU
 hNVmdy0gC2Dc+05ord//GyWq8rr8RPpGZ1F3vUFgO1y7niWAKtzKXw8Ow5hd1r9nl75+
 f3WA==
X-Gm-Message-State: AOAM532Z/Cwm9m+gEiVz10sVhyMK4G4bTLZHVKm5fxTC3unww3viI8Ji
 BHG3kvMXC/68enfWeFCkVyNPQHScuIenIA==
X-Google-Smtp-Source: ABdhPJy6EGR/lJDI6H7N7Ik5w2uYGZnmMeAecJMedmL2As8YLvhYj1exHxKmA8ouweXRpc0vMFUGjg==
X-Received: by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with SMTP id
 b136-20020a621b8e000000b0044c9318f6e1mr2717541pfb.84.1634785832724; 
 Wed, 20 Oct 2021 20:10:32 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:21a4:fcf9:f5bb:f740])
 by smtp.gmail.com with ESMTPSA id z1sm4016255pfh.150.2021.10.20.20.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:10:31 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: kaleshsingh@google.com,
	daniel@ffwll.ch,
	rostedt@goodmis.org
Subject: [RFC PATCH 3/8] drm: add helper functions for gpu_mem_total and
 gpu_mem_instance
Date: Wed, 20 Oct 2021 20:10:22 -0700
Message-Id: <20211021031027.537-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211021031027.537-1-gurchetansingh@chromium.org>
References: <20211021031027.537-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Add helper functions for above tracepoints in the drm_gem.{h,c}
  files

- Given more tracepoints, a drm_trace.* file may be started

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/Kconfig   |  1 +
 drivers/gpu/drm/drm_gem.c | 49 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_gem.h     |  7 ++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index b91f0ce8154c..cef8545df1c9 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -15,6 +15,7 @@ menuconfig DRM
 	select I2C_ALGOBIT
 	select DMA_SHARED_BUFFER
 	select SYNC_FILE
+	select TRACE_GPU_MEM
 # gallium uses SYS_kcmp for os_same_file_description() to de-duplicate
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4dcdec6487bb..24a719b79400 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -49,6 +49,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
+#include <trace/events/gpu_mem.h>
+
 #include "drm_internal.h"
 
 /** @file drm_gem.c
@@ -138,6 +140,53 @@ int drm_gem_object_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_gem_object_init);
 
+/**
+ * drm_gem_trace_gpu_mem_total - emit a total memory trace event
+ * @dev: drm_device to emit trace event for
+ * @delta: size change
+ * @imported: whether the imported or total memory counter should be used
+ *
+ * Emits a `gpu_mem_total` trace event with given parameters.
+ */
+void
+drm_gem_trace_gpu_mem_total(struct drm_device *dev, s64 delta, bool imported)
+{
+	if (imported)
+		atomic64_add(delta, &dev->import_mem_total);
+	else
+		atomic64_add(delta, &dev->mem_total);
+
+	trace_gpu_mem_total(dev->primary->index, 0,
+			    atomic64_read(&dev->mem_total),
+			    atomic64_read(&dev->import_mem_total));
+}
+EXPORT_SYMBOL(drm_gem_trace_gpu_mem_total);
+
+/**
+ * drm_gem_trace_gpu_mem_instance - emit a per instance memory trace event
+ * @dev: drm_device associated with DRM file
+ * @file: drm_file to emit event for
+ * @delta: size change
+ * @imported: whether the imported or total memory counter should be used
+ *
+ * Emits a `gpu_mem_instance` trace event with given parameters.
+ */
+void
+drm_gem_trace_gpu_mem_instance(struct drm_device *dev, struct drm_file *file,
+			       s64 delta, bool imported)
+{
+	if (imported)
+		atomic64_add(delta, &file->import_mem_instance);
+	else
+		atomic64_add(delta, &file->mem_instance);
+
+	trace_gpu_mem_total(dev->primary->index,
+			    file_inode(file->filp)->i_ino,
+			    atomic64_read(&file->mem_instance),
+			    atomic64_read(&file->import_mem_instance));
+}
+EXPORT_SYMBOL(drm_gem_trace_gpu_mem_instance);
+
 /**
  * drm_gem_private_object_init - initialize an allocated private GEM object
  * @dev: drm_device the object should be initialized for
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 35e7f44c2a75..d61937cce222 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -342,6 +342,13 @@ struct drm_gem_object {
 
 void drm_gem_object_release(struct drm_gem_object *obj);
 void drm_gem_object_free(struct kref *kref);
+
+void drm_gem_trace_gpu_mem_total(struct drm_device *dev, s64 delta,
+				 bool imported);
+void drm_gem_trace_gpu_mem_instance(struct drm_device *dev,
+				    struct drm_file *file,
+				    s64 delta, bool imported);
+
 int drm_gem_object_init(struct drm_device *dev,
 			struct drm_gem_object *obj, size_t size);
 void drm_gem_private_object_init(struct drm_device *dev,
-- 
2.25.1


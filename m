Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4638769ACF0
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 14:48:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F058410EFEE;
	Fri, 17 Feb 2023 13:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9749E10EFD5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 13:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676641706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Px4ciz6by/X66jGqheLS55GJ7hc35ETECtAGNQXcKuY=;
 b=OZpFGAGiqdH3cmzpusJwaNbvby4UYKDfhBoud00W4Yx9OoKECXg5rh4dZCK2VN9VcQbaNQ
 ZBXA0esVyClADIbD7pvn+T3rmLukPd1ocoTPZO3BGmbkwm3s326Luf+Wn2Yov8WBs4nrew
 iwjNsEUb2p/bdgU4fWWexNpjx4yfE/I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-PXzckkQRO8OckAYSCbwaxw-1; Fri, 17 Feb 2023 08:48:25 -0500
X-MC-Unique: PXzckkQRO8OckAYSCbwaxw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z17-20020a05640240d100b004acc6cf6322so2012714edb.18
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 05:48:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Px4ciz6by/X66jGqheLS55GJ7hc35ETECtAGNQXcKuY=;
 b=O73fDhUjknL9pQfC8WBl6CLGT9wWs2mXpIxvwLVl+qig1LcBeaCZFWduoZVANwoIfM
 WwUNRzFX9OnJGXDSZhCxuGr7lIh06Ic2MamgWUtcVC4vLFkMmM6yMnOfgaqVO6VPzK6A
 hhUtQLoxpn6udFUzRXOhzjG88LC/Ybusb4b/FwVxwwK8zRH3crLVZJcPm6kDxe6qA7zN
 7YcT/CMBpKg/yHum8/SZ87aq0GRShEo6rhdMoCV3NzuFv9IOHVQZI51VL0rsDsgDBqri
 +XL4LaXDtaDL6/aczLFtysfcBucY+27gFzB86+f2e4HnX6wktkalmGzyQ53aA6smkJ7t
 EZzg==
X-Gm-Message-State: AO0yUKWOt0g/Pk0niBKpYw7xvT1mE3PN99J6nUZAa6OCU1/UgLgg70aV
 TBoB7Iw3FDVbJ0u457YuHifBAbmOImkZtVrCSkUV0ojhjnT9mpu0Ov+GSOVT3AmXz5yLovOWB6f
 /6kdC6CuQObHO2slcovnkeblSnJYQ
X-Received: by 2002:a17:906:2c4c:b0:8b1:16b3:303b with SMTP id
 f12-20020a1709062c4c00b008b116b3303bmr8902645ejh.43.1676641704488; 
 Fri, 17 Feb 2023 05:48:24 -0800 (PST)
X-Google-Smtp-Source: AK7set99KelezAcLfESG3NW3a/8bhkPGfJ35zGwm2UnKEgc6MsbYnErOdjepQYokeUptlLv4OQllEg==
X-Received: by 2002:a17:906:2c4c:b0:8b1:16b3:303b with SMTP id
 f12-20020a1709062c4c00b008b116b3303bmr8902627ejh.43.1676641704235; 
 Fri, 17 Feb 2023 05:48:24 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 cf25-20020a170906b2d900b008b132c5ea47sm2144884ejb.153.2023.02.17.05.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 05:48:23 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Subject: [PATCH drm-next v2 06/16] drm: debugfs: provide infrastructure to
 dump a DRM GPU VA space
Date: Fri, 17 Feb 2023 14:48:10 +0100
Message-Id: <20230217134820.14672-1-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Danilo Krummrich <dakr@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds a function to dump a DRM GPU VA space and a macro for
drivers to register the struct drm_info_list 'gpuvas' entry.

Most likely, most drivers might maintain one DRM GPU VA space per struct
drm_file, but there might also be drivers not having a fixed relation
between DRM GPU VA spaces and a DRM core infrastructure, hence we need the
indirection via the driver iterating it's maintained DRM GPU VA spaces.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_debugfs.c | 56 +++++++++++++++++++++++++++++++++++
 include/drm/drm_debugfs.h     | 25 ++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4f643a490dc3..0a8e3fdd5f6f 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -39,6 +39,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_managed.h>
+#include <drm/drm_gpuva_mgr.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -175,6 +176,61 @@ static const struct file_operations drm_debugfs_fops = {
 	.release = single_release,
 };
 
+/**
+ * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
+ * @m: pointer to the &seq_file to write
+ * @mgr: the &drm_gpuva_manager representing the GPU VA space
+ *
+ * Dumps the GPU VA regions and mappings of a given DRM GPU VA manager.
+ *
+ * For each DRM GPU VA space drivers should call this function from their
+ * &drm_info_list's show callback.
+ *
+ * Returns: 0 on success, -ENODEV if the &mgr is not initialized
+ */
+int drm_debugfs_gpuva_info(struct seq_file *m,
+			   struct drm_gpuva_manager *mgr)
+{
+	DRM_GPUVA_ITER(it, mgr);
+	DRM_GPUVA_REGION_ITER(__it, mgr);
+
+	if (!mgr->name)
+		return -ENODEV;
+
+	seq_printf(m, "DRM GPU VA space (%s)\n", mgr->name);
+	seq_puts  (m, "\n");
+	seq_puts  (m, " VA regions  | start              | range              | end                | sparse\n");
+	seq_puts  (m, "------------------------------------------------------------------------------------\n");
+	seq_printf(m, " VA space    | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
+		   mgr->mm_start, mgr->mm_range, mgr->mm_start + mgr->mm_range);
+	seq_puts  (m, "-----------------------------------------------------------------------------------\n");
+	drm_gpuva_iter_for_each(__it) {
+		struct drm_gpuva_region *reg = __it.reg;
+
+		if (reg == &mgr->kernel_alloc_region) {
+			seq_printf(m, " kernel node | 0x%016llx | 0x%016llx | 0x%016llx |   -\n",
+				   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range);
+			continue;
+		}
+
+		seq_printf(m, "             | 0x%016llx | 0x%016llx | 0x%016llx | %s\n",
+			   reg->va.addr, reg->va.range, reg->va.addr + reg->va.range,
+			   reg->sparse ? "true" : "false");
+	}
+	seq_puts(m, "\n");
+	seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
+	seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
+	drm_gpuva_iter_for_each(it) {
+		struct drm_gpuva *va = it.va;
+
+		seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
+			   va->va.addr, va->va.range, va->va.addr + va->va.range,
+			   (u64)va->gem.obj, va->gem.offset);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_debugfs_gpuva_info);
 
 /**
  * drm_debugfs_create_files - Initialize a given set of debugfs files for DRM
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index 7616f457ce70..cb2c1956a214 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -34,6 +34,22 @@
 
 #include <linux/types.h>
 #include <linux/seq_file.h>
+
+#include <drm/drm_gpuva_mgr.h>
+
+/**
+ * DRM_DEBUGFS_GPUVA_INFO - &drm_info_list entry to dump a GPU VA space
+ * @show: the &drm_info_list's show callback
+ * @data: driver private data
+ *
+ * Drivers should use this macro to define a &drm_info_list entry to provide a
+ * debugfs file for dumping the GPU VA space regions and mappings.
+ *
+ * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info() from
+ * their @show callback.
+ */
+#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_GPUVA, data}
+
 /**
  * struct drm_info_list - debugfs info list entry
  *
@@ -134,6 +150,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
 
 void drm_debugfs_add_files(struct drm_device *dev,
 			   const struct drm_debugfs_info *files, int count);
+
+int drm_debugfs_gpuva_info(struct seq_file *m,
+			   struct drm_gpuva_manager *mgr);
 #else
 static inline void drm_debugfs_create_files(const struct drm_info_list *files,
 					    int count, struct dentry *root,
@@ -155,6 +174,12 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
 					 const struct drm_debugfs_info *files,
 					 int count)
 {}
+
+static inline int drm_debugfs_gpuva_info(struct seq_file *m,
+					 struct drm_gpuva_manager *mgr)
+{
+	return 0;
+}
 #endif
 
 #endif /* _DRM_DEBUGFS_H_ */
-- 
2.39.1


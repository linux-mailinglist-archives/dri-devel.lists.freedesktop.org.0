Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87745A5E61D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 22:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6A710E7C7;
	Wed, 12 Mar 2025 21:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TbPtKMkB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9532310E7C5;
 Wed, 12 Mar 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741813541; x=1773349541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2vstYTYN34rTAES+51p92mTZ+ZSRTP7eGI9xVDX3NF0=;
 b=TbPtKMkBs5GcI7B+sADOkqL8aD4uDtc7OJr/QMRtoLJTf5hyYDYNl2DE
 ElS4TseY4Y2C2J1V2412c5pWMpRC7cRVplrdSGx/DLisQjyhczAmsch2t
 47qUs+EXech7Co3QUD+mRuNWSvkO3eDxtwItNZxj+zABTm+I6ktVNtdil
 pANRxIjKuQKM5u17pBQ7NnwM5ZoTw4pM1aHdwU0/Ggz3tR1obF95d+HLQ
 BqdEoY/1rZdmpAVbUkbu68HHKlu+Ckx5Nr/KnzMAUeNYvC6OLERDjp5xi
 GVVFwlF2gXOD8rdyrVre5IMUVGeIxHqjBdK4VblHSyilzIldCylPlUZxi g==;
X-CSE-ConnectionGUID: igstDVtqSYaqVLtPGhT13Q==
X-CSE-MsgGUID: jFh6FdJuQDeDMINAQ5Sgnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="46562257"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="46562257"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:41 -0700
X-CSE-ConnectionGUID: iW/xOd+rSCeo1QSLhrZD4Q==
X-CSE-MsgGUID: Q2sgeqLoTvOeTTVIOkUhlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; d="scan'208";a="120791224"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO fedora..)
 ([10.245.246.73])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 14:05:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [RFC PATCH 15/19] drm/pagemap/util: Add file descriptors pointing to
 struct drm_pagemap
Date: Wed, 12 Mar 2025 22:04:12 +0100
Message-ID: <20250312210416.3120-16-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
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

Falicitate implementing uapi representing a struct drm_pagemap
as a file descriptor.

A drm_pagemap file descriptor holds, while open, a reference to
the struct drm_pagemap and to the drm_pagemap_helper module.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_pagemap_util.c | 78 ++++++++++++++++++++++++++++++
 include/drm/drm_pagemap_util.h     |  4 ++
 2 files changed, 82 insertions(+)

diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
index ae8f78cde4a7..4bcd7b8927ee 100644
--- a/drivers/gpu/drm/drm_pagemap_util.c
+++ b/drivers/gpu/drm/drm_pagemap_util.c
@@ -3,6 +3,8 @@
  * Copyright © 2025 Intel Corporation
  */
 
+#include <linux/anon_inodes.h>
+#include <linux/file.h>
 #include <linux/slab.h>
 
 #include <drm/drm_pagemap.h>
@@ -123,3 +125,79 @@ int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
 	return 0;
 }
 EXPORT_SYMBOL(drm_pagemap_acquire_owner);
+
+static int drm_pagemap_file_release(struct inode *inode, struct file *file)
+{
+	drm_pagemap_put(file->private_data);
+
+	return 0;
+}
+
+static const struct file_operations drm_pagemap_fops = {
+	.owner = THIS_MODULE,
+	.release = drm_pagemap_file_release,
+};
+
+/**
+ * drm_pagemap_fd() - Obtain an fd that can be used to reference a drm_pagemap.
+ * @dpagemap: The drm_pagemap for which to obtain an fd.
+ *
+ * Obtain an fd that can be used to reference a drm_pagemap using the function
+ * drm_pagemap_from_fd(). The fd has a reference count on the drm_pagemap, and
+ * on this module. When the fd is closed and the underlying struct file is
+ * released, the references are dropped.
+ */
+int drm_pagemap_fd(struct drm_pagemap *dpagemap)
+{
+	struct file *file;
+	int fd;
+
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
+
+	file = anon_inode_getfile("drm_pagemap_file",
+				  &drm_pagemap_fops,
+				  dpagemap, 0);
+	if (IS_ERR(file)) {
+		put_unused_fd(fd);
+		return PTR_ERR(file);
+	}
+
+	drm_pagemap_get(dpagemap);
+	fd_install(fd, file);
+
+	return fd;
+}
+EXPORT_SYMBOL(drm_pagemap_fd);
+
+/**
+ * drm_pagemap_from_fd() - Get a drm_pagemap from a file descriptor
+ * @fd: The file descriptor
+ *
+ * Return a reference-counted pointer to a drm_pagemap from
+ * a file-descriptor, typically obtained from drm_pagemap_fd().
+ * The pagemap pointer should be put using drm_pagemap_put() when
+ * no longer in use.
+ *
+ * Return: A valid drm_pagemap pointer on success. Error pointer on failure.
+ */
+struct drm_pagemap *drm_pagemap_from_fd(unsigned int fd)
+{
+	struct file *file = fget(fd);
+	struct drm_pagemap *dpagemap;
+
+	if (!file)
+		return ERR_PTR(-ENOENT);
+
+	if (file->f_op != &drm_pagemap_fops) {
+		fput(file);
+		return ERR_PTR(-ENOENT);
+	}
+
+	dpagemap = drm_pagemap_get(file->private_data);
+	fput(file);
+
+	return dpagemap;
+}
+EXPORT_SYMBOL(drm_pagemap_from_fd);
diff --git a/include/drm/drm_pagemap_util.h b/include/drm/drm_pagemap_util.h
index 03731c79493f..8f9676a469fb 100644
--- a/include/drm/drm_pagemap_util.h
+++ b/include/drm/drm_pagemap_util.h
@@ -52,4 +52,8 @@ int drm_pagemap_acquire_owner(struct drm_pagemap_peer *peer,
 			      struct drm_pagemap_owner_list *owner_list,
 			      bool (*has_interconnect)(struct drm_pagemap_peer *peer1,
 						       struct drm_pagemap_peer *peer2));
+
+int drm_pagemap_fd(struct drm_pagemap *dpagemap);
+
+struct drm_pagemap *drm_pagemap_from_fd(unsigned int fd);
 #endif
-- 
2.48.1


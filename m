Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F5F88101C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 11:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E39D810F709;
	Wed, 20 Mar 2024 10:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G2l4cxRj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10D410F6E4;
 Wed, 20 Mar 2024 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710931310; x=1742467310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHuDHiqBsr1dwcy3zZUSZAdt++kO8DGsS0IdncKduLg=;
 b=G2l4cxRj6aAPauj9CZrXil7PA2aMnZZFQJc38yvZudTr92lmuNrHec+t
 NexQGnpCp2QCmZ9Iyllm0db3iTO/9q/Z+apXfNAYTi44JT6L0fnki1LvY
 sE4+lSQ529T5KjNn9N9t6DmIOOs300qSIxbG5mr9gJo0Sw4WyCsVvrzpj
 mmjNuk1Gg+3XxZvzXa9gOs3pLZJDZrlRSni7GAvIKFYtQSJ/ozK5dncls
 YclITFsC91sdqtHBFime3J837ENJuEDmOhx5+4u4IVI7VWob4jWu8iyYL
 zJefKgd63yCgYEO6YKo/Q4Oi6ig5K007G2ATrFyH9ATus1SqfElHHDWyJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="9663666"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="9663666"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; d="scan'208";a="18855162"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 03:41:48 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [RFC 1/2] drm: add devm release action
Date: Wed, 20 Mar 2024 16:14:25 +0530
Message-Id: <20240320104426.1592959-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
References: <20240320104426.1592959-1-aravind.iddamsetty@linux.intel.com>
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

In scenarios where drm_dev_put is directly called by driver we want to
release devm_drm_dev_init_release action associated with struct
drm_device.

Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>

Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/drm_drv.c | 6 ++++++
 include/drm/drm_drv.h     | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..b23c5081812b 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
 					devm_drm_dev_init_release, dev);
 }
 
+void __devm_drm_dev_release_action(struct drm_device *dev)
+{
+	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
+}
+EXPORT_SYMBOL(__devm_drm_dev_release_action);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8878260d7529..a1d12cb72088 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -444,6 +444,8 @@ struct drm_driver {
 	const struct file_operations *fops;
 };
 
+void __devm_drm_dev_release_action(struct drm_device *dev);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
@@ -477,6 +479,8 @@ void *__devm_drm_dev_alloc(struct device *parent,
 #define devm_drm_dev_alloc(parent, driver, type, member) \
 	((type *) __devm_drm_dev_alloc(parent, driver, sizeof(type), \
 				       offsetof(type, member)))
+#define devm_drm_release_action(drm_dev) \
+	__devm_drm_dev_release_action(drm_dev)
 
 struct drm_device *drm_dev_alloc(const struct drm_driver *driver,
 				 struct device *parent);
-- 
2.25.1


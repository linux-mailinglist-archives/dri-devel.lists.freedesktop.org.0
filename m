Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32776894E0A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 10:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D37410FB83;
	Tue,  2 Apr 2024 08:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrIhD6bZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBEF10FB80;
 Tue,  2 Apr 2024 08:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712048177; x=1743584177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bh30oUIr485Sm03RHNCLxv+i4jIoW6CLcOZ3ZttdEw=;
 b=nrIhD6bZlce0139pCoe+J8Dg7UmK/mdYupxfUFPyWTfcxGkkUJznKV6J
 lWKiMdQvFDKxoreUTsnyH3mliV6ZtBDQqzH2+OfyjKt1w+e7A9VuhokN5
 x9NbpIfZBYIS5x7yHSnOt8RylvLF2nsikOL/BrLdQMnFI68aIdwy8m62O
 qei2c7kXQVE9TPom/gJYMqCNcpADGLSPD3cSsC3bPsJLPjQmGVEnfy8F2
 oJnvq3tATCVo6C7xMUE9Ah43VLG1uF4PMSk7CumwbNckFwgt1qK+/WqWK
 IurFLOPrVx+mqXKWxge5x+kYj7v/FDfiwuYLBL8cxciVnh/EPyOqzS07R w==;
X-CSE-ConnectionGUID: +A61MZsIRpWVck/VG4DqtQ==
X-CSE-MsgGUID: dlB+CVfORFGK8/oZuPylkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="18654773"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18654773"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="49225971"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 01:56:15 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm: add devm release action
Date: Tue,  2 Apr 2024 14:28:56 +0530
Message-Id: <20240402085859.1591264-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
References: <20240402085859.1591264-1-aravind.iddamsetty@linux.intel.com>
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

v2: Directly expose the original function, instead of introducing a
helper (Rodrigo)

Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/drm_drv.c | 6 ++++++
 include/drm/drm_drv.h     | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..ba60cbb0725f 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -714,6 +714,12 @@ static int devm_drm_dev_init(struct device *parent,
 					devm_drm_dev_init_release, dev);
 }
 
+void devm_drm_dev_release_action(struct drm_device *dev)
+{
+	devm_release_action(dev->dev, devm_drm_dev_init_release, dev);
+}
+EXPORT_SYMBOL(devm_drm_dev_release_action);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset)
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 8878260d7529..fa9123684874 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -444,6 +444,8 @@ struct drm_driver {
 	const struct file_operations *fops;
 };
 
+void devm_drm_dev_release_action(struct drm_device *dev);
+
 void *__devm_drm_dev_alloc(struct device *parent,
 			   const struct drm_driver *driver,
 			   size_t size, size_t offset);
-- 
2.25.1


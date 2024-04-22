Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B3F8AC48A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 08:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9CBF11282F;
	Mon, 22 Apr 2024 06:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv4Guyd3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDACA11281F;
 Mon, 22 Apr 2024 06:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713768925; x=1745304925;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G4PtOt+VWc88G5WZ5DuBu5hKTpaJnZsZ86R51uNgRxQ=;
 b=cv4Guyd3hM+NaP+fHZaZ+djU2gFFFyP228aYYv7YZFkVl5J8S3DuLL4Z
 BGZNb3O3kT8+G1v7rRshrKAkXH0WlDm6icqc6qd2iSKYYcE4Oc7Y9zzqe
 /P9gOSaVPfem1vIKRpIBuqAr15PbaY26WQpHUCd4TF3BsbtOCM9TFn2u+
 5IKl537hwURRE6vvMcofnVWFc4fVpKVcQ7/zwagGSi1uPiSTifZkLSQvm
 HJRMrMYQ2ln+noQAyiR91JSGDzFG7VYw5z9ClfPJlHRBZRDG8CvHYB/fF
 /AlR9IfLXPmqjgOP/pDtg/ge8JsjJfSgr7Q8UAh7bDe6OAvOlXWa3dEs8 Q==;
X-CSE-ConnectionGUID: 4pkt5MiOR8SxAmtOuvHopg==
X-CSE-MsgGUID: +YSVFyn3SlCztHf+b0mbXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="20715508"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="20715508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:24 -0700
X-CSE-ConnectionGUID: AwZe/KWHQ4KNfu0E0QeaAQ==
X-CSE-MsgGUID: qEaiOq3gR2y7aql6Zbpssw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28584500"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 23:55:21 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v3 1/4] drm: add devm release action
Date: Mon, 22 Apr 2024 12:27:53 +0530
Message-Id: <20240422065756.294679-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
References: <20240422065756.294679-1-aravind.iddamsetty@linux.intel.com>
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

v3: add kernel-doc (Maxime Ripard)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/drm_drv.c | 13 +++++++++++++
 include/drm/drm_drv.h     |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 243cacb3575c..9d0409165f1e 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -714,6 +714,19 @@ static int devm_drm_dev_init(struct device *parent,
 					devm_drm_dev_init_release, dev);
 }
 
+/**
+ * devm_drm_dev_release_action - Call the final release action of the device
+ * @dev: DRM device
+ *
+ * In scenarios where drm_dev_put is directly called by driver we want to release
+ * devm_drm_dev_init_release action associated with struct drm_device.
+ */
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


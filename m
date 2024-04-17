Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A9A8A7E72
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 10:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7D1132D9;
	Wed, 17 Apr 2024 08:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxMa/Ju+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99FA1132D5;
 Wed, 17 Apr 2024 08:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713343154; x=1744879154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oKDh0tCdZ35+8S2F0CA1q+1VXVUT7hkULDasdL+Utcs=;
 b=CxMa/Ju++L47ByUGvk77kEzneh+sT6TmHNdkKoGy/nxl2mpfNuUndhGa
 VAm8zoSie2C+ouBRgKkwTBVJua4aZTy6mxEcqvBlbvZWRk96jWSB7Vg90
 hTN5Nr5dH1aaq3HgTaYFtFiqBn5Ka4hLh+1jTN+2vzbwEmJI8+QOp2GLe
 5JF5d9HIrfv4rYDuxj9b2LYUakjIq0T0GYEL82cen4ekNPEuhBklE4DnX
 HEf4BE6Ln5brfvGjGDLK2VRGodBfw+6fkaDlZ72+6F5AeXMmqqK4TjMia
 pDomp1XpoVAB+AJKfJkp+D3F2eNdPAjVzeaEGABrzjcZKsR+S6KCUOsAn Q==;
X-CSE-ConnectionGUID: sruyvyB8Q6C4F0si2kt2xA==
X-CSE-MsgGUID: nj05DOwMRoqrJqWpD5z3ew==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="12660875"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="12660875"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:14 -0700
X-CSE-ConnectionGUID: rDdMfg4JT+GfP4h7JTIS5w==
X-CSE-MsgGUID: w0KMXLC/Tfin1DsgcgLluw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; d="scan'208";a="27338911"
Received: from aravind-dev.iind.intel.com ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 01:39:06 -0700
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, airlied@gmail.com, mripard@kernel.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: [PATCH v2 1/4] drm: add devm release action
Date: Wed, 17 Apr 2024 14:11:42 +0530
Message-Id: <20240417084145.242480-2-aravind.iddamsetty@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
References: <20240417084145.242480-1-aravind.iddamsetty@linux.intel.com>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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


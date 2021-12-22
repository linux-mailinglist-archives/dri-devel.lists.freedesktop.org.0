Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C62E47D456
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 16:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87010E14C;
	Wed, 22 Dec 2021 15:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D58E10E14C;
 Wed, 22 Dec 2021 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640187647; x=1671723647;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pNGGU5exxXmBba17iKeNMkYLms3huHnZB9vDNIxO3O8=;
 b=D4x0S9x1Grrpc45g/X3Lia6iPG5pUgDaAxFvTUAJV0KEvqLFPKdEjrnh
 AFvbS7MsCamUa4/3SiJITpRXxjf4udtArdUdgMZESVB0TDCqiJrn7ffOc
 QcCSc/SiGRlrjPndn4oW0p9UeTvQPforN0y9dxuoYaAetBEE3KXYKFKHk
 +RjR2K6eZOb8962//XDzVa/2hHAOyILHFPY4UASiVBbEaAAzJwCwqac/i
 phliwc1fE895SIlpGSUI3FtJu4crI8AB0FHwZBWBfJ4suZVSAsWUQXlzU
 FrmwOsitRueCoh+Wo0/NjUzlfWr2Gbn83upTEQNAvjO58Vvg4Lh5nP3F3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240598530"
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="240598530"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2021 07:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,226,1635231600"; d="scan'208";a="484793202"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga002.jf.intel.com with ESMTP; 22 Dec 2021 07:40:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 371AEFE; Wed, 22 Dec 2021 17:40:39 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] drm/i915/dsi: Drop double check ACPI companion device
 for NULL
Date: Wed, 22 Dec 2021 17:40:33 +0200
Message-Id: <20211222154033.6770-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

acpi_dev_get_resources() does perform the NULL pointer check against
ACPI companion device which is given as function parameter. Thus,
there is no need to duplicate this check in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: used LIST_HEAD() (Ville), initialized lookup directly on stack (Ville)
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 28 +++++++-------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 0da91849efde..da0bd056f3d3 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -426,24 +426,16 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 				  const u16 slave_addr)
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
-	struct device *dev = drm_dev->dev;
-	struct acpi_device *acpi_dev;
-	struct list_head resource_list;
-	struct i2c_adapter_lookup lookup;
-
-	acpi_dev = ACPI_COMPANION(dev);
-	if (acpi_dev) {
-		memset(&lookup, 0, sizeof(lookup));
-		lookup.slave_addr = slave_addr;
-		lookup.intel_dsi = intel_dsi;
-		lookup.dev_handle = acpi_device_handle(acpi_dev);
-
-		INIT_LIST_HEAD(&resource_list);
-		acpi_dev_get_resources(acpi_dev, &resource_list,
-				       i2c_adapter_lookup,
-				       &lookup);
-		acpi_dev_free_resource_list(&resource_list);
-	}
+	struct acpi_device *adev = ACPI_COMPANION(drm_dev->dev);
+	struct i2c_adapter_lookup lookup = {
+		.slave_addr = slave_addr,
+		.intel_dsi = intel_dsi,
+		.dev_handle = acpi_device_handle(adev),
+	};
+	LIST_HEAD(resource_list);
+
+	acpi_dev_get_resources(adev, &resource_list, i2c_adapter_lookup, &lookup);
+	acpi_dev_free_resource_list(&resource_list);
 }
 #else
 static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
-- 
2.34.1


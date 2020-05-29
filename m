Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EEC1E9024
	for <lists+dri-devel@lfdr.de>; Sat, 30 May 2020 11:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640E6E9C2;
	Sat, 30 May 2020 09:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CAA89F41;
 Fri, 29 May 2020 12:33:22 +0000 (UTC)
IronPort-SDR: iqqS54Bu776Gs22riHvGBdpvdYnzeqZmn+YO8PfbgLlGx0RiFbSucf3hV8exErsPJuBmxfTw9I
 AmDLzrOl/WIw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2020 05:33:21 -0700
IronPort-SDR: BH8cx+3xgrjE2I/A+UZDj1fS2eA+3s+/PeyvoU5yUDuOW2JZwAkkAAeK5uWjfg2fQ9QrlsI/wc
 5J4tTI4APi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,448,1583222400"; d="scan'208";a="303113842"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 29 May 2020 05:33:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3CB2EFC; Fri, 29 May 2020 15:33:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/i915/dsi: Drop double check for ACPI companion device
Date: Fri, 29 May 2020 15:33:17 +0300
Message-Id: <20200529123317.20470-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 May 2020 09:42:14 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

acpi_dev_get_resources() does perform the NULL pointer check against
ACPI companion device which is given as function parameter. Thus,
there is no need to duplicate this check in the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 24 ++++++++------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 574dcfec9577..6f9e08cda964 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -426,23 +426,19 @@ static void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
 {
 	struct drm_device *drm_dev = intel_dsi->base.base.dev;
 	struct device *dev = &drm_dev->pdev->dev;
-	struct acpi_device *acpi_dev;
+	struct acpi_device *acpi_dev = ACPI_COMPANION(dev);
 	struct list_head resource_list;
 	struct i2c_adapter_lookup lookup;
 
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
+	memset(&lookup, 0, sizeof(lookup));
+	lookup.slave_addr = slave_addr;
+	lookup.intel_dsi = intel_dsi;
+	lookup.dev_handle = acpi_device_handle(acpi_dev);
+
+	INIT_LIST_HEAD(&resource_list);
+	acpi_dev_get_resources(acpi_dev, &resource_list,
+			       i2c_adapter_lookup, &lookup);
+	acpi_dev_free_resource_list(&resource_list);
 }
 #else
 static inline void i2c_acpi_find_adapter(struct intel_dsi *intel_dsi,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

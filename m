Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2839389D5D9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 11:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EAC112C28;
	Tue,  9 Apr 2024 09:46:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hc1DySOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE48F112C28;
 Tue,  9 Apr 2024 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655988; x=1744191988;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jiErnE5ZOTsqPyAixqG1JuOnS30dw+jes4PeSskTcdo=;
 b=Hc1DySOqUNNbrzlpwi90uhypurovFW9nR305kQ94/4FxEpHW/61QqI7x
 OucP8l73fEzzxEjiF//CgKy3Ty4cF962MerVUXI2oof/ejaH68tGO9/yB
 pD9kM4vXYmjXRYbAlscVurm93bDWuptnrcaQ0YDzcsRZIe8ROaoP/Q7AG
 wr//OiFOk4DKskKrilL4SVlnVlf7IyzsaBIrqHrzEAGTlCANex4v24pZh
 fwBjM3wWP8AWyYs8eVULcUCp/QvXVfaBBsD3jPCwuXtl6xqgRtO92L9MI
 4nlXozJUvK2w8+GPgxvKi5bVA5E4Yc4aVWHHVgkhD66725yxURuENSEN8 g==;
X-CSE-ConnectionGUID: df4BqIdtRAqZC1gul01LAg==
X-CSE-MsgGUID: kWth4Kp7Tz+s6fUuVU8+Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11758336"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11758336"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:28 -0700
X-CSE-ConnectionGUID: 3QqzpY3xTKef2JJsQS2qwQ==
X-CSE-MsgGUID: hek6rWZxQD+7snG6nFuYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24662261"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Melissa Wen <mwen@igalia.com>, ville.syrjala@linux.intel.com
Subject: [PATCH v2 2/4] drm/edid: add drm_edid_print_product_id()
Date: Tue,  9 Apr 2024 12:46:10 +0300
Message-Id: <32bbc83ee6557809ef6d7a5edb1bc8ef4d56d10f.1712655867.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712655867.git.jani.nikula@intel.com>
References: <cover.1712655867.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add a function to print a decoded EDID vendor and product id to a drm
printer, optionally with the raw data.

v2:
- refactor date printing
- use seq_buf to avoid kasprintf() (Ville)
- handle week == 0 (Ville)
- use be16_to_cpu() on manufacturer_name

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Melissa Wen <mwen@igalia.com> # v1
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 44 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 626a0e24e66a..1400722ae3fe 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -29,12 +29,14 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/byteorder/generic.h>
 #include <linux/cec.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/seq_buf.h>
 #include <linux/slab.h>
 #include <linux/vga_switcheroo.h>
 
@@ -2771,6 +2773,48 @@ void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 }
 EXPORT_SYMBOL(drm_edid_get_product_id);
 
+static void decode_date(struct seq_buf *s, const struct drm_edid_product_id *id)
+{
+	int week = id->week_of_manufacture;
+	int year = id->year_of_manufacture + 1990;
+
+	if (week == 0xff)
+		seq_buf_printf(s, "model year: %d", year);
+	else if (!week)
+		seq_buf_printf(s, "year of manufacture: %d", year);
+	else
+		seq_buf_printf(s, "week/year of manufacture: %d/%d", week, year);
+}
+
+/**
+ * drm_edid_print_product_id - Print decoded product id to printer
+ * @p: drm printer
+ * @id: EDID product id
+ * @raw: If true, also print the raw hex
+ *
+ * See VESA E-EDID 1.4 section 3.4.
+ */
+void drm_edid_print_product_id(struct drm_printer *p,
+			       const struct drm_edid_product_id *id, bool raw)
+{
+	DECLARE_SEQ_BUF(date, 40);
+	char vend[4];
+
+	drm_edid_decode_mfg_id(be16_to_cpu(id->manufacturer_name), vend);
+
+	decode_date(&date, id);
+
+	drm_printf(p, "manufacturer name: %s, product code: %u, serial number: %u, %s\n",
+		   vend, le16_to_cpu(id->product_code),
+		   le32_to_cpu(id->serial_number), seq_buf_str(&date));
+
+	if (raw)
+		drm_printf(p, "raw product id: %*ph\n", (int)sizeof(*id), id);
+
+	WARN_ON(seq_buf_has_overflowed(&date));
+}
+EXPORT_SYMBOL(drm_edid_print_product_id);
+
 /**
  * drm_edid_get_panel_id - Get a panel's ID from EDID
  * @drm_edid: EDID that contains panel ID.
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 8bdd8d54815d..8e0e32349332 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -30,6 +30,7 @@ struct drm_connector;
 struct drm_device;
 struct drm_display_mode;
 struct drm_edid;
+struct drm_printer;
 struct hdmi_avi_infoframe;
 struct hdmi_vendor_infoframe;
 struct i2c_adapter;
@@ -481,6 +482,8 @@ int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
 void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 			     struct drm_edid_product_id *id);
+void drm_edid_print_product_id(struct drm_printer *p,
+			       const struct drm_edid_product_id *id, bool raw);
 
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
-- 
2.39.2


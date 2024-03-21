Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3416588570E
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 11:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298310E58A;
	Thu, 21 Mar 2024 10:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7SisD+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E4B10E572;
 Thu, 21 Mar 2024 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015532; x=1742551532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/N9MGyvsXf70zK7i6zQJN2IW/BInbm1g38VZUndeKPM=;
 b=Q7SisD+byX101YGHfCfSu5ETRkOaLdKzPzOhfWoc2DxRuJxLq1Q5bK/Q
 q0XpUEilRROdxR3CXaN8ADpyK2gIMQgYKzwFWuDAF1UjlTnoviU0T1RZl
 1hzaKSNhUXACbOTd4JLvGwYg4pEgpqhwvvpI5/hsstZm04iWp9a5gb5dZ
 dg7hPfsDLo7z/ZoB8sbj/ZUQXDkFY47qoH2i/P7oEYyo18uw/YoT0DuTT
 A7vNoNY9K7dIqa7jPTkIoNWcW8SuHIdEQfxYADF9m8xNDXgHwTjXaPdgo
 pfsJDTPulC7mZPFNZm5wUcCIxMjUvVDxhCUY3cxr4Ipv/vql0gezB48Ne w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5824250"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5824250"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19180059"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 2/4] drm/edid: add drm_edid_print_product_id()
Date: Thu, 21 Mar 2024 12:05:10 +0200
Message-Id: <dcefe0474d74f818e250677982b32c767b466110.1711015462.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1711015462.git.jani.nikula@intel.com>
References: <cover.1711015462.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
printer, optinally with the raw data.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 35 +++++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 626a0e24e66a..198986f0eb8b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -29,6 +29,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/byteorder/generic.h>
 #include <linux/cec.h>
 #include <linux/hdmi.h>
 #include <linux/i2c.h>
@@ -2771,6 +2772,40 @@ void drm_edid_get_product_id(const struct drm_edid *drm_edid,
 }
 EXPORT_SYMBOL(drm_edid_get_product_id);
 
+/**
+ * drm_edid_print_product_id - Print decoded product id to printer
+ * @p: drm printer
+ * @id: EDID product id
+ * @raw: If true, also print the raw hex
+ */
+void drm_edid_print_product_id(struct drm_printer *p,
+			       const struct drm_edid_product_id *id, bool raw)
+{
+	u16 mfg_id = id->manufacturer_name[0] << 8 | id->manufacturer_name[1];
+	char *date;
+	char vend[4];
+
+	drm_edid_decode_mfg_id(mfg_id, vend);
+
+	if (id->week_of_manufacture == 0xff)
+		date = kasprintf(GFP_KERNEL, "model year: %d",
+				 id->year_of_manufacture + 1990);
+	else
+		date = kasprintf(GFP_KERNEL, "week: %d, year of manufacture: %d",
+				 id->week_of_manufacture,
+				 id->year_of_manufacture + 1990);
+
+	drm_printf(p, "manufacturer name: %s, product code: %u, serial number: %u, %s\n",
+		   vend, le16_to_cpu(id->product_code),
+		   le32_to_cpu(id->serial_number), date ?: "");
+
+	if (raw)
+		drm_printf(p, "raw product id: %*ph\n", (int)sizeof(*id), id);
+
+	kfree(date);
+}
+EXPORT_SYMBOL(drm_edid_print_product_id);
+
 /**
  * drm_edid_get_panel_id - Get a panel's ID from EDID
  * @drm_edid: EDID that contains panel ID.
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 7911a2f8a672..c763ba1a0bbd 100644
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C4F885709
	for <lists+dri-devel@lfdr.de>; Thu, 21 Mar 2024 11:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC56710E55B;
	Thu, 21 Mar 2024 10:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQXZdKGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C26110E559;
 Thu, 21 Mar 2024 10:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711015526; x=1742551526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tq/ztDxkSgHWfZX/z4AO5Rfw5PocoTpl5QY2Q5soC4A=;
 b=MQXZdKGx5aEx/zqWWgDXIb6Rbxb7Q6mvvLDCZ2qSZCGIyLql448W13lE
 aOIztCterbEjvoffwg/kU6W7h+Qf4Os3zVD5t+N+q5U5hcDnF766EpfUl
 dk1PO/sfgG3z8C9bzcku41VxMNdy2CcGl6XibfmaiUDDnSzXqngUZdXg3
 6Vu6XKfnwIXYEBHGiB8xdzdaHEhgXC6JpFzM2zNxCzAuAjgQ6kYtBDcLm
 dMyEiVLdrH8m197+3R+SSV0H8Ncus0qlpIw156hTNpb16Az9YDCzI66F6
 enFyLrPiRsl1tC2U3G5AInH91aWm99bycH3QMP13fkrmPj5FgSA5HRG4T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5824243"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5824243"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="19179995"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.141])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 03:05:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 1/4] drm/edid: add drm_edid_get_product_id()
Date: Thu, 21 Mar 2024 12:05:09 +0200
Message-Id: <e3e7194ae72190a48916defa77b0a4de2fc87086.1711015462.git.jani.nikula@intel.com>
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

Add a struct drm_edid based function to get the vendor and product ID
from an EDID. Add a separate struct for defining this part of the EDID,
with defined byte order for product code and serial number.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++++++++++++
 include/drm/drm_edid.h     | 25 ++++++++++++++++++++-----
 2 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ea77577a3786..626a0e24e66a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2756,6 +2756,21 @@ const struct drm_edid *drm_edid_read(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_edid_read);
 
+/**
+ * drm_edid_get_product_id - Get the vendor and product identification
+ * @drm_edid: EDID
+ * @id: Where to place the product id
+ */
+void drm_edid_get_product_id(const struct drm_edid *drm_edid,
+			     struct drm_edid_product_id *id)
+{
+	if (drm_edid && drm_edid->edid && drm_edid->size >= EDID_LENGTH)
+		memcpy(id, &drm_edid->edid->product_id, sizeof(*id));
+	else
+		memset(id, 0, sizeof(*id));
+}
+EXPORT_SYMBOL(drm_edid_get_product_id);
+
 /**
  * drm_edid_get_panel_id - Get a panel's ID from EDID
  * @drm_edid: EDID that contains panel ID.
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 6f65bbf655a1..7911a2f8a672 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -272,14 +272,27 @@ struct detailed_timing {
 #define DRM_EDID_DSC_MAX_SLICES			0xf
 #define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
 
+struct drm_edid_product_id {
+	u8 manufacturer_name[2];
+	__le16 product_code;
+	__le32 serial_number;
+	u8 week_of_manufacture;
+	u8 year_of_manufacture;
+} __packed;
+
 struct edid {
 	u8 header[8];
 	/* Vendor & product info */
-	u8 mfg_id[2];
-	u8 prod_code[2];
-	u32 serial; /* FIXME: byte order */
-	u8 mfg_week;
-	u8 mfg_year;
+	union {
+		struct drm_edid_product_id product_id;
+		struct {
+			u8 mfg_id[2];
+			u8 prod_code[2];
+			u32 serial; /* FIXME: byte order */
+			u8 mfg_week;
+			u8 mfg_year;
+		} __packed;
+	} __packed;
 	/* EDID version */
 	u8 version;
 	u8 revision;
@@ -466,6 +479,8 @@ int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
 bool drm_edid_is_digital(const struct drm_edid *drm_edid);
+void drm_edid_get_product_id(const struct drm_edid *drm_edid,
+			     struct drm_edid_product_id *id);
 
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index);
-- 
2.39.2


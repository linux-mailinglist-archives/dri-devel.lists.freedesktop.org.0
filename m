Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B75FB3C9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030410E810;
	Tue, 11 Oct 2022 13:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186FA10E809;
 Tue, 11 Oct 2022 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496237; x=1697032237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c6Tm8ROmkBkyXGCN5Mp8KFngtlbFuEUFNf96/STHrHw=;
 b=QIP9IvTCAIjUwbZr71fjw9vUDH3oFM9xR2tv1sBi+wMBybTTpm96nTgL
 pSaj/3+LPL2zmb7Dp/prPblOI7ubxC11RpPPX7OBUOUqRSrxBxJU1T1Y7
 5GyCXXz/wANvHvsYO6i1de6stiaeTWt1ehurW8a3JU75jOHDhXGKHTjqz
 8JDvc9Azul7HB6knObDwRlcwt4K1k4qoU8Z/PKCnv4a44Pgpz/kYMt/JQ
 br1BM7+zuvGOVj3ZhZOZt9E1hn0cq4NoNS9b+Qe6fidUFcu9F0b/7GdPm
 pW30YY5Skgw6M0pbmMXDnWBprInoEBxy5TTizfG3E+c0XEGRW/PjtlwHB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="306130212"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="306130212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="626363914"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="626363914"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/15] drm/edid: detach debugfs EDID override from EDID
 property update
Date: Tue, 11 Oct 2022 16:49:43 +0300
Message-Id: <b68842462d58ca3c550049a95687f0ead81d615c.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having the EDID override debugfs directly update the EDID property is
problematic. The update is partial only. The driver has no way of
knowing it's been updated. Mode list is not updated. It's an
inconsistent state.

Detach debugfs EDID override from the property update completely. Only
set and reset a separate override EDID copy from debugfs, and have it
take effect only at detect (via EDID read). The copy is at
connector->edid_override.

This also brings override EDID closer to firmware EDID in behaviour.

Add validation of the override EDID which we completely lacked.

Note that IGT already forces a detect whenever tests update the override
EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 56 ++++++++++++-------------------------
 include/drm/drm_connector.h | 11 +++++---
 2 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c3cf942186b7..0f2898badd51 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2207,8 +2207,8 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 {
 	struct edid *override = NULL;
 
-	if (connector->override_edid)
-		override = drm_edid_duplicate(connector->edid_blob_ptr->data);
+	if (connector->edid_override)
+		override = drm_edid_duplicate(connector->edid_override->edid);
 
 	if (!override)
 		override = drm_load_edid_firmware(connector);
@@ -2223,10 +2223,10 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector,
 /* For debugfs edid_override implementation */
 int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
 {
-	struct drm_property_blob *edid = connector->edid_blob_ptr;
+	const struct drm_edid *drm_edid = connector->edid_override;
 
-	if (connector->override_edid && edid)
-		seq_write(m, edid->data, edid->length);
+	if (drm_edid)
+		seq_write(m, drm_edid->edid, drm_edid->size);
 
 	return 0;
 }
@@ -2235,32 +2235,33 @@ int drm_edid_override_show(struct drm_connector *connector, struct seq_file *m)
 int drm_edid_override_set(struct drm_connector *connector, const void *edid,
 			  size_t size)
 {
-	int ret;
+	drm_edid_free(connector->edid_override);
 
-	if (size < EDID_LENGTH || edid_size(edid) > size)
+	connector->edid_override = drm_edid_alloc(edid, size);
+	if (!drm_edid_valid(connector->edid_override)) {
+		drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override invalid\n",
+			    connector->base.id, connector->name);
+		drm_edid_free(connector->edid_override);
+		connector->edid_override = NULL;
 		return -EINVAL;
-
-	connector->override_edid = false;
+	}
 
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override set\n",
 		    connector->base.id, connector->name);
 
-	ret = drm_connector_update_edid_property(connector, edid);
-	if (!ret)
-		connector->override_edid = true;
-
-	return ret;
+	return 0;
 }
 
 /* For debugfs edid_override implementation */
 int drm_edid_override_reset(struct drm_connector *connector)
 {
-	connector->override_edid = false;
-
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] EDID override reset\n",
 		    connector->base.id, connector->name);
 
-	return drm_connector_update_edid_property(connector, NULL);
+	drm_edid_free(connector->edid_override);
+	connector->edid_override = NULL;
+
+	return 0;
 }
 
 /**
@@ -6634,23 +6635,6 @@ int drm_edid_connector_update(struct drm_connector *connector,
 {
 	int count;
 
-	/*
-	 * FIXME: Reconcile the differences in override_edid handling between
-	 * this and drm_connector_update_edid_property().
-	 *
-	 * If override_edid is set, and the EDID passed in here originates from
-	 * drm_edid_read() and friends, it will be the override EDID, and there
-	 * are no issues. drm_connector_update_edid_property() ignoring requests
-	 * to set the EDID dates back to a time when override EDID was not
-	 * handled at the low level EDID read.
-	 *
-	 * The only way the EDID passed in here can be different from the
-	 * override EDID is when a driver passes in an EDID that does *not*
-	 * originate from drm_edid_read() and friends, or passes in a stale
-	 * cached version. This, in turn, is a question of when an override EDID
-	 * set via debugfs should take effect.
-	 */
-
 	count = _drm_edid_connector_update(connector, drm_edid);
 
 	_drm_update_tile_info(connector, drm_edid);
@@ -6665,10 +6649,6 @@ EXPORT_SYMBOL(drm_edid_connector_update);
 static int _drm_connector_update_edid_property(struct drm_connector *connector,
 					       const struct drm_edid *drm_edid)
 {
-	/* ignore requests to set edid when overridden */
-	if (connector->override_edid)
-		return 0;
-
 	/*
 	 * Set the display info, using edid if available, otherwise resetting
 	 * the values to defaults. This duplicates the work done in
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index b1b2df48d42c..09a7d7f23e4a 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1550,12 +1550,15 @@ struct drm_connector {
 	struct drm_cmdline_mode cmdline_mode;
 	/** @force: a DRM_FORCE_<foo> state for forced mode sets */
 	enum drm_connector_force force;
+
 	/**
-	 * @override_edid: has the EDID been overwritten through debugfs for
-	 * testing? Do not modify outside of drm_edid_override_set() and
-	 * drm_edid_override_reset().
+	 * @edid_override: Override EDID set via debugfs.
+	 *
+	 * Do not modify or access outside of the drm_edid_override_* family of
+	 * functions.
 	 */
-	bool override_edid;
+	const struct drm_edid *edid_override;
+
 	/** @epoch_counter: used to detect any other changes in connector, besides status */
 	u64 epoch_counter;
 
-- 
2.34.1


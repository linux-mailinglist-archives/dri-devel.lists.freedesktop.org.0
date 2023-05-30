Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF1715980
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B26F10E380;
	Tue, 30 May 2023 09:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA85110E384;
 Tue, 30 May 2023 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437757; x=1716973757;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MYjoDgLZOOzUTE8coBLZbMWIjXvD1hmZJl4+qP4wxEk=;
 b=QxmEEx93lrmSGh6VUyR3ZPr1b/lCvpvYm7quDqxMdGvBw64e1jPDzjR3
 qGthBi3QeRWE8/o7I+PGbYPIDdNWa1wY715h5uuENsdYWIZZCJVUcR+Ru
 ayEuj7t9Dh2s59D40js8VOULo5UvdaXIWgTgSFjP6LG6LV8M1Q6j8GD5J
 sIiQ1TNDylbahzGIcCIzuzhN3AuLxqzmBF2INFoudnisqBwm0egipBvG2
 +HQQYtlAO9MGoG85qOz8rpaeo3gUY5C3xg72hfxzwBIUvH4iljZJfl6Pn
 6aGagLECzevc886obBo1tN2G+IYwEZIeiISzOkobEm/Po7j2MdvmrNhXp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="354872603"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="354872603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:09:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="683875145"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="683875145"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by orsmga006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:09:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 09/13] drm/edid: add drm_edid_read_switcheroo()
Date: Tue, 30 May 2023 12:08:21 +0300
Message-Id: <4ab5ec994670ea50f95c8079c1f1ae915940b00f.1685437501.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a switcheroo variant to the struct drm_edid based EDID read
functions.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 813ce00a106a..941f3d53a701 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2844,6 +2844,35 @@ struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_get_edid_switcheroo);
 
+/**
+ * drm_edid_read_switcheroo - get EDID data for a vga_switcheroo output
+ * @connector: connector we're probing
+ * @adapter: I2C adapter to use for DDC
+ *
+ * Wrapper around drm_edid_read_ddc() for laptops with dual GPUs using one set
+ * of outputs. The wrapper adds the requisite vga_switcheroo calls to
+ * temporarily switch DDC to the GPU which is retrieving EDID.
+ *
+ * Return: Pointer to valid EDID or %NULL if we couldn't find any.
+ */
+const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
+						struct i2c_adapter *adapter)
+{
+	struct drm_device *dev = connector->dev;
+	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	const struct drm_edid *drm_edid;
+
+	if (drm_WARN_ON_ONCE(dev, !dev_is_pci(dev->dev)))
+		return NULL;
+
+	vga_switcheroo_lock_ddc(pdev);
+	drm_edid = drm_edid_read_ddc(connector, adapter);
+	vga_switcheroo_unlock_ddc(pdev);
+
+	return drm_edid;
+}
+EXPORT_SYMBOL(drm_edid_read_switcheroo);
+
 /**
  * drm_edid_duplicate - duplicate an EDID and the extensions
  * @edid: EDID to duplicate
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 571885d32907..169755d3de19 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -613,6 +613,8 @@ const struct drm_edid *drm_edid_read_ddc(struct drm_connector *connector,
 const struct drm_edid *drm_edid_read_custom(struct drm_connector *connector,
 					    int (*read_block)(void *context, u8 *buf, unsigned int block, size_t len),
 					    void *context);
+const struct drm_edid *drm_edid_read_switcheroo(struct drm_connector *connector,
+						struct i2c_adapter *adapter);
 int drm_edid_connector_update(struct drm_connector *connector,
 			      const struct drm_edid *edid);
 int drm_edid_connector_add_modes(struct drm_connector *connector);
-- 
2.39.2


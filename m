Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAB8C4831
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 22:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 145E210E961;
	Mon, 13 May 2024 20:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6FCkYcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9525110E957;
 Mon, 13 May 2024 20:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715632051; x=1747168051;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DKWapjeP09RCHpoB7dOY1lAh0t5ur3RWlRiWRT9ObVk=;
 b=C6FCkYcctx9SFTH0GA/EG05MaqTxntlkGOPZNPMv33QnVW4HNW04noD7
 cpPFGyiDysGZOqHcQXitn44jG/SE+ls6eJOThnLL/4e1/qaStLtBQFRU4
 0uGomHQWGWW9uDq3bkFPH0QcwPRPTe4f1pgf+AqJumjmVhwFRGfYloiq8
 uQwj31zVCG3fNebVZyLf5Tx5PLw2KVTl9Izv0CfvucM2AHsDJJWqiC3Fp
 4WRwhAcD45qw0bPLEt4tckPvwdl94HG3R/KR/790VeTzdwyOO7jjL/gbt
 mgI0M8yBeGTUXchx3c8uYjl4NSG/YvWd3gj44MHoSQZ6mHOGSV7GpyRT8 Q==;
X-CSE-ConnectionGUID: e5gm1a64SPSkr1hJj0mobg==
X-CSE-MsgGUID: NkKQfSEcSYu9JRlycBybIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11419910"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="11419910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 13:27:31 -0700
X-CSE-ConnectionGUID: kJzHAsG9S3SXgvijZS8UJw==
X-CSE-MsgGUID: CHgt4zw9RsCJzKPvvJzNXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30486386"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 13:27:28 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/edid: remove drm_do_get_edid()
Date: Mon, 13 May 2024 23:27:23 +0300
Message-Id: <20240513202723.261440-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

All users of drm_do_get_edid() have been converted to
drm_edid_read_custom(). Remove the unused function to prevent new users
from creeping in.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Robert Foss <rfoss@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_edid.c | 28 ----------------------------
 include/drm/drm_edid.h     |  4 ----
 2 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4f54c91b31b2..0f7c4c5b14b9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2464,34 +2464,6 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	return NULL;
 }
 
-/**
- * drm_do_get_edid - get EDID data using a custom EDID block read function
- * @connector: connector we're probing
- * @read_block: EDID block read function
- * @context: private data passed to the block read function
- *
- * When the I2C adapter connected to the DDC bus is hidden behind a device that
- * exposes a different interface to read EDID blocks this function can be used
- * to get EDID data using a custom block read function.
- *
- * As in the general case the DDC bus is accessible by the kernel at the I2C
- * level, drivers must make all reasonable efforts to expose it as an I2C
- * adapter and use drm_get_edid() instead of abusing this function.
- *
- * The EDID may be overridden using debugfs override_edid or firmware EDID
- * (drm_edid_load_firmware() and drm.edid_firmware parameter), in this priority
- * order. Having either of them bypasses actual EDID reads.
- *
- * Return: Pointer to valid EDID or NULL if we couldn't find any.
- */
-struct edid *drm_do_get_edid(struct drm_connector *connector,
-			     read_block_fn read_block,
-			     void *context)
-{
-	return _drm_do_get_edid(connector, read_block, context, NULL);
-}
-EXPORT_SYMBOL_GPL(drm_do_get_edid);
-
 /**
  * drm_edid_raw - Get a pointer to the raw EDID data.
  * @drm_edid: drm_edid container
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b085525e53e2..6bdfa254a1c1 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -423,10 +423,6 @@ static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *pro
 }
 
 bool drm_probe_ddc(struct i2c_adapter *adapter);
-struct edid *drm_do_get_edid(struct drm_connector *connector,
-	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-			      size_t len),
-	void *data);
 struct edid *drm_get_edid(struct drm_connector *connector,
 			  struct i2c_adapter *adapter);
 struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
-- 
2.39.2


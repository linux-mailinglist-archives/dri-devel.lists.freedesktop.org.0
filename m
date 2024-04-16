Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ABB8A6C28
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A546112C85;
	Tue, 16 Apr 2024 13:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYsMtS3f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46832112C83
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273807; x=1744809807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4rFXO4I5gNMTvpzxi2svMqDHQ3KZ32z6a0swYTaFRk=;
 b=QYsMtS3fBMkywcseK0OKL4Aatjru5jCSObdRQALgXzr+pBNZhMqiosCL
 ZnpyaL+wI/8hsWvMGq5JwWF5dHkMNevhEBNjV+b0rRwEZNm5QPXLRO/Sy
 cshrhm5xfpM0Ks0MwUZDOvOoCwXXScrzHMJdung2bRETfe6KKu3J552nT
 eYwU1dlrPVIUvgROzqC+Q3auWqwxjfPjeooBCNL4G9P24nKIL5N38c2nS
 3jaQaCe3OM4LlW2JYhA+2vxsaAsQeAhZljO6agd5MWSY29TTA21ITYx+k
 ib9KHyDFmKkWgu4eQ0NrBHwWMg2oQg85iJr7OFBJOMoh1aP8mk8i8EHaH A==;
X-CSE-ConnectionGUID: Up/8GFXuR7S7+2mVRj+a6A==
X-CSE-MsgGUID: H3vMZwNMRK6X38ZznmiCew==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26169427"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26169427"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:27 -0700
X-CSE-ConnectionGUID: dt5bx7s4RfivJZrLy9u59w==
X-CSE-MsgGUID: HdqczchgRiCdTQvsmsyNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26929299"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 10/15] drm/i2c: tda998x: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:24 +0300
Message-Id: <3b93bd58e07284bc21c56f10e5df4f322dd8427d.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index d8d7de18dd65..2160f05bbd16 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1283,7 +1283,7 @@ static int read_edid_block(void *data, u8 *buf, unsigned int blk, size_t length)
 static int tda998x_connector_get_modes(struct drm_connector *connector)
 {
 	struct tda998x_priv *priv = conn_to_tda998x_priv(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int n;
 
 	/*
@@ -1297,25 +1297,26 @@ static int tda998x_connector_get_modes(struct drm_connector *connector)
 	if (priv->rev == TDA19988)
 		reg_clear(priv, REG_TX4, TX4_PD_RAM);
 
-	edid = drm_do_get_edid(connector, read_edid_block, priv);
+	drm_edid = drm_edid_read_custom(connector, read_edid_block, priv);
 
 	if (priv->rev == TDA19988)
 		reg_set(priv, REG_TX4, TX4_PD_RAM);
 
-	if (!edid) {
+	drm_edid_connector_update(connector, drm_edid);
+	cec_notifier_set_phys_addr(priv->cec_notify,
+				   connector->display_info.source_physical_address);
+
+	if (!drm_edid) {
 		dev_warn(&priv->hdmi->dev, "failed to read EDID\n");
 		return 0;
 	}
 
-	drm_connector_update_edid_property(connector, edid);
-	cec_notifier_set_phys_addr_from_edid(priv->cec_notify, edid);
-
 	mutex_lock(&priv->audio_mutex);
-	n = drm_add_edid_modes(connector, edid);
-	priv->sink_has_audio = drm_detect_monitor_audio(edid);
+	n = drm_edid_connector_add_modes(connector);
+	priv->sink_has_audio = connector->display_info.has_audio;
 	mutex_unlock(&priv->audio_mutex);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return n;
 }
-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FD68C25A7
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F510EA0B;
	Fri, 10 May 2024 13:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bVBhwD5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546BF10EA0B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715347599; x=1746883599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b4rFXO4I5gNMTvpzxi2svMqDHQ3KZ32z6a0swYTaFRk=;
 b=bVBhwD5APwTgTYUo1X/VykKSb5WIAoRXm0gCB77dQb4dGrjAAv0lKSAl
 BOScia6EnmjHjLdoAfCX4gld01qXzWXDyCjVcpGqp2l/5YQ9fputW3Pht
 DQO/BPRfDX+BkDPOb+ChA3ZiphWhwtfPaimkYUNjVyFiEKOrq/91cv8ed
 Cw4/4v0ad8w34vHOccubQv0Df37waWH/Pb+BE+PrlPM/QLmwvCQSO0Y9o
 Cz5rc51KUV6INc8/1jZtW6wT1o59CqD9jk0R3bdG44/xpKLHdBAey0yTv
 0XiIJGJd1Cu67VvHTJvKcvjXDg8dsRE2E4KgD4goGSnwwJdWuWhdIy20Z w==;
X-CSE-ConnectionGUID: Oaq5cAm4RlezYmrNlkbHaw==
X-CSE-MsgGUID: wqOHiGcBTQK6FxxULFmDWg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11489583"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489583"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:39 -0700
X-CSE-ConnectionGUID: qvcomucnSz6VM7i3736bTA==
X-CSE-MsgGUID: KBsTt6RlRee3s6Ig45n38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="67089414"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Russell King <linux@armlinux.org.uk>
Subject: [RESEND 4/6] drm/i2c: tda998x: switch to struct drm_edid
Date: Fri, 10 May 2024 16:26:07 +0300
Message-Id: <485a33bc4eba9daae109d3f4795bc695e026ba0c.1715347488.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715347488.git.jani.nikula@intel.com>
References: <cover.1715347488.git.jani.nikula@intel.com>
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


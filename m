Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E0061EBC0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 08:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAE110E225;
	Mon,  7 Nov 2022 07:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FA810E1F8;
 Mon,  7 Nov 2022 07:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667805644; x=1699341644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vPnhh/Ffc+ggmRg7PtIuQIgfEuTRHFt2mR0Gj7QjOwY=;
 b=cqqpiubiqD6MI81OihzAyj8ceEXsrzA2rk99YB8yqLUgbLmlSFS+0G3M
 bcyFwFoNDjq/XtwCGBXZXRlq8LkK1iQwH0fyxurM0nbpkJ/nGNB7yvNal
 Hou8r2MfiQ5nNvCNxZuMHnnQ480l015h6ucZD0QxMQQLLIk92+aSTMx6C
 jN2Ao+2ogkjLw58cLuBQr5MfVPBAfjISHHTaTmgWfas5SCzhhuUy76Ckz
 OPdXxTuG8TtGJvtWz+BeJbEbBeSipmRRBaZV259q13NExxLt/DvQ3TTHJ
 N3le+T/WRSywia40YRlduD9m49ZrOCg5osY3LRf7CSiM/TjhxIMxn3wmf A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372463407"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372463407"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704767304"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="704767304"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2022 23:20:41 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [RFC 14/15] drm/i915/hdmi21/mtl: Add support for sending uevent to
 user for FRL training failure
Date: Mon,  7 Nov 2022 12:50:44 +0530
Message-Id: <20221107072045.628895-15-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
References: <20221107072045.628895-1-ankit.k.nautiyal@intel.com>
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
Cc: vandita.kulkarni@intel.com, uma.shankar@intel.com, mika.kahola@intel.com,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case of HDMI2.1 FRL training failure for a given mode, the user
should be sent a uevent signalling Link failure.

This patch adds support for sending uevent to userspace in case of link
training failure.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 1eadf77dc819..9e8ee6d5bc5d 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2944,6 +2944,31 @@ void intel_infoframe_init(struct intel_digital_port *dig_port)
 	}
 }
 
+/* Common code with DP, need to put in a common place */
+static void intel_hdmi_modeset_retry_work_fn(struct work_struct *work)
+{
+	struct intel_connector *intel_connector;
+	struct drm_connector *connector;
+
+	intel_connector = container_of(work, typeof(*intel_connector),
+				       modeset_retry_work);
+	connector = &intel_connector->base;
+	DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n", connector->base.id,
+		      connector->name);
+
+	/* Grab the locks before changing connector property*/
+	mutex_lock(&connector->dev->mode_config.mutex);
+	/*
+	 * Set connector link status to BAD and send a Uevent to notify
+	 * userspace to do a modeset.
+	 */
+	drm_connector_set_link_status_property(connector,
+					       DRM_MODE_LINK_STATUS_BAD);
+	mutex_unlock(&connector->dev->mode_config.mutex);
+	/* Send Hotplug uevent so userspace can reprobe */
+	drm_kms_helper_hotplug_event(connector->dev);
+}
+
 void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 			       struct intel_connector *intel_connector)
 {
@@ -3021,6 +3046,11 @@ void intel_hdmi_init_connector(struct intel_digital_port *dig_port,
 					   &conn_info);
 	if (!intel_hdmi->cec_notifier)
 		drm_dbg_kms(&dev_priv->drm, "CEC notifier get failed\n");
+
+	/* Initialize the work for modeset in case of link train failure */
+	if (DISPLAY_VER(dev_priv) >= 14)
+		INIT_WORK(&intel_connector->modeset_retry_work,
+			  intel_hdmi_modeset_retry_work_fn);
 }
 
 /*
-- 
2.25.1


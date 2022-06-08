Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA158542871
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384AA10EECD;
	Wed,  8 Jun 2022 07:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3131D10EECD;
 Wed,  8 Jun 2022 07:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674689; x=1686210689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RQfazp2nFqOsH62ebKVXq86BZfYqYSUML1XmhL+OOAY=;
 b=EH4s9vaBEnFsF55KO0C6EM2q6CmBxKP/E6lTcX2KSC3VbTgQFl5Xfxp6
 Whud6OPjQRugeDtyvTCjRihX7ZW9iJVSqM04gwbqFtfWQVpLsiGtID6bP
 xUcjP+Sdu0HqzaPRW4xFHtzShOLv7gmquJnzIO2r11aY+WgIc7RwXNHgS
 KjTBhvePkkIK4KHKzdWKigH6jY7J8P0Lq4vVCNqQr1hjGpaQhRvEq5sbR
 jWmlWQfkKSVvcdhrL2rrFy2TLZmYQ+akALQeO+z6jMR9FrPqgn1un4KcY
 kv+yyZJU5bRpmdmm6ruoLzrQdPXz1BAuteHmfMOq1O8kH2jyvToxkUde+ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="340914850"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="340914850"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="648466340"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/15] drm/probe-helper: abstract .get_modes() connector
 helper call
Date: Wed,  8 Jun 2022 10:50:37 +0300
Message-Id: <a4de51efc246e4f5bcbf7b84d66bb49aaf7fd974.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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

Abstract the .get_modes() connector helper call, including the
override/firmware EDID fallback, for clarity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 75a71649b64d..a8d26b29bfa0 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -354,6 +354,24 @@ drm_helper_probe_detect(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_helper_probe_detect);
 
+static int drm_helper_probe_get_modes(struct drm_connector *connector)
+{
+	const struct drm_connector_helper_funcs *connector_funcs =
+		connector->helper_private;
+	int count;
+
+	count = connector_funcs->get_modes(connector);
+
+	/*
+	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
+	 * override/firmware EDID.
+	 */
+	if (count == 0 && connector->status == connector_status_connected)
+		count = drm_add_override_edid_modes(connector);
+
+	return count;
+}
+
 static int __drm_helper_update_and_validate(struct drm_connector *connector,
 					    uint32_t maxX, uint32_t maxY,
 					    struct drm_modeset_acquire_ctx *ctx)
@@ -473,8 +491,6 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 {
 	struct drm_device *dev = connector->dev;
 	struct drm_display_mode *mode;
-	const struct drm_connector_helper_funcs *connector_funcs =
-		connector->helper_private;
 	int count = 0, ret;
 	enum drm_connector_status old_status;
 	struct drm_modeset_acquire_ctx ctx;
@@ -559,14 +575,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		goto exit;
 	}
 
-	count = (*connector_funcs->get_modes)(connector);
-
-	/*
-	 * Fallback for when DDC probe failed in drm_get_edid() and thus skipped
-	 * override/firmware EDID.
-	 */
-	if (count == 0 && connector->status == connector_status_connected)
-		count = drm_add_override_edid_modes(connector);
+	count = drm_helper_probe_get_modes(connector);
 
 	if (count == 0 && (connector->status == connector_status_connected ||
 			   connector->status == connector_status_unknown)) {
-- 
2.30.2


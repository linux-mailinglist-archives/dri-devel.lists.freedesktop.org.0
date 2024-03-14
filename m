Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3A487BBE2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 12:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E7B10FA8E;
	Thu, 14 Mar 2024 11:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwixHppy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D1D10FA74
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 11:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710415585; x=1741951585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7NhKs1uXcyF1J5Et5XYlqzwW9+UW99WTyGpJhDnCI00=;
 b=JwixHppy11IUM9YET+BN/WsjwxgBQ4tXODGcQY/7jxCbA7M+utPAZudM
 zgxKGhC++B07nJDtLiYTaO/Htsw9L8B8F2Lb5fRL1/CLG5cr/bxTaYut2
 Ta9M7ZxVD9BWaWUGw7gsXG3u3HDpZm3XzcpFNttDlLkOLEdliKpGcblb+
 FQjqqemBPM5PaIrTXsbvmot/34kBIFgQ7Xmt1RBr+DvQXkcpc7WmOBwaV
 Rv2xtsgD5BcGfhs/OUAdUe63HOiCPM+X4jgxSEwI3azOpAWrez5tv3v3P
 GtHQpBqJGiunrUYD/BIyYO0F5Oe8il4gR4cIDgSbvHvNau2ovZpsaaiPA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5422800"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5422800"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:26:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="43296488"
Received: from rboza-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 04:26:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/edid: make drm_edid_are_equal() static
Date: Thu, 14 Mar 2024 13:26:20 +0200
Message-Id: <20240314112620.1728394-1-jani.nikula@intel.com>
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

drm_edid_are_equal() is only used within drm_edid.c. Make it static. Do
not encourage more uses of struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 +--
 include/drm/drm_edid.h     | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 923c4423151c..4c4e0d161490 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1818,7 +1818,7 @@ static bool edid_block_is_zero(const void *edid)
  * This helper can be used during probing to determine if
  * edid had changed.
  */
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
+static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 {
 	int edid1_len, edid2_len;
 	bool edid1_present = edid1 != NULL;
@@ -1840,7 +1840,6 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 
 	return true;
 }
-EXPORT_SYMBOL(drm_edid_are_equal);
 
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 7923bc00dc7a..b3f01f388ea8 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -327,8 +327,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
-
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 					 const struct drm_connector *connector,
-- 
2.39.2


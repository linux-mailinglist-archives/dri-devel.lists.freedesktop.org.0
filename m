Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44380EF51
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 15:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065FD10E1E1;
	Tue, 12 Dec 2023 14:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5BC010E1E1;
 Tue, 12 Dec 2023 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702392679; x=1733928679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=14uzE/WQpu/5VFsjOENh/drinb+dswmrOkGho48GCHI=;
 b=fnG3k5XRvJ3ZtFxYgViyOLZCZr9dSeejUWXSPfWEOSHRfpKBnNIL6QLa
 p9as9koNJOa/XOavPGipOQLXzQzTjAEL+DSbv0HlzuPCut+PjO3dfhUpi
 N5QxiZw2uKWJ8fNsUMd5fmurhRfT8QY+wJI5qxCeRCQjIMndfGdt/IrVk
 TIZIYh9bG8yUSxrs2ukZ6985gzRSg9xCPsPHLQSvIoEkCN08Yvuy1scFX
 k9fB/dHiT0fceMrgcYP5sPVMG1eJEJ75HzCqb67+g2F1nHXtxXHxxurVE
 qIdmQkDistwzGRyAbEYH/gD3MLV9OTOPb8LxUzy0/0B6FWLD2Tbcc1DGu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="379810495"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="379810495"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:51:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="864232078"
X-IronPort-AV: E=Sophos;i="6.04,270,1695711600"; d="scan'208";a="864232078"
Received: from ggilardi-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.49.147])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 06:51:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: prefer forward declarations over includes in
 drm_edid.h
Date: Tue, 12 Dec 2023 16:51:13 +0200
Message-Id: <20231212145113.3849191-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to include either linux/hdmi.h or drm/drm_mode.h. They
can be removed by using forward declarations.

While at it, group the forward declarations together, and remove the
unnecessary ones.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_edid.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 518d1b8106c7..37c2702ee9ef 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -24,11 +24,14 @@
 #define __DRM_EDID_H__
 
 #include <linux/types.h>
-#include <linux/hdmi.h>
-#include <drm/drm_mode.h>
 
+enum hdmi_quantization_range;
+struct drm_connector;
 struct drm_device;
+struct drm_display_mode;
 struct drm_edid;
+struct hdmi_avi_infoframe;
+struct hdmi_vendor_infoframe;
 struct i2c_adapter;
 
 #define EDID_LENGTH 128
@@ -319,11 +322,6 @@ struct cea_sad {
 	u8 byte2; /* meaning depends on format */
 };
 
-struct drm_encoder;
-struct drm_connector;
-struct drm_connector_state;
-struct drm_display_mode;
-
 int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads);
 int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
-- 
2.39.2


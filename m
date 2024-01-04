Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41F824A07
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 22:10:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F03110E54C;
	Thu,  4 Jan 2024 21:10:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B3F10E545;
 Thu,  4 Jan 2024 21:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704402635; x=1735938635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=d/tXxghGX4d2i9FiEfDdD+lqMUVXjkR5wNT90eCvMM8=;
 b=fSfFz2qaRhD2kLy5vxXlTy93bo/lXdKKi0woHQi+ZWMJim+GdOX2EJB6
 rJrr/UKK6ZIq/1d/NqRkLiXg0Jg4bIlVTNuSzxEqlbcJ78Qj5eaDL5rjU
 2eIvQKoTG07Ci5fkO+QTDbe/rsOm5CvJzqCFsdObWtN7zAdfKWzFGqDFj
 XXTeYGsWdtbx0HSArqC4cXS6fF1qRyKxz1yB+SPk/tanEaT3lBuf5MSBW
 pNkDF0rnyPFIhajBVL4FXTGfxGheE7qUe9feqfCT1RwKdVdohW4mJD+2J
 Q1C3cHXhixjoNbsHFzV4BSg4Re3Hx7BlWDcL32xIwot3ES1LIRJ0/lEPg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="376849488"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="376849488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 13:10:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871046306"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="871046306"
Received: from pdelarag-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.32])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 13:10:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND] drm/edid: prefer forward declarations over includes in
 drm_edid.h
Date: Thu,  4 Jan 2024 23:10:28 +0200
Message-Id: <20240104211028.1129606-1-jani.nikula@intel.com>
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
index 54cc6f04a708..86c1812a8034 100644
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


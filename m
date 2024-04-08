Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5133289BB05
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8561122FB;
	Mon,  8 Apr 2024 08:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYBqNHiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8B21122FD;
 Mon,  8 Apr 2024 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566604; x=1744102604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U2WIs5Pwzax7T4ezt0fiwOFzrrmUe8x0LWlKpWSp6ww=;
 b=ZYBqNHiQRKSniG5TTuX2Q3dm/gEDv9/TpMe4ie7O+4w/gh0DPFdT7Tqu
 42Ql0uAAx1eObLA7C1TZQZfuABcO6aFYGVaXaRxizEgZkfVv/VnjnTczS
 xTgSh0J+Nf6AGQHM2GOW+YKz7r2UJO9Xqk4+yzDBK4ByR84kEFo82jjGh
 4/WHM8LpMg7vUsgrAY3B4OUgYLx0aLtF4OBiLnuTMc5WOcIcTzuo7jLtQ
 +Xn9Iqn1x/wLawFm2MsseTvXLpfC4x6JG2mm74SmqEdMEm5qEjPX/nSVo
 dA2ylu1Js8C18NpEl0b6LHmUrJKtuvRkHGeCseYi4BJOWP6A23ELNqee2 A==;
X-CSE-ConnectionGUID: YFnHDytrSSKbqPUjzlpCnQ==
X-CSE-MsgGUID: 3WmRrBG0Rda7iPP8yodU4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25279199"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25279199"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:44 -0700
X-CSE-ConnectionGUID: YcC7hEAdT8ajLmqCGDSwUA==
X-CSE-MsgGUID: 3GhYCWwERgCDboT0Znucnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19732926"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 6/7] drm/edid: make drm_edid_are_equal() static
Date: Mon,  8 Apr 2024 11:56:07 +0300
Message-Id: <b07f2a7731c636dd34d02735c2601c3f2e65cd22.1712565984.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
References: <cover.1712565984.git.jani.nikula@intel.com>
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
index 02f0a5fd819a..c11421d43b4b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1825,7 +1825,7 @@ static bool edid_block_is_zero(const void *edid)
  * This helper can be used during probing to determine if
  * edid had changed.
  */
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
+static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 {
 	int edid1_len, edid2_len;
 	bool edid1_present = edid1 != NULL;
@@ -1847,7 +1847,6 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 
 	return true;
 }
-EXPORT_SYMBOL(drm_edid_are_equal);
 
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 19814bb1103c..b5ee893001da 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -334,8 +334,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
-
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 					 const struct drm_connector *connector,
-- 
2.39.2


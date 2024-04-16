Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982E8A66FD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C487112B47;
	Tue, 16 Apr 2024 09:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEz6Crsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FEC112B39;
 Tue, 16 Apr 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259236; x=1744795236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9z1X51hbJ2DUM6OlJFZk114S+RFqzGk3iPdtCggJM+A=;
 b=HEz6CrsajS9iVcHkuodr2nz5xTinbDL/T8svHF9TKyv7j6Ar3uqJYd9Z
 eR/2ERGepyh4gQCNCNq+x6GJsjMzQU/Vb3dLqlUi6t0jq0yqXVZ28wo4X
 Rxc2mGBNeyXJvToRmqx0IXKhs0njFoBg3Pzd4TmVjZslHGaOUe1NfqnDL
 mnu9ACXELJG8pW3e7shlgoaVYoNC4S6wnyEyD+wUoo6ge0+JIAW5nbcjP
 AwgpPb35yX+OHNhCiUBYvEeferrPd4tC9NPVpSOj2RpKQcpr4zRoYC7K/
 mkNVsqHxhWXX86I7UxnTOreeeG+6oPsvld8L8M/kpKDJ4rZHYJgII99zY Q==;
X-CSE-ConnectionGUID: mbxSmQ5cSa+jJsrTKsfJ0g==
X-CSE-MsgGUID: fPCZPNuDRD25P85K+siaoQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8908147"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8908147"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:34 -0700
X-CSE-ConnectionGUID: g3jiIdS5T7yWkZTbUN9DCQ==
X-CSE-MsgGUID: vMeOHsWjQwSNFQEDD/Zn2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22265937"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 6/7] drm/edid: make drm_edid_are_equal() static
Date: Tue, 16 Apr 2024 12:19:59 +0300
Message-Id: <aa79be9a5d0b08c71b82b86b5a8ff0f332e13c6a.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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
index 4b3ad42a8f95..463fbad85d90 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1827,7 +1827,7 @@ static bool edid_block_is_zero(const void *edid)
  * This helper can be used during probing to determine if
  * edid had changed.
  */
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
+static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 {
 	int edid1_len, edid2_len;
 	bool edid1_present = edid1 != NULL;
@@ -1849,7 +1849,6 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 
 	return true;
 }
-EXPORT_SYMBOL(drm_edid_are_equal);
 
 enum edid_block_status {
 	EDID_BLOCK_OK = 0,
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 92fff199aa78..b085525e53e2 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -348,8 +348,6 @@ int drm_edid_to_speaker_allocation(const struct edid *edid, u8 **sadb);
 int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
-bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
-
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 					 const struct drm_connector *connector,
-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB0782C3F5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E3710EB65;
	Fri, 12 Jan 2024 16:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B8510EB45;
 Fri, 12 Jan 2024 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705078223; x=1736614223;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xe5yErZorzZSBDJBU6GfU8cT3q84kcy8tFpfjFq9gJk=;
 b=DkiX1Xn4Lp6kdRBSR25I90j05as5x/nltFPhpi6KqkFBZNWm6Mk0Td8X
 nYIP3ORRXDSO6xVwKzbMRs9rpW5jx8jNw6ITA7OjCkGRzXIrFuxH6ExdE
 7/e+hh90p/GzGJ6KttJFGs16ekxZC2n/I2lYNCo94WHsSMbzPICnu1DYS
 MLnVzACWR+Td12P5eQajavKoYlrjn78ZtJ6jFL+w0uY/3DA2H093Zhz5Z
 GYt+46HZKD6Vqq+dSTU0ek1dZFxOLQueZCqk66fQ/npa5SSc8apLUt1X6
 PCKAhAL3wu5vxKMSy7U5SNfKVsSBbKPZdcFGlaB/ZIkXBhwOCdaQiHFFk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10951"; a="6578781"
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; 
   d="scan'208";a="6578781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,190,1695711600"; d="scan'208";a="24764295"
Received: from tsenx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.158])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2024 08:50:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/radeon: remove radeon_connector_edid() and stop using
 edid_blob_ptr
Date: Fri, 12 Jan 2024 18:49:55 +0200
Message-Id: <19e302142c4e42e50c6090422be90d2ed31716c0.1705078136.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705078136.git.jani.nikula@intel.com>
References: <cover.1705078136.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jani.nikula@intel.com, Xinhui <Xinhui.Pan@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

radeon_connector_edid() copies the EDID from edid_blob_ptr as a side
effect if radeon_connector->edid isn't initialized. However, everywhere
that the returned EDID is used, the EDID should have been set
beforehands.

Only the drm EDID code should look at the EDID property, anyway, so stop
using it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/radeon/radeon_audio.c      |  7 ++++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 15 ---------------
 drivers/gpu/drm/radeon/radeon_mode.h       |  2 --
 3 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index e88c35d003c5..05ee473dcfbb 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -304,6 +304,7 @@ void radeon_audio_endpoint_wreg(struct radeon_device *rdev, u32 offset,
 static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
+	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct cea_sad *sads;
 	int sad_count;
@@ -311,7 +312,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_sad(radeon_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
@@ -327,6 +328,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = radeon_get_connector_for_encoder(encoder);
+	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	u8 *sadb = NULL;
 	int sad_count;
@@ -334,8 +336,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_speaker_allocation(radeon_connector_edid(connector),
-						   &sadb);
+	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
 			  sad_count);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 81b5c3c8f658..80879e946342 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -255,21 +255,6 @@ static struct drm_encoder *radeon_find_encoder(struct drm_connector *connector,
 	return NULL;
 }
 
-struct edid *radeon_connector_edid(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct drm_property_blob *edid_blob = connector->edid_blob_ptr;
-
-	if (radeon_connector->edid) {
-		return radeon_connector->edid;
-	} else if (edid_blob) {
-		struct edid *edid = kmemdup(edid_blob->data, edid_blob->length, GFP_KERNEL);
-		if (edid)
-			radeon_connector->edid = edid;
-	}
-	return radeon_connector->edid;
-}
-
 static void radeon_connector_get_edid(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 59c4db13d90a..0d2f7785a099 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -704,8 +704,6 @@ extern u16 radeon_connector_encoder_get_dp_bridge_encoder_id(struct drm_connecto
 extern bool radeon_connector_is_dp12_capable(struct drm_connector *connector);
 extern int radeon_get_monitor_bpc(struct drm_connector *connector);
 
-extern struct edid *radeon_connector_edid(struct drm_connector *connector);
-
 extern void radeon_connector_hotplug(struct drm_connector *connector);
 extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
 				       struct drm_display_mode *mode);
-- 
2.39.2


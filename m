Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2B36D09EE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D350C10EEDC;
	Thu, 30 Mar 2023 15:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6F710EECA;
 Thu, 30 Mar 2023 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190819; x=1711726819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9j02iyN1z0oGbiLOKEigIWxMKS4gDUjrc2/jm7bQPAY=;
 b=lOiHev37SaV/p5bTipPHray+sFN93MvPP7qMCxvjYLccWw3CYjqUQJcq
 nAG9Ds86zCZA/cpjuarVjn2SWjKCcGNGV2JaZID7alO+mKDV5lfu80fcZ
 v0YusfqbYrwTBFh6+TvQXkF/RrXJ5nn0gcUIqiw2DfnC5ihuBvDOyI3+y
 WtGG5FJOqivkHY1uoKRHg0xl+7e6ZCs+gMbKCeCH/OvUV+ZbuSacr16ZE
 r/KVSP3E+IIJqBsRaLLgi2UooitdD8uCBnmsqzpTi6bTkAANCQwLZ+h07
 odcVc9idO8owqVgWEf+mE7cjZQ0sz+fgTCWotGXBV60XMbd1BEPNv6sz+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342844349"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="342844349"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774032124"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="774032124"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/radeon: remove radeon_connector_edid() and stop
 using edid_blob_ptr
Date: Thu, 30 Mar 2023 18:39:41 +0300
Message-Id: <e4cb7b0c7217511429e69c1c78729f0e864c5b24.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
	Xinhui <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

radeon_connector_edid() copies the EDID from edid_blob_ptr as a side
effect if radeon_connector->edid isn't initialized. However, everywhere
that the returned EDID is used, the EDID should have been set
beforehands.

Only the EDID code and sysfs should look at the EDID property, anyway,
so stop using it.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Pan, Xinhui <Xinhui.Pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/radeon/radeon_audio.c      |  5 ++---
 drivers/gpu/drm/radeon/radeon_connectors.c | 15 ---------------
 drivers/gpu/drm/radeon/radeon_mode.h       |  2 --
 3 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 947de91e13f6..759b5dfaca15 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -309,7 +309,7 @@ static void radeon_audio_write_sad_regs(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_sad(radeon_connector_edid(connector), &sads);
+	sad_count = drm_edid_to_sad(radeon_connector->edid, &sads);
 	if (sad_count < 0)
 		DRM_ERROR("Couldn't read SADs: %d\n", sad_count);
 	if (sad_count <= 0)
@@ -332,8 +332,7 @@ static void radeon_audio_write_speaker_allocation(struct drm_encoder *encoder)
 	if (!connector)
 		return;
 
-	sad_count = drm_edid_to_speaker_allocation(radeon_connector_edid(connector),
-						   &sadb);
+	sad_count = drm_edid_to_speaker_allocation(radeon_connector->edid, &sadb);
 	if (sad_count < 0) {
 		DRM_DEBUG("Couldn't read Speaker Allocation Data Block: %d\n",
 			  sad_count);
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index adebf8e9d2bd..99e8f387fe21 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -256,21 +256,6 @@ static struct drm_encoder *radeon_find_encoder(struct drm_connector *connector,
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
index 3a59d016e8cd..ab71a744d2b2 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -708,8 +708,6 @@ extern u16 radeon_connector_encoder_get_dp_bridge_encoder_id(struct drm_connecto
 extern bool radeon_connector_is_dp12_capable(struct drm_connector *connector);
 extern int radeon_get_monitor_bpc(struct drm_connector *connector);
 
-extern struct edid *radeon_connector_edid(struct drm_connector *connector);
-
 extern void radeon_connector_hotplug(struct drm_connector *connector);
 extern int radeon_dp_mode_valid_helper(struct drm_connector *connector,
 				       struct drm_display_mode *mode);
-- 
2.39.2


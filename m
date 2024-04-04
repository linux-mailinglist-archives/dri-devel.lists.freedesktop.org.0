Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB955898FB3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2201134FB;
	Thu,  4 Apr 2024 20:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLz5tI5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2E71134E9;
 Thu,  4 Apr 2024 20:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262841; x=1743798841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPwu/qA9TI0rqZq21rafg2//sw/cpbVb2D0g0e1tQow=;
 b=ZLz5tI5V9G6Mf9r3TM8MwcXdLi7MVETPlfxhUyA9YT3XDFUNsNTAJ4b9
 Kumlboh7yniYR6zXvzsWrtwbvin83RWqrFplwpSDTUnwMPalmSTTQ+Z17
 +zC1ZhNiRXFKWinkLsy4PoNgCYZcT6O4IFFnpLbJHbsrb778qdHGIFh5o
 H/Voq7+d9YHCmmHAvR0U54ohW+SgJSushrfWnm4epr04L//mVLFAzRxyY
 EH7tu99omdzdmtASu0p4sVDCvUH5x8QNa0n+IwF+LyyVy0Nb+ivfNERmt
 nGsMVxhI33zs266xQ0cqZmqEElMXw2oKM3yRN0mWwmMesXiSc7NBts92h w==;
X-CSE-ConnectionGUID: zwRDom6iS+StNK6l9HWKIQ==
X-CSE-MsgGUID: JVvc/akHRNSLIol8fdccIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019742"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019742"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790584"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790584"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:33:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:33:58 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 07/12] drm/client: Use array notation for function arguments
Date: Thu,  4 Apr 2024 23:33:31 +0300
Message-ID: <20240404203336.10454-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
References: <20240404203336.10454-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the array notation rather that the pointer notation for
function arguments. This makes it clear to the reader that
we are in fact dealing with an array rather than a single
pointer. Functionally the two are equivalent.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 42 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 384a9f8227a0..08fc896885dd 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -232,9 +232,9 @@ static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
 	return enable;
 }
 
-static void drm_client_connectors_enabled(struct drm_connector **connectors,
+static void drm_client_connectors_enabled(struct drm_connector *connectors[],
 					  unsigned int connector_count,
-					  bool *enabled)
+					  bool enabled[])
 {
 	bool any_enabled = false;
 	struct drm_connector *connector;
@@ -257,11 +257,11 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
 }
 
 static bool drm_client_target_cloned(struct drm_device *dev,
-				     struct drm_connector **connectors,
+				     struct drm_connector *connectors[],
 				     unsigned int connector_count,
-				     const struct drm_display_mode **modes,
-				     struct drm_client_offset *offsets,
-				     bool *enabled, int width, int height)
+				     const struct drm_display_mode *modes[],
+				     struct drm_client_offset offsets[],
+				     bool enabled[], int width, int height)
 {
 	int count, i, j;
 	bool can_clone = false;
@@ -342,10 +342,10 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 	return false;
 }
 
-static int drm_client_get_tile_offsets(struct drm_connector **connectors,
+static int drm_client_get_tile_offsets(struct drm_connector *connectors[],
 				       unsigned int connector_count,
-				       const struct drm_display_mode **modes,
-				       struct drm_client_offset *offsets,
+				       const struct drm_display_mode *modes[],
+				       struct drm_client_offset offsets[],
 				       int idx,
 				       int h_idx, int v_idx)
 {
@@ -375,11 +375,11 @@ static int drm_client_get_tile_offsets(struct drm_connector **connectors,
 	return 0;
 }
 
-static bool drm_client_target_preferred(struct drm_connector **connectors,
+static bool drm_client_target_preferred(struct drm_connector *connectors[],
 					unsigned int connector_count,
-					const struct drm_display_mode **modes,
-					struct drm_client_offset *offsets,
-					bool *enabled, int width, int height)
+					const struct drm_display_mode *modes[],
+					struct drm_client_offset offsets[],
+					bool enabled[], int width, int height)
 {
 	const u64 mask = BIT_ULL(connector_count) - 1;
 	struct drm_connector *connector;
@@ -491,10 +491,10 @@ static bool connector_has_possible_crtc(struct drm_connector *connector,
 }
 
 static int drm_client_pick_crtcs(struct drm_client_dev *client,
-				 struct drm_connector **connectors,
+				 struct drm_connector *connectors[],
 				 unsigned int connector_count,
-				 struct drm_crtc **best_crtcs,
-				 const struct drm_display_mode **modes,
+				 struct drm_crtc *best_crtcs[],
+				 const struct drm_display_mode *modes[],
 				 int n, int width, int height)
 {
 	struct drm_device *dev = client->dev;
@@ -566,12 +566,12 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 
 /* Try to read the BIOS display configuration and use it for the initial config */
 static bool drm_client_firmware_config(struct drm_client_dev *client,
-				       struct drm_connector **connectors,
+				       struct drm_connector *connectors[],
 				       unsigned int connector_count,
-				       struct drm_crtc **crtcs,
-				       const struct drm_display_mode **modes,
-				       struct drm_client_offset *offsets,
-				       bool *enabled, int width, int height)
+				       struct drm_crtc *crtcs[],
+				       const struct drm_display_mode *modes[],
+				       struct drm_client_offset offsets[],
+				       bool enabled[], int width, int height)
 {
 	const int count = min_t(unsigned int, connector_count, BITS_PER_LONG);
 	unsigned long conn_configured, conn_seq, mask;
-- 
2.43.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D8A4A4C1
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC1310ED4A;
	Fri, 28 Feb 2025 21:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJxnOu/Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66FA510ED46;
 Fri, 28 Feb 2025 21:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777305; x=1772313305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9IG255jEJXxhFDsbb7jVaeLoVsGYBXc4mIT5lNwoaA=;
 b=lJxnOu/Yo/7jV80Knf414arhlxJnfLgWXG6qwKE/lhvsOrrdIOgGOmXE
 kJO4XA5iuTXv6Zl7Fyb9f1VW4xW8xpB4iB/l9lUrkQt5dF22YJmlasf0O
 KdyumUtJ9usy9RN6e/qajFDq3rFwmHsUn7K8bdLX7Z6EM9rWpcEyKYEwu
 DkHFmSEMx4T9OEJALxnCTyb7NRj33R30Q1rMiuR0e1/wWojj7CDsiEQSl
 RxEFAyzANzmeaR1Xua9tV3gKWsT6r0rItU7C968uEnZLBk0n5G6M47nCx
 t14EkT2QPlEQcg4k7uT+F2SmC/mwGlZdhka2YTulZoEMR681tczgM5zVp Q==;
X-CSE-ConnectionGUID: BUXfHHy4Qamofgu3D0wjcw==
X-CSE-MsgGUID: oTQ9uHCgSJCT6OLZl1RSag==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352304"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352304"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:05 -0800
X-CSE-ConnectionGUID: MfqGhVWoRS+xo0mGSyOIrg==
X-CSE-MsgGUID: tDUgI8/sQ0mCn0JqLVgPBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684828"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:01 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/8] drm/client: Use array notation for function arguments
Date: Fri, 28 Feb 2025 23:14:48 +0200
Message-ID: <20250228211454.8138-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
References: <20250228211454.8138-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 42 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index b114d1b8793b..bdd4078e62ad 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -239,9 +239,9 @@ static bool drm_connector_enabled(struct drm_connector *connector, bool strict)
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
@@ -266,11 +266,11 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
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
@@ -352,10 +352,10 @@ static bool drm_client_target_cloned(struct drm_device *dev,
 }
 
 static int drm_client_get_tile_offsets(struct drm_device *dev,
-				       struct drm_connector **connectors,
+				       struct drm_connector *connectors[],
 				       unsigned int connector_count,
-				       const struct drm_display_mode **modes,
-				       struct drm_client_offset *offsets,
+				       const struct drm_display_mode *modes[],
+				       struct drm_client_offset offsets[],
 				       int idx,
 				       int h_idx, int v_idx)
 {
@@ -387,11 +387,11 @@ static int drm_client_get_tile_offsets(struct drm_device *dev,
 }
 
 static bool drm_client_target_preferred(struct drm_device *dev,
-					struct drm_connector **connectors,
+					struct drm_connector *connectors[],
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
@@ -505,10 +505,10 @@ static bool connector_has_possible_crtc(struct drm_connector *connector,
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
@@ -580,12 +580,12 @@ static int drm_client_pick_crtcs(struct drm_client_dev *client,
 
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
2.45.3


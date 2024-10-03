Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC8E98EE2C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDC010E812;
	Thu,  3 Oct 2024 11:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+Bjv6fy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5F210E820;
 Thu,  3 Oct 2024 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727955195; x=1759491195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fd9r1r1zQbbjpT4GoY89RaL3WnXKpOi+7xvH8+3IbHw=;
 b=a+Bjv6fyJy9yUOfvXFHbw9R18pIOVANHjpCu5HfuGAnI5v68pceJN96Q
 QKLjgcrIecx5iefATK6rMhncgyiqKgW6XkdNK1G50DnXk41/CR+6fczlQ
 SBj8mKHZa2o2+WDyH0OQoG25O52QhY2m2Tvt3mu0xoeH1dIY1HTnIRQZ9
 QBAdyKSXCo0ZOfQeH1B/gbELeUP0DgxXT9voDapmPAAGyg2NlkkScr5eh
 JvUTbmSwQbTYppBv5iwDYuS+QYg11sdPglYa2esbsjovku3yY9NFN06Fu
 7ngjwOftHYl+g0BPm1E9PuLQcOcACwTU0adg3TutdWOmUaxeGAZaFytNj w==;
X-CSE-ConnectionGUID: vLJ2GrpfTNqTc5t0bEv1Lg==
X-CSE-MsgGUID: fSabHlbxRGW1z26tVb5NYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="38502986"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="38502986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:33:14 -0700
X-CSE-ConnectionGUID: Ca7h1RIUT62Snedfz7u/GA==
X-CSE-MsgGUID: PjzOoTttSHS6gPFPzIy6Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74426504"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:33:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:33:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/8] drm/client: Use array notation for function arguments
Date: Thu,  3 Oct 2024 14:32:58 +0300
Message-ID: <20241003113304.11700-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-1-ville.syrjala@linux.intel.com>
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
index 20882dffcf5e..068ce32cc41b 100644
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
2.45.2


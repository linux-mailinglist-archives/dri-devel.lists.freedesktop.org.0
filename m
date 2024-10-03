Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F598F5EE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 20:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B647410E8CF;
	Thu,  3 Oct 2024 18:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQtxEJGG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB72910E8CF;
 Thu,  3 Oct 2024 18:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727979432; x=1759515432;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cLJGdGjEnvQHk0VOxm3+EJX0xSKIvCukpXlEhTf2wwE=;
 b=hQtxEJGG89dB1u4SR3NgkbPw+xtLil/t/QzNDQ/ZsJAhoZvYGoFMlXFs
 C9LK7Fz3y5LPKQHz74dDA2cEMHbMZIn3DYeTZHsXyyS14/3L6d0TDhkHw
 tt+Fmk6zWSZDFCIKD6/QQh1TkgCQJv6RnnunTSjQwN9ftdikkPrdOIHiT
 eyFFJE2vcoZDIb83oVEouwYbEiAut4YKwknYXTLhB82E7vGPohEq27JuD
 yKRhKBUCo1es1byfaSP2Nv227jfuocHupfi7if7OerkW+NejL7WGyMpr8
 3WUO+sLjSnByCw5J1OA8XlN+M/oQzNozQ2B2+B8hYNV5MVqwEO/z7ZtaI g==;
X-CSE-ConnectionGUID: 9kM3MUO1SiiXFNBWut8kfg==
X-CSE-MsgGUID: EwLV4ATGSziHsqSf8tq1XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27070137"
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="27070137"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 11:17:12 -0700
X-CSE-ConnectionGUID: 55r5ztk5QqOVxGbT6Lc+8Q==
X-CSE-MsgGUID: X2KR+Q5WS7OBIzAVlW6hlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,175,1725346800"; d="scan'208";a="74543949"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 11:17:10 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 21:17:09 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/client: s/new_crtc/crtc/
Date: Thu,  3 Oct 2024 21:17:09 +0300
Message-ID: <20241003181709.9022-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003113304.11700-7-ville.syrjala@linux.intel.com>
References: <20241003113304.11700-7-ville.syrjala@linux.intel.com>
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

Rename the 'new_crtc' variable to just 'crtc' in
drm_client_firmware_config(). We don't call any of the other
stuff in here new or old so this feels out of place.

v2: Rebase

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 0f3418cb59ab..d0ed7a8effbe 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -649,7 +649,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	for (i = 0; i < count; i++) {
 		struct drm_connector *connector;
 		struct drm_encoder *encoder;
-		struct drm_crtc *new_crtc;
+		struct drm_crtc *crtc;
 		const char *mode_type;
 
 		connector = connectors[i];
@@ -691,7 +691,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
 		num_connectors_enabled++;
 
-		new_crtc = connector->state->crtc;
+		crtc = connector->state->crtc;
 
 		/*
 		 * Make sure we're not trying to drive multiple connectors
@@ -699,7 +699,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 * match the BIOS.
 		 */
 		for (j = 0; j < count; j++) {
-			if (crtcs[j] == new_crtc) {
+			if (crtcs[j] == crtc) {
 				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
 					    connector->base.id, connector->name);
 				goto bail;
@@ -726,7 +726,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		if (!mode_valid(&modes[i])) {
 			mode_type = "current";
 			mode_copy_if_not_null(&modes[i],
-					      &new_crtc->state->mode);
+					      &crtc->state->mode);
 		}
 
 		/*
@@ -739,11 +739,11 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			mode_copy_if_not_null(&modes[i],
 					      drm_connector_fallback_non_tiled_mode(connector));
 		}
-		crtcs[i] = new_crtc;
+		crtcs[i] = crtc;
 
 		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
 			    connector->base.id, connector->name,
-			    new_crtc->base.id, new_crtc->name,
+			    crtc->base.id, crtc->name,
 			    mode_type, modes[i].name);
 
 		fallback = false;
-- 
2.45.2


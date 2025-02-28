Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19954A4A4CD
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 22:15:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42C10ED4D;
	Fri, 28 Feb 2025 21:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mud5l11F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6F910ED5B;
 Fri, 28 Feb 2025 21:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740777319; x=1772313319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayCzSfXOBQ49h2iuqpmIcDKnMGz1UH6AV4XjAJXUbiU=;
 b=Mud5l11Ftp+/xvtQvXXfdaYORC6Cp0b6jVOxRoE/Bb3Lj/YwIT31esAI
 wAjoKXWbBVtfBfcjMq5Uf8iAurwkbuQwMj00JY9HNpIiJBBEeJwpAXU+y
 uLNTC+QZFGlHI5hFqKh2yViMWDuVafrg72ctj/7CO+Sjw6uE0dhzJbq9R
 KuiyUbLhpGAYmDMYuQNzUxIDdB4vWwbu3Xz4e9Cl/vkSgt2YVluWvPr3F
 r+xS2MmuL0MxwDqmeBH3tXhbMK1x4pMPRWTlAh7OhXVZF4852f3h5Lic9
 brgwXxTgO9UC+r5U4Ynh6NU+nCZC5Ceq/KZCD3wItVzuJ3kzti74Hxu4T Q==;
X-CSE-ConnectionGUID: sMw6vAPgSTiX9UGKr20f1g==
X-CSE-MsgGUID: j7CIcgJFQQSYCDZ6vqufEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="52352342"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; d="scan'208";a="52352342"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 13:15:18 -0800
X-CSE-ConnectionGUID: b3+xOILrSda0hd6C000Usw==
X-CSE-MsgGUID: 6BLtQardTdCdFBQUr7PJMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122684913"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 28 Feb 2025 13:15:16 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 28 Feb 2025 23:15:15 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/client: s/new_crtc/crtc/
Date: Fri, 28 Feb 2025 23:14:52 +0200
Message-ID: <20250228211454.8138-7-ville.syrjala@linux.intel.com>
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

Rename the 'new_crtc' variable to just 'crtc' in
drm_client_firmware_config(). We don't call any of the other
stuff in here new or old so this feels out of place.

v2: Rebase

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 4c64535fb82c..a0caa2b229dd 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -658,7 +658,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 	for (i = 0; i < count; i++) {
 		struct drm_connector *connector;
 		struct drm_encoder *encoder;
-		struct drm_crtc *new_crtc;
+		struct drm_crtc *crtc;
 		const char *mode_type;
 
 		connector = connectors[i];
@@ -700,7 +700,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 
 		num_connectors_enabled++;
 
-		new_crtc = connector->state->crtc;
+		crtc = connector->state->crtc;
 
 		/*
 		 * Make sure we're not trying to drive multiple connectors
@@ -708,7 +708,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		 * match the BIOS.
 		 */
 		for (j = 0; j < count; j++) {
-			if (crtcs[j] == new_crtc) {
+			if (crtcs[j] == crtc) {
 				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] fallback: cloned configuration\n",
 					    connector->base.id, connector->name);
 				goto bail;
@@ -735,7 +735,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		if (!modes[i]) {
 			mode_type = "current";
 			mode_replace(dev, &modes[i],
-				     &new_crtc->state->mode);
+				     &crtc->state->mode);
 		}
 
 		/*
@@ -748,11 +748,11 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 			mode_replace(dev, &modes[i],
 				     drm_connector_fallback_non_tiled_mode(connector));
 		}
-		crtcs[i] = new_crtc;
+		crtcs[i] = crtc;
 
 		drm_dbg_kms(dev, "[CONNECTOR::%d:%s] on [CRTC:%d:%s] using %s mode: %s\n",
 			    connector->base.id, connector->name,
-			    new_crtc->base.id, new_crtc->name,
+			    crtc->base.id, crtc->name,
 			    mode_type, modes[i]->name);
 
 		fallback = false;
-- 
2.45.3


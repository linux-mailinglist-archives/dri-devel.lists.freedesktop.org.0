Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B81898FAC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 22:34:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7611134F2;
	Thu,  4 Apr 2024 20:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCd+Xidg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C20D1134EE;
 Thu,  4 Apr 2024 20:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712262845; x=1743798845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yin6lQtbX5xtRnX34F8EIDWJr7mGh3s/nX/WdrXflCE=;
 b=DCd+Xidgy9q2KoaR6cT1ZUkMLjwm97q0vHWl9DGmuZllmFTV52dxA7Ed
 w4avlO7nzny7b/pjKaUVt7feGotBfZZaq50yRfqFo2Dh60qC+gaBmG+RC
 9fNbl3vNh10Hp9LSZt1TVs3ETSiEwRh8+cq9xEVEFdTDYpBtedBl5euqv
 c3/A/3W0fYydF/ycPRb3qoZP5A7cIOMH4mpWTKp0qJq7aLl4E7rAYlGw1
 G5c1ME7/fGoeCMsjmNgUBVaM4pUk4ddIV1WypXc2J8kWci0H1nEpDX2d3
 HuP8awdsnVbqdegHtLWFRdSxSqQRZI6mfosr4TjPuSRLGFmwU5Ppg2XV1 g==;
X-CSE-ConnectionGUID: 8w4n4iy5QPKG6gTNzbtgOg==
X-CSE-MsgGUID: yoW3xH7STAq9FH7TOWQ/vg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25019743"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="25019743"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 13:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="827790585"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="827790585"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 04 Apr 2024 13:34:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Apr 2024 23:34:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH 08/12] drm/client: Extract drm_connector_first_mode()
Date: Thu,  4 Apr 2024 23:33:32 +0300
Message-ID: <20240404203336.10454-9-ville.syrjala@linux.intel.com>
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

Use a consistent method for picking the first mode from the
connnector's mode list.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_client_modeset.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index 08fc896885dd..1fba6cd8d761 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -159,6 +159,13 @@ drm_connector_preferred_mode(struct drm_connector *connector, int width, int hei
 	return NULL;
 }
 
+static const struct drm_display_mode *
+drm_connector_first_mode(struct drm_connector *connector)
+{
+	return list_first_entry_or_null(&connector->modes,
+					struct drm_display_mode, head);
+}
+
 static const struct drm_display_mode *
 drm_connector_pick_cmdline_mode(struct drm_connector *connector)
 {
@@ -439,10 +446,8 @@ static bool drm_client_target_preferred(struct drm_connector *connectors[],
 			modes[i] = drm_connector_preferred_mode(connector, width, height);
 		}
 		/* No preferred modes, pick one off the list */
-		if (!modes[i] && !list_empty(&connector->modes)) {
-			list_for_each_entry(modes[i], &connector->modes, head)
-				break;
-		}
+		if (!modes[i])
+			modes[i] = drm_connector_first_mode(connector);
 		/*
 		 * In case of tiled mode if all tiles not present fallback to
 		 * first available non tiled mode.
@@ -684,9 +689,7 @@ static bool drm_client_firmware_config(struct drm_client_dev *client,
 		if (!modes[i] && !list_empty(&connector->modes)) {
 			DRM_DEBUG_KMS("using first mode listed on connector %s\n",
 				      connector->name);
-			modes[i] = list_first_entry(&connector->modes,
-						    struct drm_display_mode,
-						    head);
+			modes[i] = drm_connector_first_mode(connector);
 		}
 
 		/* last resort: use current mode */
-- 
2.43.2


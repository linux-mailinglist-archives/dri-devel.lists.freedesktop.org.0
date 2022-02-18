Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774E4BB64D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD6210F032;
	Fri, 18 Feb 2022 10:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DA710F02D;
 Fri, 18 Feb 2022 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178730; x=1676714730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ihmuO3QUdDD45gj7L+hNCKT40xp+aeIufb18aL8HXnc=;
 b=kHb+1b6PyoM8bg+1J5EwB6fTPOwbDLA3t9b9UV0yUx9NfnHorOkozd96
 A1u9cdAi1XRAm4rmvXJo7wu2rB3E6wbNHQ56kZCxymIikiZR7XM8/5kvC
 ebSk0TJ3vyryS9+ie/X5u0BNpacaH/D8UQbdF0F6beDBJV/5TDWMW6DAs
 15dHl/X8flRE1T52gM5rkietk9HO+JjftADFjHLBekeMvHPVCY7ae2G9r
 GWowhRgR85Ar7Czu2TXhheW7uNb4rKEfd5xxMFEYVx77MCtV50NmTR9n5
 iPXGnM2wwMe9+a7mNlaFULk2yLnC4q1z9n8+vWrYWoRJ51gAna+3mBkIZ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251041242"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="251041242"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="682442643"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 18 Feb 2022 02:05:27 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:26 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/22] drm/panel: Use drm_mode_duplicate()
Date: Fri, 18 Feb 2022 12:04:01 +0200
Message-Id: <20220218100403.7028-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the hand rolled drm_mode_duplicate() with the
real thing.

@is_dup@
@@
drm_mode_duplicate(...)
{ ... }

@depends on !is_dup@
expression dev, oldmode;
identifier newmode;
@@
- newmode = drm_mode_create(dev);
+ newmode = drm_mode_duplicate(dev, oldmode);
  ...
- drm_mode_copy(newmode, oldmode);

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-truly-nt35597.c    | 3 +--
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
index b24b92d93ea5..9ca5c7ff41d6 100644
--- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
+++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
@@ -446,7 +446,7 @@ static int truly_nt35597_get_modes(struct drm_panel *panel,
 	const struct nt35597_config *config;
 
 	config = ctx->config;
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_duplicate(connector->dev, config->dm);
 	if (!mode) {
 		dev_err(ctx->dev, "failed to create a new display mode\n");
 		return 0;
@@ -454,7 +454,6 @@ static int truly_nt35597_get_modes(struct drm_panel *panel,
 
 	connector->display_info.width_mm = config->width_mm;
 	connector->display_info.height_mm = config->height_mm;
-	drm_mode_copy(mode, config->dm);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index eb43503ec97b..db2443ac81d3 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -168,7 +168,8 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
 	struct visionox_rm69299 *ctx = panel_to_ctx(panel);
 	struct drm_display_mode *mode;
 
-	mode = drm_mode_create(connector->dev);
+	mode = drm_mode_duplicate(connector->dev,
+				  &visionox_rm69299_1080x2248_60hz);
 	if (!mode) {
 		dev_err(ctx->panel.dev, "failed to create a new display mode\n");
 		return 0;
@@ -176,7 +177,6 @@ static int visionox_rm69299_get_modes(struct drm_panel *panel,
 
 	connector->display_info.width_mm = 74;
 	connector->display_info.height_mm = 131;
-	drm_mode_copy(mode, &visionox_rm69299_1080x2248_60hz);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 	drm_mode_probed_add(connector, mode);
 
-- 
2.34.1


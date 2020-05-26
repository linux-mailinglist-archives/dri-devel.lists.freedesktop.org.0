Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CA1E29F7
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 20:23:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC926E255;
	Tue, 26 May 2020 18:23:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49D396E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 18:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590517403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7OjjA8amLYnyqilHHxB8H6n6KWHY9pD00xJgS/xdmTI=;
 b=VN686CrKO7LhGyQ5TaOhLJt9zvlSdgJlYNZljiyRCQmhWTVj7JwMqI9QrzDKwKmVWQ5+aR
 9OzIH+Kla3KkHmKhaZjndeVxz/HIeP3txyTEUIAjb0iNTsd7Mm0KWheI2BG+Dh0RIK0AGk
 pEr3pmKGOG+4fb83sSJX3X+VGe+5Rsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-qmoxgcvCPeW5OUIFwfxxWw-1; Tue, 26 May 2020 14:23:22 -0400
X-MC-Unique: qmoxgcvCPeW5OUIFwfxxWw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5836B1005510;
 Tue, 26 May 2020 18:23:20 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-120-19.rdu2.redhat.com
 [10.10.120.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D847D78B2D;
 Tue, 26 May 2020 18:23:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
Date: Tue, 26 May 2020 14:23:09 -0400
Message-Id: <20200526182313.4005-2-lyude@redhat.com>
In-Reply-To: <20200526182313.4005-1-lyude@redhat.com>
References: <20200526182313.4005-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Shawn C <shawn.c.lee@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is just an atomic version of mode_valid, which is intended to be
used for situations where a driver might need to check the atomic state
of objects other than the connector itself. One such example is with
MST, where the maximum possible bandwidth on a connector can change
dynamically irregardless of the display configuration.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h |  6 +-
 drivers/gpu/drm/drm_probe_helper.c         | 65 ++++++++++++++--------
 include/drm/drm_modeset_helper_vtables.h   | 41 ++++++++++++++
 3 files changed, 88 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index f0a66ef47e5ad..ca767cba6094d 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -73,8 +73,10 @@ enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
 enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
 					    const struct drm_display_mode *mode);
-enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
-					      struct drm_display_mode *mode);
+enum drm_mode_status
+drm_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx);
 
 struct drm_encoder *
 drm_connector_get_single_encoder(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 466dfbba82564..3132784736841 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -86,16 +86,17 @@ drm_mode_validate_flag(const struct drm_display_mode *mode,
 	return MODE_OK;
 }
 
-static enum drm_mode_status
+static int
 drm_mode_validate_pipeline(struct drm_display_mode *mode,
-			    struct drm_connector *connector)
+			   struct drm_connector *connector,
+			   struct drm_modeset_acquire_ctx *ctx)
 {
 	struct drm_device *dev = connector->dev;
-	enum drm_mode_status ret = MODE_OK;
 	struct drm_encoder *encoder;
+	int ret = MODE_OK;
 
 	/* Step 1: Validate against connector */
-	ret = drm_connector_mode_valid(connector, mode);
+	ret = drm_connector_mode_valid(connector, mode, ctx);
 	if (ret != MODE_OK)
 		return ret;
 
@@ -196,16 +197,23 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
 	return encoder_funcs->mode_valid(encoder, mode);
 }
 
-enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
-					      struct drm_display_mode *mode)
+int
+drm_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx)
 {
 	const struct drm_connector_helper_funcs *connector_funcs =
 		connector->helper_private;
 
-	if (!connector_funcs || !connector_funcs->mode_valid)
+	if (!connector_funcs)
 		return MODE_OK;
 
-	return connector_funcs->mode_valid(connector, mode);
+	if (connector_funcs->mode_valid_ctx)
+		return connector_funcs->mode_valid_ctx(connector, mode, ctx);
+	else if (connector_funcs->mode_valid)
+		return connector_funcs->mode_valid(connector, mode);
+	else
+		return MODE_OK;
 }
 
 #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
@@ -375,8 +383,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
  *      (if specified)
  *    - drm_mode_validate_flag() checks the modes against basic connector
  *      capabilities (interlace_allowed,doublescan_allowed,stereo_allowed)
- *    - the optional &drm_connector_helper_funcs.mode_valid helper can perform
- *      driver and/or sink specific checks
+ *    - the optional &drm_connector_helper_funcs.mode_valid or
+ *      &drm_connector_helper_funcs.mode_valid_ctx helpers can perform driver
+ *      and/or sink specific checks
  *    - the optional &drm_crtc_helper_funcs.mode_valid,
  *      &drm_bridge_funcs.mode_valid and &drm_encoder_helper_funcs.mode_valid
  *      helpers can perform driver and/or source specific checks which are also
@@ -507,22 +516,34 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 		mode_flags |= DRM_MODE_FLAG_3D_MASK;
 
 	list_for_each_entry(mode, &connector->modes, head) {
-		if (mode->status == MODE_OK)
-			mode->status = drm_mode_validate_driver(dev, mode);
+		if (mode->status != MODE_OK)
+			continue;
+
+		mode->status = drm_mode_validate_driver(dev, mode);
+		if (mode->status != MODE_OK)
+			continue;
 
-		if (mode->status == MODE_OK)
-			mode->status = drm_mode_validate_size(mode, maxX, maxY);
+		mode->status = drm_mode_validate_size(mode, maxX, maxY);
+		if (mode->status != MODE_OK)
+			continue;
 
-		if (mode->status == MODE_OK)
-			mode->status = drm_mode_validate_flag(mode, mode_flags);
+		mode->status = drm_mode_validate_flag(mode, mode_flags);
+		if (mode->status != MODE_OK)
+			continue;
 
-		if (mode->status == MODE_OK)
-			mode->status = drm_mode_validate_pipeline(mode,
-								  connector);
+		ret = drm_mode_validate_pipeline(mode, connector, &ctx);
+		if (ret == -EDEADLK) {
+			drm_modeset_backoff(&ctx);
+			goto retry;
+		} else if (WARN_ON_ONCE(ret < 0)) {
+			mode->status = MODE_BAD;
+		} else {
+			mode->status = ret;
+		}
 
-		if (mode->status == MODE_OK)
-			mode->status = drm_mode_validate_ycbcr420(mode,
-								  connector);
+		if (mode->status != MODE_OK)
+			continue;
+		mode->status = drm_mode_validate_ycbcr420(mode, connector);
 	}
 
 prune:
diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
index 421a30f084631..8f020c3424b2b 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -968,6 +968,47 @@ struct drm_connector_helper_funcs {
 	 */
 	enum drm_mode_status (*mode_valid)(struct drm_connector *connector,
 					   struct drm_display_mode *mode);
+
+	/**
+	 * @mode_valid_ctx:
+	 *
+	 * Callback to validate a mode for a connector, irrespective of the
+	 * specific display configuration.
+	 *
+	 * This callback is used by the probe helpers to filter the mode list
+	 * (which is usually derived from the EDID data block from the sink).
+	 * See e.g. drm_helper_probe_single_connector_modes().
+	 *
+	 * This function is optional, and is the atomic version of
+	 * &drm_connector_funcs.mode_valid.
+	 *
+	 * To allow for accessing the atomic state of modesetting objects, the
+	 * helper libraries always call this with ctx set to a valid context,
+	 * and &drm_mode_config.connection_mutex will always be locked with
+	 * the ctx parameter set to @ctx. This allows for taking additional
+	 * locks as required.
+	 *
+	 * Even though additional locks may be acquired, this callback is
+	 * still expected not to take any constraints into account which would
+	 * be influenced by the currently set display state - such constraints
+	 * should be handled in the driver's atomic check. For example, if a
+	 * connector shares display bandwidth with other connectors then it
+	 * would be ok to validate a mode uses against the maximum possible
+	 * bandwidth of the connector. But it wouldn't be ok to take the
+	 * current bandwidth usage of other connectors into account, as this
+	 * would change depending on the display state.
+	 *
+	 * Returns:
+	 *
+	 * Either &drm_mode_status.MODE_OK, one of the failure reasons in
+	 * &enum drm_mode_status, or -EDEADLK if a deadlock would have
+	 * occurred and we need to backoff.
+	 *
+	 */
+	int (*mode_valid_ctx)(struct drm_connector *connector,
+			      struct drm_display_mode *mode,
+			      struct drm_modeset_acquire_ctx *ctx);
+
 	/**
 	 * @best_encoder:
 	 *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

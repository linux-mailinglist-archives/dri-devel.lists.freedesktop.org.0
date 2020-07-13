Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF39B21DE3C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jul 2020 19:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65736E520;
	Mon, 13 Jul 2020 17:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4F86E51C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 17:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594660103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixSHFGV9lGPnDRAjtyXoG0YuMEUoNxJG9ssG/E3tB7I=;
 b=FNIWpQ0Mlw4HqMVxRBeKKXCb4fOAyCzb5IJ2aFG6619gQO6eVNzx8MWtYKQyQmZYE51Mn2
 etSAMKEnAkukPrL7x2VGwlQ++/TUKM2po7d9Y7+8mSaeXn9xJhQfhJRZFinGTrKM+2vaBB
 K/ulBJ+JZfglk79eWfV7YZYAI+syAZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-xnFiA8IhMu6FcW8eFkaFNA-1; Mon, 13 Jul 2020 13:08:19 -0400
X-MC-Unique: xnFiA8IhMu6FcW8eFkaFNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C4091089697;
 Mon, 13 Jul 2020 17:07:51 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-119-224.rdu2.redhat.com [10.10.119.224])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 719CF10013C0;
 Mon, 13 Jul 2020 17:07:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/probe_helper: Add
 drm_connector_helper_funcs.mode_valid_ctx
Date: Mon, 13 Jul 2020 13:07:45 -0400
Message-Id: <20200713170746.254388-2-lyude@redhat.com>
In-Reply-To: <20200713170746.254388-1-lyude@redhat.com>
References: <20200713170746.254388-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
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

Changes since v1:
* Use new drm logging functions
* Make some corrections in the mode_valid_ctx kdoc
* Return error codes or 0 from ->mode_valid_ctx() on fail, and store the
  drm_mode_status in an additional function parameter
Changes since v2:
* Don't accidentally assign ret to mode->status on success, or we'll
  squash legitimate mode validation results
* Don't forget to assign MODE_OK to status in drm_connector_mode_valid()
  if we have no callbacks
* Drop leftover hunk in drm_modes.h around enum drm_mode_status
Changes since v3:
* s/return ret/return 0/ in drm_mode_validate_pipeline()
* Minor cleanup in drm_connector_mode_valid()

Tested-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_crtc_helper_internal.h |   7 +-
 drivers/gpu/drm/drm_probe_helper.c         | 101 ++++++++++++++-------
 include/drm/drm_modeset_helper_vtables.h   |  42 +++++++++
 3 files changed, 113 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper_internal.h b/drivers/gpu/drm/drm_crtc_helper_internal.h
index f0a66ef47e5ad..25ce42e799952 100644
--- a/drivers/gpu/drm/drm_crtc_helper_internal.h
+++ b/drivers/gpu/drm/drm_crtc_helper_internal.h
@@ -73,8 +73,11 @@ enum drm_mode_status drm_crtc_mode_valid(struct drm_crtc *crtc,
 					 const struct drm_display_mode *mode);
 enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
 					    const struct drm_display_mode *mode);
-enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
-					      struct drm_display_mode *mode);
+int
+drm_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx,
+			 enum drm_mode_status *status);
 
 struct drm_encoder *
 drm_connector_get_single_encoder(struct drm_connector *connector);
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index e0ed58d291ed9..d6017726cc2a0 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -86,17 +86,19 @@ drm_mode_validate_flag(const struct drm_display_mode *mode,
 	return MODE_OK;
 }
 
-static enum drm_mode_status
+static int
 drm_mode_validate_pipeline(struct drm_display_mode *mode,
-			    struct drm_connector *connector)
+			   struct drm_connector *connector,
+			   struct drm_modeset_acquire_ctx *ctx,
+			   enum drm_mode_status *status)
 {
 	struct drm_device *dev = connector->dev;
-	enum drm_mode_status ret = MODE_OK;
 	struct drm_encoder *encoder;
+	int ret;
 
 	/* Step 1: Validate against connector */
-	ret = drm_connector_mode_valid(connector, mode);
-	if (ret != MODE_OK)
+	ret = drm_connector_mode_valid(connector, mode, ctx, status);
+	if (ret || *status != MODE_OK)
 		return ret;
 
 	/* Step 2: Validate against encoders and crtcs */
@@ -104,8 +106,8 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 		struct drm_bridge *bridge;
 		struct drm_crtc *crtc;
 
-		ret = drm_encoder_mode_valid(encoder, mode);
-		if (ret != MODE_OK) {
+		*status = drm_encoder_mode_valid(encoder, mode);
+		if (*status != MODE_OK) {
 			/* No point in continuing for crtc check as this encoder
 			 * will not accept the mode anyway. If all encoders
 			 * reject the mode then, at exit, ret will not be
@@ -114,10 +116,10 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 		}
 
 		bridge = drm_bridge_chain_get_first_bridge(encoder);
-		ret = drm_bridge_chain_mode_valid(bridge,
-						  &connector->display_info,
-						  mode);
-		if (ret != MODE_OK) {
+		*status = drm_bridge_chain_mode_valid(bridge,
+						      &connector->display_info,
+						      mode);
+		if (*status != MODE_OK) {
 			/* There is also no point in continuing for crtc check
 			 * here. */
 			continue;
@@ -127,17 +129,17 @@ drm_mode_validate_pipeline(struct drm_display_mode *mode,
 			if (!drm_encoder_crtc_ok(encoder, crtc))
 				continue;
 
-			ret = drm_crtc_mode_valid(crtc, mode);
-			if (ret == MODE_OK) {
+			*status = drm_crtc_mode_valid(crtc, mode);
+			if (*status == MODE_OK) {
 				/* If we get to this point there is at least
 				 * one combination of encoder+crtc that works
 				 * for this mode. Lets return now. */
-				return ret;
+				return 0;
 			}
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static int drm_helper_probe_add_cmdline_mode(struct drm_connector *connector)
@@ -198,16 +200,27 @@ enum drm_mode_status drm_encoder_mode_valid(struct drm_encoder *encoder,
 	return encoder_funcs->mode_valid(encoder, mode);
 }
 
-enum drm_mode_status drm_connector_mode_valid(struct drm_connector *connector,
-					      struct drm_display_mode *mode)
+int
+drm_connector_mode_valid(struct drm_connector *connector,
+			 struct drm_display_mode *mode,
+			 struct drm_modeset_acquire_ctx *ctx,
+			 enum drm_mode_status *status)
 {
 	const struct drm_connector_helper_funcs *connector_funcs =
 		connector->helper_private;
+	int ret = 0;
+
+	if (!connector_funcs)
+		*status = MODE_OK;
+	else if (connector_funcs->mode_valid_ctx)
+		ret = connector_funcs->mode_valid_ctx(connector, mode, ctx,
+						      status);
+	else if (connector_funcs->mode_valid)
+		*status = connector_funcs->mode_valid(connector, mode);
+	else
+		*status = MODE_OK;
 
-	if (!connector_funcs || !connector_funcs->mode_valid)
-		return MODE_OK;
-
-	return connector_funcs->mode_valid(connector, mode);
+	return ret;
 }
 
 #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
@@ -385,8 +398,9 @@ EXPORT_SYMBOL(drm_helper_probe_detect);
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
@@ -517,22 +531,39 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
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
+		ret = drm_mode_validate_pipeline(mode, connector, &ctx,
+						 &mode->status);
+		if (ret) {
+			drm_dbg_kms(dev,
+				    "drm_mode_validate_pipeline failed: %d\n",
+				    ret);
+
+			if (drm_WARN_ON_ONCE(dev, ret != -EDEADLK)) {
+				mode->status = MODE_ERROR;
+			} else {
+				drm_modeset_backoff(&ctx);
+				goto retry;
+			}
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
index 421a30f084631..4efec30f8badc 100644
--- a/include/drm/drm_modeset_helper_vtables.h
+++ b/include/drm/drm_modeset_helper_vtables.h
@@ -968,6 +968,48 @@ struct drm_connector_helper_funcs {
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
+	 * &drm_connector_helper_funcs.mode_valid.
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
+	 * would be ok to validate the minimum bandwidth requirement of a mode
+	 * against the maximum possible bandwidth of the connector. But it
+	 * wouldn't be ok to take the current bandwidth usage of other
+	 * connectors into account, as this would change depending on the
+	 * display state.
+	 *
+	 * Returns:
+	 * 0 if &drm_connector_helper_funcs.mode_valid_ctx succeeded and wrote
+	 * the &enum drm_mode_status value to @status, or a negative error
+	 * code otherwise.
+	 *
+	 */
+	int (*mode_valid_ctx)(struct drm_connector *connector,
+			      struct drm_display_mode *mode,
+			      struct drm_modeset_acquire_ctx *ctx,
+			      enum drm_mode_status *status);
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

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D022C132AD0
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 17:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906566E108;
	Tue,  7 Jan 2020 16:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657BC6E101
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 16:12:01 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DE00A292342;
 Tue,  7 Jan 2020 16:11:59 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 2/5] Revert "drm/bridge: Add the necessary bits to support bus
 format negotiation"
Date: Tue,  7 Jan 2020 17:11:52 +0100
Message-Id: <20200107161155.601100-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200107161155.601100-1-boris.brezillon@collabora.com>
References: <20200107161155.601100-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit e351e4d5eaec713b2d4780c79f68702e88f2a212.
---
 drivers/gpu/drm/drm_bridge.c | 267 +----------------------------------
 include/drm/drm_bridge.h     | 124 ----------------
 2 files changed, 1 insertion(+), 390 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 37400607e9b7..8e4b799150b0 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -671,261 +671,13 @@ static int drm_atomic_bridge_check(struct drm_bridge *bridge,
 	return 0;
 }
 
-/**
- * drm_atomic_helper_bridge_propagate_bus_fmt() - Propagate output format to
- *						  the input end of a bridge
- * @bridge: bridge control structure
- * @bridge_state: new bridge state
- * @crtc_state: new CRTC state
- * @conn_state: new connector state
- * @output_fmt: tested output bus format
- * @num_input_fmts: will contain the size of the returned array
- *
- * This helper is a pluggable implementation of the
- * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that don't
- * modify the bus configuration between their input and their output. It
- * returns an array of input formats with a single element set to @output_fmt.
- *
- * RETURNS:
- * a valid format array of size @num_input_fmts, or NULL if the allocation
- * failed
- */
-u32 *
-drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state,
-					u32 output_fmt,
-					unsigned int *num_input_fmts)
-{
-	u32 *input_fmts;
-
-	input_fmts = kzalloc(sizeof(*input_fmts), GFP_KERNEL);
-	if (!input_fmts) {
-		*num_input_fmts = 0;
-		return NULL;
-	}
-
-	*num_input_fmts = 1;
-	input_fmts[0] = output_fmt;
-	return input_fmts;
-}
-EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
-
-static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
-				    struct drm_bridge *cur_bridge,
-				    struct drm_crtc_state *crtc_state,
-				    struct drm_connector_state *conn_state,
-				    u32 out_bus_fmt)
-{
-	struct drm_bridge_state *cur_state;
-	unsigned int num_in_bus_fmts, i;
-	struct drm_bridge *prev_bridge;
-	u32 *in_bus_fmts;
-	int ret;
-
-	prev_bridge = drm_bridge_get_prev_bridge(cur_bridge);
-	cur_state = drm_atomic_get_new_bridge_state(crtc_state->state,
-						    cur_bridge);
-	if (WARN_ON(!cur_state))
-		return -EINVAL;
-
-	/*
-	 * If bus format negotiation is not supported by this bridge, let's
-	 * pass MEDIA_BUS_FMT_FIXED to the previous bridge in the chain and
-	 * hope that it can handle this situation gracefully (by providing
-	 * appropriate default values).
-	 */
-	if (!cur_bridge->funcs->atomic_get_input_bus_fmts) {
-		if (cur_bridge != first_bridge) {
-			ret = select_bus_fmt_recursive(first_bridge,
-						       prev_bridge, crtc_state,
-						       conn_state,
-						       MEDIA_BUS_FMT_FIXED);
-			if (ret)
-				return ret;
-		}
-
-		cur_state->input_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
-		cur_state->output_bus_cfg.format = out_bus_fmt;
-		return 0;
-	}
-
-	in_bus_fmts = cur_bridge->funcs->atomic_get_input_bus_fmts(cur_bridge,
-							cur_state,
-							crtc_state,
-							conn_state,
-							out_bus_fmt,
-							&num_in_bus_fmts);
-	if (!num_in_bus_fmts)
-		return -ENOTSUPP;
-	else if (!in_bus_fmts)
-		return -ENOMEM;
-
-	if (first_bridge == cur_bridge) {
-		cur_state->input_bus_cfg.format = in_bus_fmts[0];
-		cur_state->output_bus_cfg.format = out_bus_fmt;
-		kfree(in_bus_fmts);
-		return 0;
-	}
-
-	for (i = 0; i < num_in_bus_fmts; i++) {
-		ret = select_bus_fmt_recursive(first_bridge, prev_bridge,
-					       crtc_state, conn_state,
-					       in_bus_fmts[i]);
-		if (ret != -ENOTSUPP)
-			break;
-	}
-
-	if (!ret) {
-		cur_state->input_bus_cfg.format = in_bus_fmts[i];
-		cur_state->output_bus_cfg.format = out_bus_fmt;
-	}
-
-	kfree(in_bus_fmts);
-	return ret;
-}
-
-/*
- * This function is called by &drm_atomic_bridge_chain_check() just before
- * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
- * It performs bus format negotiation between bridge elements. The negotiation
- * happens in reverse order, starting from the last element in the chain up to
- * @bridge.
- *
- * Negotiation starts by retrieving supported output bus formats on the last
- * bridge element and testing them one by one. The test is recursive, meaning
- * that for each tested output format, the whole chain will be walked backward,
- * and each element will have to choose an input bus format that can be
- * transcoded to the requested output format. When a bridge element does not
- * support transcoding into a specific output format -ENOTSUPP is returned and
- * the next bridge element will have to try a different format. If none of the
- * combinations worked, -ENOTSUPP is returned and the atomic modeset will fail.
- *
- * This implementation is relying on
- * &drm_bridge_funcs.atomic_get_output_bus_fmts() and
- * &drm_bridge_funcs.atomic_get_input_bus_fmts() to gather supported
- * input/output formats.
- *
- * When &drm_bridge_funcs.atomic_get_output_bus_fmts() is not implemented by
- * the last element of the chain, &drm_atomic_bridge_chain_select_bus_fmts()
- * tries a single format: &drm_connector.display_info.bus_formats[0] if
- * available, MEDIA_BUS_FMT_FIXED otherwise.
- *
- * When &drm_bridge_funcs.atomic_get_input_bus_fmts() is not implemented,
- * &drm_atomic_bridge_chain_select_bus_fmts() skips the negotiation on the
- * bridge element that lacks this hook and asks the previous element in the
- * chain to try MEDIA_BUS_FMT_FIXED. It's up to bridge drivers to decide what
- * to do in that case (fail if they want to enforce bus format negotiation, or
- * provide a reasonable default if they need to support pipelines where not
- * all elements support bus format negotiation).
- */
-static int
-drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
-{
-	struct drm_connector *conn = conn_state->connector;
-	struct drm_encoder *encoder = bridge->encoder;
-	struct drm_bridge_state *last_bridge_state;
-	unsigned int i, num_out_bus_fmts;
-	struct drm_bridge *last_bridge;
-	u32 *out_bus_fmts;
-	int ret = 0;
-
-	last_bridge = list_last_entry(&encoder->bridge_chain,
-				      struct drm_bridge, chain_node);
-	last_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
-							    last_bridge);
-	if (WARN_ON(!last_bridge_state))
-		return -EINVAL;
-
-	if (last_bridge->funcs->atomic_get_output_bus_fmts) {
-		const struct drm_bridge_funcs *funcs = last_bridge->funcs;
-
-		out_bus_fmts = funcs->atomic_get_output_bus_fmts(last_bridge,
-							last_bridge_state,
-							crtc_state,
-							conn_state,
-							&num_out_bus_fmts);
-		if (!num_out_bus_fmts)
-			return -ENOTSUPP;
-		else if (!out_bus_fmts)
-			return -ENOMEM;
-	} else {
-		num_out_bus_fmts = 1;
-		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
-		if (!out_bus_fmts)
-			return -ENOMEM;
-
-		if (conn->display_info.num_bus_formats &&
-		    conn->display_info.bus_formats)
-			out_bus_fmts[0] = conn->display_info.bus_formats[0];
-		else
-			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
-	}
-
-	for (i = 0; i < num_out_bus_fmts; i++) {
-		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
-					       conn_state, out_bus_fmts[i]);
-		if (ret != -ENOTSUPP)
-			break;
-	}
-
-	kfree(out_bus_fmts);
-
-	return ret;
-}
-
-static void
-drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
-				      struct drm_connector *conn,
-				      struct drm_atomic_state *state)
-{
-	struct drm_bridge_state *bridge_state, *next_bridge_state;
-	struct drm_bridge *next_bridge;
-	u32 output_flags;
-
-	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
-	next_bridge = drm_bridge_get_next_bridge(bridge);
-
-	/*
-	 * Let's try to apply the most common case here, that is, propagate
-	 * display_info flags for the last bridge, and propagate the input
-	 * flags of the next bridge element to the output end of the current
-	 * bridge when the bridge is not the last one.
-	 * There are exceptions to this rule, like when signal inversion is
-	 * happening at the board level, but that's something drivers can deal
-	 * with from their &drm_bridge_funcs.atomic_check() implementation by
-	 * simply overriding the flags value we've set here.
-	 */
-	if (!next_bridge) {
-		output_flags = conn->display_info.bus_flags;
-	} else {
-		next_bridge_state = drm_atomic_get_new_bridge_state(state,
-								next_bridge);
-		output_flags = next_bridge_state->input_bus_cfg.flags;
-	}
-
-	bridge_state->output_bus_cfg.flags = output_flags;
-
-	/*
-	 * Propage the output flags to the input end of the bridge. Again, it's
-	 * not necessarily what all bridges want, but that's what most of them
-	 * do, and by doing that by default we avoid forcing drivers to
-	 * duplicate the "dummy propagation" logic.
-	 */
-	bridge_state->input_bus_cfg.flags = output_flags;
-}
-
 /**
  * drm_atomic_bridge_chain_check() - Do an atomic check on the bridge chain
  * @bridge: bridge control structure
  * @crtc_state: new CRTC state
  * @conn_state: new connector state
  *
- * First trigger a bus format negotiation before calling
- * &drm_bridge_funcs.atomic_check() (falls back on
+ * Calls &drm_bridge_funcs.atomic_check() (falls back on
  * &drm_bridge_funcs.mode_fixup()) op for all the bridges in the encoder chain,
  * starting from the last bridge to the first. These are called before calling
  * &drm_encoder_helper_funcs.atomic_check()
@@ -937,29 +689,12 @@ int drm_atomic_bridge_chain_check(struct drm_bridge *bridge,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_connector_state *conn_state)
 {
-	struct drm_connector *conn = conn_state->connector;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge *iter;
-	int ret;
-
-	ret = drm_atomic_bridge_chain_select_bus_fmts(bridge, crtc_state,
-						      conn_state);
-	if (ret)
-		return ret;
 
 	list_for_each_entry_reverse(iter, &encoder->bridge_chain, chain_node) {
 		int ret;
 
-		/*
-		 * Bus flags are propagated by default. If a bridge needs to
-		 * tweak the input bus flags for any reason, it should happen
-		 * in its &drm_bridge_funcs.atomic_check() implementation such
-		 * that preceding bridges in the chain can propagate the new
-		 * bus flags.
-		 */
-		drm_atomic_bridge_propagate_bus_flags(iter, conn,
-						      crtc_state->state);
-
 		ret = drm_atomic_bridge_check(iter, crtc_state, conn_state);
 		if (ret)
 			return ret;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 46e15526b087..ae0595c70132 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -35,38 +35,6 @@ struct drm_bridge;
 struct drm_bridge_timings;
 struct drm_panel;
 
-/**
- * struct drm_bus_cfg - bus configuration
- *
- * This structure stores the configuration of a physical bus between two
- * components in an output pipeline, usually between two bridges, an encoder
- * and a bridge, or a bridge and a connector.
- *
- * The bus configuration is stored in &drm_bridge_state separately for the
- * input and output buses, as seen from the point of view of each bridge. The
- * bus configuration of a bridge output is usually identical to the
- * configuration of the next bridge's input, but may differ if the signals are
- * modified between the two bridges, for instance by an inverter on the board.
- * The input and output configurations of a bridge may differ if the bridge
- * modifies the signals internally, for instance by performing format
- * conversion, or modifying signals polarities.
- */
-struct drm_bus_cfg {
-	/**
-	 * @format: format used on this bus (one of the MEDIA_BUS_FMT_* format)
-	 *
-	 * This field should not be directly modified by drivers
-	 * (&drm_atomic_bridge_chain_select_bus_fmts() takes care of the bus
-	 * format negotiation).
-	 */
-	u32 format;
-
-	/**
-	 * @flags: DRM_BUS_* flags used on this bus
-	 */
-	u32 flags;
-};
-
 /**
  * struct drm_bridge_state - Atomic bridge state object
  * @base: inherit from &drm_private_state
@@ -76,16 +44,6 @@ struct drm_bridge_state {
 	struct drm_private_state base;
 
 	struct drm_bridge *bridge;
-
-	/**
-	 * @input_bus_cfg: input bus configuration
-	 */
-	struct drm_bus_cfg input_bus_cfg;
-
-	/**
-	 * @output_bus_cfg: input bus configuration
-	 */
-	struct drm_bus_cfg output_bus_cfg;
 };
 
 static inline struct drm_bridge_state *
@@ -429,72 +387,6 @@ struct drm_bridge_funcs {
 	void (*atomic_destroy_state)(struct drm_bridge *bridge,
 				     struct drm_bridge_state *state);
 
-	/**
-	 * @atomic_get_output_bus_fmts:
-	 *
-	 * Return the supported bus formats on the output end of a bridge.
-	 * The returned array must be allocated with kmalloc() and will be
-	 * freed by the caller. If the allocation fails, NULL should be
-	 * returned. num_output_fmts must be set to the returned array size.
-	 * Formats listed in the returned array should be listed in decreasing
-	 * preference order (the core will try all formats until it finds one
-	 * that works).
-	 *
-	 * This method is only called on the last element of the bridge chain
-	 * as part of the bus format negotiation process that happens in
-	 * &drm_atomic_bridge_chain_select_bus_fmts().
-	 * This method is optional. When not implemented, the core will
-	 * fall back to &drm_connector.display_info.bus_formats[0] if
-	 * &drm_connector.display_info.num_bus_formats > 0,
-	 * or to MEDIA_BUS_FMT_FIXED otherwise.
-	 */
-	u32 *(*atomic_get_output_bus_fmts)(struct drm_bridge *bridge,
-					   struct drm_bridge_state *bridge_state,
-					   struct drm_crtc_state *crtc_state,
-					   struct drm_connector_state *conn_state,
-					   unsigned int *num_output_fmts);
-
-	/**
-	 * @atomic_get_input_bus_fmts:
-	 *
-	 * Return the supported bus formats on the input end of a bridge for
-	 * a specific output bus format.
-	 *
-	 * The returned array must be allocated with kmalloc() and will be
-	 * freed by the caller. If the allocation fails, NULL should be
-	 * returned. num_output_fmts must be set to the returned array size.
-	 * Formats listed in the returned array should be listed in decreasing
-	 * preference order (the core will try all formats until it finds one
-	 * that works). When the format is not supported NULL should be
-	 * returned and *num_output_fmts should be set to 0.
-	 *
-	 * This method is called on all elements of the bridge chain as part of
-	 * the bus format negotiation process that happens in
-	 * &drm_atomic_bridge_chain_select_bus_fmts().
-	 * This method is optional. When not implemented, the core will bypass
-	 * bus format negotiation on this element of the bridge without
-	 * failing, and the previous element in the chain will be passed
-	 * MEDIA_BUS_FMT_FIXED as its output bus format.
-	 *
-	 * Bridge drivers that need to support being linked to bridges that are
-	 * not supporting bus format negotiation should handle the
-	 * output_fmt == MEDIA_BUS_FMT_FIXED case appropriately, by selecting a
-	 * sensible default value or extracting this information from somewhere
-	 * else (FW property, &drm_display_mode, &drm_display_info, ...)
-	 *
-	 * Note: Even if input format selection on the first bridge has no
-	 * impact on the negotiation process (bus format negotiation stops once
-	 * we reach the first element of the chain), drivers are expected to
-	 * return accurate input formats as the input format may be used to
-	 * configure the CRTC output appropriately.
-	 */
-	u32 *(*atomic_get_input_bus_fmts)(struct drm_bridge *bridge,
-					  struct drm_bridge_state *bridge_state,
-					  struct drm_crtc_state *crtc_state,
-					  struct drm_connector_state *conn_state,
-					  u32 output_fmt,
-					  unsigned int *num_input_fmts);
-
 	/**
 	 * @atomic_check:
 	 *
@@ -509,14 +401,6 @@ struct drm_bridge_funcs {
 	 * called when &drm_bridge_funcs.atomic_check() is implemented, so only
 	 * one of them should be provided.
 	 *
-	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
-	 * &drm_bridge_state.output_bus_cfg.flags it should should happen in
-	 * this function. By default the &drm_bridge_state.output_bus_cfg.flags
-	 * field is set to the next bridge
-	 * &drm_bridge_state.input_bus_cfg.flags value or
-	 * &drm_connector.display_info.bus_flags if the bridge is the last
-	 * element in the chain.
-	 *
 	 * RETURNS:
 	 * zero if the check passed, a negative error code otherwise.
 	 */
@@ -704,14 +588,6 @@ void drm_atomic_bridge_chain_pre_enable(struct drm_bridge *bridge,
 void drm_atomic_bridge_chain_enable(struct drm_bridge *bridge,
 				    struct drm_atomic_state *state);
 
-u32 *
-drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
-					struct drm_bridge_state *bridge_state,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state,
-					u32 output_fmt,
-					unsigned int *num_input_fmts);
-
 void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
 				      struct drm_bridge_state *state);
 void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

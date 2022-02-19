Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4C4BC362
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566E610EC04;
	Sat, 19 Feb 2022 00:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6B910E180
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:06 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 15DBF83B9B;
 Sat, 19 Feb 2022 01:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230544;
 bh=0ESrqcar5CMMLHRigFsBSOOSdNLNe6yhKBL5yl8yX3U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YptVKqHqMJfyOsTxBdQWoS23C6WsVilLeXDy5t94ySMOyjKqDbDyw89KYNlfGV6fS
 nENVdtdg5dHFxZSlUerFGNVp6wKxeHvUEU+YlTG26JlQKKOCvtkMFMPz4ksCQN0kr6
 mhbMdRTeA48Av3CdZkEJm7aE9VsyGqlpICX0eHLxxuhhhrqs73Ve+1XknEWPbocXFb
 cqQrUgD/QOgrprvg+4aCRPWumjuBoxdCpwbDrLXDcs0tai5peHfBgVky/Hh/ujdmq2
 eSpLQj9IQqDchEJLgK7IwLkDitbl3RqHdPc371fQdqxVDeXgnRcYNgFo8zAvC5s5rA
 E+28noutAMH4w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/bridge: Add new atomic_get_input_bus_cfgs callback
Date: Sat, 19 Feb 2022 01:28:39 +0100
Message-Id: <20220219002844.362157-3-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220219002844.362157-1-marex@denx.de>
References: <20220219002844.362157-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add new .atomic_get_input_bus_cfgs callback into struct drm_bridge_funcs {}.
This is an extended version of .atomic_get_input_bus_fmts callback which
only returns list of bus formats supported by a bridge and provides no way
to e.g. limit clock frequency required between neighboring bridges.

The new .atomic_get_input_bus_cfgs callback returns list of struct drm_bus_cfg,
which currently contains format and bus flags, but can be extended with other
members, like desired clock frequency, as required.

The .atomic_get_input_bus_cfgs should replace the .atomic_get_input_bus_fmts
once drivers get converted over. The conversion could be done using a script.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_bridge.c | 47 ++++++++++++++++++++++++------------
 include/drm/drm_bridge.h     | 42 ++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f052d50106758..a069c50cc7d6b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -841,7 +841,8 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	 * hope that it can handle this situation gracefully (by providing
 	 * appropriate default values).
 	 */
-	if (!cur_bridge->funcs->atomic_get_input_bus_fmts) {
+	if (!cur_bridge->funcs->atomic_get_input_bus_cfgs &&
+	    !cur_bridge->funcs->atomic_get_input_bus_fmts) {
 		if (cur_bridge != first_bridge) {
 			fixed_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
 			ret = select_bus_fmt_recursive(first_bridge,
@@ -865,32 +866,48 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	}
 
 	/*
-	 * If the driver implements ->atomic_get_input_bus_fmts() it
-	 * should also implement the atomic state hooks.
+	 * If the driver implements ->atomic_get_input_bus_cfgs()
+	 * or legacy ->atomic_get_input_bus_fmts() it should also
+	 * implement the atomic state hooks.
 	 */
 	if (WARN_ON(!cur_state))
 		return -EINVAL;
 
-	in_bus_fmts = cur_bridge->funcs->atomic_get_input_bus_fmts(cur_bridge,
+	if (cur_bridge->funcs->atomic_get_input_bus_cfgs) {
+		in_bus_cfgs = cur_bridge->funcs->atomic_get_input_bus_cfgs(
+							cur_bridge,
+							cur_state,
+							crtc_state,
+							conn_state,
+							out_bus_cfg,
+							&num_in_bus_fmts);
+		if (!num_in_bus_fmts)
+			return -ENOTSUPP;
+		else if (!in_bus_cfgs)
+			return -ENOMEM;
+	} else {
+		in_bus_fmts = cur_bridge->funcs->atomic_get_input_bus_fmts(
+							cur_bridge,
 							cur_state,
 							crtc_state,
 							conn_state,
 							out_bus_cfg->format,
 							&num_in_bus_fmts);
-	if (!num_in_bus_fmts)
-		return -ENOTSUPP;
-	else if (!in_bus_fmts)
-		return -ENOMEM;
+		if (!num_in_bus_fmts)
+			return -ENOTSUPP;
+		else if (!in_bus_fmts)
+			return -ENOMEM;
 
-	/* Transcribe in_bus_fmts to in_bus_cfgs */
-	in_bus_cfgs = kcalloc(num_in_bus_fmts, sizeof(*in_bus_cfgs), GFP_KERNEL);
-	if (!in_bus_cfgs)
-		return -ENOMEM;
+		/* Transcribe in_bus_fmts to in_bus_cfgs */
+		in_bus_cfgs = kcalloc(num_in_bus_fmts, sizeof(*in_bus_cfgs), GFP_KERNEL);
+		if (!in_bus_cfgs)
+			return -ENOMEM;
 
-	for (i = 0; i < num_in_bus_fmts; i++)
-		in_bus_cfgs[i].format = in_bus_fmts[i];
+		for (i = 0; i < num_in_bus_fmts; i++)
+			in_bus_cfgs[i].format = in_bus_fmts[i];
 
-	kfree(in_bus_fmts);
+		kfree(in_bus_fmts);
+	}
 
 	if (first_bridge == cur_bridge) {
 		cur_state->input_bus_cfg.format = in_bus_cfgs[0].format;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 061d87313fac9..b2fe0ee7294b5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -439,6 +439,48 @@ struct drm_bridge_funcs {
 					   struct drm_connector_state *conn_state,
 					   unsigned int *num_output_fmts);
 
+	/**
+	 * @atomic_get_input_bus_cfgs:
+	 *
+	 * Return the supported bus configurations on the input end of a bridge
+	 * for a specific output bus format.
+	 *
+	 * The returned array must be allocated with kmalloc() and will be
+	 * freed by the caller. If the allocation fails, NULL should be
+	 * returned. num_output_fmts must be set to the returned array size.
+	 * Formats listed in the returned array should be listed in decreasing
+	 * preference order (the core will try all formats until it finds one
+	 * that works). When the format is not supported NULL should be
+	 * returned and num_output_fmts should be set to 0.
+	 *
+	 * This method is called on all elements of the bridge chain as part of
+	 * the bus format negotiation process that happens in
+	 * drm_atomic_bridge_chain_select_bus_fmts().
+	 * This method is optional. When not implemented, the core will bypass
+	 * bus format negotiation on this element of the bridge without
+	 * failing, and the previous element in the chain will be passed
+	 * MEDIA_BUS_FMT_FIXED as its output bus format.
+	 *
+	 * Bridge drivers that need to support being linked to bridges that are
+	 * not supporting bus format negotiation should handle the
+	 * output_fmt == MEDIA_BUS_FMT_FIXED case appropriately, by selecting a
+	 * sensible default value or extracting this information from somewhere
+	 * else (FW property, &drm_display_mode, &drm_display_info, ...)
+	 *
+	 * Note: Even if input format selection on the first bridge has no
+	 * impact on the negotiation process (bus format negotiation stops once
+	 * we reach the first element of the chain), drivers are expected to
+	 * return accurate input formats as the input format may be used to
+	 * configure the CRTC output appropriately.
+	 */
+	struct drm_bus_cfg *(*atomic_get_input_bus_cfgs)
+					(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state,
+					 struct drm_bus_cfg *output_cfg,
+					 unsigned int *num_input_cfgs);
+
 	/**
 	 * @atomic_get_input_bus_fmts:
 	 *
-- 
2.34.1


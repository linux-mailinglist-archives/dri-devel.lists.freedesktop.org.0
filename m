Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB994BC361
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 01:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5C610EAD0;
	Sat, 19 Feb 2022 00:29:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEAB10E1CE
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 00:29:06 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A6E8283B93;
 Sat, 19 Feb 2022 01:29:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645230544;
 bh=L+B1tFSSDDT9W0fLMjFIiTtoyd9xng4Xae+xdTJ9xMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i9oD1qLDAcww9/hUQEEUfGmi97kIaf2uiwgtoLFWzL/nKPvhfggJ7dhbgvWCx4JMk
 NgFDoXQtCWGVkgSPZRsHWNXBu38WFgWON0gKETOPjVUDii+rQMXiPLs1F/h9mItT+u
 T/Sy0F7u4LkSQzG/2JEWR+hcnq0Cw1ROR2wwMJuyaZyLehrJ3b50moNIqgf9+lvCX6
 cOgP8TBITyXwBe3XhT3KjdxFCM8l+DMPKHnP+sR5ijiXFI9YCIPyhxdI7VNvJT5ig+
 LtJ6IBr84L1NA+yhJhbyw3zmtV1bKOHESFZauGiAHN866SvoK0IdDgP5Z4qttXWpzH
 0IB76BY5BMD0w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/bridge: Pass struct drm_bus_cfg to
 select_bus_fmt_recursive()
Date: Sat, 19 Feb 2022 01:28:38 +0100
Message-Id: <20220219002844.362157-2-marex@denx.de>
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

Pass the entire struct drm_bus_cfg {} to select_bus_fmt_recursive()
instead of only u32 out_bus_fmt which contains only the pixel format.
This would permit passing more bus format data around during the
bridge-to-bridge format negotiation.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_bridge.c | 39 +++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebcb..f052d50106758 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -821,11 +821,13 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 				    struct drm_bridge *cur_bridge,
 				    struct drm_crtc_state *crtc_state,
 				    struct drm_connector_state *conn_state,
-				    u32 out_bus_fmt)
+				    struct drm_bus_cfg *out_bus_cfg)
 {
 	struct drm_bridge_state *cur_state;
 	unsigned int num_in_bus_fmts, i;
 	struct drm_bridge *prev_bridge;
+	struct drm_bus_cfg fixed_bus_cfg;
+	struct drm_bus_cfg *in_bus_cfgs;
 	u32 *in_bus_fmts;
 	int ret;
 
@@ -841,10 +843,11 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	 */
 	if (!cur_bridge->funcs->atomic_get_input_bus_fmts) {
 		if (cur_bridge != first_bridge) {
+			fixed_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
 			ret = select_bus_fmt_recursive(first_bridge,
 						       prev_bridge, crtc_state,
 						       conn_state,
-						       MEDIA_BUS_FMT_FIXED);
+						       &fixed_bus_cfg);
 			if (ret)
 				return ret;
 		}
@@ -855,7 +858,7 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 		 */
 		if (cur_state) {
 			cur_state->input_bus_cfg.format = MEDIA_BUS_FMT_FIXED;
-			cur_state->output_bus_cfg.format = out_bus_fmt;
+			cur_state->output_bus_cfg.format = out_bus_cfg->format;
 		}
 
 		return 0;
@@ -872,34 +875,44 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 							cur_state,
 							crtc_state,
 							conn_state,
-							out_bus_fmt,
+							out_bus_cfg->format,
 							&num_in_bus_fmts);
 	if (!num_in_bus_fmts)
 		return -ENOTSUPP;
 	else if (!in_bus_fmts)
 		return -ENOMEM;
 
+	/* Transcribe in_bus_fmts to in_bus_cfgs */
+	in_bus_cfgs = kcalloc(num_in_bus_fmts, sizeof(*in_bus_cfgs), GFP_KERNEL);
+	if (!in_bus_cfgs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_in_bus_fmts; i++)
+		in_bus_cfgs[i].format = in_bus_fmts[i];
+
+	kfree(in_bus_fmts);
+
 	if (first_bridge == cur_bridge) {
-		cur_state->input_bus_cfg.format = in_bus_fmts[0];
-		cur_state->output_bus_cfg.format = out_bus_fmt;
-		kfree(in_bus_fmts);
+		cur_state->input_bus_cfg.format = in_bus_cfgs[0].format;
+		cur_state->output_bus_cfg.format = out_bus_cfg->format;
+		kfree(in_bus_cfgs);
 		return 0;
 	}
 
 	for (i = 0; i < num_in_bus_fmts; i++) {
 		ret = select_bus_fmt_recursive(first_bridge, prev_bridge,
 					       crtc_state, conn_state,
-					       in_bus_fmts[i]);
+					       &(in_bus_cfgs[i]));
 		if (ret != -ENOTSUPP)
 			break;
 	}
 
 	if (!ret) {
-		cur_state->input_bus_cfg.format = in_bus_fmts[i];
-		cur_state->output_bus_cfg.format = out_bus_fmt;
+		cur_state->input_bus_cfg.format = in_bus_cfgs[i].format;
+		cur_state->output_bus_cfg.format = out_bus_cfg->format;
 	}
 
-	kfree(in_bus_fmts);
+	kfree(in_bus_cfgs);
 	return ret;
 }
 
@@ -947,6 +960,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts;
 	struct drm_bridge *last_bridge;
+	struct drm_bus_cfg out_bus_cfg;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
@@ -988,8 +1002,9 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	}
 
 	for (i = 0; i < num_out_bus_fmts; i++) {
+		out_bus_cfg.format = out_bus_fmts[i];
 		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
-					       conn_state, out_bus_fmts[i]);
+					       conn_state, &out_bus_cfg);
 		if (ret != -ENOTSUPP)
 			break;
 	}
-- 
2.34.1


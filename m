Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 069191E18F0
	for <lists+dri-devel@lfdr.de>; Tue, 26 May 2020 03:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F46E05F;
	Tue, 26 May 2020 01:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC089DFA
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 01:15:47 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F18AE3D;
 Tue, 26 May 2020 03:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590455745;
 bh=PqFQqx8I8K5Z5pXRytXDMhyzkoDJeHUYQvMz6KbBM2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uyc0wgYPVoyOS23PDAs+09qBc+h+qNNtqBQ4W8T/Bftx/WMdvXXpC5p0G5lr+gECM
 Kk0NqoywskT82pXt6BIHN016dcR9q/O7ggNC68XVBIeYk8aamECu7V5jYe3ApxJp/R
 z251i6pKh5ZN1DcpYeleGn+h6b1bWpW0HAKCC0oo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/27] drm: bridge: dw-hdmi: Store current connector in struct
 dw_hdmi
Date: Tue, 26 May 2020 04:14:58 +0300
Message-Id: <20200526011505.31884-21-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Store the connector that the bridge is currently wired to in the dw_hdmi
structure. This is currently identical to the connector field, but will
differ once the driver supports disabling connector creation.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 35d38b644912..16bffedb4715 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -181,6 +181,7 @@ struct dw_hdmi {
 
 	struct mutex mutex;		/* for state below and previous_mode */
 	enum drm_connector_force force;	/* mutex-protected force state */
+	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
 	bool bridge_is_on;		/* indicates the bridge is on */
 	bool rxsense;			/* rxsense state */
@@ -2823,23 +2824,32 @@ static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->mutex);
 }
 
-static void dw_hdmi_bridge_disable(struct drm_bridge *bridge)
+static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
+	hdmi->curr_conn = NULL;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 }
 
-static void dw_hdmi_bridge_enable(struct drm_bridge *bridge)
+static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_state)
 {
 	struct dw_hdmi *hdmi = bridge->driver_private;
+	struct drm_atomic_state *state = old_state->base.state;
+	struct drm_connector *connector;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
+	hdmi->curr_conn = connector;
 	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
@@ -2854,8 +2864,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_check = dw_hdmi_bridge_atomic_check,
 	.atomic_get_output_bus_fmts = dw_hdmi_bridge_atomic_get_output_bus_fmts,
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
-	.enable = dw_hdmi_bridge_enable,
-	.disable = dw_hdmi_bridge_disable,
+	.atomic_enable = dw_hdmi_bridge_atomic_enable,
+	.atomic_disable = dw_hdmi_bridge_atomic_disable,
 	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 };
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

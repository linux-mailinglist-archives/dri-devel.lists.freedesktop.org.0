Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E915125FB5
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 11:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649B86EB26;
	Thu, 19 Dec 2019 10:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317116EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 10:46:07 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A126E3B;
 Thu, 19 Dec 2019 11:46:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576752365;
 bh=/32gTyQR2nyv4h+v3cB/3Y390Bz71Jn7+gHjxSk+JaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jRgBgTKYq+5tvlkTkMEToZv/Yvg2g0Ftx7/HL042Ngi7aauiLWSqlMppAV7yro3bJ
 rn6PBVf3qJWN0rnbymtgxXmyPjNkvCgwm5khkjBgWwwnt2+xiG3GfLOALj9hKgDTdD
 Si/DSHvXzspn0ziF8tGnOEmPXrEeqzuj/bKGyfXs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 32/51] drm/omap: hdmi4: Implement drm_bridge .hpd_notify()
 operation
Date: Thu, 19 Dec 2019 12:45:03 +0200
Message-Id: <20191219104522.9379-33-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
References: <20191219104522.9379-1-laurent.pinchart@ideasonboard.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI4 encoder is transitioning to the drm_bridge API, implement the
last missing operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a5c6054158eb..17759b6a191a 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -551,6 +551,15 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->lock);
 }
 
+static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    enum drm_connector_status status)
+{
+	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
+
+	if (status == connector_status_disconnected)
+		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
+}
+
 static struct edid *hdmi4_bridge_read_edid(struct omap_hdmi *hdmi,
 					   struct drm_connector *connector)
 {
@@ -570,6 +579,7 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.mode_set = hdmi4_bridge_mode_set,
 	.atomic_enable = hdmi4_bridge_enable,
 	.atomic_disable = hdmi4_bridge_disable,
+	.hpd_notify = hdmi4_bridge_hpd_notify,
 	.get_edid = hdmi4_bridge_get_edid,
 };
 
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

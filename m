Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8638A147758
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 04:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950816FEF0;
	Fri, 24 Jan 2020 03:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0516FEE0
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 03:55:32 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C58F73CA1;
 Fri, 24 Jan 2020 04:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1579838124;
 bh=/32gTyQR2nyv4h+v3cB/3Y390Bz71Jn7+gHjxSk+JaU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IBys4Zp7dAbFBDuYc4DYlJq5Aahwiyhu8mxTQbRgcQpEkBH+DMjQ8NVO1pTDBxJI+
 yijxnXawgiWI7KAeF251rzpuhBdujbTb7D2eA4BcvP3JVx5/vnkxFAbF8SWeX5i9Ak
 2jjZo6Y3lBedR+ySGWxCGOzrWR1bIjGiXthUnsjs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 33/52] drm/omap: hdmi4: Implement drm_bridge .hpd_notify()
 operation
Date: Fri, 24 Jan 2020 05:54:26 +0200
Message-Id: <20200124035445.1830-34-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
References: <20200124035445.1830-1-laurent.pinchart@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
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

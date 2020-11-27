Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2102C6133
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 09:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC29D6E9C7;
	Fri, 27 Nov 2020 08:53:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9F76E9C7
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:53:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AR8qqFL058771;
 Fri, 27 Nov 2020 02:52:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606467173;
 bh=22qq5cH0rtrp1yoHTvmHzVfEHlHoqWC5Nw0TTNSpnJQ=;
 h=From:To:CC:Subject:Date;
 b=x/Td2FQnsw8Ly3YMPNOjHZl65kkDMj2WBTnJ2kcFmUrtj75IlqPej86litB0/L5Ul
 12NeEaE2U8Xl/dqKtmVqAGGeThrgCB6mjA5xz7GzHt2uo7Dr9aiNGXPn6HkitUe3TU
 E0IU/lf9RDsW4Q4Mr7GEbZNYLrNE4FeggpqiTyos=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AR8qqPH024773
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 27 Nov 2020 02:52:52 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 27
 Nov 2020 02:52:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 27 Nov 2020 02:52:52 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AR8qom2074793;
 Fri, 27 Nov 2020 02:52:50 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH] drm/omap: sdi: fix bridge enable/disable
Date: Fri, 27 Nov 2020 10:52:41 +0200
Message-ID: <20201127085241.848461-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-omap@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, stable@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the SDI output was converted to DRM bridge, the atomic versions of
enable and disable funcs were used. This was not intended, as that would
require implementing other atomic funcs too. This leads to:

WARNING: CPU: 0 PID: 18 at drivers/gpu/drm/drm_bridge.c:708 drm_atomic_helper_commit_modeset_enables+0x134/0x268

and display not working.

Fix this by using the legacy enable/disable funcs.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
Fixes: 8bef8a6d5da81b909a190822b96805a47348146f ("drm/omap: sdi: Register a drm_bridge")
Cc: stable@vger.kernel.org # v5.7+
Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/dss/sdi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/sdi.c b/drivers/gpu/drm/omapdrm/dss/sdi.c
index 033fd30074b0..282e4c837cd9 100644
--- a/drivers/gpu/drm/omapdrm/dss/sdi.c
+++ b/drivers/gpu/drm/omapdrm/dss/sdi.c
@@ -195,8 +195,7 @@ static void sdi_bridge_mode_set(struct drm_bridge *bridge,
 	sdi->pixelclock = adjusted_mode->clock * 1000;
 }
 
-static void sdi_bridge_enable(struct drm_bridge *bridge,
-			      struct drm_bridge_state *bridge_state)
+static void sdi_bridge_enable(struct drm_bridge *bridge)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 	struct dispc_clock_info dispc_cinfo;
@@ -259,8 +258,7 @@ static void sdi_bridge_enable(struct drm_bridge *bridge,
 	regulator_disable(sdi->vdds_sdi_reg);
 }
 
-static void sdi_bridge_disable(struct drm_bridge *bridge,
-			       struct drm_bridge_state *bridge_state)
+static void sdi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct sdi_device *sdi = drm_bridge_to_sdi(bridge);
 
@@ -278,8 +276,8 @@ static const struct drm_bridge_funcs sdi_bridge_funcs = {
 	.mode_valid = sdi_bridge_mode_valid,
 	.mode_fixup = sdi_bridge_mode_fixup,
 	.mode_set = sdi_bridge_mode_set,
-	.atomic_enable = sdi_bridge_enable,
-	.atomic_disable = sdi_bridge_disable,
+	.enable = sdi_bridge_enable,
+	.disable = sdi_bridge_disable,
 };
 
 static void sdi_bridge_init(struct sdi_device *sdi)
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

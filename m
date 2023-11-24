Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F012D7F77B0
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 16:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033010E803;
	Fri, 24 Nov 2023 15:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133E910E802
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 15:24:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
 t=1700838871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mc7Wf0hW6FowFM4Mm7qR65l0E98I4NpTxHZ7srPzTOc=;
 b=wkVvMqHUqI8TxuJSHJUgA8mxyczMeeUC99Yz/tNb1r7Myj4sN7l2EK/Q0rfSuOFEf4t5sF
 vKjL5Rd/Hyds14IHXsQOjg2rNPtIjIUyZPhBJ9JwaDL255ckALplmxOGruk5AlgpkE7Sk1
 UfDI3+bJ3d6UyWkGeP1v/MBptd2Y97+UhXIFLeQJ9FPbD37RvZ2e8YCC1pmhtvbvLpFhPj
 C3vdz1MF3pD9KCx+b+HoUNBtIyPuZNIoaH441+D55iMUYY+85ztWHwgsryXIaij6x0qW32
 4CYpSy9dQQLXSQLFjML3kZqphN/AdJjOPToem+Vr38z5+GXi9cKAcWRizHTmDA==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Fri, 24 Nov 2023 16:14:22 +0100
Subject: [PATCH v2 2/2] drm/bridge: adv7511: get edid in hpd_work to update
 CEC phys address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20231124-adv7511-cec-edid-v2-2-f0e5eeafdfc2@bang-olufsen.dk>
References: <20231124-adv7511-cec-edid-v2-0-f0e5eeafdfc2@bang-olufsen.dk>
In-Reply-To: <20231124-adv7511-cec-edid-v2-0-f0e5eeafdfc2@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The adv7511 driver is solely responsible for setting the physical
address of its CEC adapter. To do this, it must read the EDID. However,
EDID is only read when either the drm_bridge_funcs :: get_edid or
drm_connector_helper_funcs :: get_modes ops are called. Without loss of
generality, it cannot be assumed that these ops are called when a sink
gets attached. Therefore there exist scenarios in which the CEC physical
address will be invalid (f.f.f.f), rendering the CEC adapter inoperable.

Address this problem by always fetching the EDID in the HPD work when we
detect a connection. The CEC physical address is set in the process.
This is done by moving the EDID DRM helper into an internal helper
function so that it can be cleanly called from an earlier section of
the code. The EDID getter has not changed in practice.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 74 ++++++++++++++++++----------
 1 file changed, 48 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 5ffc5904bd59..1f1d3a440895 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -542,6 +542,36 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 	return 0;
 }
 
+static struct edid *__adv7511_get_edid(struct adv7511 *adv7511,
+				       struct drm_connector *connector)
+{
+	struct edid *edid;
+
+	/* Reading the EDID only works if the device is powered */
+	if (!adv7511->powered) {
+		unsigned int edid_i2c_addr =
+					(adv7511->i2c_edid->addr << 1);
+
+		__adv7511_power_on(adv7511);
+
+		/* Reset the EDID_I2C_ADDR register as it might be cleared */
+		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
+			     edid_i2c_addr);
+	}
+
+	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
+
+	if (!adv7511->powered)
+		__adv7511_power_off(adv7511);
+
+	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
+			       drm_detect_hdmi_monitor(edid));
+
+	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
+
+	return edid;
+}
+
 /* -----------------------------------------------------------------------------
  * Hotplug handling
  */
@@ -595,8 +625,24 @@ static void adv7511_hpd_work(struct work_struct *work)
 		adv7511->connector.status = status;
 
 		if (adv7511->connector.dev) {
-			if (status == connector_status_disconnected)
+			if (status == connector_status_disconnected) {
 				cec_phys_addr_invalidate(adv7511->cec_adap);
+			} else {
+				struct edid *edid;
+
+				/*
+				 * Get the updated EDID so that the CEC
+				 * subsystem gets informed of any change in CEC
+				 * address. The helper returns a newly allocated
+				 * edid structure, so free it to prevent
+				 * leakage.
+				 */
+				edid = __adv7511_get_edid(adv7511,
+							  &adv7511->connector);
+				if (edid)
+					kfree(edid);
+			}
+
 			drm_kms_helper_hotplug_event(adv7511->connector.dev);
 		} else {
 			drm_bridge_hpd_notify(&adv7511->bridge, status);
@@ -611,31 +657,7 @@ static void adv7511_hpd_work(struct work_struct *work)
 static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
 				     struct drm_connector *connector)
 {
-	struct edid *edid;
-
-	/* Reading the EDID only works if the device is powered */
-	if (!adv7511->powered) {
-		unsigned int edid_i2c_addr =
-					(adv7511->i2c_edid->addr << 1);
-
-		__adv7511_power_on(adv7511);
-
-		/* Reset the EDID_I2C_ADDR register as it might be cleared */
-		regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
-			     edid_i2c_addr);
-	}
-
-	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
-
-	if (!adv7511->powered)
-		__adv7511_power_off(adv7511);
-
-	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-			       drm_detect_hdmi_monitor(edid));
-
-	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
-
-	return edid;
+	return __adv7511_get_edid(adv7511, connector);
 }
 
 static int adv7511_get_modes(struct adv7511 *adv7511,

-- 
2.42.1


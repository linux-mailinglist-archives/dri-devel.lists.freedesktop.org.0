Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED685ACF6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570F10E173;
	Mon, 19 Feb 2024 20:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.b="fImIG8zt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6710E173
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 20:18:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
 t=1708373588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kFZNbXQUFAlr8d7wQOjWhFQiUag9o0uIzBpo8W4u+X8=;
 b=fImIG8ztlMgvHBWbWNrGKrUMPefmEVHb8dBpjveIsJnuA585m4M0V5IZvjEXKa2JpXfWUl
 uyLYilgIPgRD9oG6s0Ke8G2uOQChKiTL6xHvdHmWqqtPVjkwv3Ik/HpIqC1KTRd/DCaLlN
 qz/VEnGjeZxW9Av0x3aehpLkGh8sUSaKRn5BQ0UiS85fmORljOO3kMcb8m9Y9XDTqqledK
 YuuugJiF6zXQ6/72S7fMK962CPiTE7vUilO12LbwKc1XG/gzj4IE0u4emhN574PBK9cwxb
 TtvSXFXd8JsT2+ipHY0o8uu8WfT+4J0YnuFV+zRhBiSDqT8YzsS7Xk4axsoQEQ==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Mon, 19 Feb 2024 21:12:59 +0100
Subject: [PATCH v3 2/2] drm/bridge: adv7511: get edid in hpd_work to update
 CEC phys address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240219-adv7511-cec-edid-v3-2-445aed2f1cd7@bang-olufsen.dk>
References: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
In-Reply-To: <20240219-adv7511-cec-edid-v3-0-445aed2f1cd7@bang-olufsen.dk>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
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

Reviewed-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 73 ++++++++++++++++++----------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 5ffc5904bd59..d823b372ff43 100644
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
@@ -595,8 +625,23 @@ static void adv7511_hpd_work(struct work_struct *work)
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
+				kfree(edid);
+			}
+
 			drm_kms_helper_hotplug_event(adv7511->connector.dev);
 		} else {
 			drm_bridge_hpd_notify(&adv7511->bridge, status);
@@ -611,31 +656,7 @@ static void adv7511_hpd_work(struct work_struct *work)
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
2.43.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD085ACF7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 21:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0194A10E1EC;
	Mon, 19 Feb 2024 20:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.b="xoz8tY5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com
 [91.218.175.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146AE10E188
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 20:18:32 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pqrs.dk; s=key1;
 t=1708373587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr6bVcKnfspMMRxxIcvGJZKYsuRR76HeAUpuoZm3aKc=;
 b=xoz8tY5ewsOlJ7oHXaqTxeiYFaMy6W01horFeinqzhUWwulruOLAhCSDhnTqMUKCkErvJZ
 fLt3oYWHpdWgyvKgkHtU18mFqNeIJRsvqXouAAKknv68orETLgmmpAd3vdAg0771VxCYQ+
 ZMj8MBgOzoo503u1TxXEWdfBpXJ3x5A7saqC+lAf/Aj0M8Z8OjmudBGtWkBydbfJIKhzXy
 +Xj4b5EVrguAtukQRLJRwMtwbAEMlzEcdEU7z4TXBFpj2QfZq1SQvNTsmpPChY4OoVt7tt
 TZW3xvoU1PntWA2HCvQG/x+8Ylj1oLninxrk7n+Sm5Hq8gtJgZEZWrwqJJYEPw==
From: =?utf-8?q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Date: Mon, 19 Feb 2024 21:12:58 +0100
Subject: [PATCH v3 1/2] drm/bridge: adv7511: rearrange hotplug work code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240219-adv7511-cec-edid-v3-1-445aed2f1cd7@bang-olufsen.dk>
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

In preparation for calling EDID helpers from the hotplug work, move the
hotplug work below the EDID helper section. No functional change.

Reviewed-by: Robert Foss <rfoss@kernel.org>
Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 120 ++++++++++++++-------------
 1 file changed, 62 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8be235144f6d..5ffc5904bd59 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -406,64 +406,6 @@ static void adv7511_power_off(struct adv7511 *adv7511)
  * Interrupt and hotplug detection
  */
 
-static bool adv7511_hpd(struct adv7511 *adv7511)
-{
-	unsigned int irq0;
-	int ret;
-
-	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
-	if (ret < 0)
-		return false;
-
-	if (irq0 & ADV7511_INT0_HPD) {
-		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
-			     ADV7511_INT0_HPD);
-		return true;
-	}
-
-	return false;
-}
-
-static void adv7511_hpd_work(struct work_struct *work)
-{
-	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
-	enum drm_connector_status status;
-	unsigned int val;
-	int ret;
-
-	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
-	if (ret < 0)
-		status = connector_status_disconnected;
-	else if (val & ADV7511_STATUS_HPD)
-		status = connector_status_connected;
-	else
-		status = connector_status_disconnected;
-
-	/*
-	 * The bridge resets its registers on unplug. So when we get a plug
-	 * event and we're already supposed to be powered, cycle the bridge to
-	 * restore its state.
-	 */
-	if (status == connector_status_connected &&
-	    adv7511->connector.status == connector_status_disconnected &&
-	    adv7511->powered) {
-		regcache_mark_dirty(adv7511->regmap);
-		adv7511_power_on(adv7511);
-	}
-
-	if (adv7511->connector.status != status) {
-		adv7511->connector.status = status;
-
-		if (adv7511->connector.dev) {
-			if (status == connector_status_disconnected)
-				cec_phys_addr_invalidate(adv7511->cec_adap);
-			drm_kms_helper_hotplug_event(adv7511->connector.dev);
-		} else {
-			drm_bridge_hpd_notify(&adv7511->bridge, status);
-		}
-	}
-}
-
 static int adv7511_irq_process(struct adv7511 *adv7511, bool process_hpd)
 {
 	unsigned int irq0, irq1;
@@ -600,6 +542,68 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
 	return 0;
 }
 
+/* -----------------------------------------------------------------------------
+ * Hotplug handling
+ */
+
+static bool adv7511_hpd(struct adv7511 *adv7511)
+{
+	unsigned int irq0;
+	int ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_INT(0), &irq0);
+	if (ret < 0)
+		return false;
+
+	if (irq0 & ADV7511_INT0_HPD) {
+		regmap_write(adv7511->regmap, ADV7511_REG_INT(0),
+			     ADV7511_INT0_HPD);
+		return true;
+	}
+
+	return false;
+}
+
+static void adv7511_hpd_work(struct work_struct *work)
+{
+	struct adv7511 *adv7511 = container_of(work, struct adv7511, hpd_work);
+	enum drm_connector_status status;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(adv7511->regmap, ADV7511_REG_STATUS, &val);
+	if (ret < 0)
+		status = connector_status_disconnected;
+	else if (val & ADV7511_STATUS_HPD)
+		status = connector_status_connected;
+	else
+		status = connector_status_disconnected;
+
+	/*
+	 * The bridge resets its registers on unplug. So when we get a plug
+	 * event and we're already supposed to be powered, cycle the bridge to
+	 * restore its state.
+	 */
+	if (status == connector_status_connected &&
+	    adv7511->connector.status == connector_status_disconnected &&
+	    adv7511->powered) {
+		regcache_mark_dirty(adv7511->regmap);
+		adv7511_power_on(adv7511);
+	}
+
+	if (adv7511->connector.status != status) {
+		adv7511->connector.status = status;
+
+		if (adv7511->connector.dev) {
+			if (status == connector_status_disconnected)
+				cec_phys_addr_invalidate(adv7511->cec_adap);
+			drm_kms_helper_hotplug_event(adv7511->connector.dev);
+		} else {
+			drm_bridge_hpd_notify(&adv7511->bridge, status);
+		}
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * ADV75xx helpers
  */

-- 
2.43.1


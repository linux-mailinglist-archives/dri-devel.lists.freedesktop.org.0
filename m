Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0AB629758
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:27:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D99F10E138;
	Tue, 15 Nov 2022 11:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DD810E138
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:27:26 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 4so12928918pli.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 03:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4zSQ0DjWyG+4BNx59pGTUfeFDadgUQEQVZPf7S2ofm4=;
 b=f9iEdJ5v8usTqfhxUiwrvfOFtGZEkKTKAnW7l97YkEsWMir2NPoG/C9cVE6uXZ5+d2
 wLeoImdBseWL+BDW4Oku7t3zwK3xZtX8gCFDB3tAADB+O0e5bt5r8Iw4eliKofReo42m
 xJF4paolACEq+Qra3Tm+2uGWaJlu/kIZq9z3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4zSQ0DjWyG+4BNx59pGTUfeFDadgUQEQVZPf7S2ofm4=;
 b=Cw8JJ1Q15hcCV/4oVcfeMWYdIdNQv8v5QqcCeSPx8DQwvwVNoZdKBi71hwrLnpwmZq
 M62pZGKynGLxuuYzpbbT7IYJfQuYYelmLcOMA6zImR5x3N1+R+t4wrwH4raOLZYnaTTa
 X66x+ACMmS1zAksYuHh/tVo/iryVtPGR+HRxoqfazVvWme9cTNZoXjXZmaYqPdlSP+Tv
 y4lmJmy3k3gLAYXzywW9voHnPjr+hZJ/c78JzFS2WMYzinvskmowyW2H+IwPEz2PUnZ/
 oGXBgu6fku5jEcicpGT7wOdgR8jz9ncLH8Pw7SQYRnjI02vn1jQWejppVOnKeZlGZlNv
 8DZg==
X-Gm-Message-State: ANoB5pmURflqjaqmWa/iX34iDoP/ViIlLqgjd3/Yiiez3+xOD6tGESNR
 EOd4DqwATyFMrvMf3KhqKUaKWw==
X-Google-Smtp-Source: AA0mqf5XG2A5vG0RXAJAVZxu4ysiQ9ALyvgkiv483stnUKm9YOyMeOCWjrFQRvV0G48WsOCj3mZlVg==
X-Received: by 2002:a17:902:e483:b0:188:b44b:598 with SMTP id
 i3-20020a170902e48300b00188b44b0598mr3672200ple.54.1668511646490; 
 Tue, 15 Nov 2022 03:27:26 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:e5b1:b561:a821:c6c])
 by smtp.gmail.com with ESMTPSA id
 cp5-20020a170902e78500b00186a8085382sm9584924plb.43.2022.11.15.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 03:27:25 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] drm/bridge: it6505: Add caching for EDID
Date: Tue, 15 Nov 2022 19:27:20 +0800
Message-Id: <20221115112720.911158-1-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.493.g58b659f92b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: allen chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add caching when EDID is read, and invalidate the cache until the
bridge detects HPD low or sink count changes on HPD_IRQ.

It takes 1.2s for IT6505 bridge to read a 3-block EDID, and skipping
one EDID read would be a notable difference on user experience.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 drivers/gpu/drm/bridge/ite-it6505.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 21a9b8422bda..4b818f31668f 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -457,6 +457,8 @@ struct it6505 {
 
 	/* it6505 driver hold option */
 	bool enable_drv_hold;
+
+	struct edid *cached_edid;
 };
 
 struct it6505_step_train_para {
@@ -2244,6 +2246,13 @@ static void it6505_plugged_status_to_codec(struct it6505 *it6505)
 				   status == connector_status_connected);
 }
 
+
+static void it6505_remove_edid(struct it6505 *it6505)
+{
+	kfree(it6505->cached_edid);
+	it6505->cached_edid = NULL;
+}
+
 static int it6505_process_hpd_irq(struct it6505 *it6505)
 {
 	struct device *dev = &it6505->client->dev;
@@ -2270,6 +2279,7 @@ static int it6505_process_hpd_irq(struct it6505 *it6505)
 		it6505_reset_logic(it6505);
 		it6505_int_mask_enable(it6505);
 		it6505_init(it6505);
+		it6505_remove_edid(it6505);
 		return 0;
 	}
 
@@ -2353,6 +2363,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
 			it6505_video_reset(it6505);
 	} else {
 		memset(it6505->dpcd, 0, sizeof(it6505->dpcd));
+		it6505_remove_edid(it6505);
 
 		if (it6505->hdcp_desired)
 			it6505_stop_hdcp(it6505);
@@ -3016,16 +3027,18 @@ static struct edid *it6505_bridge_get_edid(struct drm_bridge *bridge,
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = &it6505->client->dev;
-	struct edid *edid;
 
-	edid = drm_do_get_edid(connector, it6505_get_edid_block, it6505);
+	if (!it6505->cached_edid) {
+		it6505->cached_edid = drm_do_get_edid(connector, it6505_get_edid_block,
+						      it6505);
 
-	if (!edid) {
-		DRM_DEV_DEBUG_DRIVER(dev, "failed to get edid!");
-		return NULL;
+		if (!it6505->cached_edid) {
+			DRM_DEV_DEBUG_DRIVER(dev, "failed to get edid!");
+			return NULL;
+		}
 	}
 
-	return edid;
+	return drm_edid_duplicate(it6505->cached_edid);
 }
 
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
@@ -3367,6 +3380,7 @@ static void it6505_i2c_remove(struct i2c_client *client)
 	drm_dp_aux_unregister(&it6505->aux);
 	it6505_debugfs_remove(it6505);
 	it6505_poweroff(it6505);
+	it6505_remove_edid(it6505);
 }
 
 static const struct i2c_device_id it6505_id[] = {
-- 
2.38.1.493.g58b659f92b-goog


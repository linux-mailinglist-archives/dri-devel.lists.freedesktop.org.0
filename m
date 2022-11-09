Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E868622796
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A42510E535;
	Wed,  9 Nov 2022 09:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782B310E535
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:52:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id k7so16611490pll.6
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YEXz8R79xCCKZ4gVi6aoWaOP0hM45EJ4HRkKfzYJXp4=;
 b=NvKJw3vSpw0gSIPYrmfre5lT1Ej0yLqmGwo9XHTV8Rak9f9TXnaRzZoOC86GOIaxzY
 /nTZp1KpZJpMypci4dNTl63IUjmo8rewgMsXklH6hQCxcRgQ3FUdvhnL9mG8i51T3Pn0
 jpYaEWMVgL9LJBZlAc1o8j6DWaVxp6u87INvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YEXz8R79xCCKZ4gVi6aoWaOP0hM45EJ4HRkKfzYJXp4=;
 b=AJUOh9/vqzbcpCHW//oqMujDN6k3NiNU04bCouWq6FgA50kIQEgYqnXG1B1et0dJQa
 jB0L231PtwhhavjxRBPWoWhAQIKAy3CJ1DAJhThvgZnT8Gogtrk2ve0+P0K9atieWSJk
 VsaWyfoBJ/L1fDRGTuhWKzmxgZra8Yd4qsO/ke0pGFtBPhcL6dHbNopmZHu+PHzlt8Wt
 HUof2qJDQxQUUul6ZRchzJiJcmpHAKmsZl+ur7pSj9IiEPSksQk3rb+igiQXCE4JcFtK
 fkWTVXHgnI1xCS5uRbeRuylSEGtne1Qh1YDn2O5PBWClOZkVf2rRJx0S3OVALVyYSwqi
 IDSg==
X-Gm-Message-State: ACrzQf2yrWHlstsrsa5UbBH6sdXalAPllbM+v0oQOvsb7+nYPXR1mxxi
 O7wffcFemK5v1SBABnZqJeRN5g==
X-Google-Smtp-Source: AMsMyM6BTP/7DJCEJ/RVYkzPkgRF/C6XyYOT/qqSROs8Uxm/w+ujOHPLWPiwVW50amm8sRoZmMJc8A==
X-Received: by 2002:a17:90b:33c7:b0:214:1ddc:c6bd with SMTP id
 lk7-20020a17090b33c700b002141ddcc6bdmr43100808pjb.151.1667987555062; 
 Wed, 09 Nov 2022 01:52:35 -0800 (PST)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:1a4f:384c:38ff:a6ae])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b00186e34524e3sm8561909plk.136.2022.11.09.01.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:52:34 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: it6505: Guard bridge power in IRQ handler
Date: Wed,  9 Nov 2022 17:52:27 +0800
Message-Id: <20221109095227.3320919-1-treapking@chromium.org>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
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
Cc: Pin-yen Lin <treapking@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, allen chen <allen.chen@ite.com.tw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a pair of pm_runtime_get_if_in_use and pm_runtime_put_sync in the
interrupt handler to make sure the bridge won't be powered off during
the interrupt handlings. Also remove the irq_lock mutex because it's not
guarding anything now.

Fixes: ab28896f1a83 ("drm/bridge: it6505: Improve synchronization between extcon subsystem")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 21a9b8422bda..e7f7d0ce1380 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -412,7 +412,6 @@ struct it6505 {
 	 * Mutex protects extcon and interrupt functions from interfering
 	 * each other.
 	 */
-	struct mutex irq_lock;
 	struct mutex extcon_lock;
 	struct mutex mode_lock; /* used to bridge_detect */
 	struct mutex aux_lock; /* used to aux data transfers */
@@ -2494,10 +2493,8 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	};
 	int int_status[3], i;
 
-	mutex_lock(&it6505->irq_lock);
-
-	if (it6505->enable_drv_hold || !it6505->powered)
-		goto unlock;
+	if (it6505->enable_drv_hold || pm_runtime_get_if_in_use(dev) <= 0)
+		return IRQ_HANDLED;
 
 	int_status[0] = it6505_read(it6505, INT_STATUS_01);
 	int_status[1] = it6505_read(it6505, INT_STATUS_02);
@@ -2515,16 +2512,14 @@ static irqreturn_t it6505_int_threaded_handler(int unused, void *data)
 	if (it6505_test_bit(irq_vec[0].bit, (unsigned int *)int_status))
 		irq_vec[0].handler(it6505);
 
-	if (!it6505->hpd_state)
-		goto unlock;
-
-	for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
-		if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
-			irq_vec[i].handler(it6505);
+	if (it6505->hpd_state) {
+		for (i = 1; i < ARRAY_SIZE(irq_vec); i++) {
+			if (it6505_test_bit(irq_vec[i].bit, (unsigned int *)int_status))
+				irq_vec[i].handler(it6505);
+		}
 	}
 
-unlock:
-	mutex_unlock(&it6505->irq_lock);
+	pm_runtime_put_sync(dev);
 
 	return IRQ_HANDLED;
 }
@@ -3277,7 +3272,6 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	if (!it6505)
 		return -ENOMEM;
 
-	mutex_init(&it6505->irq_lock);
 	mutex_init(&it6505->extcon_lock);
 	mutex_init(&it6505->mode_lock);
 	mutex_init(&it6505->aux_lock);
-- 
2.38.1.431.g37b22c650d-goog


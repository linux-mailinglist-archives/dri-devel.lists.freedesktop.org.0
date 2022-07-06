Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0615688BC
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C8811AF03;
	Wed,  6 Jul 2022 12:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1698D11AF02
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:53:10 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id l12so8216954plk.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jts1Y9JMpVL0If8P8yimWr5loe4E0VIqYItcqhdJT04=;
 b=J5h7sC+wpA1ej0AY7GGFDGcLzlBfbS2jtjQAtEj3EooYLMSkvj+E/iH7Ihp5W/wj/U
 5av2KGOQdc8rZFtYkRx2Ww0Ty5D2u9A2G7dZfNfbS7wy/za51jTXhMuKYfj+XqabLgs/
 EtJmN4yrr1ag0rJ9mDGzrgjDPQDiRCkguqDAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jts1Y9JMpVL0If8P8yimWr5loe4E0VIqYItcqhdJT04=;
 b=jm+QWCPH4AcN9mW9FhB+Axf0f4WscV9yEIoWQV/t4xtgg50xCWDFKZiW+9LjqJKWgy
 nKdQD7pj2FUxoJTm2VRMQ+L/m4Lhkx+qodIiuybV+CMXKJlyJS9gldScez8lFHnRh5S6
 +aDSSE4pnJ+NGBJU2fxJ2uqCruzDMzxlagf3RXBREpI2EYXuWNH8R7ziniEa3lvyuHk4
 KziaYqKFBhnDzvVHhnDR4jBzbHkIFmaUYQbjaiHAboJMXTA9a9NJvkwVs8fNVfeYWbCW
 hyvhO59048NPWcEu784vRu3oRQivA0upeyymLIiaZnv7Wom8DFhazoHyN1Kf6PPVbkhc
 nvAw==
X-Gm-Message-State: AJIora+0xw+pp3pwNGbD7EC9bFEsqKr5tuHTK2NUaSBOVKt65eW6s4Ep
 S8LYCH0mGVH+gc1X5chFGmfr3O1HuTqfdQ==
X-Google-Smtp-Source: AGRyM1t3rkNRA6Pzf7Rhejl5i6Yk/NJFrroHb1CZ1jTGwinOP7wTDoxpkRm6jtCxnL+OTuJWRwSxKw==
X-Received: by 2002:a17:903:41d0:b0:16a:55e0:6c3d with SMTP id
 u16-20020a17090341d000b0016a55e06c3dmr47794830ple.21.1657111989582; 
 Wed, 06 Jul 2022 05:53:09 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5300:b974:1680:1bd])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090341cc00b0016a6cd546d6sm25640127ple.251.2022.07.06.05.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:53:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 3/4] drm/bridge: anx7625: Fix NULL pointer crash when using
 edp-panel
Date: Wed,  6 Jul 2022 20:52:53 +0800
Message-Id: <20220706125254.2474095-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706125254.2474095-1-hsinyi@chromium.org>
References: <20220706125254.2474095-1-hsinyi@chromium.org>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move devm_of_dp_aux_populate_ep_devices() after pm runtime and i2c setup
to avoid NULL pointer crash.

edp-panel probe (generic_edp_panel_probe) calls pm_runtime_get_sync() to
read EDID. At this time, bridge should have pm runtime enabled and i2c
clients ready.

Fixes: adca62ec370c ("drm/bridge: anx7625: Support reading edid through aux channel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index fcf07a037c2c8..aded20b9e25b1 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2590,14 +2590,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	platform->aux.dev = dev;
 	platform->aux.transfer = anx7625_aux_transfer;
 	drm_dp_aux_init(&platform->aux);
-	devm_of_dp_aux_populate_ep_devices(&platform->aux);
-
-	ret = anx7625_parse_dt(dev, pdata);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		goto free_wq;
-	}
 
 	if (anx7625_register_i2c_dummy_clients(platform, client) != 0) {
 		ret = -ENOMEM;
@@ -2613,6 +2605,15 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (ret)
 		goto free_wq;
 
+	devm_of_dp_aux_populate_ep_devices(&platform->aux);
+
+	ret = anx7625_parse_dt(dev, pdata);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
+		goto free_wq;
+	}
+
 	if (!platform->pdata.low_power_mode) {
 		anx7625_disable_pd_protocol(platform);
 		pm_runtime_get_sync(dev);
-- 
2.37.0.rc0.161.g10f37bed90-goog


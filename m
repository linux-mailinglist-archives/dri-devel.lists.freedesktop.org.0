Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9592E560550
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 18:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F72910E45A;
	Wed, 29 Jun 2022 16:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64A410E52A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 16:06:08 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id 68so15729620pgb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LwimkmoBK2vJGij8UUnRV6t0uOjwq6dnkWSCt3UmvOg=;
 b=BC5StwdHRdfpkrXcfq8wY3aIGaAhCJid7IBMUYBfsZOf8zWHOeEV0BSDhwzF/NrkbI
 SFlILCqtdZyXrtspikiixxiWQLdx4BK6wpQqysFkp6JaD0MAJma06YXNl9bbG7aOFAH/
 Od9MGSrXh/UJ4SM7eHK/kp2xn4FhNKJUFQQ7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LwimkmoBK2vJGij8UUnRV6t0uOjwq6dnkWSCt3UmvOg=;
 b=2a1fFwwraNo/m45JOPpJvQ2beDD4/W6RQ9v5SL76gGuFPej7ucd8rbbF2aQJ1cp377
 PqzTJRBDs1s8eIz+HSnjqBM7fZ1KwfMStTWvD+Fy+PO/85q5oH3Kh7OkM1Md/ltakVT1
 Qm4fyq6U/EhOIgPK9cSU0YT9tLJbScEEf0ZYKCw1wj+v+QkCj8Po8/bZ4VpkspYMo97p
 bcr3JpyztxyC1mgnpQL9NrDIIxjXirytaY5vCl6Ia0WhuBGbmiZwNnwMLX1IPJOnY2C9
 5CTmWkZOFmEfw6FxdZzaDJZgp3Vym+LCqUw/zlI25uNhuLLTEXZWuKwkvMce0m0KIDiW
 YC6g==
X-Gm-Message-State: AJIora82gjANXeGOzpYe3woQJRWo0oJZVZpw+UwsGM8ccmMHkQsPB+7/
 h5YrgtF2PW3ttXDC8oUlHOyd7A==
X-Google-Smtp-Source: AGRyM1tYJfwH/bSAlF+6S8zoDJUYsVl0BO11qvOxodSG+nzG1h/rZYNyVFyxZf87MyrFiLdtW/8Nlg==
X-Received: by 2002:a05:6a00:1f94:b0:527:a8f4:9811 with SMTP id
 bg20-20020a056a001f9400b00527a8f49811mr9529367pfb.71.1656518768201; 
 Wed, 29 Jun 2022 09:06:08 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a170902e3d300b00163f8ddf160sm11495350ple.161.2022.06.29.09.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 09:06:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>,
	Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 3/4] drm/bridge: anx7625: Fix NULL pointer crash when using
 edp-panel
Date: Thu, 30 Jun 2022 00:05:49 +0800
Message-Id: <20220629160550.433980-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220629160550.433980-1-hsinyi@chromium.org>
References: <20220629160550.433980-1-hsinyi@chromium.org>
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
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 478f5af381c7d..59ddeba33652b 100644
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


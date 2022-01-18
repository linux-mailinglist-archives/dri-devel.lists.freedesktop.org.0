Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB963492286
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968D310EBB9;
	Tue, 18 Jan 2022 09:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35F610EBC3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:20:10 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id hv15so22712893pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3q9wkMinheXrqXy/yp63auEPN8EtJaQhX9gCBlzKxgs=;
 b=aK2MDPeSWHHwrY//afMrQLweMQ/RyKgAzoZfk/ZzlXXfqJg6DzJjaAF7Afq6nR6xKn
 FA0J3a1IxoYd4QbSJXwdD+TS1H2RCzNXzWIhJbsXnkcnpL0zUEZEr7rTiOSRrm9cyMb4
 uiWExIlSi++fDL7WGEZ8vh5ANpKjA5VmhH0Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3q9wkMinheXrqXy/yp63auEPN8EtJaQhX9gCBlzKxgs=;
 b=SPzU1UsSCzn7jW8IhzzluSstj0fUGJlJGRhGm1K/DGqo/XA4IDcaHuVsEpdw0QuNYx
 CjQmSA01Ku1j5NOmM0ExzsM/pZgCct5d7ZBA7LvtsFwVMreORy1RyQUlZGkLFVgx1Y41
 vgGzlOKQ6OGHEdegwjqM8pO6JMLII4AjfXQLqkepKgVBSyVa+0dEN0zlvS3XJHT+FGAe
 JPEaz8uPWfb+ui5eN2f7KyRm+viQ7DBvmcNuPYAUn/Fle5MNx7lr/1etnuEGtW9rclnV
 cdGzblJrogXdA3mVoerzZmRpbwDO8WepHbpLVvrOcqbdPFahVUSaA2RKPXydsH8pkfXl
 1LMA==
X-Gm-Message-State: AOAM532eNRhBLap+c6KunAgZlEsvBiucHCbsWfhnPR1KQkqnWB7sbwQs
 DyFfN7VCcl1tjcyhKBWuiT+KvA==
X-Google-Smtp-Source: ABdhPJzUUIoYrADArPB2qee5422yaGuvsUv4wN5fx07v7yPnixxhBxxfZXpwkmV8u8H984h7eE2TtA==
X-Received: by 2002:a17:90a:380b:: with SMTP id
 w11mr29582367pjb.113.1642497610547; 
 Tue, 18 Jan 2022 01:20:10 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:4448:8072:97f1:64dd])
 by smtp.gmail.com with ESMTPSA id y1sm14691501pgs.4.2022.01.18.01.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 01:20:10 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 2/4] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Tue, 18 Jan 2022 17:20:00 +0800
Message-Id: <20220118092002.4267-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220118092002.4267-1-hsinyi@chromium.org>
References: <20220118092002.4267-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
handled by driver detach.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
---
v2->v3: remove kfree() in anx7625_i2c_remove().
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 17b23940549a42..b7e3373994b480 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 		return -ENODEV;
 	}
 
-	platform = kzalloc(sizeof(*platform), GFP_KERNEL);
+	platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
 	if (!platform) {
 		DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
 		return -ENOMEM;
@@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
-		goto free_platform;
+		return ret;
 	}
 
 	platform->client = client;
@@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (!platform->hdcp_workqueue) {
 		dev_err(dev, "fail to create work queue\n");
 		ret = -ENOMEM;
-		goto free_platform;
+		return ret;
 	}
 
 	platform->pdata.intp_irq = client->irq;
@@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 	if (platform->hdcp_workqueue)
 		destroy_workqueue(platform->hdcp_workqueue);
 
-free_platform:
-	kfree(platform);
-
 	return ret;
 }
 
@@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 	if (platform->pdata.audio_en)
 		anx7625_unregister_audio(platform);
 
-	kfree(platform);
 	return 0;
 }
 
-- 
2.34.1.703.g22d0c6ccf7-goog


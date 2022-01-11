Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78248AC68
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 12:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB9113616;
	Tue, 11 Jan 2022 11:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD39E113616
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 11:27:06 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id e19so9979710plc.10
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 03:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUFyLMV0GWlHVuW18MQAch8BvfbkZ5RjN4y5TyCoTS8=;
 b=AxaAg6kIlLkHQsgU8s3+5BYRqH+T7qGlAtHcFXe/nZyZkWuSeaVPkIwI8bHC+dhMRP
 1TmsCCmbgdLsM1HIGsw5+p1nIoKOGkCPC6d1pdWxel81y8Nq9g8Cf3BiaSAy7TAAO3qY
 hBhizOVeYiVZB07OGNLxxkMaddMOMswIkjjyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aUFyLMV0GWlHVuW18MQAch8BvfbkZ5RjN4y5TyCoTS8=;
 b=kHmGKspG5pmqX9TxnjWt79QdNSBbLEFOGZbz8QQmAoNswjDz9a+UmYqn7XbXDGBkL3
 zRFo96T5ZUn23lmCRRN07GnqipEGyPVFEpkx7P/S4YyZX7gNkW0Fj32x9g5Jy1ob72Hn
 kTCAZxrFC6sPycpud3/tbqlHKtlZf+YiKPoMiQG0vQXNtwKybAEOGHHpssnb4egsLzIP
 l23SObVaxSYK4lVPdhAgjhfAnQXvUGd2+T4uohk47bwsweiSIx4Tp2mhVzRVGysMSDHj
 sPpKDY8uU8QA8hJiH0hAuC7rdH4aEcKCzdSS/n0wFtXqjPPXlZUnDVTdwN3Jtz0umR52
 epVQ==
X-Gm-Message-State: AOAM530nLp5DFp7CsDfWgNe3oeV9Lp+vSfRhMoyyIxV0XsrjFK5AfpjB
 PBs90ynmydTGyvB77CCdnz2Imw==
X-Google-Smtp-Source: ABdhPJwADokKLYG31oJnwFzrI95A99W/MQk1LAj6PUhOiImevr2TrxdzpObC4qORur6heDHtrep/+Q==
X-Received: by 2002:aa7:8642:0:b0:4be:9b5a:d4db with SMTP id
 a2-20020aa78642000000b004be9b5ad4dbmr4045759pfo.64.1641900426453; 
 Tue, 11 Jan 2022 03:27:06 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a41:eba5:ec46:f86c])
 by smtp.gmail.com with ESMTPSA id d12sm10664856pfv.172.2022.01.11.03.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:27:06 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Tue, 11 Jan 2022 19:26:59 +0800
Message-Id: <20220111112701.1064458-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
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
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 0b858c78abe8b6..dbe708eb3bcf11 100644
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
 
-- 
2.34.1.575.g55b058a8bb-goog


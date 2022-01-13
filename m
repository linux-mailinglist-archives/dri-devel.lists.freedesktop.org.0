Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944F48D2D8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 08:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3483112136;
	Thu, 13 Jan 2022 07:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CBC112136
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 07:32:04 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id hv15so9552003pjb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 23:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=du7UtZTksojdMdJU3Db9bmQRhjFxVrsUPN0QxzhmRfQ=;
 b=XRWcnUSui98p33/sm26qBbm54SzZ5iNXYwDIcVdlfutHdp+FoBy9DGkBxVpyY1qhqe
 F7tIH3HNM2cBotmLWDmhP9RiKfRNuuIkg5LKMAQ1YUFRU3ZgzZdcEaZ+A2lEnBR9RFSW
 9tcWf7RSJa+K+GpQPptN80vS5ud6XPJCKCZZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=du7UtZTksojdMdJU3Db9bmQRhjFxVrsUPN0QxzhmRfQ=;
 b=urOraeE3Zt3uPD+W0gL8R4F5oS1cLPiSJ7x6To2z7V8OPZrW2lAmZ7+nBo+hsehCEH
 jDWy6a5Vp0yMVWKupJnIlsCe+rALZNGc0NMwgjNrq1S2mgI7T7FttbmolU4HFhvvWByZ
 nlhUkT5D4nvTV9PfXGo2W4DuGEIobXBdL6dIYTzLhobKbh42z096RZv8JEnQwfM2tdox
 zrFB5z+jd9Cu8jozqLb2mplYxku2DL7sqdyRyATP5L7Q4mL8XSY1LnBDCypAGs6ZpYSI
 3GzlLxk7BR14mPX0d5Tvq2NhZ71GgRZCDKG3KjVoIjjIY+dW1bh7UIsjr8rsQeiVMFLE
 gP5Q==
X-Gm-Message-State: AOAM532MQAs5q9rx3zTIYYuD6yYL8RlYYFMxH27w0+a1Eex/buXmkcXq
 3VSWCfV8/E/ScAXtbhGVT41goeGTLJQAbA==
X-Google-Smtp-Source: ABdhPJzVfQyp3OrIqmUib4qqArq4Pah8l2B6psdTAz7f/amb43BdGKeleLHCVHWdiaVpTaelcbMCrg==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr3756416pjb.126.1642059124107; 
 Wed, 12 Jan 2022 23:32:04 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3ced:e0da:4852:430c])
 by smtp.gmail.com with ESMTPSA id om3sm7747701pjb.49.2022.01.12.23.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 23:32:03 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
Date: Thu, 13 Jan 2022 15:31:56 +0800
Message-Id: <20220113073158.2171673-1-hsinyi@chromium.org>
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
Reviewed-by: Xin Ji <xji@analogixsemi.com>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E63CF763
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 12:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6CC89E9E;
	Tue, 20 Jul 2021 10:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAC889E9E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 10:06:02 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so1588794pjb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 03:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6dvoxU82sdq8hrtHo6MNtrAkdmF4Qfs1QHBwRf0tvA=;
 b=Cp59n2Cb272AzmErANtJnFMRXbhxIXwpy4y+lZNu4HXwA0rY3ycd0yal8gjH4KS/8B
 tX7HiQlqzbMpHXvkhj2/8EtDSZVA5KLyTBhW7d8tTrmJmBbNDOWpfkD76197FZBz7zti
 ydKpQM1bMd+Ia1gvMedLl7LNhCSltVNot4Bc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6dvoxU82sdq8hrtHo6MNtrAkdmF4Qfs1QHBwRf0tvA=;
 b=MehXv8tsdMZqPGNtemBQvZrb+zk7vdhwMZ341U2PwYceQL+3yzlUaa2zcyaObCTh0q
 5P+AX77ephsnQaNIBbYAlNMGRhXAbcPhf6/EuOC4Yku1yUYuiWe9r+cZZhho0YZDGNQZ
 cQhFkzMzKssN1vN1jcx3NbNv6ed6f/29lsPPV3eJoVlkJqXlQh0khoWRXAgeYwVccJxC
 ybwjE1guYamFn/KVTj4uv88lNRRZrE0IOJxEqbsTDACkqh++U6SUm7mxCg4aLZ5L9Xme
 ZOvQaFzm3NTmumecEnMJRlwpIaDBGFJyq113IvZ2KZePPXbsSXzaCVUjUYpSJzUdlhJa
 yxAA==
X-Gm-Message-State: AOAM533hATuUS70wQQz6UfKX6/M/A5QkVRTrNuMuTVkitotZbDhQkpDi
 GG7cPR2uU6uJwqquO46GUN7xkw==
X-Google-Smtp-Source: ABdhPJymK2i/4VfbrYc8qY2j3o9aCSyBSwL36wWIQBgl7jKUzWJ4Lv9BHbGe+7BeA9pC5I4dtFqRRw==
X-Received: by 2002:a17:90a:4302:: with SMTP id
 q2mr33210703pjg.189.1626775562319; 
 Tue, 20 Jul 2021 03:06:02 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id y5sm22843830pfn.87.2021.07.20.03.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 03:06:01 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v2] drm/bridge: anx7625: Use pm_runtime_force_{suspend, resume}
Date: Tue, 20 Jul 2021 18:05:21 +0800
Message-Id: <20210720100553.2340425-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.32.0.402.g57bb445576-goog
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jonas Karlman <jonas@kwiboo.se>, open list <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Xin Ji <xji@analogixsemi.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_force_{suspend,resume} as system suspend/resume hook, to
ensure that anx7625 is always powered off on suspend.

Also add a device link between anx7625 driver and the encoder, to ensure
that bridge_disable will be called before suspend.

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---

Changes from v1:
* Use device link to ensure suspend resume order, instead of manually
  calling force resume.

This is the second approach mentioned in v1 of this patch
(https://lore.kernel.org/patchwork/patch/1459569/#1655836).

An issue was found that the anx7625 driver won't power off when used as
eDP bridge on Asurada board if suspend is entered via VT2.

The reason is that in this case, anx7625_suspend won't power off anx7625
(since intp_irq is not set). And anx7625_bridge_disable is only called
indirectly by other driver's (mediatek-drm) suspend.
pm_runtime_put_sync won't do anything since it's already in system
suspend.

If not in VT2, the bridge disable is indirectly called when Chrome
stops, so anx7625 will be powered off correctly.

To fix the issue, the suspend resume hooks are changed to
pm_runtime_force_{suspend,resume} to ensure the runtime suspend / resume
is always called correctly when system suspend / resume.
(Note that IRQ no longer needs to be disabled on suspend after commit
f03ab6629c7b ("drm/bridge: anx7625: Make hpd workqueue freezable"))

Also adds a stateless device link to ensure that the bridge disable is
called before anx7625 is suspended.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 54 +++++++++--------------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  1 +
 2 files changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 7519b7a0f29d..e248f0da2f8b 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1331,6 +1331,8 @@ static void anx7625_bridge_detach(struct drm_bridge *bridge)
 		mipi_dsi_detach(ctx->dsi);
 		mipi_dsi_device_unregister(ctx->dsi);
 	}
+	if (ctx->link)
+		device_link_del(ctx->link);
 }
 
 static int anx7625_bridge_attach(struct drm_bridge *bridge,
@@ -1355,6 +1357,13 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return err;
 	}
 
+	ctx->link = device_link_add(bridge->dev->dev, dev, DL_FLAG_STATELESS);
+	if (!ctx->link) {
+		DRM_DEV_ERROR(dev, "device link creation failed");
+		err = -EINVAL;
+		goto detach_dsi;
+	}
+
 	if (ctx->pdata.panel_bridge) {
 		err = drm_bridge_attach(bridge->encoder,
 					ctx->pdata.panel_bridge,
@@ -1362,13 +1371,22 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		if (err) {
 			DRM_DEV_ERROR(dev,
 				      "Fail to attach panel bridge: %d\n", err);
-			return err;
+			goto remove_device_link;
 		}
 	}
 
 	ctx->bridge_attached = 1;
 
 	return 0;
+
+remove_device_link:
+	device_link_del(ctx->link);
+detach_dsi:
+	if (ctx->dsi) {
+		mipi_dsi_detach(ctx->dsi);
+		mipi_dsi_device_unregister(ctx->dsi);
+	}
+	return err;
 }
 
 static enum drm_mode_status
@@ -1705,39 +1723,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused anx7625_resume(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		enable_irq(ctx->pdata.intp_irq);
-		anx7625_runtime_pm_resume(dev);
-	}
-
-	return 0;
-}
-
-static int __maybe_unused anx7625_suspend(struct device *dev)
-{
-	struct anx7625_data *ctx = dev_get_drvdata(dev);
-
-	if (!ctx->pdata.intp_irq)
-		return 0;
-
-	if (!pm_runtime_enabled(dev) || !pm_runtime_suspended(dev)) {
-		anx7625_runtime_pm_suspend(dev);
-		disable_irq(ctx->pdata.intp_irq);
-		flush_workqueue(ctx->workqueue);
-	}
-
-	return 0;
-}
-
 static const struct dev_pm_ops anx7625_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(anx7625_suspend, anx7625_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 	SET_RUNTIME_PM_OPS(anx7625_runtime_pm_suspend,
 			   anx7625_runtime_pm_resume, NULL)
 };
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 034c3840028f..c941b7a32859 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -385,6 +385,7 @@ struct anx7625_data {
 	struct drm_bridge bridge;
 	u8 bridge_attached;
 	struct mipi_dsi_device *dsi;
+	struct device_link *link;
 };
 
 #endif  /* __ANX7625_H__ */

base-commit: 3568c2c543e25d1a47bd97a607171511e7d44a45
-- 
2.32.0.402.g57bb445576-goog


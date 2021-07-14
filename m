Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 214063C7E57
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 08:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366E56E167;
	Wed, 14 Jul 2021 06:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB3D6E167
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 06:05:18 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so3071171pju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 23:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3xrLCowHoV9+qyE8ZVGJpCIjAP5+VxK4UkQj5GcY2w=;
 b=kLFkLuzZN/EMGHwlQGVS/UYmwM1Jor+xNSxXNx0vwbUEejkcyGW3ZmWZwpiB1TMCi/
 X2cTIJGs3M4vgTulRuQtElHfqpwfIWordoE8h7elKxyTNW4Vj/KhFEuk/g+f8IzSVtWR
 1IkdCBY3OhNxNLCR8lAti4i9lqmVQ4fX4VV78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3xrLCowHoV9+qyE8ZVGJpCIjAP5+VxK4UkQj5GcY2w=;
 b=LZg9e7MCf8taGhyj5EPNDV1vvwJtIO5Y+SmOsWKAINXTYr+u08dmmJCsrtqfiNZboa
 ixHWstOBi8EAYZC9CQtgsesDfeu9liKirhdt0I+uPbOkCohCpnQ6D/RWR+1zbEnrqRSa
 xZOFQsaqhsvVsgQHI9gKSwaXWfrcWlcg/f2u56/wXH+D3Op2UiJ3vu2HblQz2BY6JyKn
 Fu3BzWGRtYFcAzPMP1+hjr/OmX8W608oq2cPPlyDbrB7nASayvAO/qwCa0KWKrM86ePA
 ODu/4H5NqGCiiaTKAXmX0VLDO5ei3tkh9m/nbG8i02sshxW5nW49NcLPR5BXLsj4yoot
 6nVg==
X-Gm-Message-State: AOAM530tgiWTT5SqFnkvDmXcEPc8jVTr05dFNDxQdb0Az6Gn7QnNW8wH
 0KWe964GPRJ+4F9TmaNg6OFFJA==
X-Google-Smtp-Source: ABdhPJxMHrnpzw0TqHvFJSj9wz6UUif9iub0qocjpvcy/+qmAdEUClh8smx1q3mPpPVrt62tv/yGCA==
X-Received: by 2002:a17:902:ff0c:b029:11d:3e9e:41ec with SMTP id
 f12-20020a170902ff0cb029011d3e9e41ecmr6557656plj.1.1626242717623; 
 Tue, 13 Jul 2021 23:05:17 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id m19sm4524468pjl.13.2021.07.13.23.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 23:05:17 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] drm/bridge: anx7625: Use pm_runtime_force_{suspend,resume}
Date: Wed, 14 Jul 2021 14:01:59 +0800
Message-Id: <20210714060221.1483752-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
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
 <linux-arm-kernel@lists.infradead.org>, Yu Jiahua <yujiahua1@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use pm_runtime_force_suspend and pm_runtime_force_resume to ensure that
anx7625 would always be powered off when suspended. Also update the
bridge enable hook to always ensure that the anx7625 is powered on
before starting DP operations.

Fixes: 409776fa3c42 ("drm/bridge: anx7625: add suspend / resume hooks")

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>

---

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

Since bridge disable is called indirectly by mediatek-drm driver's
suspend, it might happens after anx7625 suspend is called. So a check
if the driver is already suspended via pm_runtime_force_suspend is also
added, to ensure that the anx7625_dp_stop won't be called when power
is off. And also since bridge enable might happens before anx7625 resume
is called, a check to that is also added, and would force resume the
device in this case.

I'm not sure if the approach to fix this is the most appropriate way,
since using pm_runtime_force_resume in bridge enable kinda feels hacky
to me. I'm open to any suggestions.

---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 55 +++++++++--------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a3d82377066b..9d0f5dc88b16 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1559,7 +1559,20 @@ static void anx7625_bridge_enable(struct drm_bridge *bridge)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm enable\n");
 
-	pm_runtime_get_sync(dev);
+	/*
+	 * The only case where pm_runtime is disabled here is when the function
+	 * is called other driver's resume hook by
+	 * drm_mode_config_helper_resume, but when the pm_runtime_force_resume
+	 * hasn't been called on this device.
+	 *
+	 * pm_runtime_get_sync won't power on anx7625 in this case since we're
+	 * in system resume, so instead we force resume anx7625 to make sure
+	 * the following anx7625_dp_start would succeed.
+	 */
+	if (pm_runtime_enabled(dev))
+		pm_runtime_get_sync(dev);
+	else
+		pm_runtime_force_resume(dev);
 
 	anx7625_dp_start(ctx);
 }
@@ -1571,9 +1584,10 @@ static void anx7625_bridge_disable(struct drm_bridge *bridge)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm disable\n");
 
-	anx7625_dp_stop(ctx);
-
-	pm_runtime_put_sync(dev);
+	if (pm_runtime_enabled(dev)) {
+		anx7625_dp_stop(ctx);
+		pm_runtime_put_sync(dev);
+	}
 }
 
 static enum drm_connector_status
@@ -1705,38 +1719,9 @@ static int __maybe_unused anx7625_runtime_pm_resume(struct device *dev)
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

base-commit: c0d438dbc0b74901f1901d97a6c84f38daa0c831
-- 
2.32.0.93.g670b81a890-goog


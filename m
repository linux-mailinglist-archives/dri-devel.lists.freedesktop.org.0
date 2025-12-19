Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A93AECCF44C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:05:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0486310E612;
	Fri, 19 Dec 2025 10:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VfOvPCCM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C7610E612
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:05:04 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so11973185e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766138702; x=1766743502;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qCwv4X+KzD+vouH2xPiXyoSyQ6aMt6Zow7yOJggZqVk=;
 b=VfOvPCCM6jt3hf5Og/SgmngsC8FlbaBZ2UDpovVbOrp9ao7rreHfciWBDJ+wpf3SXE
 C9guWZX8sS+zV7k3D3nkHayfMVU/XA2jQ7WPc9htxqVfQJ0YwMayrXSH/biev6LU8baP
 8Lc4Ssv6Z1t+cgWCMu5ziN9oPEj0823kTPYefYPzGsHrJV7VPwJs0EMAhz50G7yxWKgR
 MUi+BPHZhskvsxSEzFa35bsU13hL24qoShy2OwIXyEJ3RPDc+392riLHguVtvegJ64zI
 md7+NBmm/AqcYTeQCL258UJxTEIag5wX/pwketSUexVToHwWxYFOzRK07sQm4dMfk0CT
 Z8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766138702; x=1766743502;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qCwv4X+KzD+vouH2xPiXyoSyQ6aMt6Zow7yOJggZqVk=;
 b=oXjqmnWH4R2sJmg48tjveXg1/z3N7gzPXDRip4plMmwO7AwaB2g1CcxAhsUWqDbYTa
 o/dCTOjYSYkpp7ZdauVUgZnvCliGiKEBzI7IPB1hyc5cEcDPyz6FjDhg+JNKUPxLcaQ4
 JhRU3KRoflpbEZS7sRcHk9iuj/pdKBlfeFAkr7AYOY/NMwIhng+QkzG+ujhbz5HDGQMf
 GNY5hNzrf9g+TQlUYJNYCfHcI9Sy4GYm++gifIXU7zKbGhbiGAjwvCDxoVbMjStUJPbC
 mml7nap56f5cQXv62kb+/piFa0yBYR4cQGma2FuRSTwro3sexUxBiU2PZaKjW5RBGf8t
 pdkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVtUDhF5kBfgJMXtesJ4NxWGN+O/H8XjI+8M1w95rnZjA5yg8ErqI/TrWpn+vW0tH8Vm2yrNe8W/c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgYZ5yBo5Foev7Ly1zXbibKDxNLuffPSVCvTcdCJ+24CJN30y1
 P7OR93AGbL12eaYJEOux+5ZczL4R777gQVdHaYxLvN8ckX/WLsyMtrj9P9GaMHINMnc=
X-Gm-Gg: AY/fxX4coqHj+mja9XvrJ1VHRxlJRp8tQzw/66IqWqPad+xB3u+9qs64/uFNKECfFjg
 JZBq2mia/DvA1jowdzdmxA59Et4h2lp10d47fu+VUx1Csu1f5B4hrMdBdtvs4uK0mFXDpU4w7aH
 Ih1uwO1wrqzgjCm/GlfaRpwI6rpINudP4dPtUzKC6tQtjNZ5XucfiVdhuN6ZKmJFSGPkcl2sRZf
 7TGHTJcbEN6sWXGFfKWCBSX/7Li7i50U60E+MQDeC8oM0fcvN/MKzJGzgp2yLN3vBAjazvmeuWY
 stUL5iZ+PkypofBZn/8S05emtYk9V/z5rPINp9huIRy/T5XUcbcMgsK3SoDpgCxL6/Uq0U8/1pU
 9gEYn9WMo6aJhLTgbRF7rMTNutcsYR9mhX0nYYhum1xgi8t0IKkbKIr/BXFC3Bc9TUnGj+Ld347
 UyzmclBDKvwrJPbzEZRuS5nSIjmGI0TFHWDpVLqJwMtCD7I8PnAoWzQdtyZ1EGQdXIKx6wKwn29
 AwVroU9r3SiCg==
X-Google-Smtp-Source: AGHT+IGlCDGOjiwI+IH1bMBxfMSlGkypioabRN0v2YpksxkM+Setm5oy/hxFEzGX44i/p1nER2gLTQ==
X-Received: by 2002:a05:600c:64cd:b0:477:fcb:2256 with SMTP id
 5b1f17b1804b1-47d19595042mr18946645e9.17.1766138702550; 
 Fri, 19 Dec 2025 02:05:02 -0800 (PST)
Received: from localhost
 (p200300f65f0066087cf387e078e1a5dc.dip0.t-ipconnect.de.
 [2003:f6:5f00:6608:7cf3:87e0:78e1:a5dc])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-47be26a81b6sm90044095e9.0.2025.12.19.02.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:05:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: mipi-dsi: Make use of bus callbacks
Date: Fri, 19 Dec 2025 11:04:51 +0100
Message-ID: <20251219100452.3387068-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3616;
 i=u.kleine-koenig@baylibre.com; h=from:subject;
 bh=larUoUWVkIab1tCeSgYKkJqbRlCR11nt0/p8oSomz6E=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpRSNE6HSk6MeekIAK0cySH1z4Bf0XH0CsXzCkY
 kTYeLtMq/mJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUUjRAAKCRCPgPtYfRL+
 TiljB/9l26bDHf+s9f5g2299+TP5KUPaKRDj0i4EgerSCSWKK1neDqFHl8+F+QLgKaFwkbS1oHW
 C14R0qVlr7I6wSk+nKGAyjqPdgoPU+Htxz6GhqW98tDBXKLRW4NCLSbAgbEsjt4u58Cjxv81i+7
 MvHMEJXyyZ0rmq53C9+4LbVi7cYHOdDckjQv7zzjApJnDbedocbPSulOpUNE8MUhazQz1U9QdYE
 FBVNcwa867ocFK6DDQWXWZdc4DPrkfdpUxdQv+1YHsPLWugngbPLqCkjjeH8f58m9FxUb2Z6U5H
 MSgH286GCkn/Yk89IQBhLgbD8xjLn4MY4STnPaybbYwm14z7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are nearly identical to the respective driver callbacks. The only
differences are that .remove() returns void instead of int and .shutdown()
has to cope for unbound devices.

The objective is to get rid of users of struct device_driver callbacks
.probe(), .remove() and .shutdown() to eventually remove those.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

only build tested (on x86_64, arm64 and s390x using allmodconfig).

Best regards
Uwe

 drivers/gpu/drm/drm_mipi_dsi.c | 66 +++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a712e177b350..8077f6cc72ab 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -81,6 +81,36 @@ static int mipi_dsi_uevent(const struct device *dev, struct kobj_uevent_env *env
 	return 0;
 }
 
+
+static int mipi_dsi_probe(struct device *dev)
+{
+	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+
+	if (drv->probe)
+		return drv->probe(dsi);
+
+	return 0;
+}
+
+static void mipi_dsi_remove(struct device *dev)
+{
+	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+
+	if (drv->remove)
+		drv->remove(dsi);
+}
+
+static void mipi_dsi_shutdown(struct device *dev)
+{
+	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+
+	if (dev->driver && drv->shutdown)
+		drv->shutdown(dsi);
+}
+
 static const struct dev_pm_ops mipi_dsi_device_pm_ops = {
 	.runtime_suspend = pm_generic_runtime_suspend,
 	.runtime_resume = pm_generic_runtime_resume,
@@ -96,6 +126,9 @@ const struct bus_type mipi_dsi_bus_type = {
 	.name = "mipi-dsi",
 	.match = mipi_dsi_device_match,
 	.uevent = mipi_dsi_uevent,
+	.probe = mipi_dsi_probe,
+	.remove= mipi_dsi_remove,
+	.shutdown = mipi_dsi_shutdown,
 	.pm = &mipi_dsi_device_pm_ops,
 };
 EXPORT_SYMBOL_GPL(mipi_dsi_bus_type);
@@ -1980,32 +2013,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
 
-static int mipi_dsi_drv_probe(struct device *dev)
-{
-	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
-
-	return drv->probe(dsi);
-}
-
-static int mipi_dsi_drv_remove(struct device *dev)
-{
-	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
-
-	drv->remove(dsi);
-
-	return 0;
-}
-
-static void mipi_dsi_drv_shutdown(struct device *dev)
-{
-	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
-	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
-
-	drv->shutdown(dsi);
-}
-
 /**
  * mipi_dsi_driver_register_full() - register a driver for DSI devices
  * @drv: DSI driver structure
@@ -2019,13 +2026,6 @@ int mipi_dsi_driver_register_full(struct mipi_dsi_driver *drv,
 	drv->driver.bus = &mipi_dsi_bus_type;
 	drv->driver.owner = owner;
 
-	if (drv->probe)
-		drv->driver.probe = mipi_dsi_drv_probe;
-	if (drv->remove)
-		drv->driver.remove = mipi_dsi_drv_remove;
-	if (drv->shutdown)
-		drv->driver.shutdown = mipi_dsi_drv_shutdown;
-
 	return driver_register(&drv->driver);
 }
 EXPORT_SYMBOL(mipi_dsi_driver_register_full);

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


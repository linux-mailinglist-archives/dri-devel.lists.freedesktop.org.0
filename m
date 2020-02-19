Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3AB1641F1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EF36EB3C;
	Wed, 19 Feb 2020 10:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1996EB6A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so27495097wrl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LItQjwA9mV8nuzJaVMbtJa/Mr2QhOC3mRaiFX1ZxXdY=;
 b=YxkwRj6v8sA1O8uUWpxaiC1weDjQG0/dB9BrF0omx8hP4Cfvm/u3uhChTRy6OUV9c5
 MME0yXSd2SwFPef/kLxlM8Njyy1NU6o0vGjdrZ4gljtlg7T+4hHN65kvlH8sUt0Xd1xy
 IWXKEZP2Wn4cKJOp6SCZGu0gDb8hWdX7siKqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LItQjwA9mV8nuzJaVMbtJa/Mr2QhOC3mRaiFX1ZxXdY=;
 b=sG7fmn/3IuD2N/bRR1a9qTHxo0AEIDmFq7aUTGjvdc4k3CLHhacFXc1xOxs5iSAWeE
 IH2DCBzAhiTcHazNSio2PFxK+Af32t0Wma5Gkd2JTEpeWzkRPqoB/JsUkto1JaY5DAwa
 2doLFVwvwysdXQADP90QTWA6gL2ZUI0KvsJqOuBRzetJ7Kq2KFH7Pet+CMjgrZHkcjEr
 7XdBJjij+gVxoQh2Fv+VXUrV2qCgfAvmYKuvkgwgZgQNz4FxXAWLocDBruEI9HejvA0j
 BKTgb5FwTwdLuf2TVQVTHq+2yQQhuBbKcW+5Rav02ACWsbGmdyy3XlfBkI6SNjidnyJA
 UoOA==
X-Gm-Message-State: APjAAAVV8AT0XqCMXnJAOkMT7QZ283/kYeb5hQM/O4+OqqHt9PBDiJb3
 RvdEKrern3yVvC0gln6hQFc7WF83eR0=
X-Google-Smtp-Source: APXvYqy41ijA+ytu4BpqRVdObmpuN0/v9OCf6kG77+ZmHtW3b1DODLTtx1plfAc+TznLQGGvJDIdxA==
X-Received: by 2002:adf:e70d:: with SMTP id c13mr34515327wrm.248.1582107747996; 
 Wed, 19 Feb 2020 02:22:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:27 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 48/52] drm/mipi-dbi: Move drm_mode_config_init into mipi
 library
Date: Wed, 19 Feb 2020 11:21:18 +0100
Message-Id: <20200219102122.1607365-49-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

7/7 drivers agree that's the right choice, let's do this.

This avoids duplicating the same old error checking code over all 7
drivers, which is the motivation here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_mipi_dbi.c  | 4 ++++
 drivers/gpu/drm/tiny/hx8357d.c  | 2 --
 drivers/gpu/drm/tiny/ili9225.c  | 2 --
 drivers/gpu/drm/tiny/ili9341.c  | 2 --
 drivers/gpu/drm/tiny/ili9486.c  | 2 --
 drivers/gpu/drm/tiny/mi0283qt.c | 2 --
 drivers/gpu/drm/tiny/st7586.c   | 2 --
 drivers/gpu/drm/tiny/st7735r.c  | 2 --
 8 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index a678e07508d4..9de1586659be 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -510,6 +510,10 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 	if (!dbidev->dbi.command)
 		return -EINVAL;
 
+	ret = drm_mode_config_init(drm);
+	if (ret)
+		return ret;
+
 	dbidev->tx_buf = devm_kmalloc(drm->dev, tx_buf_size, GFP_KERNEL);
 	if (!dbidev->tx_buf)
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/tiny/hx8357d.c b/drivers/gpu/drm/tiny/hx8357d.c
index 42bc5dadcb1c..c88b84366dc5 100644
--- a/drivers/gpu/drm/tiny/hx8357d.c
+++ b/drivers/gpu/drm/tiny/hx8357d.c
@@ -239,8 +239,6 @@ static int hx8357d_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index aae88dc5b3f7..fa998a16026c 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -390,8 +390,6 @@ static int ili9225_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
diff --git a/drivers/gpu/drm/tiny/ili9341.c b/drivers/gpu/drm/tiny/ili9341.c
index 7d40cb4ff72b..945e15169866 100644
--- a/drivers/gpu/drm/tiny/ili9341.c
+++ b/drivers/gpu/drm/tiny/ili9341.c
@@ -197,8 +197,6 @@ static int ili9341_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 7d735fc67498..38d293cf5377 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -211,8 +211,6 @@ static int ili9486_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
diff --git a/drivers/gpu/drm/tiny/mi0283qt.c b/drivers/gpu/drm/tiny/mi0283qt.c
index 8555a56bce8c..b8c973bc2347 100644
--- a/drivers/gpu/drm/tiny/mi0283qt.c
+++ b/drivers/gpu/drm/tiny/mi0283qt.c
@@ -201,8 +201,6 @@ static int mi0283qt_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dbi->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 427c2561f5f4..1f1a576be93c 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -331,8 +331,6 @@ static int st7586_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	bufsize = (st7586_mode.vdisplay + 2) / 3 * st7586_mode.hdisplay;
 
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index b447235c3d47..0f48a5a2d3d7 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -212,8 +212,6 @@ static int st7735r_probe(struct spi_device *spi)
 	}
 	drmm_add_final_kfree(drm, dbidev);
 
-	drm_mode_config_init(drm);
-
 	dbi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(dbi->reset)) {
 		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

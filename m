Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263B23F0A04
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2EC6E873;
	Wed, 18 Aug 2021 17:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F416E873
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 17:13:26 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z9so4595228wrh.10
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFid9F2eF9PqNhKCggNJ7cYgvwbKXWCYKt0nUIUymOs=;
 b=GsvHQgpjaESYG5gtGcBAchUblwDnGBfCRa1Cbq88bnebOKDVZfNI47a7t8YHzfwXR0
 Wg6/E8zJEbHXHlBrKwmkoHSuKaof9B2CRhFCK0Y6FxL52+93tX0E0kCuVKSzTQXsOx3L
 VADza4/83gBW+6u12EezFkqO52Ms5vQWwwdrsPKMbb/Tdaj06pMLwUOcdpk/CSEHMVR0
 96PJ7L8+C3Knj82Xe7M4sVheHmHPjLn9tKND+G+STUu5ldE+650SpMm1t8HVAq/2MsKj
 Cxg1CUB4JG4OQwd6DzbvOosCxQAHzhuGKveOvF1noiFegFOaRoci9wlJDEgkZ000qc8A
 91KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oFid9F2eF9PqNhKCggNJ7cYgvwbKXWCYKt0nUIUymOs=;
 b=P7RyHp25xJwcU36XAGlqrnAUOp77vsdf+lv4QHvDbO7PXvQq1W3SNwjCsqHfrEIShE
 QJ78gaoFf30uBfDcABbXPmPOcAPgiuQXjiYsAlYnDJUqbvOMN3fVJ4Yi9LJvTjT4OpLa
 A7e4dOWE3Frj8Vkx16FgYaliFq/BmVAzZ3zzmG+Y+CVsk+RWoQ3R0wZDnAgPslq7VsAX
 upWv/561mo2Ns+pe6Th20L3hTEtgwQYECp2c+ix5RIu7FPuvgG48oD9Z76Je2royhfgQ
 eAAHF+mp0HB/oKJ6xThh/o6EbjrXox2M0crl3FbMwA5YFvm+AZ3lj6bmlxRE41aXki1W
 ttpA==
X-Gm-Message-State: AOAM530E1WR3NN3HVrP/qEPs1ZgtY7Cx15+i9px87yoQwE6WCY9SrY4F
 5pZyLrHXI8gWHlrMMjfOeK4ypg==
X-Google-Smtp-Source: ABdhPJxsRm2aT7e0rJVvWLb69hw4XoiBF8vUB/N+VxbBSZLj5e9PY8ThTjzFgyOW1rlRG9p9PCalKA==
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr12007908wrw.150.1629306805112; 
 Wed, 18 Aug 2021 10:13:25 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:a470:eb9f:53a5:20f8])
 by smtp.gmail.com with ESMTPSA id p3sm414825wrr.21.2021.08.18.10.13.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 10:13:24 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: a.hajda@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 xji@analogixsemi.com, pihsun@chromium.org, tzungbi@google.com,
 sam@ravnborg.org, hsinyi@chromium.org, drinkcat@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] drm/bridge: anx7625: Propagate errors from
 sp_tx_rst_aux()
Date: Wed, 18 Aug 2021 19:13:17 +0200
Message-Id: <20210818171318.1848272-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of sp_tx_rst_aux() is not propagated, which means
both compiler warnings and potential errors not being handled.

Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v1:
 - Instead of discarding the error, propagate it until it
   is handled properly

 drivers/gpu/drm/bridge/analogix/anx7625.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 14d73fb1dd15b..ea414cd349b5c 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -720,7 +720,7 @@ static int edid_read(struct anx7625_data *ctx,
 		ret = sp_tx_aux_rd(ctx, 0xf1);
 
 		if (ret) {
-			sp_tx_rst_aux(ctx);
+			ret = sp_tx_rst_aux(ctx);
 			DRM_DEV_DEBUG_DRIVER(dev, "edid read fail, reset!\n");
 		} else {
 			ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
@@ -735,7 +735,7 @@ static int edid_read(struct anx7625_data *ctx,
 	if (cnt > EDID_TRY_CNT)
 		return -EIO;
 
-	return 0;
+	return ret;
 }
 
 static int segments_edid_read(struct anx7625_data *ctx,
@@ -785,7 +785,7 @@ static int segments_edid_read(struct anx7625_data *ctx,
 	if (cnt > EDID_TRY_CNT)
 		return -EIO;
 
-	return 0;
+	return ret;
 }
 
 static int sp_tx_edid_read(struct anx7625_data *ctx,
@@ -887,7 +887,11 @@ static int sp_tx_edid_read(struct anx7625_data *ctx,
 	}
 
 	/* Reset aux channel */
-	sp_tx_rst_aux(ctx);
+	ret = sp_tx_rst_aux(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "Failed to reset aux channel!\n");
+		return ret;
+	}
 
 	return (blocks_num + 1);
 }
-- 
2.30.2


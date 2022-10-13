Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D95FD80C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B499310E7E9;
	Thu, 13 Oct 2022 11:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4BA10E7E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:04:23 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id u71so1271584pgd.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 04:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BptX1vlVcNHP5LWvhu8S2NjiO9ee4jWe/KGbor9Uaxo=;
 b=IjO7mPYpHNOk7l0IwChYojbxdMe0w7AtfsioruRTxng85gyCJNgkqJnFCxndp4y7CF
 LmqkG0MoozuBvOalP282o4s4e+MTQ5av6B5oaw8LvDe0Sbi6JKY3IsvlYNw+/irSHaoK
 /rpzoM8YRjbt815iGMAdUlEYWZVUMlSH94ac8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BptX1vlVcNHP5LWvhu8S2NjiO9ee4jWe/KGbor9Uaxo=;
 b=1dXmDUf+rurwr+nqTuuCV0qv6LVKSojhBNshCGRZGH80PPyREkEgDuMjixGIHrd02V
 rOWCtT/6+H5amaRGRsOVqfjCh2SZSL1wqqA0NaYFJ13jvZlLaWmrvswZwur6NDDT6LC3
 ZgbRq/0dnoAkezS1VDKdXK1pc+T96ufRaLwpO2hMMPdlF661Ln6Gi0pJMHALQf/SEiDr
 mrklplCwvoG65YxByseMhIhbeGaUuQ3w/sy/6tEyswL0QJm1CIKZgAjjZNBMYpex2zHg
 LbSiSN7OU3GWvSqxy2u/gYIAHt2QIHO92Q4gxn4BqfP6UewG6XNtqt7151//xhMBhM6v
 lAPA==
X-Gm-Message-State: ACrzQf1IosgMtD57rc/ClkBfwQQc5WlamcuAezVVj1eL00nFtpp+zupS
 lX072rhKO4gtCrkF2/I7OL0Waw==
X-Google-Smtp-Source: AMsMyM5vi2Tzg/9fz7+9dffyUUr9Nbvyb5LJ1k3XC6DE7+11qMdHRvhWoVcFLb8QoWkWqqE58Gk15w==
X-Received: by 2002:a63:2cc2:0:b0:41c:681d:60d2 with SMTP id
 s185-20020a632cc2000000b0041c681d60d2mr28700706pgs.502.1665659062636; 
 Thu, 13 Oct 2022 04:04:22 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:4b90:18ed:8d41:7622])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a17090ab88b00b0020af2411721sm2914794pjr.34.2022.10.13.04.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 04:04:22 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] drm/bridge: it6505: Initialize AUX channel in
 it6505_i2c_probe
Date: Thu, 13 Oct 2022 19:04:08 +0800
Message-Id: <20221013110411.1674359-2-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221013110411.1674359-1-treapking@chromium.org>
References: <20221013110411.1674359-1-treapking@chromium.org>
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
Cc: Allen Chen <allen.chen@ite.com.tw>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Pin-yen Lin <treapking@chromium.org>,
 Hermes Wu <hermes.wu@ite.com.tw>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During device boot, the HPD interrupt could be triggered before the DRM
subsystem registers it6505 as a DRM bridge. In such cases, the driver
tries to access AUX channel and causes NULL pointer dereference.
Initializing the AUX channel earlier to prevent such error.

Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ite-it6505.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index a4302492cf8d..f7f6c3e20fae 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2871,10 +2871,7 @@ static int it6505_bridge_attach(struct drm_bridge *bridge,
 	}
 
 	/* Register aux channel */
-	it6505->aux.name = "DP-AUX";
-	it6505->aux.dev = dev;
 	it6505->aux.drm_dev = bridge->dev;
-	it6505->aux.transfer = it6505_aux_transfer;
 
 	ret = drm_dp_aux_register(&it6505->aux);
 
@@ -3354,6 +3351,11 @@ static int it6505_i2c_probe(struct i2c_client *client,
 	debugfs_init(it6505);
 	pm_runtime_enable(dev);
 
+	it6505->aux.name = "DP-AUX";
+	it6505->aux.dev = dev;
+	it6505->aux.transfer = it6505_aux_transfer;
+	drm_dp_aux_init(&it6505->aux);
+
 	it6505->bridge.funcs = &it6505_bridge_funcs;
 	it6505->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	it6505->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
-- 
2.38.0.rc1.362.ged0d419d3c-goog


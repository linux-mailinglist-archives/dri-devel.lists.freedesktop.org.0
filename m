Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982C5FC94B
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 18:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334D110E69B;
	Wed, 12 Oct 2022 16:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BED410E69B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 16:29:11 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 78so15916308pgb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 09:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cn1tYSp6Fs26zz8mdx6XxYmQlY8g3zLtpMK7g8RZT1U=;
 b=Fs4gWIc/2+USWqzntDJRD8yynnsb+1iJJm80wz2TexKT+yj1/30tVTpzfqpdS8pCvH
 HS4tBX00esP9gFzO0IfU6EgXKKLTonR/DMOrz79rWkAnGGazztmHzy3D0Pp9NhYjlbjx
 8bPjoHnzoGMcOrDGW71iHil+DqNvPV6tnom7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cn1tYSp6Fs26zz8mdx6XxYmQlY8g3zLtpMK7g8RZT1U=;
 b=tBs5MNbGVvraz2BjBM4WV0NHboiy1SIoVWr0/sgpcjYEFGZSJSxfyVvTkA5442lCVj
 bG/NN7Ux6XCkT3tXYQAbsLFByPYxQSA1GtNr74dCLwNGCFZG3zNWewm7sFUY2/yFyphU
 d7Ovfcw/8aF8mMYqnNryjiXef9P/0ehFsSAayx91iSuPAKNZC1a+bJxpyZ/k0KsxntZd
 kgtNMZpZsld3htmNacY20akCRmt/rVK7X+WSpQEcXYxDfve76MQnXzkjmu/n65+8jG9x
 OHFvirN5b63VfQagr8Y0Gt8k0r3DLwy8ZWoKPy47zx/ZVtfCfFi9vTP5GBfV0nA0pvmW
 ySsg==
X-Gm-Message-State: ACrzQf29Z2Q2YzbkDY5KbryzE4MFi89eX/Ss2sBTLoMOLqSHZmpL15NI
 rQTLOQVseri6kVPDv9dCqyZT8w==
X-Google-Smtp-Source: AMsMyM6HxJ+lgT8f8WrnaKCblNjlb/TUbZ2wY3dcWmlOhT8Hmm5Z6eImkf02dCMv+Hli0GCNG87qgA==
X-Received: by 2002:a05:6a00:8cc:b0:52c:7ab5:2ce7 with SMTP id
 s12-20020a056a0008cc00b0052c7ab52ce7mr31258809pfu.28.1665592150442; 
 Wed, 12 Oct 2022 09:29:10 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:2921:f6a9:5848:18e1])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a635704000000b0045dc85c4a5fsm9722163pgb.44.2022.10.12.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 09:29:09 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/bridge: it6505: Initialize AUX channel in
 it6505_i2c_probe
Date: Thu, 13 Oct 2022 00:28:57 +0800
Message-Id: <20221012162900.2876686-2-treapking@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
In-Reply-To: <20221012162900.2876686-1-treapking@chromium.org>
References: <20221012162900.2876686-1-treapking@chromium.org>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5C66A742
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 00:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E519D10E21B;
	Fri, 13 Jan 2023 23:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F343310E048
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 23:56:34 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f3so16018083pgc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5+evsYAc3b1lQ5lkyPBOLTAudAqBRHFoDkoyn9gzcWU=;
 b=bglNrXXzl+zfB88DcX28XESqwrqWNa2PfHlGEAegGmswKUvIEGuclPlzAGHJAX4jCa
 JS45SdnMg4dw/bRTbacQImuLolP2g4t6Xy/VSB3Vr6FXhf/nsHLl/zrsvI+YI1cS/bWg
 79LDXePloaL1xmygJa8gaMTVJUaxRy4BV/MC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5+evsYAc3b1lQ5lkyPBOLTAudAqBRHFoDkoyn9gzcWU=;
 b=vx2fqNPGZjnt4Wa7iPVUT3SqWgCCjlVZzmvXRP93emjU11iFuSk+peai+/38izdzeR
 TfTvA7tDc8oTtzq+rbkml/p7xhHPLzWcbqJNHIZs07F+uZ8p+mPueINofDo0KqTcX3W+
 x+YVjcN+boD8F0TeVYru1+qH8jnFEbWChnbQq9WAvaVp7KEkx0AHNm8UBjgjCilDkcl6
 Wi+7fbCffly2faRACgfPtsYQSxzj7F/PiUowpjJhJRLXr7/BP/xB3R7ZjkrOMWjqMIg+
 jDnXBc0E8o8tOiHTV7PfztPcgwj1ciByDsAdqqQ902FO4Us4YNvWGS7oXYqNAXrWZtGz
 XMLA==
X-Gm-Message-State: AFqh2kqGq4Wy0JqpzRQ9xOEHBpVRjGly8e1pDc0ZOQWvQHS4ZBbkJAoN
 OzPnYQkdb7xdBkd10P3r0HB/ZPBxBUQKbrng
X-Google-Smtp-Source: AMrXdXsl5dwvIc5BLm75HVq3ofqQwGV0J7iamu0uFTfbZwquAyj1MTYTinzmzaIutoOWtOvYzd3dTg==
X-Received: by 2002:a62:2746:0:b0:58b:af27:dcda with SMTP id
 n67-20020a622746000000b0058baf27dcdamr5847832pfn.14.1673654194182; 
 Fri, 13 Jan 2023 15:56:34 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:b4ad:3c49:1195:a01e])
 by smtp.gmail.com with ESMTPSA id
 f10-20020aa79d8a000000b005823b7da05asm10002737pfq.122.2023.01.13.15.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 15:56:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RFT PATCH 1/2] drm/bridge: tc358762: Set pre_enable_prev_first
Date: Fri, 13 Jan 2023 15:56:03 -0800
Message-Id: <20230113155547.RFT.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
order"). This should allow us to revert commit ec7981e6c614
("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time").

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/tc358762.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 0b6a28436885..77f7f7f54757 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.39.0.314.g84b9a713c41-goog


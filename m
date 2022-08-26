Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5599C5A25E3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 12:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D58610E3C2;
	Fri, 26 Aug 2022 10:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74F9C10E3C2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 10:32:37 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id t129so1165269pfb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=dtu5aMtj4xUVB2P5GCPZnShf7gkZy/unClrmm0lDZ+c=;
 b=b83I/LIUmp+5mSHBInI1Ef5MEkkssWTZ9r1cpEBUBRzA/ZJUnTHCJNuWKrDFCDHlfY
 GqFUviJizlXZBDZye7eBnd2IYU1/7zMGh+l+j1i15tqSv/PEnrQDHOfeNAzDVa6cI4zJ
 ASkiPi3xCAUlqtsESLiBaZ5DIwj78VM+MSY/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=dtu5aMtj4xUVB2P5GCPZnShf7gkZy/unClrmm0lDZ+c=;
 b=aKCS7yIDxrUaHrcWAH+tKRVJvaVt4QSqT/GEXUjFucxy9sWOiwF72a2gk1r1v7eUSY
 1hLb9sujMaZ9qoAZFW8xexc/8+aWJP6zqoffBWk1dOyqaNU7+rIPyGXot1Cuz3N/LYa7
 wisWlQGkWgwyTp39GLpMFE/mAV/igmXRxU/D24bvbbOQbcbZDpIC/G+aP4kVYRcjgl5U
 6f4GIr87uyDH6ABqStHOq0l8iIqEUTNmTEmcPfb3z3sD93oR2kb0nQIfFCd9381MI/fp
 Bceig3FMjkyrrA1uv5TXjCkiCJwAeeJ7nvKIL5HhlpA6cHbV5qX3KVkbr85gK3cIMoDj
 ilGQ==
X-Gm-Message-State: ACgBeo2vcwfEmXUGVA8+Z0YsHCYIX8QWMV/9gQacnvqJkI4MwTQv9ZcJ
 6Rxj5lpXPqO4ACemBAAkBxzMQg==
X-Google-Smtp-Source: AA6agR6YwO3Xn18S+BIsUXZCFTJcr2ucNOrvG9nC8pX4z4u57OUlF7fWbmEA7/GLENjqSBtMyfM3yQ==
X-Received: by 2002:aa7:8712:0:b0:537:db6d:af66 with SMTP id
 b18-20020aa78712000000b00537db6daf66mr30006pfo.55.1661509956933; 
 Fri, 26 Aug 2022 03:32:36 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:d4a7:ca1d:f607:5a3b])
 by smtp.gmail.com with ESMTPSA id
 n59-20020a17090a5ac100b001f510175984sm1314610pji.41.2022.08.26.03.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 03:32:36 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: it6505: Fix the order of DP_SET_POWER commands
Date: Fri, 26 Aug 2022 18:32:31 +0800
Message-Id: <20220826103231.2504799-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
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
 Pin-yen Lin <treapking@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Send DP_SET_POWER_D3 command to the downstream before stopping DP, so the
suspend process will not be interrupted by the HPD interrupt. Also modify
the order in .atomic_enable callback to make the callbacks symmetric.

Fixes: 77c18864c5fc ("drm/bridge: it6505: Send DP_SET_POWER_D3 before stopping DP")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index f9251ec49bf0..2bb957cffd94 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2951,9 +2951,6 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (ret)
 		dev_err(dev, "Failed to setup AVI infoframe: %d", ret);
 
-	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
-				     DP_SET_POWER_D0);
-
 	it6505_update_video_parameter(it6505, mode);
 
 	ret = it6505_send_video_infoframe(it6505, &frame);
@@ -2963,6 +2960,9 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	it6505_int_mask_enable(it6505);
 	it6505_video_reset(it6505);
+
+	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+				     DP_SET_POWER_D0);
 }
 
 static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -2974,9 +2974,9 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
 
 	if (it6505->powered) {
-		it6505_video_disable(it6505);
 		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
 					     DP_SET_POWER_D3);
+		it6505_video_disable(it6505);
 	}
 }
 
-- 
2.37.2.672.g94769d06f0-goog


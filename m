Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7755A5AF3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 06:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6447310E4C8;
	Tue, 30 Aug 2022 04:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DD710E54B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 04:58:06 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso7530056pjd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 21:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=dK8f+bSiX8rZNVbzJ6QM+JiqkHCfSPqcZ+FR3yPajWo=;
 b=mPR9wWeAHBswGlkEijMLxr1cR9rhgQuUAVTE7qdxas7ES5Bnv402ghcZi5oJClOt4M
 1+/qpTBkAikMnvfZYNb5kLkRTeH2fFpAfaOF+dE7DLnwUp01lD2b1A2PeFRaYNaT3+zu
 qdn8kPqSLXut6M0qm5k3LF2U/rExKP6v1jlHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=dK8f+bSiX8rZNVbzJ6QM+JiqkHCfSPqcZ+FR3yPajWo=;
 b=Gq3xqrDoPxcjlAm95OjFB0ycmTz6jkIALxZwSYyjS7A7GyHOCVvYZmECIkCUisNsuY
 ARMqEkLXGede29nBEBJm9tRJFbkhi10+FoddxTrqTsWZkRXE5peQPWho+El8Rs5CpqSW
 +n1cI3Hflb1bGyZy8ExjYZa/CxoztE3jqIiJUDjjqwYScSfLXAs6ZiLQYvTmyH2mfoe4
 lnRtvqa5CUNWd56fwSHsMWuKpI0kp3RBb4qyXcd+ernm4Di+PESg2iX+8ncGcUB05ilb
 fRjHQO0oSsvvzCth/TCDG6GM8AzqvuX3NZOkvk1umwsKuug4B3aqwl0NtdvbraPot4Z2
 AnNg==
X-Gm-Message-State: ACgBeo1oPt5TiJPjkF/f5l9D8Ty++XHGkrVGHVIIZIIJ/zpNpuQLouHD
 fyaipzz5JdJ7yFEqq1W6O4zJMQ==
X-Google-Smtp-Source: AA6agR6B6f8pNn5GZX6kUkW/UtxN7Z8yMMAjforcEPhR1lsXozCZCGHrZPkTAamDwEZeSl1y47WyVA==
X-Received: by 2002:a17:902:c651:b0:174:36ce:49ce with SMTP id
 s17-20020a170902c65100b0017436ce49cemr19431445pls.87.1661835486490; 
 Mon, 29 Aug 2022 21:58:06 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:85ae:69db:1857:fbad])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a17090a2ca600b001fe136b4930sm139328pjd.50.2022.08.29.21.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 21:58:05 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: it6505: Fix the order of DP_SET_POWER commands
Date: Tue, 30 Aug 2022 12:57:56 +0800
Message-Id: <20220830045756.1655954-1-treapking@chromium.org>
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

Fixes: 46ca7da7f1e8 ("drm/bridge: it6505: Send DPCD SET_POWER to downstream")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---

Changes in v2:
- Correct "fixes" tag.
- Collect "Reviewed-by" tag.

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


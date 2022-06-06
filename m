Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8110B53E144
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 09:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB42E10E31A;
	Mon,  6 Jun 2022 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B29C10E31A
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 07:24:24 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n8so11489133plh.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 00:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMfut4LPsHaQl9oSY0zIbRD7TwaINdF2fCPCCoRTmzk=;
 b=Jl/v7UQ2V39aHQrh/Am7iP+T7NGe3QacYFlH0Ig4qdL5AiB+Dp+T229S4wFwZMPQ6a
 xzAAgpFGOeVLZ775zebxoG+K4mBQu7CS7y83DrBE9t+waNPQ60EwDUxoWJ83nlU6/5t+
 T3zL8AGrm6DrgAEMGw4ekxZLj1CTAdOkoGi6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pMfut4LPsHaQl9oSY0zIbRD7TwaINdF2fCPCCoRTmzk=;
 b=gc+InEy9HvVs6rhJO9cADrwfgFX1cRoZyCAXFE1rKAO34I5gV8M5WZ4el4qr9mt0Ty
 Puu9TyPGnBJumvouGob8jbr25EPabGuZT/8+c5PqVOnRkBjX5AzqCp6QmulF898l/E7/
 X+z53eNLEswcDqw5m5NVZieXaqHIsxH2+tNvaW3HleXDBFSrST61DN1STyCSgTvxTwPd
 R9xDHrlUsxQJoB/GoMvJNvuBxyvT0m+BwTAFg7AnrcLJ/OjZFTXICJ6kr6wZI7Q1KJy3
 YVnKilk6uFxr28N83HXsFeqE3Wdn1eB2nzARncmeSibJxivzz4ZpXxkw+PMELwcyKODr
 PrOA==
X-Gm-Message-State: AOAM530EmvR2WrZaEjOYiZ3fJ87wtLHi1YpK5X0Oz5L33BUxdzB0IrQ3
 lExJD5NBHUcVYdLdkO4Vzo4EOA==
X-Google-Smtp-Source: ABdhPJwIbAPZl7VVoUAdeTLq7nntvE3YRj01MWcFW6M6bKPiVfbIr2+NrNIRF094+iw89O8FMIWWZg==
X-Received: by 2002:a17:902:7202:b0:167:6548:3f3e with SMTP id
 ba2-20020a170902720200b0016765483f3emr10255212plb.98.1654500264178; 
 Mon, 06 Jun 2022 00:24:24 -0700 (PDT)
Received: from treapking.tpe.corp.google.com
 ([2401:fa00:1:10:e921:a124:f7a6:a292])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a635d54000000b003fae8a7e3e5sm9802731pgm.91.2022.06.06.00.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 00:24:23 -0700 (PDT)
From: Pin-Yen Lin <treapking@chromium.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: it6505: Power off downstream device in
 .atomic_enable
Date: Mon,  6 Jun 2022 15:24:17 +0800
Message-Id: <20220606072417.328354-1-treapking@chromium.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
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
 dri-devel@lists.freedesktop.org, Pin-Yen Lin <treapking@chromium.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Power off the downstream device in .atomic_enable callback, so the
external display shows up again after changing resolution.

Fixes: 46ca7da7f1e8 ("drm/bridge: it6505: Send DPCD SET_POWER to downstream")

Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
---

 drivers/gpu/drm/bridge/ite-it6505.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4b673c4792d7..e5626035f311 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2945,6 +2945,9 @@ static void it6505_bridge_atomic_enable(struct drm_bridge *bridge,
 	if (ret)
 		dev_err(dev, "Failed to setup AVI infoframe: %d", ret);
 
+	it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
+				     DP_SET_POWER_D0);
+
 	it6505_update_video_parameter(it6505, mode);
 
 	ret = it6505_send_video_infoframe(it6505, &frame);
-- 
2.36.1.255.ge46751e96f-goog


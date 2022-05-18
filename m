Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5EA52B2C3
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 08:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACAF10E215;
	Wed, 18 May 2022 06:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1825810E215
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 06:59:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id r71so1377202pgr.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 23:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmSH4WeEBLasFK029hFJFejLoqVw7N7yZPY1rCf/FfU=;
 b=cvFS50VivsG2a7DUQM7O/jQw4CymgJ9LbNkb818N52p4s2zAa1WFjiS8iB6HMqZRvW
 6qDOkWsWqkMxV+IyEMpYo2pRFTd/9TZ5lt8pF0UQyZtcQbsuHTemqTMQVtF/bL483l2c
 m7G7hqDQnoySGOYbKJka6x2gX3+X4P2/M+4NnZSMPttUt7hHaNBzTkSVcrqYxCxRnnhj
 FQXcFw6JMAY1/tz6Ad3E85ciWSSTPopjgDX41NV3dfcsJhdHgF5pQ+zN3GlKlPmPCmqX
 j2tlCJnnLs4PQvIQk5aNrS/AsMO5S3krdBtERgZkrYPZek/lVFVrpm2J6OwlcCy52AyQ
 GZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmSH4WeEBLasFK029hFJFejLoqVw7N7yZPY1rCf/FfU=;
 b=wiM9WhqpCaazKnfNgcz+2/TbzcJT5G4SR8M6Kakipo9huIR84sTZ9UGimZLQaJ3gWO
 ECpqhxtQ3Tf/1MiOAIVErLnnkNEwbI8kcbJ7+u0RYSTOSfSwv412Tzr4nr8DYSd3PM1x
 Sv7LITWJCSRIon4n3+CF+zJUy5rduiZVfl1MklBJ4Km4XB4AgD4FxhS4Csf4960ZDksE
 qQ2QpMlf2g3jzMYIVTJxuUdCDVAd1SVu4688JgFLvoNQlx0XKRFpvBie84XQ4dRwqS6S
 tdpLseH6BcrdurrGzB8yFwBNyIvBoxdWeoYjb6f59agm/+Y/5BjzVfKjzFIYshT43UFm
 kUcg==
X-Gm-Message-State: AOAM533kvT67QZDEZmC5qPvpq0Vmm8iA2L0v+6v34Ul67qYaRBri8XBm
 9+C7eOK8b0a9XzNy8VBIC6k=
X-Google-Smtp-Source: ABdhPJxtTMXDI+f8tNs/ZUpIsUhmPUx1tJVZHzwxzEtN7KEf2Pc2d4NnQjrjCMBLpm/lgwNquFXuxA==
X-Received: by 2002:a63:4602:0:b0:3f2:7215:1ac0 with SMTP id
 t2-20020a634602000000b003f272151ac0mr10925036pga.179.1652857150712; 
 Tue, 17 May 2022 23:59:10 -0700 (PDT)
Received: from localhost.localdomain ([103.84.139.165])
 by smtp.gmail.com with ESMTPSA id
 g16-20020aa79f10000000b0050dc76281a6sm990241pfr.128.2022.05.17.23.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 23:59:10 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 architt@codeaurora.org
Subject: [PATCH] drm: bridge: sii8620: fix possible off-by-one
Date: Wed, 18 May 2022 14:58:56 +0800
Message-Id: <20220518065856.18936-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The next call to sii8620_burst_get_tx_buf will result in off-by-one
When ctx->burst.tx_count + size == ARRAY_SIZE(ctx->burst.tx_buf). The same
thing happens in sii8620_burst_get_rx_buf.

This patch also change tx_count and tx_buf to rx_count and rx_buf in
sii8620_burst_get_rx_buf. It is unreasonable to check tx_buf's size and
use rx_buf.

Fixes: e19e9c692f81 ("drm/bridge/sii8620: add support for burst eMSC transmissions")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index ec7745c31da0..ab0bce4a988c 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -605,7 +605,7 @@ static void *sii8620_burst_get_tx_buf(struct sii8620 *ctx, int len)
 	u8 *buf = &ctx->burst.tx_buf[ctx->burst.tx_count];
 	int size = len + 2;
 
-	if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
+	if (ctx->burst.tx_count + size >= ARRAY_SIZE(ctx->burst.tx_buf)) {
 		dev_err(ctx->dev, "TX-BLK buffer exhausted\n");
 		ctx->error = -EINVAL;
 		return NULL;
@@ -622,7 +622,7 @@ static u8 *sii8620_burst_get_rx_buf(struct sii8620 *ctx, int len)
 	u8 *buf = &ctx->burst.rx_buf[ctx->burst.rx_count];
 	int size = len + 1;
 
-	if (ctx->burst.tx_count + size > ARRAY_SIZE(ctx->burst.tx_buf)) {
+	if (ctx->burst.rx_count + size >= ARRAY_SIZE(ctx->burst.rx_buf)) {
 		dev_err(ctx->dev, "RX-BLK buffer exhausted\n");
 		ctx->error = -EINVAL;
 		return NULL;
-- 
2.25.1


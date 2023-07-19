Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AC2758D5F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 08:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EFE10E040;
	Wed, 19 Jul 2023 06:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EB110E040
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 06:02:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so65430855e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 23:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1689746531; x=1690351331; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mkZLqHE3iVHOICOh6iAIAdodJXBEtzaLjqYAOg31flE=;
 b=yUCW3tkG/kSrvrobap4JiXMH8bgw20XFnode3DLpSUy/YVixR82w6c6+lRxBm4iEYF
 6iBoT6Z2CIZhey3wj7kGeNAKmkonTtRpuCaeKXGBLSS1cS0kQB0+OG8SU3M8qdhB3TIv
 ripPSqSPZEQ+ztjs+G+1P3ZhyxY3hjw9IzBXbgUvLQdF6twnq56bgCVzVFyBfefEi+oV
 /povO4vBPvB9FFpaDMdbyV6sZQAA4l0hzVTXBcKlEPna4D4pftPBOhzfd2QOy5s/ETYO
 xR+/7iemVrRv0oLI7sLOX7xaV90JHETAixZ8o5W3SsNMlcV9cLFFhyiAdTBtSYvhJ3T2
 R8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689746531; x=1690351331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mkZLqHE3iVHOICOh6iAIAdodJXBEtzaLjqYAOg31flE=;
 b=PqrEjEqPUPYTs5oQ7Bij7NjPVr5m0QH3Jiv+3AQ+ziBFqr0YKfRWL+glCcvQlRg202
 /cJjZ8FYG3kHh8nfcH4QcmzqDj9CPfReDMgJS9iNIe6LZtpUmtTgPScKbgqOVbHTO97T
 CQS8GGm3BZd/DFP98f+T9EiVWe+M5dW9jUt96y7vvhsIjA5W8d2u3+CLl2XwOf38NH+J
 J3r+a/3Xf81vSU9gfNnb4Yd3YGtong2SVxnouU0LhtxujSjyT+sFYDbL/UR+Skq617iA
 w7yOxMrI5zEUARTQ99NAIr26YEPUrEvxAVdRqCDrk5ZMWyOOXwlDckvS74DOaRnjH+tK
 phWA==
X-Gm-Message-State: ABy/qLZJptd2j19fl5EPqMqdPR+XE9/zP09Mvi5g2M/ctj6b/PbuNv8Y
 HDSV+gku2uBMGjUYphuuSVfmig==
X-Google-Smtp-Source: APBJJlFNnbcKke5LjjHKOrAdLuk8o4o26cCL+2RmiJVUqSqhIj6KqvH+eK/zo7+p++ydqyIlDYQrbQ==
X-Received: by 2002:a05:600c:2253:b0:3fb:a937:6024 with SMTP id
 a19-20020a05600c225300b003fba9376024mr3604367wmm.29.1689746531235; 
 Tue, 18 Jul 2023 23:02:11 -0700 (PDT)
Received: from localhost.localdomain ([188.27.129.168])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a1ce90d000000b003fa95890484sm810119wmc.20.2023.07.18.23.02.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 23:02:10 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4] drm: adv7511: Fix low refresh rate register for ADV7533/5
Date: Wed, 19 Jul 2023 09:01:43 +0300
Message-ID: <20230719060143.63649-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20190716131005.761-1-bogdan.togorean@analog.com>
References: <20190716131005.761-1-bogdan.togorean@analog.com>
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, andrzej.hajda@intel.com,
 jonas@kwiboo.se, nuno.sa@analog.com, Laurent.pinchart@ideasonboard.com,
 Alexandru Ardelean <alex@shruggie.ro>, bogdan.togorean@analog.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bogdan Togorean <bogdan.togorean@analog.com>

For ADV7533 and ADV7535 low refresh rate is selected using
bits [3:2] of 0x4a main register.
So depending on ADV model write 0xfb or 0x4a register.

Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
Reviewed-by: Robert Foss <rfoss@kernel.org>
Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index ddceafa7b637..8d6c93296503 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -786,8 +786,13 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	regmap_update_bits(adv7511->regmap, 0xfb,
-		0x6, low_refresh_rate << 1);
+	if (adv7511->type == ADV7511)
+		regmap_update_bits(adv7511->regmap, 0xfb,
+				   0x6, low_refresh_rate << 1);
+	else
+		regmap_update_bits(adv7511->regmap, 0x4a,
+				   0xc, low_refresh_rate << 2);
+
 	regmap_update_bits(adv7511->regmap, 0x17,
 		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
 
-- 
2.41.0


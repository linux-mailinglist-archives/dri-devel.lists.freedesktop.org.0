Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A07060CF
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE17310E3BD;
	Wed, 17 May 2023 07:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319110E27D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 16:44:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f41d087b24so78979765e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 09:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20221208.gappssmtp.com; s=20221208; t=1684255460; x=1686847460; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9RRIvZyK8CQAM0dAt4H7LQ/6jjtstZYibAABduiNmKg=;
 b=1pki32CkIzhFh7JpQ37UTbB0z/0EiqVq7PJo2o0rHD72vTZTKzznUr+zstjp6pW7Ek
 5Nncvby+RBLpFydfYP84Daneai9k97DsMIaSrrbDD2SGqejUaoLaDb0kwqmgr6LTOVBM
 EEZ0w0sgFmstOkKPYLbUfMogrU9cEIaCLDXfBZicSZMEg6NLwUAlaWZoUQNcHuT9Y1e5
 xkgjVm2RC8QFLOhwL+EmZsEC7sLbKn/TUoGwMc9S928xL1uFyTbzKBPxqhNiqBE1wjVw
 mM4oNJk0AEedy4oa0o3oQ4fzrwbHGgQyzhjNX2iz0tBRCnhfq/utsw5L2htW22SNNyMk
 9T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684255460; x=1686847460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9RRIvZyK8CQAM0dAt4H7LQ/6jjtstZYibAABduiNmKg=;
 b=cdUZ8qv77IcgYYXHaxH8MfZO6H8kB1iE6tOoJ0opx6hUd/evn7vBVom10KQO+0AVYb
 iKPOyjM2YyHGUWbRZ8oi4OqunkKsbpsSeCwLZr2gerCgRmR2iPbO0bSJmLZXvWXCzKEQ
 vToIuDY0TPizisXhajlx2Bc3TPkD8gLLy0D4M4bSx9JE30+7fit0tZzyKf8Fdq32jEHr
 suYH013ty/TFnf6k+pSQgUTKluSqCCNxIx3K9K0QcEg2/wuOtw9aY+paRQN/Ftu4+HbY
 qbfnaNVqtyVp8f5xA+iDymlCa7oVk5FDSQM6QOuUWiDdmkUK8l0oUmt5b8S1cQGQc3I1
 Ybvg==
X-Gm-Message-State: AC+VfDwYyuH/mFxcgBBsCi+e/cHE61PyLb0IPLcXNILLTHmtBXX/XG+e
 GLqgDiYUsrSQ9d3bzlqK+l08rE8D+IURUzctJSE=
X-Google-Smtp-Source: ACHHUZ5PPeGhNUMDjhJMuSkkih/heMu/8CXLe09tt0djJBA5eZwtYs6f1RnDINUQqmnUi5x8iIBd0g==
X-Received: by 2002:a7b:ca51:0:b0:3f4:2148:e8e5 with SMTP id
 m17-20020a7bca51000000b003f42148e8e5mr23269068wml.1.1684255460042; 
 Tue, 16 May 2023 09:44:20 -0700 (PDT)
Received: from localhost.localdomain ([188.27.132.2])
 by smtp.gmail.com with ESMTPSA id
 h18-20020adffd52000000b003063db8f45bsm3219899wrs.23.2023.05.16.09.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 09:44:19 -0700 (PDT)
From: Alexandru Ardelean <alex@shruggie.ro>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm: adv7511: Fix low refresh rate register for ADV7533/5
Date: Tue, 16 May 2023 19:44:16 +0300
Message-Id: <20230516164416.11616-1-alex@shruggie.ro>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 17 May 2023 07:08:54 +0000
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
Cc: Bogdan Togorean <bogdan.togorean@analog.com>,
 Alexandru Ardelean <alex@shruggie.ro>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bogdan Togorean <bogdan.togorean@analog.com>

For ADV7533 and ADV7535 low refresh rate is selected using
bits [3:2] of 0x4a main register.
So depending on ADV model write 0xfb or 0x4a register.

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
---
 drivers/gpu/drm/i2c/adv7511.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/adv7511.c b/drivers/gpu/drm/i2c/adv7511.c
index 61aa824d45d2..e016105a8fbe 100644
--- a/drivers/gpu/drm/i2c/adv7511.c
+++ b/drivers/gpu/drm/i2c/adv7511.c
@@ -729,8 +729,13 @@ static void adv7511_encoder_mode_set(struct drm_encoder *encoder,
 	else
 		low_refresh_rate = ADV7511_LOW_REFRESH_RATE_NONE;
 
-	regmap_update_bits(adv7511->regmap, 0xfb,
-		0x6, low_refresh_rate << 1);
+	if (adv7511->type == ADV7511)
+		regmap_update_bits(adv7511->regmap, 0xfb,
+			0x6, low_refresh_rate << 1);
+	else
+		regmap_update_bits(adv7511->regmap, 0x4a,
+			0xc, low_refresh_rate << 2);
+
 	regmap_update_bits(adv7511->regmap, 0x17,
 		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
 
-- 
2.40.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D58C5A37
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 19:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F05010E56C;
	Tue, 14 May 2024 17:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="PvpKgiWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CCA10E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 17:22:01 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-1eecc71311eso49320275ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 10:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715707319; x=1716312119;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9F2O1ySgZCzUPwkKOIVF7CvO8xaM7qBPiKzCHpLk+3I=;
 b=PvpKgiWPKsGKGRlM98kOBxVHQ+7/Akjs7hwVQFA/X6Gt1/a51pXcvZDp6+A5aOwir0
 Tjbuzju1WVuJpScJHNiSN+sgq8E1aPMVD4A9bWBhGbCzk0gaYPFm7lDHQPFk01Nld8IE
 5FTGWu9kHvM1cAZQEGr0lp7bQCmyars9TF4VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707319; x=1716312119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9F2O1ySgZCzUPwkKOIVF7CvO8xaM7qBPiKzCHpLk+3I=;
 b=b3qhCexX2L9sYBBP3a3BZibC55f80ziqePwOv5oD2OG22gqlDXYX5Ch0u/6QAOHa2x
 YT4lMPMn+WM9LMSY2oHOREj2VpWiAuKf5gAowqJz783HeJy3ckQUHqGD1Mmf06jUD+9V
 N/u52QWzejRVws8YZbAN7lo3INWnku5EWiIPiuNk+Yca08rnrT7OPRQBzU9OOLpKLeV/
 YRnberUL9Etp3+Mgqsuv8E9AmeJm4Db5IGSJZwJKtXEftt0ZIh58zWYdALYnAHquNudl
 YSRzx815P+KZGtJYnRA9FlyRenxYeIhj3kuixzSjfyJYF5ZivJubots0uzAZEv+8Xkvh
 vMew==
X-Gm-Message-State: AOJu0YyX3gFkvL6yTm0u22Z/E3qRv3BKAINefS1iIdJS4QkD9tmSRL6S
 ByygLbcO+KYDtHiRt5s1g7tIzrJIPtd58j2BR7NNkd2Eea6LvAk9ZivIkq9HzY/gBRrOdy62M5E
 =
X-Google-Smtp-Source: AGHT+IF5Hi8A8gvBVkU38EIZ/5cpHdnK9nFkHtcNa75rxG8dzS/5sKxvVlEhSFAbLfiuOFv8u7J5hQ==
X-Received: by 2002:a17:902:e808:b0:1eb:4a72:91ff with SMTP id
 d9443c01a7336-1ef43f4e4c3mr222172195ad.49.1715707319574; 
 Tue, 14 May 2024 10:21:59 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ef10:6fdf:5041:421f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf3101csm100147575ad.121.2024.05.14.10.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:21:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] drm/mipi-dsi: mipi_dsi_*_write functions don't need to
 ratelimit prints
Date: Tue, 14 May 2024 10:20:53 -0700
Message-ID: <20240514102056.v5.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240514172136.1578498-1-dianders@chromium.org>
References: <20240514172136.1578498-1-dianders@chromium.org>
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

We really don't expect these errors to be printed over and over
again. When a driver hits the error it should bail out. Just use a
normal error print.

This gives a nice space savings for users of these functions:

$ scripts/bloat-o-meter \
  .../before/panel-novatek-nt36672e.ko \
  .../after/panel-novatek-nt36672e.ko
add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-16760 (-16760)
Function                                     old     new   delta
nt36672e_1080x2408_60hz_init               17080   10640   -6440
nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
Total: Before=31815, After=15055, chg -52.68%

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v3)

Changes in v3:
- ("mipi_dsi_*_write functions don't need to ratelimit...") moved earlier.

Changes in v2:
- New

 include/drm/drm_mipi_dsi.h | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index e0f56564bf97..67967be48dbd 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -314,17 +314,16 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
  * @dsi: DSI peripheral device
  * @seq: buffer containing the payload
  */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                 \
-	do {                                                                    \
-		static const u8 d[] = { seq };                                  \
-		struct device *dev = &dsi->dev;                                 \
-		ssize_t ret;                                                    \
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));            \
-		if (ret < 0) {                                                  \
-			dev_err_ratelimited(dev, "transmit data failed: %zd\n", \
-					    ret);                               \
-			return ret;                                             \
-		}                                                               \
+#define mipi_dsi_generic_write_seq(dsi, seq...)                           \
+	do {                                                              \
+		static const u8 d[] = { seq };                            \
+		struct device *dev = &dsi->dev;                           \
+		ssize_t ret;                                              \
+		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));      \
+		if (ret < 0) {                                            \
+			dev_err(dev, "transmit data failed: %zd\n", ret); \
+			return ret;                                       \
+		}                                                         \
 	} while (0)
 
 /**
@@ -340,8 +339,7 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 		ssize_t ret;                                                \
 		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));     \
 		if (ret < 0) {                                              \
-			dev_err_ratelimited(                                \
-				dev, "sending command %#02x failed: %zd\n", \
+			dev_err(dev, "sending command %#02x failed: %zd\n", \
 				cmd, ret);                                  \
 			return ret;                                         \
 		}                                                           \
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


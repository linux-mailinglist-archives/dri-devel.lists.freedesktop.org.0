Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703628B8D5A
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D58710FA3A;
	Wed,  1 May 2024 15:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="at+uXZy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FE210F1D2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:43:25 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-6edc61d0ff6so6915813b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714578205; x=1715183005;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wAD627IJLyAwq2+Pm443W8wYZzFiM9UM6KaJFA24npw=;
 b=at+uXZy2RvuyenhyYm5L3cEyahgT1paDWGV+afmnvn0wL2mjXWIdzSz49/OuBk26v6
 EDGnNAnvMocFkc8ushcNLiVNQ9SsGn0u2VxAtjNyXrCUHjH1bNdX442F5H+bStIgjwbp
 4Dnvfz+++3+OXPlAs0UI03XePxZKjkGRFPpsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714578205; x=1715183005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wAD627IJLyAwq2+Pm443W8wYZzFiM9UM6KaJFA24npw=;
 b=hV67U7FtIkohc/tPxQAEa9XGFobvt1D3gjVAF/nw3aL57OrmqS+zQdTP2tSjhwP5vJ
 Shz8xXWpDkwCxSF20WC/YWK39POzzfGtXELisdw34cmQMfnTNdeLixVgvCq7teDDCMF1
 iri/+vSDAGpUJd3PG+0gmv2I/Put5DVDRgKOkPUfUJtMmlMtCjftH13XYp+NMyl+7nxl
 sHqOtYQiJTSgwOr9y3APoXBfg0dhuCa4u+ZubcWAqMF+pqu1FiQqazQz690qp7nJ9gN4
 aa8n0VQ259rhOggPDccIvnn0iK2vGRFjYvZQO+mvqvDv4nv55XzAhegEpGI7iOKnW4M4
 Eirg==
X-Gm-Message-State: AOJu0YwzVnhzrRqbX4ZQuZx9m04rd4Tj/a6VcFUKbzfB9K7XdTD2E55K
 R870Y3kor1keep3/p3xbNaMVcdTrFJVDN7Wl+A13Gsesi8ZHqmJ0uL+rMrV0DAk8g94Z4OquvZk
 =
X-Google-Smtp-Source: AGHT+IHnQJcwW7iSgBS1Mn2cIHPMUqWwr0A7IK4cUZyXisTKMjjwtDQdihxzWoNTTqOFDzU5XwnMpQ==
X-Received: by 2002:a05:6a00:a02:b0:6ea:86f2:24fb with SMTP id
 p2-20020a056a000a0200b006ea86f224fbmr3949203pfh.25.1714578204875; 
 Wed, 01 May 2024 08:43:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:e886:8de:19a2:55b0])
 by smtp.gmail.com with ESMTPSA id
 fb12-20020a056a002d8c00b006f3ec69bc09sm7717924pfb.75.2024.05.01.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:43:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Brian Norris <briannorris@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] drm/mipi-dsi: mipi_dsi_*_write functions don't need to
 ratelimit prints
Date: Wed,  1 May 2024 08:41:06 -0700
Message-ID: <20240501084109.v3.3.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
In-Reply-To: <20240501154251.3302887-1-dianders@chromium.org>
References: <20240501154251.3302887-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.45.0.rc0.197.gbae5840b3b-goog


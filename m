Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A690B8B17F0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 02:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF101113EDF;
	Thu, 25 Apr 2024 00:21:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="arBLTdRw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2F7113EDE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:21:00 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6eb86aeeb2cso268114a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 17:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714004459; x=1714609259;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ObhZs+th7g8VscGs2I0yShbfHJZx8oS19i8kCf/KxY=;
 b=arBLTdRwc+BRzqKagMdtOwQnGktkhgxWH04t8m4M3pVkxAGbIMr/PNQmaI2j+6IRiS
 +GoNaL96AYWeh3QwexTBlekPmPghogoS3K4TG6YyvEb24xp6HwwZio/67Z/U/nmHt0NX
 /Qa94olUXzYQhxtlqXkooL/cb7KE4ILMppcI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714004459; x=1714609259;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ObhZs+th7g8VscGs2I0yShbfHJZx8oS19i8kCf/KxY=;
 b=LUaLGWF8Gj4IcIhwrhKcV470Jrr6wVQcZ0KhaQRxGr90miEEWbxba8rC0Ghq8EWB9M
 qi+r96psS2YeLgHRT0bFxAAr6wQDcMWnegcs6P5FBZYYngxpFqlu5RbpFs6UDMPNF14e
 ygsS6SSMQhYyLINPvsPlPRO5AxzQd7j9ynHaGB7gL5xgtIOb2BJNDpHzTdHW5SCr8QS6
 8ZbCjhg01dhqy3suBe7dV5ZMksqsVGhJDpzG2tjQf8pR4JJ2/6RoE/26k8ZrCEzcqpz5
 vFGlN/CpxT0i6nFNZ0pyofa3D9fXxNp+HWYLfatxI7I4H4qSzoGktbi9fRmpJJ3uhNiD
 Ovew==
X-Gm-Message-State: AOJu0YzlxOMcnsZPJ4VydxsJzeAoyergGam62bxZS3fIvqHofRBCMpFY
 Zs+G7hjWFkjUbunMfTRGYga6IF0v9p0xnqacVinlDCDmuWpUGWghSCsxDHQaJIiQXNpg1n77M0c
 =
X-Google-Smtp-Source: AGHT+IG5J2R7XHW8gknBTIc0tbqbR6H7suWvgk1m9INcP18Qp3bZh0OHj2EQjYRxMgRNbxalMUB3JQ==
X-Received: by 2002:a05:6870:956f:b0:221:bf34:b15f with SMTP id
 v47-20020a056870956f00b00221bf34b15fmr3141193oal.25.1714004458468; 
 Wed, 24 Apr 2024 17:20:58 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:7c53:2204:2b1d:2152])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa78891000000b006ecf217a5e1sm12012311pfe.189.2024.04.24.17.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 17:20:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linus.walleij@linaro.org,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Hsin-Yi Wang <hsinyi@google.com>, Sam Ravnborg <sam@ravnborg.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mipi-dsi: Reduce driver bloat of mipi_dsi_*_write_seq()
Date: Wed, 24 Apr 2024 17:20:18 -0700
Message-ID: <20240424172017.1.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
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

The consensus of many DRM folks is that we want to move away from DSI
drivers defining tables of init commands. Instead, we want to move to
init functions that can use common DRM functions. The issue thus far
has been that using the macros mipi_dsi_generic_write_seq() and
mipi_dsi_dcs_write_seq() bloats the driver using them.

Through a cooperative effort between Hsin-Yi Wang and Dmitry
Baryshkov, we have realized that the majority of the bloat is the fact
that we have the dev_err_ratelimited() directly in the macros. Let's
hoist this call into drm_mipi_dsi.c by adding a "chatty" version of
the functions that includes the print.

Without any changes to clients this gives a dramatic savings. Building
with my build system shows one example:

$ scripts/bloat-o-meter \
  .../before/panel-novatek-nt36672e.ko \
  .../after/panel-novatek-nt36672e.ko

add/remove: 0/1 grow/shrink: 1/1 up/down: 6/-19652 (-19646)
Function                                     old     new   delta
__UNIQUE_ID_vermagic520                       64      70      +6
nt36672e_1080x2408_60hz_init               16592    7260   -9332
nt36672e_1080x2408_60hz_init._rs           10320       -  -10320
Total: Before=31503, After=11857, chg -62.36%

Note that given the change in location of the print it's harder to
include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
theoretically, someone could call the new chatty function with a
zero-size array and it would be illegal to dereference data[0].
There's a printk format to print the whole buffer and this is probably
more useful for debugging anyway. Given that we're doing this for
mipi_dsi_dcs_write_seq(), let's also print the buffer for
mipi_dsi_generic_write_seq() in the error case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
The MIPI device I have in front of me (wormdingler) hasn't been
converted to use these functions yet, so this is just compile
tested. It's about my end of day so I'm sending this out since it's
pretty straightforward. Hopefully others can confirm it works well for
them and also saves space under their compilers.

 drivers/gpu/drm/drm_mipi_dsi.c | 54 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 31 ++++++++-----------
 2 files changed, 67 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 795001bb7ff1..5ded6aef38ed 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -764,6 +764,33 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
+/**
+ * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
+ * @dsi: DSI peripheral device
+ * @payload: buffer containing the payload
+ * @size: size of payload buffer
+ *
+ * Just like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
+ * call for you.
+ *
+ * Return: The number of bytes transmitted on success or a negative error code
+ * on failure.
+ */
+ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
+				      const void *payload, size_t size)
+{
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_generic_write(dsi, payload, size);
+	if (ret < 0)
+		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
+				    (int)size, payload, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -852,6 +879,33 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
 
+/**
+ * mipi_dsi_dcs_write_buffer_chatty - mipi_dsi_dcs_write_buffer() w/ an error log
+ * @dsi: DSI peripheral device
+ * @data: buffer containing data to be transmitted
+ * @len: size of transmission buffer
+ *
+ * Just like mipi_dsi_dcs_write_buffer() but includes a dev_err_ratelimited()
+ * call for you.
+ *
+ * Return: The number of bytes successfully transmitted or a negative error
+ * code on failure.
+ */
+ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
+					 const void *data, size_t len)
+{
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
+	if (ret < 0)
+		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
+				    (int)len, data, ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 82b1cc434ea3..784e425dc4c8 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -256,6 +256,8 @@ int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
+ssize_t mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
+				      const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 
@@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
 
 ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 				  const void *data, size_t len);
+ssize_t mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
+					 const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -317,14 +321,10 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 #define mipi_dsi_generic_write_seq(dsi, seq...)                                \
 	do {                                                                   \
 		static const u8 d[] = { seq };                                 \
-		struct device *dev = &dsi->dev;                                \
 		int ret;                                                       \
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));           \
-		if (ret < 0) {                                                 \
-			dev_err_ratelimited(dev, "transmit data failed: %d\n", \
-					    ret);                              \
+		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
+		if (ret < 0)                                                   \
 			return ret;                                            \
-		}                                                              \
 	} while (0)
 
 /**
@@ -333,18 +333,13 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
  * @cmd: Command
  * @seq: buffer containing data to be transmitted
  */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                           \
-	do {                                                               \
-		static const u8 d[] = { cmd, seq };                        \
-		struct device *dev = &dsi->dev;                            \
-		int ret;                                                   \
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0) {                                             \
-			dev_err_ratelimited(                               \
-				dev, "sending command %#02x failed: %d\n", \
-				cmd, ret);                                 \
-			return ret;                                        \
-		}                                                          \
+#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                               \
+	do {                                                                   \
+		static const u8 d[] = { cmd, seq };                            \
+		int ret;                                                       \
+		ret = mipi_dsi_dcs_write_buffer_chatty(dsi, d, ARRAY_SIZE(d)); \
+		if (ret < 0)                                                   \
+			return ret;                                            \
 	} while (0)
 
 /**
-- 
2.44.0.769.g3c40516874-goog


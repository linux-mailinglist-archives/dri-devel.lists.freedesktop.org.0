Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127498B8D5B
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 17:43:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3FE10F157;
	Wed,  1 May 2024 15:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="arMrgA8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC72610F157
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2024 15:43:28 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6f3f6aa1437so3391318b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2024 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714578207; x=1715183007;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdqLCsG6yH2ylvUtBdK7xRsLXNRPF4P26ZlbxzbdCAs=;
 b=arMrgA8x/09/nGlcsJGVsFFT/5YkfipU3jOu4NoKDHf6YlhvyA0loWZWVkSZl1MnEu
 Edid0Xm7wrD44sF3CUOD3YIGdbxk5Sh/RMumOhHB/gDGRCe24q+/7P4wZ4AwVkzCQHo6
 grgR9WkC2ulpkxCRIiTx7Gss/ho8/7wA4fcVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714578207; x=1715183007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PdqLCsG6yH2ylvUtBdK7xRsLXNRPF4P26ZlbxzbdCAs=;
 b=cuGTMoc5oHlACJohp8bvggc5DKLScgR+7MqdJpcQ4eH4cE6gAy93klzbyI4KRWD37h
 XKt90iIGDB4EdVBfKQMCcKaEswRGpYYB7ikkC1Tpv9XH9UBw40WRovL/I752K1UmrfsF
 CFMhnNAqOza/zd2/j6vGmymUKpQ+9Ac4eXeB5Sj/HQYXe1EZ7MPXHhNvAki0tOX2DmPa
 HV3HtxUp4kMM5mM0246LaihkMe7m6eGbZyrYDx6YvXcKi0LgQI4Dytenud4yOHEJ3b+k
 7JiC01Kx6/dWF3qGxGeLDHDqN7g8mY+BWzzyk23AXL9Rn/0HbkBgNwuIYPhi8+VK1leH
 wRsA==
X-Gm-Message-State: AOJu0YxBBJJJe3R0YrH1R/J/yX/3GUKrip6LKDZ7ysVk1pJDrMjwWl9p
 vTQ6jAA3CanAhDUPbm7Fx8iQEa+dtqlmex6IitnBEaIsXx5kC1zJ6CCMbbUMZeNoenewoBC4Gh4
 =
X-Google-Smtp-Source: AGHT+IEpb9hu/+w6lC896xSQLLAgZ0Frgtjrm4c/ukurMA4cbUXqvrXhDqtlA1gpxRSC8kZpsrSbVg==
X-Received: by 2002:a05:6a20:9187:b0:1a9:4055:6dce with SMTP id
 v7-20020a056a20918700b001a940556dcemr2831466pzd.58.1714578206857; 
 Wed, 01 May 2024 08:43:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:e886:8de:19a2:55b0])
 by smtp.gmail.com with ESMTPSA id
 fb12-20020a056a002d8c00b006f3ec69bc09sm7717924pfb.75.2024.05.01.08.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 08:43:26 -0700 (PDT)
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
Subject: [PATCH v3 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
Date: Wed,  1 May 2024 08:41:07 -0700
Message-ID: <20240501084109.v3.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
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

Through a cooperative effort between Hsin-Yi Wang and Dmitry
Baryshkov, we have realized the dev_err() in the
mipi_dsi_*_write_seq() macros was causing quite a bit of bloat to the
kernel. Let's hoist this call into drm_mipi_dsi.c by adding a "chatty"
version of the functions that includes the print. While doing this,
add a bit more comments to these macros making it clear that they
print errors and also that they return out of _the caller's_ function.

Without any changes to clients this gives a nice savings. Building
with my build system shows one example:

$ scripts/bloat-o-meter \
  .../before/panel-novatek-nt36672e.ko \
  .../after/panel-novatek-nt36672e.ko
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-4404 (-4404)
Function                                     old     new   delta
nt36672e_1080x2408_60hz_init               10640    6236   -4404
Total: Before=15055, After=10651, chg -29.25%

Note that given the change in location of the print it's harder to
include the "cmd" in the printout for mipi_dsi_dcs_write_seq() since,
theoretically, someone could call the new chatty function with a
zero-size array and it would be illegal to dereference data[0].
There's a printk format to print the whole buffer and this is probably
more useful for debugging anyway. Given that we're doing this for
mipi_dsi_dcs_write_seq(), let's also print the buffer for
mipi_dsi_generic_write_seq() in the error case.

It should be noted that the current consensus of DRM folks is that the
mipi_dsi_*_write_seq() should be deprecated due to the non-intuitive
return behavior. A future patch will formally mark them as deprecated
and provide an alternative.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Rebased upon patch to remove ratelimit of prints.

Changes in v2:
- Add some comments to the macros about printing and returning.
- Change the way err value is handled in prep for next patch.
- Modify commit message now that this is part of a series.
- Rebased upon patches to avoid theoretical int overflow.

 drivers/gpu/drm/drm_mipi_dsi.c | 56 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 47 +++++++++++++++-------------
 2 files changed, 82 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 795001bb7ff1..8593d9ed5891 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -764,6 +764,34 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
+/**
+ * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
+ * @dsi: DSI peripheral device
+ * @payload: buffer containing the payload
+ * @size: size of payload buffer
+ *
+ * Like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
+ * call for you and returns 0 upon success, not the number of bytes sent.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
+				  const void *payload, size_t size)
+{
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	ret = mipi_dsi_generic_write(dsi, payload, size);
+	if (ret < 0) {
+		dev_err(dev, "sending generic data %*ph failed: %zd\n",
+			(int)size, payload, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -852,6 +880,34 @@ ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
 
+/**
+ * mipi_dsi_dcs_write_buffer_chatty - mipi_dsi_dcs_write_buffer() w/ an error log
+ * @dsi: DSI peripheral device
+ * @data: buffer containing data to be transmitted
+ * @len: size of transmission buffer
+ *
+ * Like mipi_dsi_dcs_write_buffer() but includes a dev_err_ratelimited()
+ * call for you and returns 0 upon success, not the number of bytes sent.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
+				     const void *data, size_t len)
+{
+	struct device *dev = &dsi->dev;
+	ssize_t ret;
+
+	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
+	if (ret < 0) {
+		dev_err(dev, "sending dcs data %*ph failed: %zd\n",
+			(int)len, data, ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_chatty);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 67967be48dbd..6d68d9927f46 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -256,6 +256,8 @@ int mipi_dsi_picture_parameter_set(struct mipi_dsi_device *dsi,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
+int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
+				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 
@@ -279,6 +281,8 @@ enum mipi_dsi_dcs_tear_mode {
 
 ssize_t mipi_dsi_dcs_write_buffer(struct mipi_dsi_device *dsi,
 				  const void *data, size_t len);
+int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
+				     const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -311,38 +315,39 @@ int mipi_dsi_dcs_get_display_brightness_large(struct mipi_dsi_device *dsi,
 
 /**
  * mipi_dsi_generic_write_seq - transmit data using a generic write packet
+ *
+ * This macro will print errors for you and will RETURN FROM THE CALLING
+ * FUNCTION (yes this is non-intuitive) upon error.
+ *
  * @dsi: DSI peripheral device
  * @seq: buffer containing the payload
  */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                           \
-	do {                                                              \
-		static const u8 d[] = { seq };                            \
-		struct device *dev = &dsi->dev;                           \
-		ssize_t ret;                                              \
-		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));      \
-		if (ret < 0) {                                            \
-			dev_err(dev, "transmit data failed: %zd\n", ret); \
-			return ret;                                       \
-		}                                                         \
+#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
+	do {                                                                   \
+		static const u8 d[] = { seq };                                 \
+		int ret;                                                       \
+		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
+		if (ret < 0)                                                   \
+			return ret;                                            \
 	} while (0)
 
 /**
  * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
+ *
+ * This macro will print errors for you and will RETURN FROM THE CALLING
+ * FUNCTION (yes this is non-intuitive) upon error.
+ *
  * @dsi: DSI peripheral device
  * @cmd: Command
  * @seq: buffer containing data to be transmitted
  */
-#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...)                            \
-	do {                                                                \
-		static const u8 d[] = { cmd, seq };                         \
-		struct device *dev = &dsi->dev;                             \
-		ssize_t ret;                                                \
-		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));     \
-		if (ret < 0) {                                              \
-			dev_err(dev, "sending command %#02x failed: %zd\n", \
-				cmd, ret);                                  \
-			return ret;                                         \
-		}                                                           \
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
2.45.0.rc0.197.gbae5840b3b-goog


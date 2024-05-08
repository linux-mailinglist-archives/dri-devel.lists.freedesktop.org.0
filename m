Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288638C05E6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 22:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEFB10FB9D;
	Wed,  8 May 2024 20:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hCx/2Bd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1046710FB9D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 20:53:24 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-5ce6b5e3c4eso136305a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715201603; x=1715806403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0KBQjikHoEoo31Ag6nuesXir34mVyr/KHi31tqkm70=;
 b=hCx/2Bd1iydsy9ntezvMImUmLUUpb8cXHAX3rogvoEb4Vo2euJ2fRuQqAqvI2dei1U
 tYEIfKU5NaRGtP47UKaBBzXeSqtlqCMJx2t17DagtpiVK5s6nW3SMdfwG6lNsHvyd3dE
 gZKkz1SZ8RaW7XoSduRU4HoZ0NMAormMAGM1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715201603; x=1715806403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H0KBQjikHoEoo31Ag6nuesXir34mVyr/KHi31tqkm70=;
 b=eeDZC518xb9N3Aaj6c9PIisJN5L366ef/pRXoT5C+RoNqpe0xoL8yFqYgrgJjWMP/R
 1IpbFHUJk/Q5aVloHTN3KuZ20uF5c8Pcc+aMkV0Yv7TDXdBdW7em10DC0910quCR98LS
 /rjtA7Jly5glWsP2ZGiBQIPFEYtfiuFPiv8eMgxDO9rD/lYTuGOK54UB9bzz66SetPnU
 Mcopa6BtKXQ55PFebwyurjZgXAnI9yWP0VdyTY3SttlkcW//Hy93O/D8ZJlPJHzVMh5f
 P/T+JkkLr6IHPcjYP5eR+Xd4LQEeSNr9ro4osgJPm5oysyrj4DNc+rEGkXaDI1E3PC0l
 0Eww==
X-Gm-Message-State: AOJu0YxiBrrtPHgN5bfoAu6QpHB3NkqaZkoM5/Ox4o+iJxiXDtrVOZAG
 8rsqHqNB5jZIKLoAUNtmujzCV5/ELB36WdEzOh0vPJegdGu/ueOZozd9ZGrMOOYAPtE3DdW2xpY
 =
X-Google-Smtp-Source: AGHT+IE52ygfxvKZfSUFp985/EUTRAks71N4Iu7eNeNZ/S31yCHhDoyeglHw6Q/rCJMwMG6Dg6CVVg==
X-Received: by 2002:a17:90b:4b11:b0:2b1:8210:56bb with SMTP id
 98e67ed59e1d1-2b6163a2665mr3577408a91.3.1715201602810; 
 Wed, 08 May 2024 13:53:22 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:40f4:feca:59e0:d3ca])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b67126ad51sm6887a91.25.2024.05.08.13.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 13:53:22 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>, Linus Walleij <linus.walleij@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] drm/mipi-dsi: Reduce driver bloat of
 mipi_dsi_*_write_seq()
Date: Wed,  8 May 2024 13:51:46 -0700
Message-ID: <20240508135148.v4.4.Id15fae80582bc74a0d4f1338987fa375738f45b9@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240508205222.2251854-1-dianders@chromium.org>
References: <20240508205222.2251854-1-dianders@chromium.org>
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

Without any changes to clients this gives a nice savings. Specifically
the macro was inlined and thus the error report call was inlined into
every call to mipi_dsi_dcs_write_seq() and
mipi_dsi_generic_write_seq(). By using a call to a "chatty" function,
the usage is reduced to one call in the chatty function and a function
call at the invoking site.

Building with my build system shows one example:

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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Update wording as per Linus W.

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
2.45.0.rc1.225.g2a3ae87e7f-goog


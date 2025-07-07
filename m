Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AC7AFADCF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 09:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BCB10E13F;
	Mon,  7 Jul 2025 07:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="XTAWQijN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A584F10E13F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 07:57:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-742c7a52e97so2031319b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751875051; x=1752479851;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
 b=XTAWQijNoJKChm+PjibGR6n/1NQjqz4LeQMVxcB9p5QnomHOnIDueevxvhOi5rKvtu
 mULW8AnNUkLkRY0Rx/J7aITA5IacMK2hI3ufTAngN50+Qj9N7dOOyuCyWrZYfr6bgckU
 kZYij8Ro3wD2SeRiTi/YEmhUGHSoWLO5gKHQ3eOdgr7mHjROD55lB5Q3619866jPk9gt
 3yOV7V1zY+80TnpEWBcWoHNh1u3242a3v8T25aKUg/EyKQxl4yt/X+CtwEkzbT0+WdwJ
 J4LwQX3J6z9X/vqNDtU5mfPU4l5hkYa1qQYnluK7a4J4ugwN2+HqR+V2xv0MnCoaHUOc
 QdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875051; x=1752479851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PoWchHvEvGdP5Z/q0UzERLxYZuvcNkSip61qcq1I2gk=;
 b=MwvZE9hqtFgzjq4Rat2KcavR+VWLRlZkv80t1CJ/OcFWeQXdbo25jgZNyu6YS3CgIn
 /ghiNpNy2fe9oXzDrfIlP2Fd75/vdHo3LCIc5yxTZ6G50yL8mxTkFUSY4sWSemGqA0WN
 +YvuQeBCc5qbY5k1MOr0i22r/hqZW8PhXf7rtlSX6wPF6+E48sTiOTCnNA9C6Gp8bv0S
 66lqrwQOxcKCiA4FWIhY8RNRa8y9RG6ZLHdfahQ1/oFbxtPs6NLU8ONziJoYfgyXfj4U
 XPMD3IiTxwuyyy+VUMaedPGG6lyTi+FXcek3SqVJm5S/7b/h0fiOa3B760wGlIWQ7iQT
 rIJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvcmPOjHmH6QSM/gtiFs/qWM1wgxBG8rA4QcXF43EPSg2PUcjsirQ7TCPN6NK6Gec2U25xE0WsLKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAlv4/NTdZBvSy0cC0mp9P+4qu+ZaLlvuGMUzSJqfwg0LAnbAU
 eDOxsyyvBk3wjhVWbhW4D950dVTTEe3XDTTodYbS/VvkikQXBnEN8bYIWa9U9BpNpzk=
X-Gm-Gg: ASbGncs2yiEfLLnhN0qxjUknjHdwGPsLojC1fJMBv+p27S0wPPxeSXExSpEbNaVhWMv
 tKkDoD1cd/PAe5DkBSVfQ/7GmGBfjDbdSfVlrwJnfyHTP7Xb36qhUs5YrQ+rNVcJNBAt7x/ikPS
 dAwgx7uX/C/aBy3Ltl+LzdfrWYdOXVQfG82pyQbLuOAdlKM6sD8AB7YvnBlIjw1wl2+as4CU7uJ
 AWumkncBxarNIa2EQy6t2Of4NtnI0Fg61wrvgg9ffj2mPJFgF4AO9XSB6HCQeXdgl9FoEWppDMw
 jfuboUWRXJlY19XQ7SSQ99Vg/oMfZWOsv8wSZY/iCVn7T85/qmW/SqMjXG9pNE9548Bbhjrx6rw
 7J1mgJG4Dage8Kcl40Q==
X-Google-Smtp-Source: AGHT+IEItjQ5pli2AJ0rBOKHmZ7rfFk3/t/CL1j/RMQ2Bp4Fe+1XZFqzMaA4o2gCpzZkugK6AWVtuQ==
X-Received: by 2002:a05:6a00:2195:b0:748:33f3:8da3 with SMTP id
 d2e1a72fcca58-74cf6fd0ad9mr11173295b3a.19.1751875051077; 
 Mon, 07 Jul 2025 00:57:31 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 00:57:30 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Mon,  7 Jul 2025 01:56:57 -0600
Message-ID: <20250707075659.75810-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() macro and
mipi_dsi_generic_write_chatty() function now that they are no longer
used.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 34 +++-------------------------------
 include/drm/drm_mipi_dsi.h     | 23 -----------------------
 2 files changed, 3 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..3b8ff24980b4 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -772,41 +772,13 @@ ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 EXPORT_SYMBOL(mipi_dsi_generic_write);
 
 /**
- * mipi_dsi_generic_write_chatty() - mipi_dsi_generic_write() w/ an error log
- * @dsi: DSI peripheral device
- * @payload: buffer containing the payload
- * @size: size of payload buffer
- *
- * Like mipi_dsi_generic_write() but includes a dev_err()
- * call for you and returns 0 upon success, not the number of bytes sent.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size)
-{
-	struct device *dev = &dsi->dev;
-	ssize_t ret;
-
-	ret = mipi_dsi_generic_write(dsi, payload, size);
-	if (ret < 0) {
-		dev_err(dev, "sending generic data %*ph failed: %zd\n",
-			(int)size, payload, ret);
-		return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(mipi_dsi_generic_write_chatty);
-
-/**
- * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write_chatty() w/ accum_err
+ * mipi_dsi_generic_write_multi() - mipi_dsi_generic_write() w/ accum_err
  * @ctx: Context for multiple DSI transactions
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
- * Like mipi_dsi_generic_write_chatty() but deals with errors in a way that
- * makes it convenient to make several calls in a row.
+ * A wrapper around mipi_dsi_generic_write() that deals with errors in a way
+ * that makes it convenient to make several calls in a row.
  */
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size)
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..f9cc106c8eb6 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
@@ -379,27 +377,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 
-/**
- * mipi_dsi_generic_write_seq - transmit data using a generic write packet
- *
- * This macro will print errors for you and will RETURN FROM THE CALLING
- * FUNCTION (yes this is non-intuitive) upon error.
- *
- * Because of the non-intuitive return behavior, THIS MACRO IS DEPRECATED.
- * Please replace calls of it with mipi_dsi_generic_write_seq_multi().
- *
- * @dsi: DSI peripheral device
- * @seq: buffer containing the payload
- */
-#define mipi_dsi_generic_write_seq(dsi, seq...)                                \
-	do {                                                                   \
-		static const u8 d[] = { seq };                                 \
-		int ret;                                                       \
-		ret = mipi_dsi_generic_write_chatty(dsi, d, ARRAY_SIZE(d));    \
-		if (ret < 0)                                                   \
-			return ret;                                            \
-	} while (0)
-
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
  *
-- 
2.49.0


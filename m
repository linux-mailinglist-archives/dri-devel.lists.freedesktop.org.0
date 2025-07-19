Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E97B0AEA3
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 10:27:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D76510E1E3;
	Sat, 19 Jul 2025 08:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="mm7UTNl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E30510E1E3
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 08:27:04 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7490cb9a892so1855972b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752913624; x=1753518424;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
 b=mm7UTNl+w0OFEJAKFe70u79f8gNZ9Y+4qdTu1bKKm1u0YjjozflWvx47jt07tzLzK8
 3hp3Z04MnIiHd9x1+Oed1O3sCf6Y3C6hJJSoUzl5v5ioFruJxJ57sCpb3Amsv3+ss2lr
 E9VSzB6LQINj4ex333AgM9Dc+aENPwezkfHCyqH+F1yYknr/4K+76sB2FlyyNWhbU3+u
 /zJ9f0+795bSiuNH+/DRdoRo68r8JibarRw+EN6ubeXNq1Kj5jj1gYjiwcs53LDkhm+B
 ry3Rj4d3ILHc29hFHn9TXgSl+ZnSbyFqZV4534WlaRL2H85OxJ3OB6DHOZ3aGnDF91QT
 VZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752913624; x=1753518424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2MI/yokjCP1HwI/RReXqohEWfCg7UzwzYJvm86YPBHo=;
 b=RbHeAMBnMpgRcIpzUC2c+jH+eq7X75UX7iDsyraheP713E0jTnknhZOllHkKu/AlaO
 Xniu5kDjycyC8v1fURX65arZMthUoZHMSv5XLXe/QbH3gh/ZjmrbbTh3ErAxuFLXu048
 2d0/pTejffKYBrYuEBkC9rLiCHgaL5yQ+WJc6x3KGLTqJ1DB6Iq6eMdsGGBip3Kjm0Y/
 9VMY1gpRxdEf5ub+oILqNtu3FmG+a0MXboNBmCSSdyflokO0SEMI5Mt64rtC8CXYBs+B
 6lF2KhbVnZqD0Ngfp7X5xcZH5NPY8oLYh1ZIYzmPl3nnaIxgbfn5NuVyujqHMbaO8nrK
 QcuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVds8DctjYJR2rAQ1J3jV4C6++bnyLT1eUuUclPpQ3eMWmVW/oGVQiEtRboPa2qnc8SPzDGr5sifFE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8B7ePTnMRdUiEpioW6Xi6P7BGNQmk58yRYHSgzaQwhR31txs
 nYxqbp/uWl3/ScIvO93Y9GnkeWktfPQU1HD67pxWU2hDLngA7emq6gCSHauOQpRHnRY=
X-Gm-Gg: ASbGncuGTNZ2evzxhbDFhNNfkYOFD9GYvlUXTuwDtLoFkdW7PZfeUeyCDg7SQD0oOyE
 hDwfqzVOuhhkKVQQUcl7b384d54JaBBpBvv0CWpix3aM0dMvVR1qQhv/t+oZ+A0j4H9Ayh1uv5R
 oLZ1BXHVg/t89jBaCcaC4cmqjJEE0eMdndvayr9knG+A+LXJSCeIFD00QQH4QdqcPn1v5orEYvQ
 OhjI0OiBX8NmjrMiBdk1HDGsDab3Wu+ziDTTt9/PmaQNm6P1jXGTWtPz2Ysm1obsTbOAc7SpRkR
 TceUrBgXQtNTwkXhIqy2sDeMUUyYfFnctVQqtTrfpn9JmDroGmj6YL6R2aBcd2XF9XaYzLlNZWh
 cND1UG1RIbN+jzlFmutM4K4WrmCkBfiLH+e+u2oHD56cEI7ifyQ==
X-Google-Smtp-Source: AGHT+IEookr+a3eTQEBmol8DGigr1hM4wxeOxAzpxnN5vNTt7ozZfZj7qFtqjv6WzZYiLjYmaNRGvg==
X-Received: by 2002:a05:6a21:62c9:b0:238:3f54:78ea with SMTP id
 adf61e73a8af0-2391ca917fcmr7914227637.44.1752913624038; 
 Sat, 19 Jul 2025 01:27:04 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb157635sm2475260b3a.83.2025.07.19.01.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 01:27:03 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com,
 diogo.ivo@tecnico.ulisboa.pt, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v5 1/4] drm: Create mipi_dsi_dual* macros
Date: Sat, 19 Jul 2025 02:26:35 -0600
Message-ID: <20250719082639.307545-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250719082639.307545-1-me@brighamcampbell.com>
References: <20250719082639.307545-1-me@brighamcampbell.com>
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

Create mipi_dsi_dual, mipi_dsi_dual_dcs_write_seq_multi, and
mipi_dsi_dual_generic_write_seq_multi macros for panels which are driven
by two parallel serial interfaces. This allows for the reduction of code
duplication in drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

mipi_dsi_dual_dcs_write_seq_multi goes unused by jdi-lpm102a188a. It's
included in this patch for completeness and in anticipation of its use
in other drivers in the future.

 drivers/gpu/drm/drm_mipi_dsi.c | 48 ++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 89 ++++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..4a7ca1261105 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -827,6 +827,30 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
 
+/**
+ * mipi_dsi_dual_generic_write_multi() - mipi_dsi_generic_write_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @payload: Buffer containing the payload
+ * @size: Size of payload buffer
+ *
+ * A wrapper around mipi_dsi_generic_write_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mpi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				      struct mipi_dsi_device *dsi2,
+				      struct mipi_dsi_multi_context *ctx,
+				      const void *payload, size_t size)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_generic_write_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_generic_write_multi);
+
 /**
  * mipi_dsi_generic_read() - receive data using a generic read packet
  * @dsi: DSI peripheral device
@@ -1006,6 +1030,30 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
 
+/**
+ * mipi_dsi_dual_dcs_write_buffer_multi - mipi_dsi_dcs_write_buffer_multi() for
+ * two dsi channels, one after the other
+ * @dsi1: First dsi channel to write buffer to
+ * @dsi2: Second dsi channel to write buffer to
+ * @ctx: Context for multiple DSI transactions
+ * @data: Buffer containing data to be transmitted
+ * @len: Size of transmission buffer
+ *
+ * A wrapper around mipi_dsi_dcs_write_buffer_multi() that allows the user to
+ * conveniently write to two dsi channels, one after the other.
+ */
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len)
+{
+	ctx->dsi = dsi1;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+	ctx->dsi = dsi2;
+	mipi_dsi_dcs_write_buffer_multi(ctx, data, len);
+}
+EXPORT_SYMBOL(mipi_dsi_dual_dcs_write_buffer_multi);
+
 /**
  * mipi_dsi_dcs_write() - send DCS write command
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..ffdfcb57cbd4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -289,6 +289,10 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
+void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_device *dsi1,
+				       struct mipi_dsi_device *dsi2,
+				       struct mipi_dsi_multi_context *ctx,
+				       const void *payload, size_t size);
 ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 			      size_t num_params, void *data, size_t size);
 u32 drm_mipi_dsi_get_input_bus_fmt(enum mipi_dsi_pixel_format dsi_format);
@@ -329,6 +333,10 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
 				     const void *data, size_t len);
 void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 				     const void *data, size_t len);
+void mipi_dsi_dual_dcs_write_buffer_multi(struct mipi_dsi_device *dsi1,
+					  struct mipi_dsi_device *dsi2,
+					  struct mipi_dsi_multi_context *ctx,
+					  const void *data, size_t len);
 ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
@@ -431,6 +439,87 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * WARNING: This macro reuses the _func argument and the optional trailing
+ * arguments twice each, which may cause unintended side effects. For example,
+ * adding the postfix increment ++ operator to one of the arguments to be
+ * passed to _func will cause the variable to be incremented twice instead of
+ * once and the variable will be its original value + 1 when sent to _dsi2.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)		 \
+	do {							 \
+		struct mipi_dsi_multi_context *_ctxcpy = (_ctx); \
+		(_ctxcpy)->dsi = (_dsi1);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+		(_ctxcpy)->dsi = (_dsi2);			 \
+		(_func)((_ctxcpy), ##__VA_ARGS__);		 \
+	} while (0)
+
+/**
+ * mipi_dsi_dual_generic_write_seq_multi - transmit data using a generic write
+ * packet to two dsi interfaces, one after the other
+ *
+ * This macro will send the specified generic packet twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the packet to the first DSI
+ * interface, the packet will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_generic_write_seq_multi(_dsi1, _dsi2, _ctx, _seq...)	\
+	do {									\
+		static const u8 d[] = { _seq };					\
+		mipi_dsi_dual_generic_write_multi(_dsi1, _dsi2, _ctx, d,	\
+							 ARRAY_SIZE(d));	\
+	} while (0)
+
+/**
+ * mipi_dsi_dual_dcs_write_seq_multi - transmit a DCS command with payload to
+ * two dsi interfaces, one after the other
+ *
+ * This macro will send the specified DCS command with payload twice, once per
+ * each of the two interfaces supplied. This is useful for reducing duplication
+ * of code in panel drivers which use two parallel serial interfaces.
+ *
+ * Note that if an error occurs while transmitting the payload to the first DSI
+ * interface, the payload will not be sent to the second DSI interface.
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @_dsi1: First DSI interface to act as recipient of packet
+ * @_dsi2: Second DSI interface to act as recipient of packet
+ * @_ctx: Context for multiple DSI transactions
+ * @_cmd: Command
+ * @_seq: buffer containing the payload
+ */
+#define mipi_dsi_dual_dcs_write_seq_multi(_dsi1, _dsi2, _ctx, _cmd, _seq)   \
+	do {								    \
+		static const u8 d[] = { _cmd, _seq };			    \
+		mipi_dsi_dual_dcs_write_buffer_multi(_dsi1, _dsi2, _ctx, d, \
+						     ARRAY_SIZE(d));	    \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1


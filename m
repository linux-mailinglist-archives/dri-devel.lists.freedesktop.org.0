Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782BCB16AD1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 05:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D502310E467;
	Thu, 31 Jul 2025 03:23:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="JvH6h3au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4053910E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Jul 2025 03:23:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-240b3335c20so3695845ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 20:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753932233; x=1754537033;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YO3wVwEDuSYhrQ+FF5y/l5gPvVgHJtS+tEfRcRSUajo=;
 b=JvH6h3auA/A4h4VykYL8yX6eup3SYQSs7pumYnrgg20be8CkhXC3WobOXQzKENxjZj
 UdrsHZPhNFsuzhBkWEy9f3SQ0eIbOwoJZ2ZGE1Nfp1WsffaaRwh1ZClbmZBK1qkUNU/A
 dT/9x8KKrm5eyp6TuUqOWiB4fLer650kDkow+qDlLxYCFu35CIPB2s+3y5LcrFJU4p3j
 gUKY1zQmqTvN3favAdqrBZGgx28fZL9s3tqTi/MMreFfZxDP3yRiwwUctqpRBfebm4Fs
 jLsneeLYowpTMIvKdzLvxBb5U5ldxQMCKmHzHhlNvS5oewM8clTJlCDuGX91N4Bu7AEV
 6xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753932233; x=1754537033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YO3wVwEDuSYhrQ+FF5y/l5gPvVgHJtS+tEfRcRSUajo=;
 b=dkv6kJHVE8fuxPy142mPEgJRnOB9NYyyFeyUbV+nThtkhueKeDxKxW//w6bqq2vHM0
 npUfMzza6yMf8vDwiKErTPPcpPtGkp7x7fSe0ndYcmJbvE1VVtV71jVIHgdJdjqaWGnX
 jifF77JqCRo/J2VEzoQOVJrhFLvg3BnEEuWxJ/XlSPSm+DhXP3VP30rEDuMYK8fKlFFo
 i8FfP6KWtWdN6kqaPveCzNqavuAcypBg8BMD2gr3iYWZqWgPo/PkzBqncYteInjLp0fS
 1Yz5is0yPsZE4DkvTgSnIUb0ONVKpPIaXJYIzcvBDBM+gVKoLLbIETjFnBxaLBBXFzjH
 6oyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUre3q1MCF0gzV5RJ/EChvnGbAL4HWTfhu3tpsdieu00gINCLeqt/CaVnEYxmwQNGLlTnVnXpUnlc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyajBB8IjOaKXFxwnD4Pbx8Od064LrRvTSNvyrio4Xj1mjjPkGf
 RpK+h03lUDg4kBexMHgXzpyBBdxIxFDPywoFy8p2ULyrx4U0C2qX7o0ZL5ej/dOBphY=
X-Gm-Gg: ASbGncsZjdPtAUYrPHrpBY0b4U35u7B19c98k2JXd6rQWODBnql2/IinCUywAvScqou
 ywqAogKZk4KoV15lTo8TSk0D56N6ym9+0uvm6Aqc44fGdFlshfkO9whlaPD/de3w6/l4td9y4YW
 POOm5jKfsKQ+c3qEixDq/4TPbghXgzkk3Xpdiq8SeUZxVT8H399w6q1lguQUq9q6iKcqxNBKNRN
 djDQyJb95LTiJnlSou8RxuyjtrySNjmINjtb7TLwtERLJqXpCYECQ3nuXxDCdJwgMF7O036C7ZF
 pIeQNnjZpr+WMLoUDZMrwI0DX1CR81cMVR2uQFGAmdEJEaWo9HeH9K8ClWT2W3LN+4OE1DismSb
 cm3IGv3YYqZSuz8KTF7M8Qc/OryE80mPA6FpPYu0NliaKzeqn6pOysPkqpiLw
X-Google-Smtp-Source: AGHT+IE18gcw1L9AiSBmhHHznkEqWPINFS1vbZ9/Dmhaw4XfpgJGvjyRPijQawkyMW2EZS4l0LoVIg==
X-Received: by 2002:a17:903:3bcb:b0:23d:fa9a:80ac with SMTP id
 d9443c01a7336-24096a9ddcdmr85611615ad.16.1753932232544; 
 Wed, 30 Jul 2025 20:23:52 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1f15092sm4854795ad.66.2025.07.30.20.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 20:23:52 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v4 2/3] drm: Add MIPI read_multi func and two write macros
Date: Wed, 30 Jul 2025 21:23:42 -0600
Message-ID: <20250731032343.1258366-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731032343.1258366-1-me@brighamcampbell.com>
References: <20250731032343.1258366-1-me@brighamcampbell.com>
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

Create mipi_dsi_dcs_read_multi(), which accepts a mipi_dsi_multi_context
struct for improved error handling and cleaner panel driver code.

Create mipi_dsi_dcs_write_var_seq_multi() and
mipi_dsi_generic_write_var_seq_multi() macros which allow MIPI panel
drivers to write non-constant data to display controllers.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     | 35 ++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..0f2c3be98212 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -1075,6 +1075,43 @@ ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_read);
 
+/**
+ * mipi_dsi_dcs_read_multi() - mipi_dsi_dcs_read() w/ accum_err
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: DCS command
+ * @data: buffer in which to receive data
+ * @len: size of receive buffer
+ *
+ * Like mipi_dsi_dcs_read() but deals with errors in a way that makes it
+ * convenient to make several calls in a row.
+ */
+void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
+			     void *data, size_t len)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	struct mipi_dsi_msg msg = {
+		.channel = dsi->channel,
+		.type = MIPI_DSI_DCS_READ,
+		.tx_buf = &cmd,
+		.tx_len = 1,
+		.rx_buf = data,
+		.rx_len = len
+	};
+	ssize_t ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_device_transfer(dsi, &msg);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "dcs read with command %#x failed: %d\n", cmd,
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_read_multi);
+
 /**
  * mipi_dsi_dcs_nop() - send DCS nop packet
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..f06c753603ba 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -333,6 +333,8 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 			   const void *data, size_t len);
 ssize_t mipi_dsi_dcs_read(struct mipi_dsi_device *dsi, u8 cmd, void *data,
 			  size_t len);
+void mipi_dsi_dcs_read_multi(struct mipi_dsi_multi_context *ctx, u8 cmd,
+			     void *data, size_t len);
 int mipi_dsi_dcs_nop(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_soft_reset(struct mipi_dsi_device *dsi);
 int mipi_dsi_dcs_get_power_mode(struct mipi_dsi_device *dsi, u8 *mode);
@@ -415,6 +417,22 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_generic_write_var_seq_multi - transmit non-constant data using a
+ * generic write packet
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @ctx: Context for multiple DSI transactions
+ * @seq: buffer containing the payload
+ */
+#define mipi_dsi_generic_write_var_seq_multi(ctx, seq...)	     \
+	do {							     \
+		const u8 d[] = { seq };				     \
+		mipi_dsi_generic_write_multi(ctx, d, ARRAY_SIZE(d)); \
+	} while (0)
+
 /**
  * mipi_dsi_dcs_write_seq_multi - transmit a DCS command with payload
  *
@@ -431,6 +449,23 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-constant
+ * payload
+ *
+ * This macro will print errors for you and error handling is optimized for
+ * callers that call this multiple times in a row.
+ *
+ * @ctx: Context for multiple DSI transactions
+ * @cmd: Command
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_var_seq_multi(ctx, cmd, seq...)		\
+	do {								\
+		const u8 d[] = { cmd, seq };				\
+		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d));	\
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.50.1


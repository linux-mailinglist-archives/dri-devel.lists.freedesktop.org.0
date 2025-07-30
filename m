Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA632B158D5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 08:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB1610E36E;
	Wed, 30 Jul 2025 06:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cbaSzZDi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2F710E128
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 06:17:58 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-24049d16515so21502205ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 23:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753856278; x=1754461078;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QTa7ttMugFu1yCj4YKK1TgSGh01SfTxQdJKN90Hkmps=;
 b=cbaSzZDikyXunFwHU8GY//qj1m75XGAtMVd6n8eq1OqWDXLsJiajMGcVDS60kBJq5I
 6wicyNv/xrd4KRUr9GjtF9JfpN05BmTNImb0rKGbfxzdWBYunCu+457XR9Um4Vm4IlRG
 V+So8Yox9WEVSVf1lT/5A1VR9xUpGk2AHIRIe3YQHaFZVdVt5JuTAn2SAQ59X8Sjq5ng
 dK2kzOK0A0rCAFyWZIvaDOJ6SMRO+BWX2IVJFJb168lSFJX8UZhGS8QfHOz2yXd4Y373
 3layK/njXyUHJ3bGhRp8Ipe9V2G3HO2upSliiN3er9Gvh373HJTBK22XZwoz2wTffzDz
 t6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753856278; x=1754461078;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QTa7ttMugFu1yCj4YKK1TgSGh01SfTxQdJKN90Hkmps=;
 b=XVMSi6ef6h3voPNNHvfAfzRlSs322EMCLhhATjl0Par79wKDamCGJw36pQ4pL9k3fO
 kkTFZpjtnBtowMI3jcfLJt8D4LfvJCOpeneTjHGkv5rQV2xOew7YtUTEFHmcKefQUGfl
 hoP8/dGsTWLmXJIPYf9R8YKhHQnafw7augfN2XM3hVs5uL47U2cb+CPNOyKnrbZEBXO+
 jbv9RZ3bwdKdsakAyGU+aGpLMHDFqmW38qOwqcDvYONCZo0q2C8e3cKhgjw1NH4uwZhD
 iWjluMKjJj2JBMZMzVGbF9Dc8yd5Z1Rfw++MIml7/LKp9J9kcbmnpzhvYtlCUvqOzjBq
 O4Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh29wQWUGd5+VQ92ubqBagYkqEIkAvAPWdSbWiRfQqiTDgvfxwq+6Xesl+ncUGl+LCDXhaFKJP9bU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4DZpyhGl+cqP9eAF18E4wZmciYJXTYlrH0eSjmr3UqU2WWOCq
 x4+NUjWl1iSEO7zYj8/QWa9JIbSedcS5fCw05vsCka4OPkX2trk0piXYDPxWpiSC/hk=
X-Gm-Gg: ASbGncuIugt0aE+xFIREbwN2bWSe0tzzrEiCW4ty6l+DtWQBmOtwW+aLvT7y6JZQc5t
 HjGKngJ6OATQLw+cQdoS7IDeFQxbwZaxEbMnkMZiAfqesVsnvHeTGmChgeFR6RZr/4CEm5Xu3GT
 6iO8tPwk26CBfo7qozZ+3RcRccQ90hTigEf1CPGqK7IaMibasvJ1s4Q3VPxcQP9LqD3wyOQdGMU
 yvHNmQq5OgUqfMFHSDg05fL+tTJedGBz92IhKwmbycjr52xZFW097k6gbLJd99JFLZr9pCvIiHD
 RtLWU/8gbYwh81oBNs2ce/N6Y85KBiZ8XUwHlFj3kBss+ugVl/0vYR5H/xDgi57k25xk6l3eb5e
 ldr+e/7yITstk3ysdb6Xsj1PmRHTOUhoioGUi/VmyBqdLsNXXmRJboUzHdisb
X-Google-Smtp-Source: AGHT+IG0UujJqciGiZSHs2MLJH0uOtfTc3Y0Ak8pUJ72jExypcRAeZTfDeAiGFaPBnABeOJag3a8BQ==
X-Received: by 2002:a17:903:2412:b0:240:468c:83f1 with SMTP id
 d9443c01a7336-24096bec816mr37844195ad.44.1753856277729; 
 Tue, 29 Jul 2025 23:17:57 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 23:17:57 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 2/3] drm: Add MIPI read_multi func and two write macros
Date: Wed, 30 Jul 2025 00:17:47 -0600
Message-ID: <20250730061748.1227643-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730061748.1227643-1-me@brighamcampbell.com>
References: <20250730061748.1227643-1-me@brighamcampbell.com>
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
drivers to write non-static data to display controllers.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

Doug, you had suggested a slightly different shortlog for this patch. I
adjusted your suggestion to fit within the canonical recommended
shortlog length of 50 characters. I understand that the 50 character
limit isn't a rule as much as it is a guideline, but the current
shortlog seems to me like a good compromise.

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
index 369b0d8830c3..296ffdc9cd02 100644
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
+ * mipi_dsi_dcs_write_var_seq_multi - transmit a DCS command with non-static
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


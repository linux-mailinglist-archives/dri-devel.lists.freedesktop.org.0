Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E1B147D8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 07:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 771EF10E1CB;
	Tue, 29 Jul 2025 05:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="gcSKWGFu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5349A10E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 05:44:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-7425bd5a83aso4913489b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 22:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753767890; x=1754372690;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uIA0s5nBGDK7qRgcFeqARdwufY8QewmJ/Lc2uYtcY/w=;
 b=gcSKWGFuauqSicpUJfdUZzRpfh9Sy8Rk92cqU8WgEwsepIOCFhxpZ7O1rtSgCFZB7p
 pLDJs45IWrNNdM3rGr10tA4v/KZoWVUOrpUITDSfCspYLvtCXOvVkiX39scq/f7mN2Ep
 9ixVVs0xp+wy4ZQ0V1J2W+eRkRDvkWVbZNjD+Ii7LCBlt+IC8m4KF+zCvnv4xWb0X6fA
 DeOYg2WSqHG6qiWapZBqaN3aN4hbcBkTzSlCKh4Zb36R5iID2+AX4XyKryQW44miZmnS
 zYrANoDdXBW4/ZPVUsY4ZG8DPJBNykGpbeP8pp2S5ywMiXGNG1zG2lVeqY1UGu+PxelG
 5mSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753767890; x=1754372690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uIA0s5nBGDK7qRgcFeqARdwufY8QewmJ/Lc2uYtcY/w=;
 b=HDhG0d9c22E5CyXsL1JoC8S27eNj3C39wFdwd9k8FX6BL5blYrXfC5ZpgLtdKi8lyv
 0Yq4PXiA9hhDpY2Tny+4mj7dfNMxwh93vxZ6Pbd3FZTaroNc6/niNoPE8PO9aV2eHNk3
 5D7zRZI+qzWVMdx9tWnQhHvjE6fH7H5J2A0goDgNEbIk1ytfL3VLTRn1qYGsblIh4pk8
 U3qGQ8WQDsSaI5tS607lCuML8TEGa48lu5Hk2IG2yT8pfHEc+9DTkb5p1QyXCvuno2e/
 tJMY+iOc77dt8rSwdUoqE05eiVvhWefbqB5aaOYnwUtCD90eK9kczqZVTkZSL6pk95RG
 7CtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiFtpuxNxttalxckb5EwiMlX2NX65YwMCFeYTEs72lCgGHFfat44PPO2ig2tkEznyqN5YhQnFsfPo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUzqs50hgxJYK76GgCs0kLqEU/PfeqpGh4zMPPpHzytInHe8MR
 F2Zdjt/0tFXFhYsjKXQxmNHV1tmOb46sKPmXTxaJqTL6sawotH+wVthFYMmWlu8p9GQ=
X-Gm-Gg: ASbGncutymCOelGfKol9SKqsf1vmXlg34yBXXvJDG7S0gpUqVQEWscL9JzJho18aU8d
 r+5wO2b/seKXTvmhfwERDi6VBdii9SlOdub1vzAifFAR3BHVuE5/8PhQlcbiam6YjhbCS4a+PQM
 yGMr13YAUNY8FhFdix85OwOxGa/eDw5iXHxjhEzD19+xmmNkyily+keH13YcGCTpVc26R77yXD/
 lPNToRldqL674b/MQWksr3WbpKuv2tp+BR0z6gAYvuM9i/+VPwH06KLp7naxDfg60WYjh0VxW+2
 nEet1CjSjML84p1KH4AFToIi/SSa6nX7wp+OorSohabAYdpGJg3aCtegkvzj41NNtnxQDQ6+qO3
 1DgpbnWZWwy5fFHUtKBIpZ68vEgeC2of7pjnIONF2DzBe9RvIuA==
X-Google-Smtp-Source: AGHT+IH1AKSCrF7h1/BRJs0PIKPb3nVQd90FUyuawr5Z43EXY+Uh73yi3uR1uHQBQf3YpLhP51DbMQ==
X-Received: by 2002:a05:6a00:cd0:b0:740:aa31:fe66 with SMTP id
 d2e1a72fcca58-763345c79femr22488250b3a.4.1753767889214; 
 Mon, 28 Jul 2025 22:44:49 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7640872a500sm6972462b3a.22.2025.07.28.22.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 22:44:48 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 2/3] drm: Add MIPI support function and macros
Date: Mon, 28 Jul 2025 23:44:34 -0600
Message-ID: <20250729054435.1209156-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729054435.1209156-1-me@brighamcampbell.com>
References: <20250729054435.1209156-1-me@brighamcampbell.com>
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

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

I looked into using __builtin_constant_p() to extend
mipi_dsi_{generic,dcs}_write_seq_multi() to accept both static and
non-static sequences of bytes and store them accordingly, it looked
promising at first, but I found no such solution ultimately. At the very
least, if we find a solution at some point, my hope is that cocinelle
could be used to replace each of the new var_seq_multi() usages among
drivers with an improved seq_multi().


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
index 369b0d8830c3..bfee4071e89e 100644
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
+ * mipi_dsi_generic_write_var_seq_multi - transmit non-static data using a
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


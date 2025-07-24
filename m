Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C18B11221
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 22:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB910E0AB;
	Thu, 24 Jul 2025 20:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="mEO7SZ2L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D9F10E0AB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 20:23:45 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2350fc2591dso17879865ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753388625; x=1753993425;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i4zUj/idKOirKhzudfRqBBLM0pFf8X+XkqCIOZ++mo4=;
 b=mEO7SZ2L3GdvSVXUuS3AWpDTNWEH1wXRGKrAPmEO6nPclTAYtRJrkxSowEt6Hs/qv3
 wD3hhzKXp4sY9dGr0G/y+X/txtASmaw8TjkuZVqJdCmysEitzxqhc/2Lnr9gmPmdVE6T
 N6D/33GMfOcf8a4FKmwecGmL+dx7dbXuXps4GwjRwcu6zFQV3BnmfGTTBDosgC7hT8EF
 znUqrLESYCi2K4JLYjvucfLWxxqqYFbCPY2Cid02GKC19bPabp073e3j3kbAm0qOUaBF
 szWHzyuw5Fq0YQGK2sOtS2+XnzxYz5uKKnnFZJ3T8JV53lsgcJTvqaSJHUfH5VocU0QX
 XRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753388625; x=1753993425;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4zUj/idKOirKhzudfRqBBLM0pFf8X+XkqCIOZ++mo4=;
 b=Ya+1FURM6FwVKfKlECBZWXBthh3vUDtemOqYoZIRWjmMgyNVFvpCGVhyLpWmt/bRQq
 6f9HxK7s2eGV67BfkWkPVd7Tp/L2ui1aOZK28SYUuXd1X5mhhrstMSGxC7vHvRKyFMeM
 GwQf5OR6ZpsFRFe1iLvsqgMzJo/2+ZKsdyoOKR2tmJXXfMIUc3hkgZYs/X0RQUYuwhGr
 wZy21A27ONibiKW/odWZoiKYjF3Ou/TehadcZSDe/8v12RWJTRpaDNCaokK/E3fwksVT
 RM5ikbBf09beixQrEHuQb5stHAp+7Y9iMsLDvXM4UMfrVzlG3QUFyFGzagJzxY2aQ530
 7HYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGygp50npNiKVkeRL/cdJnbMvjxJpAfUifWUdF4BfhM8TqNvimyFnTXR0WCWeIUE1j4lM6Q70Rkd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykiBByxEcLa8ZKO+2zEE2Z8J52mgN9672k74Vid+hmBcxvy7+1
 9w3MEwSAdDVSHvj+V/lnf2+qbDde1GzVt6HylPW02KLEC5gTHWT2kx2Pp2aMIXlor0I=
X-Gm-Gg: ASbGncvZnd+N1NF5auXqHkTX6PhefI7DOAILYfeN9A1MdoC8dcBeTbNKilwDENmQRZG
 PEDB0aWLV569pZoP8u0sPA+yb0N4JIzv0c2CQPviSj+BPcj/rzgiRtjGmqSo1WPytXX3VfOgMSn
 3XeSVyG9XOXULYa8Q5nMCtjYqjpqdbJ3E4OjeUDqvY1wvn517Zpy2ZAh4uXzgIeIixtFQanEkmo
 VsrYquq8kVyzjUlA498ZJ71xBZB8gfmf9SrsDp/RyAzn0MAFDnd2TT8xW6t/8reQGz0mG5QZBx9
 kZkwI2hWgOWoc8bBuLiqoMd4R/6wFdKdU/cUUfsLdMbqJ93E4XARW+eFU/teim8WJZbFQYB3Qcp
 fTIPXmkf0fugcgefh6ROlrOEkuykqyHYX5oSU7F4sWUip3AmRlu/Khs1VaS0a
X-Google-Smtp-Source: AGHT+IHd+bt4vHJ39l4CpLf5WhIwZLQkiEEpVe8TOKkAb1COeGQGReplWtQ1IyJKNtoQWNlr1/1dZA==
X-Received: by 2002:a17:903:b8c:b0:21f:5063:d3ca with SMTP id
 d9443c01a7336-23fa5d73fc6mr46051295ad.16.1753388624999; 
 Thu, 24 Jul 2025 13:23:44 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fa48dbfccsm22077815ad.138.2025.07.24.13.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 13:23:44 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linus.walleij@linaro.org,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, sam@ravnborg.org
Cc: dianders@chromium.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 1/2] drm: Create mipi_dsi_dcs_read_multi()
Date: Thu, 24 Jul 2025 14:23:37 -0600
Message-ID: <20250724202338.648499-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724202338.648499-1-me@brighamcampbell.com>
References: <20250724202338.648499-1-me@brighamcampbell.com>
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

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 37 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a00d76443128..227b28555174 100644
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
+		dev_err(dev, "transferring dcs message %xh failed: %d\n", cmd,
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_dcs_read_multi);
+
 /**
  * mipi_dsi_dcs_nop() - send DCS nop packet
  * @dsi: DSI peripheral device
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..d17c00d299c8 100644
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
-- 
2.50.1


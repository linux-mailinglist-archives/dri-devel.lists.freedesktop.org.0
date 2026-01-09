Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 543C1D0B042
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 16:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CE510E8E3;
	Fri,  9 Jan 2026 15:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QPpDSyEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2519010E8E3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 15:46:43 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-bc274b8b15bso2852398a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 07:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767973602; x=1768578402; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XrlduJZJPMbIa1RfsQnFtGNBelRs3n9wJNobxuDPXfM=;
 b=QPpDSyEYHyh3wiLLgsKsozBVW8sZ0ydTWnqN86hEfrFYbO1OSoe8+Fwuuzu+zHrHM3
 9d1Ao0aKxvZX6U0hqni+1SiBpNHlxxy8oCl8otRqtLOoQff3zbQu71nto7rwptFEhQKm
 0V9z9XqT1H1zwEObfyVPLbA1tWAbRzfh5Qzk6/qx8qNj3aEL9/2tW8lXfnB5JE9vUFCd
 GMJBnaZPYvpK64pyc/Iwa3uBqy45zutUpSbL6hTk0+QE6Xw3oRY+ZO4BHggEoumivE8N
 NzECYdJM+gkEwkhnygLbZ0+9dkJK62vYKDQQC4+2+bNYUfLR5NrEfaBgi4lnEJU30iSM
 9fgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767973602; x=1768578402;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XrlduJZJPMbIa1RfsQnFtGNBelRs3n9wJNobxuDPXfM=;
 b=VHTlOVOKSIurtMw5i6Rf4uYKsPh7DzDPzxFTQkEq0yHP2hhf6CZ3JNvUcqG3U0o/wP
 /lXC/T4ahqBUNDGpxuxAzsVyQxTwcD/sRzPYht3JiqTLOoV3Dn4pBFX1O2MzOcOCX0QD
 ILOfAv3Ql/uXhJXiJeOrx45BYpyKwkcWI17AkQq/ZzwQigRdiJ/KopxmX6bzLazFxEXf
 56okF9cZBs6CeVLoBjcfSXJwe1N+DyEoaTrrenA8M8BNLzjX+BgrUJuDVb5JU2pwheY9
 ozCl/5hnEaJ/L/ZWG94VmsM0hSKUx7eo6HVp44oY2fLzRpxZKJjuPxcqwIGoMs0ZLymB
 rovw==
X-Gm-Message-State: AOJu0Yyxsz1Sr0MT8w6SWfKnHkTefZ19Zm/EjQFOXYHMo+5jynPefoPJ
 D9g4M9+spK1JdBD5+Q9atRej8jp01Hit1ra8xiC8MhIPp7LOKX0uiXtPG1rixsyC
X-Gm-Gg: AY/fxX6BFGOKra2FUC0d2tQ5Dfp7rIxaoh295ZpKJAtbe3eoA3777lAKCNNCNjDdtE3
 yJgu0FAQvLu9GKWTYm8mam7lTGBqBKVOjFYpXbq5Dipn6wZwsk+SsuPjdwVhMRzmk/wbHtpeZ35
 eKUQr/RRhxJVyipnBy1OLOlqocjLJja9vLZ0JliNVENTc90TjikHB2WUBhPiJADEJFpuWX7j395
 RNZeh9GhjzrAip5yEvxQ/qZIf1H9KS91k0n7jjlyDzShF3fS7u0Xm0iPfk+eKBxtjdiNgFsD/41
 W0kVwseC1mT2g4zecttKz+lelgDkzI9Yti6vDTIBPzBD65ojfAO9WERzwVJ6bzchOfDaLOY+Hc/
 q50TzON4/iWsDeQ0FSaNMuNcUuQ+VlZVzEl40gAVKLh4/QGTbBIHFobwA6W9scyT0jhv9mzUjxL
 XaW0aTuVrSsL9bJTE4zBWeWzn0zUT0iCSBMiIV8qoLg9o=
X-Google-Smtp-Source: AGHT+IFlA/Jv+xISGETz+tPoNPLoRIGvtKBemHAHeqLT8VlbscyA7TRtr1fOfUkpwnMtemxAoRXrQA==
X-Received: by 2002:a17:902:f54f:b0:299:bda7:ae3c with SMTP id
 d9443c01a7336-2a3ee428923mr96108875ad.14.1767973602077; 
 Fri, 09 Jan 2026 07:46:42 -0800 (PST)
Received: from fedoraemon.neon-universe.ts.net
 ([2406:7400:11d:8d1e:1613:9777:a803:43fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3ba03f9sm108166395ad.0.2026.01.09.07.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jan 2026 07:46:41 -0800 (PST)
From: Avinal Kumar <avinal.xlvii@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, neil.armstrong@linaro.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Subject: [PATCH 1/2] drm/mipi-dsi: add mipi_dsi_shutdown_peripheral_multi
Date: Fri,  9 Jan 2026 21:11:56 +0530
Message-ID: <20260109154157.33592-2-avinal.xlvii@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109154157.33592-1-avinal.xlvii@gmail.com>
References: <20260109154157.33592-1-avinal.xlvii@gmail.com>
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

Add mipi_dsi_shutdown_peripheral_multi function and mark
mipi_dsi_shutdown_peripheral fucntion as deprecated.

Signed-off-by: Avinal Kumar <avinal.xlvii@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 28 ++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a712e177b350..2fed50172a44 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -587,6 +587,9 @@ EXPORT_SYMBOL(mipi_dsi_create_packet);
  * mipi_dsi_shutdown_peripheral() - sends a Shutdown Peripheral command
  * @dsi: DSI peripheral device
  *
+ * This function is deprecated. Use mipi_dsi_shutdown_peripheral_multi()
+ * instead.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi)
@@ -1980,6 +1983,31 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_set_tear_scanline_multi);
 
+/**
+ * mipi_dsi_shutdown_peripheral_multi() - sends a Shutdown Peripheral command
+ * @ctx: Context for multiple DSI transactions
+ *
+ * Like mipi_dsi_shutdown_peripheral() but deals with errors in a way that
+ * makes it convienient to make seeral calls in a row.
+ */
+void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	int ret;
+
+	if (ctx->accum_err)
+		return;
+
+	ret = mipi_dsi_shutdown_peripheral(dsi);
+	if (ret < 0) {
+		ctx->accum_err = ret;
+		dev_err(dev, "Failed to shutdown peripheral: %d\n",
+			ctx->accum_err);
+	}
+}
+EXPORT_SYMBOL(mipi_dsi_shutdown_peripheral_multi);
+
 static int mipi_dsi_drv_probe(struct device *dev)
 {
 	struct mipi_dsi_driver *drv = to_mipi_dsi_driver(dev->driver);
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 3aba7b380c8d..19ccdf5eeb5f 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -389,6 +389,7 @@ void mipi_dsi_dcs_set_page_address_multi(struct mipi_dsi_multi_context *ctx,
 void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
 					  u16 scanline);
 void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
+void mipi_dsi_shutdown_peripheral_multi(struct mipi_dsi_multi_context *ctx);
 
 /**
  * mipi_dsi_generic_write_seq_multi - transmit data using a generic write packet
-- 
2.52.0


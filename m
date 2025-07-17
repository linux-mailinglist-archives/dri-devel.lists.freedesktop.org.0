Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54315B0920C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 18:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED7710E84C;
	Thu, 17 Jul 2025 16:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="ZVgVrAaA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3E710E84E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 16:41:44 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-b31e0ead80eso911300a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752770503; x=1753375303;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y6U6F7ktOHhXsfwCj268J79W4P9Jk1oA5CQY0LkezaM=;
 b=ZVgVrAaAM1DtZx1yHNzxIJx05RvvNnFf338uWfSgZI5P4AhkD5qMeLcXOR++MtkpQ6
 IussUtQ/a+QNqsxJf0h/AGAWX7WAad/uWyIzWyM1VMCBKgXSk8DF2j+sRFmqpJ8wiCci
 zTgl14IVfF/ELV2CtntAMdc2LN6T+5DIwLLop3lLxbYt/hxhLnm7MNAPAVb6C2GhwBqG
 KzkIgHG/QCTSo+phT/6gcVTC7gSfSAymsGI9R+FZ6jmGz1lj5H2fukp9j3GvvMiMqh1v
 7c6AeKzadrCJYhGjsl9NN9aODbe7IaEPENCchENXfme/yxEioHu72c9F5zLCFgJcwTeu
 o/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752770503; x=1753375303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y6U6F7ktOHhXsfwCj268J79W4P9Jk1oA5CQY0LkezaM=;
 b=MldmGfXVhWiMWUxVR1gOmIHLc57Vqz36ykuORmudt6QJH0MQkelkPqcDgMNX/nO0aI
 jGed5Wc8nvjKg6EXYoYpv2BoE4zhwC9n0ZB3/Vtfx3wHZy3KKkOyWlwfUmeU/bpCt+Th
 EgR83faJdKFBBuhH4sKrpZbYxF5SuvKJMNTCc+YHK8k4CFTHwe4q2JC0ssTrdD+9by/a
 Wkizeb1tTa3zIW4RXaYSwMR/uz9KbD6B/EwdA+5KBIimpiv9jhq9/u+7d6p+oez1Mroa
 m3bqX55CCIMnfqxHcq+V6OUWL9IvGrxgDA8OVSOALK5zBYEgiwSTLAntjg8rmGHgBYOJ
 CyLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlNZvEjhHNcE08xzNS0pozP6Di4cCUpz6D806+zYCdK0V6PltcAiVHDAM5ZJrVIs/gGycj3qamcZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUQhwfRq2EcJnOc6yUg/nRHATJcKXX0jQ2k6ENBGUWi78pQkMS
 mhzzq5XetFItMLEi3j8BL+aB/GX9zM2Uz3iNexd7/uIAWVkJSiYYux70LBKB22y0/No=
X-Gm-Gg: ASbGnct8W0zegsPuTxnRlNJYmQ6aAIP77hNS4T/h3AzJNs+UQ6wLFuiHXk2Z3mTUzen
 s900aOg/jO/u8KH9yZ0lD/F55vFLOIpg+Dmq+UZDbbeg8/Y+511EiiVVi/NpuywCl546wPHIpb/
 Q4JQw5njuW0S8mYdaS9lwKEoQACWnnYu5H2G3DFzBC7tf22VXIrD/6Ss5gkJwShs34GLqpJcsPZ
 +QPB2z1HVJTv+e/jqMB2thNFFtRea1xE1TxzNEma69NGdFjM7t7SqCmq1LdUQkS5PZpI4j2efOm
 CZcOljJdR4e6xtyJOLz4mIRPmbNd+/k+wbGe3xzraIJqiujwedVnr0BHNSkZJHAMloEUcad04jz
 fdlPZOLiwZkQnCcv+X0cAv5eG56iywyt62PQtJkNgzBf+t0GSSQ==
X-Google-Smtp-Source: AGHT+IEtjvc3xhBloO4ZME3CaseiMwB11gSyKFagdHpdQow/ZgQmvELeyGJVwsRPmXNuF5C1d/10Og==
X-Received: by 2002:a17:90b:2542:b0:311:d670:a0e9 with SMTP id
 98e67ed59e1d1-31c9e75ba9dmr10555061a91.21.1752770503322; 
 Thu, 17 Jul 2025 09:41:43 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7e8ae4sm1821750a91.24.2025.07.17.09.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 09:41:42 -0700 (PDT)
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
Subject: [PATCH v4 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Thu, 17 Jul 2025 10:40:51 -0600
Message-ID: <20250717164053.284969-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717164053.284969-1-me@brighamcampbell.com>
References: <20250717164053.284969-1-me@brighamcampbell.com>
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

Remove the deprecated mipi_dsi_generic_write_seq() and
mipi_dsi_generic_write_chatty() functions now that they are no longer
used.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
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
index 03199c966ea5..1ab28fd70c8a 100644
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
2.50.1


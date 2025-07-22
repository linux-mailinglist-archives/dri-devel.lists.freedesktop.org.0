Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 936B3B0CF67
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 03:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C944A10E5CF;
	Tue, 22 Jul 2025 01:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="jllias8P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31310E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 01:53:26 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-75ce780af03so1334531b3a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 18:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1753149206; x=1753754006;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
 b=jllias8PgeGXfr7m9utjJXj5quWF8wS9JMDei40j4lC9Od90L6ezVhckixyuze5MaM
 KuxnnsZyzGKrjcR34tNWYSekU7UnZtD45Lb+ks4ArFZWYWyGda+t0i2RE9P7Mu+zh9KR
 g4c+iZlSQI35ApzvFiKkldbjB/syc/l2bKlnZYHO2yEPhh6kpbDFjxTx88Sh6wdfQEhc
 jQMRInYV+RcfXu1/q1goYfhkdG+UZyn5CcS3RUpcNW5NKT1NmJjbGpM8AA8bQRaGXmPv
 Wq+nx57l1PaEzs+0/Yr3CKxEXJc9BqDU9H5DbVq0QKE7xS4oGhjNJgNAleW4FNYq7iq8
 8XPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753149206; x=1753754006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdRj+I88N+R+RVdcFm7ubWhFSooeArA2NulQ8/PI04M=;
 b=Env7KitmkanLZD1hAJG+mYrVQGRd+xzvV9LRv8ECbuqwi2m/az6MiRbQp+2n6/axca
 LQGVAHUJ3EfrtRmVpf51WK2MPcfj7KP/LTOsO259E2Nytc7oeCV8mT3dbShAgMfiNAkn
 DnFZlN00o2rjdCqug9JKfxn99rfep2A/wZBNtHWTMfr3sLqiApZkodu0wyffVxbDByem
 RA3UuVbzdabLE6nt/Ytk9PY2MxzajMnMluZs5qZCeZwNk4Y39FHC8p38olwHmPN8S6mv
 nM72fsNOLKgD2AyJcsnHtj4W5HKXxYGjTfzBCM56J3Ju3lhMUpW+QGf3LqnuBqbzTgCI
 XtwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGQzWjKaE4RCUPZrJ1cB19P5wDjV8M1Z+Zcbf6uQzQyQwbldbx6f8Rsz5CrfgFQmdossQHFfzBMrY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXO2Hws2274FqLbiZ42CKHhwQt6Uce+gKhJsh09ViyD5KYq9oO
 jacU3jaAmJzXbTAvwn6MQoyFQMNlFMAHbYaXY61Ia+IlLPHMYi2iiayRgI1k0n5Tubw=
X-Gm-Gg: ASbGncuV6vosK5YAdtv3KwBHag+l8mXw7d30OEG9NW143xs0bxOtUibNlNxfRo8kq8Q
 szkgiXnTCMx+pTSA6DSrKDNCkB+KKQwyEmaRcy4Rfx909LGl6QjbP7604nJZCgVIzDVEwJkpvIp
 xN66DGDkwG5Z9R/73Tbqk8gRO6sUiUwq1ntgljrb0QKV5nF//fS0bOkDd/+OAM4QptMzf93Gilm
 HR+t5oFdDB+2qjhkESFes8yGlrXnEcOQJIv7xdOSXBLTtErotBjRqHp/vcjlqeyYGsFjBxFmAua
 vvkZPVDKFQQlS5SBqAV4bM+7QmIyfokKvhFHSWchm3weI/xFPcWziSTzbLN/70WZ/gXDEetxQX8
 RWIvwSQTBvX3cgN/vbF8dprx/geUO3rEswZm73o+KYm4URKKkzQ==
X-Google-Smtp-Source: AGHT+IG6tNXplzhOlO9KMayA+8YKZtftV5rzHK8TvneHGceF0dD/1zLLjMy0L2fZ+upC9WT9XqLSug==
X-Received: by 2002:a05:6a00:1945:b0:747:bd28:1ca1 with SMTP id
 d2e1a72fcca58-75722771f31mr32750586b3a.3.1753149205584; 
 Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2fe62d9fsm6017441a12.1.2025.07.21.18.53.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jul 2025 18:53:25 -0700 (PDT)
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
Subject: [PATCH v6 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Mon, 21 Jul 2025 19:53:10 -0600
Message-ID: <20250722015313.561966-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722015313.561966-1-me@brighamcampbell.com>
References: <20250722015313.561966-1-me@brighamcampbell.com>
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
index 5b387543de28..ca77f152404a 100644
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
index f1dc822f69d6..ea523eb35b08 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -285,8 +285,6 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 
 ssize_t mipi_dsi_generic_write(struct mipi_dsi_device *dsi, const void *payload,
 			       size_t size);
-int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
-				  const void *payload, size_t size);
 void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 				  const void *payload, size_t size);
 void mipi_dsi_dual_generic_write_multi(struct mipi_dsi_multi_context *ctx,
@@ -387,27 +385,6 @@ void mipi_dsi_dcs_set_tear_scanline_multi(struct mipi_dsi_multi_context *ctx,
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


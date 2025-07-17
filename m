Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9607B085A2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 08:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297C810E6DE;
	Thu, 17 Jul 2025 06:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="QLpfNrOB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BC810E6BF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jul 2025 06:58:15 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74924255af4so611847b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 23:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1752735495; x=1753340295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
 b=QLpfNrOBZ1PEyOnNHshNlrV+e0399CI12+5OI/WVWnonqf7FG0FBiOtNn9KDyc1sfc
 y4LQ+40qTItgNgzldHQpnxRCLtkF4EgIGELY3bp6LiKEWnQoJEyvC4yZmUFLiYpZyvna
 xAC8aw4GExJhtBsUXSkNKl6HgMQBlvjpjyyUf8ySXvFVTkmiS/3FIeEz3yd7gKYslGrR
 uDzZCGYlQQiDpx+M8hkzVbh7fqLOC50tC+MNPr1w4LE5Yjwyts7gMMHER/L6edmTQzfi
 VftW0eNUQFlvR0iTKFLmCyhWJZ1OeoR68n9t8lYS1rB2UiDV55bIiOW6Z6joZnvcVl2f
 auGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752735495; x=1753340295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CcDUtidcIz4q2tNw/LqIMZV2WGjfWu8YabyIVvd6cck=;
 b=gqn9FbjCqxWetHmSyXqXp8EAjAw7Rc8136bdh9YWNFw9oMWKNgI0MiylNBChuFsBsx
 G3VIF86zVGQlX2LxYM+edAmgofXgqzohoemhpSse16kIRu47uWDMiLuxXZGNunGcOZYy
 MkmX7yprSAdb2nS0t3qCovubMSZTIQYjviEOFAFLpZdsn3X4sbVVYZQ503oouVbesFIK
 MqTB0bW0sqfMN0bd7ieRj+Mt+KgMJONysYXD6EXkXJ6caW1BJ741/NSvfj1xutH7tJHu
 zO3ZXmvIqkb1wZnWQS4WwWOiBkK+p3gmCQZN5uW2qN95XDwEmVqqkNRxATzDV+Ol5QEw
 nIUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYmp68xTiuzIA1onenlcC0DQ77Y6XcX8kh3cviMhhOsT9Qpv8862NZ1C+6nvldl+bWxZ+RWV4muO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymKMdLAFaBR1nc7erps9zwchImLEiNWFVfj+QkcosOuQhP5YiU
 RBtKbagMKWCuS/FRjKpwxIvHD84oBLxyajhziywSH2I1VaP+HU2YSRdpEhreGE4ElV8=
X-Gm-Gg: ASbGnctSSSblsFvM+M+BlJBmwHU4XkdX7WamzF8BSV8RwRMxNYfV75ZHJJ6V0BnFlRL
 OwoFiA56pVeHJUAXyWSLxbLSGHPrzM5XIa15eQ9y8aQoWQBgHNff6G1iZ7wOBUJOgzyYqUM1z0m
 ZASFaaJr7pqcqL5IzqtL/vA2kxh9sH8yXd5Ue8qtNryOfq8daKrtaExGMyHGyBHXgnLHJCM9wud
 PvdJU0uStqsiWE9vr0vl3j/OT6L6ZXYuyKI6uNfnPKO0yi3TOAv8vlqUfGX8nh6RN5bfVPVAIj8
 B64hRnd32Aq4WF74/C5r3BfDWRfgHDvxjommaDl2uWsqPTUh+JtlBLc0zr1pttJYAHvH8F/AygT
 lnquGzt6V38DZKKrDuDIqYqOSEIjVRtSDGJSLnQP8s8vyZNOIHDy59w==
X-Google-Smtp-Source: AGHT+IHtXjv1j8/b35hlWwb7zAfmQUs+V6Fqss1rT4O/h1FVsmO78slSmyNXzYvHuFstjqrEM2uOFg==
X-Received: by 2002:a05:6a00:188f:b0:740:9d7c:8f5c with SMTP id
 d2e1a72fcca58-75725589c70mr7614496b3a.18.1752735494900; 
 Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 23:58:14 -0700 (PDT)
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
Subject: [PATCH v3 3/4] drm: Remove unused MIPI write seq and chatty functions
Date: Thu, 17 Jul 2025 00:57:55 -0600
Message-ID: <20250717065757.246122-4-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
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
index 32da8861f9de..526308e24f6c 100644
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


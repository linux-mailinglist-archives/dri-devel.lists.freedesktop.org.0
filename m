Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59936AFC443
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 09:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C5C10E5AE;
	Tue,  8 Jul 2025 07:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="L3hMSq2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9306610E5AD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 07:39:11 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-742c3d06de3so4733150b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751960351; x=1752565151;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
 b=L3hMSq2RC3iRAXjM/cO/RVBUizJ7KnXmkMyQ/iXePg/kJeg05Sq7rds7SgH11T5T8A
 Hxq6NmF6LsPN4E+HC2pR6in+tgr62IfCkMGZ5t8Fc+gGbGi2vV9KH8rq+hw2FpTZraoE
 0njzZIjo+a5UiPzFgKmlDrDCVNldBYuCgSSJqpGpDgJVEDjmg4hrPxrv2SozQPyJJ+wo
 +3Gyqrh7UjdZs9pSv+RkRbWZlOj2yYB3/kueJ9TdLkI6ZyseL+jCTrzxqT+MPLc+9jtk
 aPhjuvH7Ym33N6Qn1BQ5QVsjh4x+4i9DTDDpvYD4x7fw+4RoOhTtnT+QtI1dT8z4iYvJ
 IiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751960351; x=1752565151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SFUiRqJ8ldtxTynjrbllEzn54iuQyuslXMfdn6+3Zb8=;
 b=LkWpx4WjlgHZZtuXRm12R/tAPYma5IXmmuc1P4zGBwA+DKLYN7qXn7bntRawTT/iH1
 DzShgeTSO4ichR/K52Zkvw7tsMKEvyKGEf0oqaiTFEwl3xB91mp5YjEzu/wdXK3FEwEL
 UzcgjjBkajwRZgAoUSL5DoGBU3FP9qYz8G+ffWR8r9WTgqatHLyp2zRV7t8+Dpld6mEp
 LH7c2VBQITRJAKyyb3gjdcwpSxe8Ba2Ms2aujEVP9Vz2Jk3TKyokquTUoWdwFz7ftee2
 5XiB1WWQyI+z2ys1ASXjrmBOZ72jtOJUcDz9n3FkvFcyLTNpea+SHM15nQRiv8mnm6jr
 RUvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuua53gqo3z+/V1d8FBrUNeYotVEhm6bbfRf81QZltG2HxaVvrd04oyr+gmx7ioXhVu7NLVdpHvcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyWR/ymHeeCmEIiLUIuqNNutj8PVbbvTE8eHvthA/4WDlDO/N3
 fWwlyfs9tZI+sVb2lbcutPEtQKiO1vTBdmGHCJvbcfEXWuTCxvzVbNYxCThTwKTv6YY=
X-Gm-Gg: ASbGncv9WMNfSxHTS8zkAlnaJ/vgh1CrxHLTcV54EDV054N1+mf6ZtCupYI7Jw4ur8v
 nBbn9va2OJMrl5vwJJKFhJQ8KYgBZ+/2cOLtVSO1FkINFu+vKn4H61i9jtxnAi7nP6fY4VuP+Xm
 9yA/7ATPFddxaHvbHQJpWemaCoBLTuV9+oVpPGTOgmszkvjpUO2r3HGH2KfOxZBao4PuYmVZqvR
 QMDeVhkGn7ptvItrPe8KJELl+yTNCHsJ1JSs1eZJBZbJ9W31yVCPPORBEF/Fgtk5bxrTNw2saAJ
 mb0kbxcPc2xhO8mIeirt+fJN0FSUOnL9qwPbNJHRweIafop3XGGDPmYR2ySDvdtcLMqI2qAVVht
 4OzT1CcCrq9Hbzw3cgvjmS/ZatuE/
X-Google-Smtp-Source: AGHT+IEjjvMwCxlNvfS65ducwO3zjwiKKWiiOevnyebt6KaT7pnYdCus6N5MscGP8SruBVriyB/gpg==
X-Received: by 2002:a05:6a00:2e17:b0:749:472:d3a7 with SMTP id
 d2e1a72fcca58-74ce6689123mr24357739b3a.18.1751960351056; 
 Tue, 08 Jul 2025 00:39:11 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74ce42a540bsm11633523b3a.140.2025.07.08.00.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 00:39:10 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v2 2/3] drm: Remove unused MIPI write seq and chatty functions
Date: Tue,  8 Jul 2025 01:38:59 -0600
Message-ID: <20250708073901.90027-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708073901.90027-1-me@brighamcampbell.com>
References: <20250708073901.90027-1-me@brighamcampbell.com>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1F68B42EF
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2024 01:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AEE11AB47;
	Fri, 26 Apr 2024 23:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="cOQc7c1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277591125C0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 23:59:17 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2a614b0391dso2223323a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 16:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714175955; x=1714780755;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hZzSfB/1n9+jedI2oBQjWcrR3uyh08/jlbQ/BhI/Hdw=;
 b=cOQc7c1MZt/mBbH9PHim8F1BZt9CKULn998KFokaA2hvql0gl2oSQvdrKmuwYKfG/h
 V4VRQtf161vI6/4x3iheUxC6pvx8eNBFYi6e5oa0aecLW8ZpT2mJED1TZ3j2caIfZtWn
 dLJzEM3q54GMAZ9IJzrIM5sI+aElOuphW56Eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714175955; x=1714780755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hZzSfB/1n9+jedI2oBQjWcrR3uyh08/jlbQ/BhI/Hdw=;
 b=MpQTstzGno0PzhBsTyo2qyojNJsIQtA2UG8tIzWBDaIgh0y+row0MpSBugDuxujtyy
 l4sY9w1G3YVoKXLNUs0NbJV2AEyZWluYF/qutny6Vl2bdnWFhREpFyBJ+rhrPVEx28m2
 h3eW+FvCTlm2D5Ek27/sGC+oRQIJ0gaOE90oyxCBaBVSXQUaNxrGbqx5GEn6j9BH4ss8
 WnucIZSVqke7CTHrkgZ6o7QH+z+1rKwPNaRn7f/MZI9pDroIVZXpsn4uQMz74Qi6EiGC
 NNoyddmPUyEeiLu6oOrfpqi2qi7mYuzDJYUQIp2iOAOS/HvrGAPBkrHKd0i0dM2E5VVs
 efcA==
X-Gm-Message-State: AOJu0YwM+01FWgafmY+2Txq+5uOnO3G1fZ06ICHEYYHhSGExg9RI3+vL
 w/OV6unV+JrO/YhOytb9TLlFqX636tRZeFI0vxSJWH+WPj6i32nSrjmCzahF+8bKKXXHpzK5mTw
 =
X-Google-Smtp-Source: AGHT+IFoJpPKq/WRiQvEti4tzyFjVp2ObidfEpxF1tBEZezg21mRL219dd0QaSSZbuMenSdPDiKAxw==
X-Received: by 2002:a17:90a:f2d0:b0:2ae:ee75:1479 with SMTP id
 gt16-20020a17090af2d000b002aeee751479mr4274243pjb.25.1714175955634; 
 Fri, 26 Apr 2024 16:59:15 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fca:3ae2:20e6:82bb])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a17090aab8400b002af41bd563esm5111939pjq.33.2024.04.26.16.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 16:59:15 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 lvzhaoxiong@huaqin.corp-partner.google.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Hsin-Yi Wang <hsinyi@google.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Joel Selvaraj <jo@jsfamily.in>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] drm/mipi-dsi: mipi_dsi_*_write functions don't need to
 ratelimit prints
Date: Fri, 26 Apr 2024 16:58:38 -0700
Message-ID: <20240426165839.v2.5.I9982cd5d8014de7a4513f5619f66f88da49ce4ec@changeid>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240426235857.3870424-1-dianders@chromium.org>
References: <20240426235857.3870424-1-dianders@chromium.org>
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

We really don't expect these errors to be printed over and over
again. When a driver hits the error it should bail out. Just use a
normal error print.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New

 drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index b7c75a4396e6..8bc2db971e93 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -770,7 +770,7 @@ EXPORT_SYMBOL(mipi_dsi_generic_write);
  * @payload: buffer containing the payload
  * @size: size of payload buffer
  *
- * Like mipi_dsi_generic_write() but includes a dev_err_ratelimited()
+ * Like mipi_dsi_generic_write() but includes a dev_err()
  * call for you and returns 0 upon success, not the number of bytes sent.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -783,8 +783,8 @@ int mipi_dsi_generic_write_chatty(struct mipi_dsi_device *dsi,
 
 	ret = mipi_dsi_generic_write(dsi, payload, size);
 	if (ret < 0) {
-		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
-				    (int)size, payload, (int)ret);
+		dev_err(dev, "sending generic data %*ph failed: %d\n",
+			(int)size, payload, (int)ret);
 		return ret;
 	}
 
@@ -814,8 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_generic_write(dsi, payload, size);
 	if (ret < 0) {
 		ctx->accum_err = ret;
-		dev_err_ratelimited(dev, "sending generic data %*ph failed: %d\n",
-				    (int)size, payload, ctx->accum_err);
+		dev_err(dev, "sending generic data %*ph failed: %d\n",
+			(int)size, payload, ctx->accum_err);
 	}
 }
 EXPORT_SYMBOL(mipi_dsi_generic_write_multi);
@@ -914,7 +914,7 @@ EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer);
  * @data: buffer containing data to be transmitted
  * @len: size of transmission buffer
  *
- * Like mipi_dsi_dcs_write_buffer() but includes a dev_err_ratelimited()
+ * Like mipi_dsi_dcs_write_buffer() but includes a dev_err()
  * call for you and returns 0 upon success, not the number of bytes sent.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -927,8 +927,8 @@ int mipi_dsi_dcs_write_buffer_chatty(struct mipi_dsi_device *dsi,
 
 	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
 	if (ret < 0) {
-		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
-				    (int)len, data, (int)ret);
+		dev_err(dev, "sending dcs data %*ph failed: %d\n",
+			(int)len, data, (int)ret);
 		return ret;
 	}
 
@@ -958,8 +958,8 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
 	if (ret < 0) {
 		ctx->accum_err = ret;
-		dev_err_ratelimited(dev, "sending dcs data %*ph failed: %d\n",
-				    (int)len, data, ctx->accum_err);
+		dev_err(dev, "sending dcs data %*ph failed: %d\n",
+			(int)len, data, ctx->accum_err);
 	}
 }
 EXPORT_SYMBOL(mipi_dsi_dcs_write_buffer_multi);
-- 
2.44.0.769.g3c40516874-goog


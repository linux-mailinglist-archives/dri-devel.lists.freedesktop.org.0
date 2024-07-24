Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF3E93B0EB
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 14:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4010E032;
	Wed, 24 Jul 2024 12:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gJfP48x4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10810E6A7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 12:25:08 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1fc49c1f3e5so8432035ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721823908; x=1722428708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FanJFk8N4d+FovkzKkK+yK0pgkmnrsP9b5F0k2uR1QM=;
 b=gJfP48x4UsDZWUwM0PJr4IeMEjgmzpwOdi57s8iU9d5sNf9k5Ir8s/oQLdIoWMWp1o
 0enmOHOtysDKLHJugLu3yKz7yyC07WCnXLvbYYwn8R4Kpphhr6FBw6TLTwsv+r9BrVtc
 Gjk5Chj6i5+ObklCq3PAx90RJAnx6gVYbmxGjTO2O3AjMqdnCaTTW8wNr1g/9jiGqASe
 rAGqa7pnXQkOuPQM2JnosPpT0vp/eJ4Bg4hizsOqOebQ6EH0oVkdF9smkgja2k2WBYFJ
 rt7v+RFeIFW7o2RGy5vh1Avqgf/I5ijwJAkgFx8gxxI9JADgehpg9atY+CPZXkRq/495
 eWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721823908; x=1722428708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FanJFk8N4d+FovkzKkK+yK0pgkmnrsP9b5F0k2uR1QM=;
 b=aNUYQNWFoLhMmIgKqQbDw34qyH6u1acr5XywshMRrKMwZ9ENtlvJbVMzmeCtVNYhIa
 Tydr3WnRRRgs0/aLvbn9VGi1Hil0ZmRfSfpRqMfRp3r5xPdqZsY88Wt0itLbAKRnCEwl
 xzMf5lFmEQ5+pOHejBFawOliTI3+cX5GU2EMoVwEGi3Lxyh7cXq4AEH7k+yxO6Gi3xHg
 s2tBmWKntZcnEhiliXjr1VAICBn5n+ko/5dVw4HG3M9D/bDtWAIc91SQ/XTVjOaDDIul
 +MkKV6TxHHwj6Mnp1atJkGHAI8GsB9XIAi2e3kCQed7NTrhjguJJrImCJgEMcH7Ch0rK
 iJsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM8YhsEq2z0b7T3Be03+r4LWSGzohysNfUmHyTUjFf0WEi4KWC3KwsH4lKsCi4CJaq8ocU0b4RlNKE8kDrjbigxSVO0mx5U/vu9a1W3jkF
X-Gm-Message-State: AOJu0YzvzMao0A56XdovBe1KnaunepfDvRkpEXlpP7JprATc/XJIFUAE
 kGSMni77j9gc/A+01gcusXPJWSawkd/CuZn90KQmF1XOgu0PPdyR
X-Google-Smtp-Source: AGHT+IESuRKDCEItHRopfV2JwMH2VW29QebUq9NYg/izyx5v/vt6IyizXedg4Aqf+pfc0frWsfVHKg==
X-Received: by 2002:a17:90b:3143:b0:2c9:7e9e:70b3 with SMTP id
 98e67ed59e1d1-2cd161ae448mr10189550a91.33.1721823907823; 
 Wed, 24 Jul 2024 05:25:07 -0700 (PDT)
Received: from distilledx.srmu.edu.in ([103.4.221.252])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cdb76001d6sm1481454a91.48.2024.07.24.05.25.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 05:25:07 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: dianders@chromium.org, airlied@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tejas Vipin <tejasvipin76@gmail.com>
Subject: [PATCH 2/2] drm/mipi-dsi: Change multi functions to use quiet member
 of mipi_dsi_multi_context
Date: Wed, 24 Jul 2024 17:54:47 +0530
Message-ID: <20240724122447.284165-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240724122447.284165-1-tejasvipin76@gmail.com>
References: <20240724122447.284165-1-tejasvipin76@gmail.com>
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

Changes all the multi functions to check if the current context requires
errors to be printed or not using the quiet member.

Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index a471c46f5ca6..cbb77342d201 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -814,6 +814,8 @@ void mipi_dsi_generic_write_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_generic_write(dsi, payload, size);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending generic data %*ph failed: %d\n",
 			(int)size, payload, ctx->accum_err);
 	}
@@ -958,6 +960,8 @@ void mipi_dsi_dcs_write_buffer_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_dcs_write_buffer(dsi, data, len);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending dcs data %*ph failed: %d\n",
 			(int)len, data, ctx->accum_err);
 	}
@@ -1450,6 +1454,8 @@ void mipi_dsi_picture_parameter_set_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_picture_parameter_set(dsi, pps);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending PPS failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1481,6 +1487,8 @@ void mipi_dsi_compression_mode_ext_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_compression_mode_ext(dsi, enable, algo, pps_selector);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending COMPRESSION_MODE failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1506,6 +1514,8 @@ void mipi_dsi_dcs_nop_multi(struct mipi_dsi_multi_context *ctx)
 	ret = mipi_dsi_dcs_nop(dsi);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS NOP failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1531,6 +1541,8 @@ void mipi_dsi_dcs_enter_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
 	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS ENTER_SLEEP_MODE failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1556,6 +1568,8 @@ void mipi_dsi_dcs_exit_sleep_mode_multi(struct mipi_dsi_multi_context *ctx)
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS EXIT_SLEEP_MODE failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1581,6 +1595,8 @@ void mipi_dsi_dcs_set_display_off_multi(struct mipi_dsi_multi_context *ctx)
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS SET_DISPLAY_OFF failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1606,6 +1622,8 @@ void mipi_dsi_dcs_set_display_on_multi(struct mipi_dsi_multi_context *ctx)
 	ret = mipi_dsi_dcs_set_display_on(dsi);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS SET_DISPLAY_ON failed: %d\n",
 			ctx->accum_err);
 	}
@@ -1633,6 +1651,8 @@ void mipi_dsi_dcs_set_tear_on_multi(struct mipi_dsi_multi_context *ctx,
 	ret = mipi_dsi_dcs_set_tear_on(dsi, mode);
 	if (ret < 0) {
 		ctx->accum_err = ret;
+		if (ctx->quiet)
+			return;
 		dev_err(dev, "sending DCS SET_TEAR_ON failed: %d\n",
 			ctx->accum_err);
 	}
-- 
2.45.2


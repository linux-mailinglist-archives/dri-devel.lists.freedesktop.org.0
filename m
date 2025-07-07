Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84264AFADCD
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 09:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2CA10E27F;
	Mon,  7 Jul 2025 07:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="cGmkWPw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF90810E13F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 07:57:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-23c8f179e1bso21173665ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brighamcampbell.com; s=google; t=1751875047; x=1752479847;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
 b=cGmkWPw/rjGsnlDNOMr56BsCAOC3mI0pXCtH11pZtEs8ztUxqUkk4fVXlgvEUvMDA0
 qMfJDwXyItJGK0zc9KXzviYqhSJOM7xElE4xmu1HK7CTJvmKXJSCTIosAgo9OZ15mnx1
 HbkPAAc0Su7GfgLv0NO7c4YhI/EjFCz3s7XLDgBHR/ouN0mG+6k0lJnFG3Zk395dve9R
 55LT2g4v7WqCOkD/mAoSknSFMjohQdlFMOljW8udHNhSzVeUAoYISz8xODA0evJ5YP7I
 2gWFl6xOFVeTReOnLoLad9ZhyWXW8/yogW54vHqDgbkifp9U++3befTczHOMf+zVRP/z
 3KIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751875047; x=1752479847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gizo1Y9JZrUMSmoAMbm1FYjU79aRDOXQASrbUODDlcY=;
 b=M9SgAzzxnwiwWBb7n+Sv/alJc1QNYhnZcHrJgBqBnpyecjcY7wmX+pmvj++jegGJCh
 na83gH8ZEqgYXpv8wTfuY4Avk/i9ZaheFglqNEG3HIytDXoWiaJkGNRPlMdfRGUvFO//
 PsMmGGEBuEkr1iDKbKhpvzK9QQbLY+Q87mXdOGTQ32h2wDRnBfUPDqTaq2Oc5/PamkCK
 P2c4+tu6wdmzhfYwtyGzWA4bxE8JBy3XWiH7NDMFRocfdKUqV2Hjr/D04TFxpiwhDMFm
 LhbrfVzxyzpudWHSvTEcC93rYlhbXEXQjL8YHNfitI8B+Y60reZkHkNdZS0kL7Ew2hVn
 ke0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbk/WseC8NarQPVTEBkSYOvTGKS5VUbnSwjpiyAsXoSTPct9LULw6tdl4vPLdxPqMk9/dvFZWDqQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx7QdeLmmJ8PVh5g8sKzzdA+LrQ4cCk5AzQbxjPiBqN1RoYWCE
 Wz/uWX9uwlMw/RjTMZgqIBSDixZYP7RCoDRA8j4LVxG+bgSnhRGY/gtyKlt5Pk/Ii1A=
X-Gm-Gg: ASbGncthknD/gRWLaSFJYmcaOD29bhuVlmb5tg12WTjFOlbONHrYfmjPJXnT8ojZ/u7
 siPkKnypmHmJVOEKDhNe0bwrhR8YbsMcAWwA29jIb1C8i6IDiG9Co4kmWv2qQBslJ2HQnNsdufh
 E0yxy0rT7aXTIm9nF8YyvTSBq+eYurNQ70EdjIrRNwvoHB4V66gIithccQ1Bqp+fjWVnbOrFkYS
 /TqUPaDTjo085aTtn1LufFBc/PVTeI6xMOGGUDwwF4v4bC2yJrZ9jk6LhfRalXNkaiCBq7EBawc
 DPHNDrk4eoCSOSCPIVVORNc5kA7sJ7vFd+MvImijN3m7Eo5ns0nD+Pa2YMi90Jats7R0cMs9h9i
 Z/Huq6ByCIG0EIYz87g==
X-Google-Smtp-Source: AGHT+IH3zTssQXlW4e9+S6k2Gnh2tBpqiBPmGMJFWBwXftXzY2NmSu5YHWb2cBRXSypKAiCuAwySvg==
X-Received: by 2002:a17:902:f792:b0:223:619e:71da with SMTP id
 d9443c01a7336-23c875da391mr150368325ad.49.1751875047455; 
 Mon, 07 Jul 2025 00:57:27 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee62f8bdsm8246476a12.57.2025.07.07.00.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 00:57:26 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org, tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 1/3] drm: panel: Replace usage of deprecated MIPI macro
Date: Mon,  7 Jul 2025 01:56:56 -0600
Message-ID: <20250707075659.75810-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707075659.75810-1-me@brighamcampbell.com>
References: <20250707075659.75810-1-me@brighamcampbell.com>
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

Replace all usages of the deprecated mipi_dsi_generic_write_seq() with
mipi_dsi_generic_write_seq_multi().

This patch's usage of the mipi_dsi_multi_context struct is not
idiomatic. Rightfully, the struct wasn't designed to cater to the needs
of panels with multiple MIPI DSI interfaces. This panel is an oddity
which requires swapping the dsi pointer between calls to
mipi_dsi_generic_write_seq_multi() in order to preserve the exact
behavior implemented using the non-multi variant of the macro.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
index 5b5082efb282..777a8ab3a397 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
@@ -161,29 +161,35 @@ static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
 
 static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
 {
+	struct mipi_dsi_multi_context dsi_ctx;
+
 	/* Clear the manufacturer command access protection */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_CMD_ACS_PROT,
 				   MCS_CMD_ACS_PROT_OFF);
 	/*
-	 * Change the VGH/VGL divide rations to move the noise generated by the
+	 * Change the VGH/VGL divide ratios to move the noise generated by the
 	 * TCONN. This should hopefully avoid interaction with the backlight
 	 * controller.
 	 */
-	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link1;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
+	dsi_ctx.dsi = jdi->link2;
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, MCS_PWR_CTRL_FUNC,
 				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
 				   MCS_PWR_CTRL_PARAM1_DEFAULT,
 				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
 				   MCS_PWR_CTRL_PARAM2_DEFAULT);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int jdi_panel_prepare(struct drm_panel *panel)
-- 
2.49.0


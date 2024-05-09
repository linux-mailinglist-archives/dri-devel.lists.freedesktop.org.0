Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FDE8C148D
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 20:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9724710E9E6;
	Thu,  9 May 2024 18:14:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Skox+Oef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B81B10E9E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 May 2024 18:14:19 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-34ddc9fe497so654277f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 May 2024 11:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715278457; x=1715883257; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZGgT1hFMgp8SCEUMu0ofv/nKd4SmFdvFXao6FIoI+VY=;
 b=Skox+OefFh5TvHgP6HiOo7F9SKoy/YDlQhCU+SjZUaVx8AjdED/WI80ckfgdbedjil
 ClOK6Veow/at06/PUZL70a28QGU3e4J22MD9f6MERFrVKbaBy4bBjPk4rt/DEK+D5jDq
 bbnrDuYZwBFmqcUJi0nskRH0pyIedo6GzVXJ8263WPRz0S/XlhwAuotejpnn2eyIlWkr
 cLWQ4PjHAc27v8j/28S59OKvi/J0jAxUy4gTGjvfNhOWwSEEfziuCQCMTDt93MjOeiaI
 UbEgnctyUTZHZRlakmUkA9jj3w00Xfy8DWsATJyIk0oh9epll1CrfJTX267peqa/PGXj
 cYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715278457; x=1715883257;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZGgT1hFMgp8SCEUMu0ofv/nKd4SmFdvFXao6FIoI+VY=;
 b=MHyM/XEQKHlCURgx/WhV8esyHBrnr0wKm8K0tF8S0tpRVf+s3UeM85PQFI2JActHAF
 a+kRupBFQ7yVEzt3e+S1qLntIW33J9eyp9kuoVOdl8AjUe/S0OT6ZxmAssdBu4de6RBU
 vaRq21jIIF+SEjokV7QKUrKr5CV91DptVI19W9y8lt5wfeRofgI/s/ThiGBtyEnFO4SD
 IRy8VQtJMGhEmzhi/pdoWd2vDri1LbmBVqMWTj/UZJrEOTR0Pc9p9tmmdMiFPuq0nmqs
 ll6Wo+iBa/WZIASBHuK2qhm1S9ZX2CsYIOdhlPuokbFcBvIpLTAreG8rBApTsDOsnuih
 BCPw==
X-Gm-Message-State: AOJu0YxM8HUBXFnhangO4Gb5XvPrX7hidBjCdB2y5+TQpXGufMCP30Fk
 hbE/Ry2mPR9eSZe8HsLPVGDNmRxVYb3pBD/kx5EPJvFf+ScxPScM
X-Google-Smtp-Source: AGHT+IFhoA/vMIw+2oaqHOhFzdJJvOAysP+jydkChqoSdF7SyzB4dG4uXSezRwQdw7c6vf12sQ6TOg==
X-Received: by 2002:adf:e785:0:b0:34a:7a97:caa1 with SMTP id
 ffacd0b85a97d-3504a61c7bfmr373895f8f.2.1715278457363; 
 Thu, 09 May 2024 11:14:17 -0700 (PDT)
Received: from [192.168.1.130] (51B6DCE0.unconfigured.pool.telekom.hu.
 [81.182.220.224]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b79bd40sm2350566f8f.4.2024.05.09.11.14.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 11:14:16 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Thu, 09 May 2024 20:14:07 +0200
Subject: [PATCH] drm/panel: jdi-fhd-r63452: move DCS off commands to
 disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240509-jdi-use-disable-v1-1-5c175b2ea1ee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAG4SPWYC/x3MwQpAQBRG4VfRXbs1Jsp4FVkw8+NKaG6k5N1Nl
 t/inIcUUaDUZA9FXKKybwlFnpGf+20CS0gma2xpKuN4CcKngoNoP6xgwDrj6uB8XVCqjohR7v/
 Ydu/7AaqscXRhAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
X-Mailer: b4 0.13.0
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

Move DCS off commands from .unprepare to .disable so that they
actually reach the DSI host.

Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
index 483dc88d16d8..f7222974d6ed 100644
--- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
+++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
@@ -169,6 +169,15 @@ static int jdi_fhd_r63452_prepare(struct drm_panel *panel)
 }
 
 static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
+{
+	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
+
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
+	return 0;
+}
+
+static int jdi_fhd_r63452_disable(struct drm_panel *panel)
 {
 	struct jdi_fhd_r63452 *ctx = to_jdi_fhd_r63452(panel);
 	struct device *dev = &ctx->dsi->dev;
@@ -178,8 +187,6 @@ static int jdi_fhd_r63452_unprepare(struct drm_panel *panel)
 	if (ret < 0)
 		dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
 
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-
 	return 0;
 }
 
@@ -219,6 +226,7 @@ static int jdi_fhd_r63452_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs jdi_fhd_r63452_panel_funcs = {
 	.prepare = jdi_fhd_r63452_prepare,
 	.unprepare = jdi_fhd_r63452_unprepare,
+	.disable = jdi_fhd_r63452_disable,
 	.get_modes = jdi_fhd_r63452_get_modes,
 };
 

---
base-commit: 704ba27ac55579704ba1289392448b0c66b56258
change-id: 20240509-jdi-use-disable-ee29098d9c81

Best regards,
-- 
Barnabás Czémán <trabarni@gmail.com>


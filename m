Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098293264C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 14:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA9710E6A2;
	Tue, 16 Jul 2024 12:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="diu+MSfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D1510E69A
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 12:11:33 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-70b0bc1ef81so3510034b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 05:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721131893; x=1721736693; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ctnk4Qig36T6nuqfFemKrVj0VTPFOFW8uO+7ZSbbM1w=;
 b=diu+MSfXYpsuQZkYwMa+LLtyZmSptECXcF/w4qw5D8ppxirQd4PodP2g8RnSMjlXr/
 q7yHz64A1tsmZuqnCWQNXozFXYaDanNMVq/0MsjBSrtMlXujVUvsTxvVaZcO3VuKrknq
 Ajfr/axS9BTV889FtuYROU3pKJaZjOpOrLtgj+3phV6nF6/htVkb14D5TgrTs7oAxNuf
 i5VSWDefwebpe3fOwg0Ez+qavmPDBpsfRgE3JDUvXGbFCMlP0hbbal/wGdoyRprJwYeC
 EzYbzMK1juKU2JsBH1xZfHdYVXj38K2riyGswKTgJ9yR2PfO8F0NzRWuP63f0V8ya3hA
 vmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721131893; x=1721736693;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ctnk4Qig36T6nuqfFemKrVj0VTPFOFW8uO+7ZSbbM1w=;
 b=PAwCsSIDIqVFl9XxrssXTUSBn9vLGtDo1qG/5575F04DHB5WsRH+m3Kh0Taeh6ED/w
 Q1kmWMhqvypPMUWYpdlA/jm5y0sE3NcPB9fAg7bHx1KYqAIROgb8x5Wd2ncd0/nQZXnq
 hdz2VaW7zKxu6WeF2lviZN2+bRlYoisHN6+BB1f4PlFPrtcY9uQMype2k5zSyHU5T40u
 3W74KYF/yP1aiMMVODGciZJb23qmoPaPy1BmHvb23llBOd9S+0hRwT0t8ZuaHFrbs9x9
 XiboqmVYRVGTV+xz2kSgafdVmqBvppHpOGZNYnxA7J4GU8kIHvqb6b21/h4q9jaZYBtb
 CLkQ==
X-Gm-Message-State: AOJu0YymgkA4GeGXecGeCxFBzIHzu4HtBZIBZcvv/rGNrOx8HbWW2+18
 EsHdpT7G6RC4IlI+pll8hCyq1T5TMQien8XjPyCWW4AXbaOU7tkpMB6/CYyqsJg=
X-Google-Smtp-Source: AGHT+IHm5RsQCEppC5izT7ZdsLIybhwjJpUCuQ5C82fMYEhLvy546hF8MA0rbBuj+iMezEQ+roGyiw==
X-Received: by 2002:a05:6a00:3cd2:b0:706:700c:7864 with SMTP id
 d2e1a72fcca58-70c1fb112a0mr2261549b3a.4.1721131893327; 
 Tue, 16 Jul 2024 05:11:33 -0700 (PDT)
Received: from lvzhaoxiong-KLVC-WXX9.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eccc48bsm6114065b3a.203.2024.07.16.05.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 05:11:32 -0700 (PDT)
From: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, airlied@gmail.com,
 mripard@kernel.org, dianders@chromium.org, hsinyi@google.com,
 awarnecke002@hotmail.com, quic_jesszhan@quicinc.com,
 dmitry.baryshkov@linaro.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/2] drm/panel: boe-th101mb31ig002 : using
 drm_connector_helper_get_modes_fixed()
Date: Tue, 16 Jul 2024 20:11:12 +0800
Message-Id: <20240716121112.14435-3-lvzhaoxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
References: <20240716121112.14435-1-lvzhaoxiong@huaqin.corp-partner.google.com>
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

Use public functions(drm_connector_helper_get_modes_fixed()) to
get porch parameters.

Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
---
 .../drm/panel/panel-boe-th101mb31ig002-28a.c  | 26 ++-----------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index d4e4abd103bb..4a61a11099b6 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -16,6 +16,7 @@
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_probe_helper.h>
 
 struct boe_th101mb31ig002;
 
@@ -313,31 +314,8 @@ static int boe_th101mb31ig002_get_modes(struct drm_panel *panel,
 						      struct boe_th101mb31ig002,
 						      panel);
 	const struct drm_display_mode *desc_mode = ctx->desc->modes;
-	struct drm_display_mode *mode;
 
-	mode = drm_mode_duplicate(connector->dev, desc_mode);
-	if (!mode) {
-		dev_err(panel->dev, "Failed to add mode %ux%u@%u\n",
-			desc_mode->hdisplay, desc_mode->vdisplay,
-			drm_mode_vrefresh(desc_mode));
-		return -ENOMEM;
-	}
-
-	drm_mode_set_name(mode);
-
-	connector->display_info.bpc = 8;
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
-
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
+	return drm_connector_helper_get_modes_fixed(connector, desc_mode);
 }
 
 static enum drm_panel_orientation
-- 
2.17.1


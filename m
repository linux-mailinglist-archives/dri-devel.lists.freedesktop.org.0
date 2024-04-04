Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3966F8984B8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0FD11B331;
	Thu,  4 Apr 2024 10:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KIHQWXdz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0401611B333
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56e1e6e1d01so567297a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225292; x=1712830092; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3iEJ/RqQGEQXC2ep2uq6icF6qECUCl++i3ec6IEoffE=;
 b=KIHQWXdzAm/oTpuOvjHnuNOMO771tey3pGskrjXAaZH39hO3j1nwNyTVrn+aPtHELy
 +WxSnu8/3Aa1hTiQRxVy+rLazP8LWb3pNngT0G6+pBBmFbjI+eYJ2KBd6kr0FbDNNfA5
 Z40vNp0RB6Ib/KozUm0/Qn6np2LksLVEncTHmVgOHgVPW66/fNJ3yvoLTbkRz1OewfXU
 siqZFvs8cj6hqs33BRfgSwE0wyzVJXYY/ukwkoAbJI+HKd3Yd9fES5lt7QibMzmLSP7V
 mG+g6TTy0V3taD2f8INr4XyOpwxznOseUE4Sj5/fvmwxM/zkQTZ4rpwcr7g6Q8vUYkRy
 Xnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225292; x=1712830092;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3iEJ/RqQGEQXC2ep2uq6icF6qECUCl++i3ec6IEoffE=;
 b=OpQYohaPPZPE042bq2FUSg37EF0y4TVit1FUU5wuxZop7rJL3lOgc5v4FlGEE+WPJL
 iEop2NgjYUWDT17cxpNgunKlJBE4bHrf6l3xYd5lvPexG4Fk5cfrCtuiwBggWg6CIHU/
 eBsaCVPrN8xU6souZ5LUEBJb4k7Ju3bHpi8GKyc/u07TMCfYi8zx09gJ+gOgmJOgXibH
 qnUKbFwluEYI6yXZv9ei1NGmJ5y7jmuXZlDVRg7oixJ9zx+sUc8+lgeJueyO5c5+nIbi
 2NS7uAQHuNAzVwJFL38+dgAIF9zAa9Ht9Ry0Prcu8XgmTeQRM0IqBmpKbjE+zwx71aNz
 4zjg==
X-Gm-Message-State: AOJu0YxGousoteMK0tNv8nuclaQ5oHpwRQvl4B2QjmWVo0IwvtgF+533
 7uc0pBv0y/4Tl2Dy2oy+1dP+RoALmFrTCIgdhn7po9jYsuNixSEjyyyWdM7uwlk=
X-Google-Smtp-Source: AGHT+IE7uZg+Q8MxKj9wP0qIcOCX5VGa3Rs8Ms9OK8oC2SCWf7JhMx8FjKV08qwBA1+QirOE+lHo/Q==
X-Received: by 2002:a50:9f22:0:b0:56b:a077:2eee with SMTP id
 b31-20020a509f22000000b0056ba0772eeemr1463352edf.4.1712225292236; 
 Thu, 04 Apr 2024 03:08:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:08:02 +0300
Subject: [PATCH 4/6] drm/panel: novatek-nt36672e: stop calling
 regulator_set_load manually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-4-9f56953c5fb9@linaro.org>
References: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
In-Reply-To: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=H9DTnvxOhLAsFMR7/zYzkTplDuaaTlPMoOsjC54VSys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwGOSkOIwSEiA9PVDGHOoidJ+W9OPRJ8acpz
 nzm2l9u+zqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BgAKCRCLPIo+Aiko
 1WMWB/96tYjo2hhtiGxIK0g/c0rr8Y2g8PIUfBaRQ5yKZE6bHjOHd5kpM6RTO95gR5cX2m37Vdz
 UdtHFCsw0p0GHa7VQMeJHwwmYGlyq5kRRXYAJWN/xffSJZXSFHO/7jf3lt6u+zTKuIjEdWP00GK
 65z43VET+dmpitof8CNOty04Q0GD46F76Zivvy9YjMyNO3nH+EThYsPB92alpFXLqdZvkt7G3Ih
 IuydjRCHtNDxoaamGsLDzUPVrBVVmAEWWT2+dntfqtcB17zyb98nVkcdXqTpX6BDWWMuCqgzjbM
 YNdfJaHSbeOUe324ctffoZk9jtJan5O0VkntBwKi++N0l0Tg
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use .init_load_uA part of the bulk regulator API instead of calling
register_set_load() manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index 9a870b9b6765..20b7bfe4aa12 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -343,17 +343,7 @@ static int nt36672e_1080x2408_60hz_init(struct mipi_dsi_device *dsi)
 static int nt36672e_power_on(struct nt36672e_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret, i;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
-		ret = regulator_set_load(ctx->supplies[i].consumer,
-				regulator_enable_loads[i]);
-		if (ret) {
-			dev_err(&dsi->dev, "regulator set load failed for supply %s: %d\n",
-				ctx->supplies[i].supply, ret);
-			return ret;
-		}
-	}
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret < 0) {
@@ -550,8 +540,10 @@ static int nt36672e_panel_probe(struct mipi_dsi_device *dsi)
 		return -ENODEV;
 	}
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++)
+	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
 		ctx->supplies[i].supply = regulator_names[i];
+		ctx->supplies[i].init_load_uA = regulator_enable_loads[i];
+	}
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
 			ctx->supplies);

-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CB8984BB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0996811B334;
	Thu,  4 Apr 2024 10:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dxHZGcZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E04311B335
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:16 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56845954ffeso1308654a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225295; x=1712830095; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9gdreFmOsn9hnQ9/3et99EfVumTY2yhwD/QDrRRb3VQ=;
 b=dxHZGcZaDupKsMFjm2rnrtoiNjfPVTES7uXBigKtLxRVx//wIyiU0LozMyM40tglNO
 S0i2BcJuUu1lrt4TPZKdwR+Oym+irGL+HJmcaUzQSOcHwqAQ6oy9UTpTWuQjEDZPhnwj
 svV+NWsTBdeo2QkmSv8GOZdptMA0Jpns0LI9M1YRScLs+jJUxyw8c4OAFQ0w9iDNJ1ck
 neWYvnil58O8gWr6MXRfdc9e/3sgr82eFNOw1gZ8QGbZq0q5JGgw2UUAfnbGCVCGHmtB
 453Tp1w5xqfYb1L9hpYV+BgtutOTyMonBEqKB2+O/fdyk7bICHtUk73Co6K397saMT0f
 vTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225295; x=1712830095;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9gdreFmOsn9hnQ9/3et99EfVumTY2yhwD/QDrRRb3VQ=;
 b=hO/tWET1d9x18s8PEQhi1iYSXayIUByX0gHBMHp7R7shi2rMzcLTLKwnMs2/SVyP0d
 wWRv4NyjoU2gVFmCSkiTgMm/qIX0Z05YgHzbcHXZFzxNuEKPZ6bsBtlbQHvwzJ0TDvg0
 uZI3NJYmJDcTAg+Wb1nHTeQO+pyX00OpwNQk+TPCFQ3+EtgGxNibIqhxAEAK42sh1yiZ
 uEuLkLC1EQFkRADz+5n/Gase3tZolY6fielM835momaMnSvDcAZY6UZ/wWQshfBGDdHz
 JowpJ8g+Q6tSakCI39ZmuC9ixfuhK7o4ibWKHW30drw/U0/LRZfP95xzZ98eh9atiNvE
 kjYg==
X-Gm-Message-State: AOJu0YzVtdENs2FZYAA1jpZ1Tu5oqdjOqayL6ccyrdBmD78h8dMA7QcU
 yPkEKAT0NIYLTwsE5hmGqA/KEiHuH2Y4M0p4RDhGN70li2kCKzMyqL2X9NyXXiI=
X-Google-Smtp-Source: AGHT+IG6MIBoUnhn5kD8YkyWDaqubmu5zZw/UDEyEutc/LQNpwjh73npo2Rh0hXKgklGbZY1tDHrxg==
X-Received: by 2002:a50:999a:0:b0:568:b622:f225 with SMTP id
 m26-20020a50999a000000b00568b622f225mr1367415edb.30.1712225294754; 
 Thu, 04 Apr 2024 03:08:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:08:04 +0300
Subject: [PATCH 6/6] drm/panel: visionox-rm69299: stop calling
 regulator_set_load manually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-6-9f56953c5fb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=irilOr1F66J72zSf/iZ/FxY1c7hsuCBIEPtG00CVG8k=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwGO0eQ0yN5Gyv9QpomFj0R6gyXZ+5rtNEtm
 IGQoU0uAEaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BgAKCRCLPIo+Aiko
 1WYFCACn5db1y7XDZnwi8s8NKNDV0h88BTcuOpypH5tfLwAH0CVs/5d5b23X+DvXMpORhQEi1jY
 Dlh/F0h8AceX/ZhR04srs58R1l1cV18WdVKPKoWheb7OstyQjJweYXovPKwMHJ9oAgyIVfGWA2b
 ZkPVfk1YaWtNi7jLO44GU7J7TOMbi9Y6tHvkxgEb7LpRXi6KzxA5Vxn/hlitMipltv3Th8rHBbU
 k6h0ttkCAmQbWlJKlqYqcNOE615htx4ndaJ81GMF6rJ4I8/2/oiVwmjy5y3aLOLWsJ0Iurs02L+
 MwsKQn0YXCDkU5gtyKKVeeXSmjgnvndGlJJ+gU7szKQ6+s6Q
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
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
index b15ca56a09a7..272490b9565b 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -197,7 +197,9 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 	ctx->dsi = dsi;
 
 	ctx->supplies[0].supply = "vdda";
+	ctx->supplies[0].init_load_uA = 32000;
 	ctx->supplies[1].supply = "vdd3p3";
+	ctx->supplies[1].init_load_uA = 13200;
 
 	ret = devm_regulator_bulk_get(ctx->panel.dev, ARRAY_SIZE(ctx->supplies),
 				      ctx->supplies);
@@ -227,22 +229,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_device *dsi)
 		goto err_dsi_attach;
 	}
 
-	ret = regulator_set_load(ctx->supplies[0].consumer, 32000);
-	if (ret) {
-		dev_err(dev, "regulator set load failed for vdda supply ret = %d\n", ret);
-		goto err_set_load;
-	}
-
-	ret = regulator_set_load(ctx->supplies[1].consumer, 13200);
-	if (ret) {
-		dev_err(dev, "regulator set load failed for vdd3p3 supply ret = %d\n", ret);
-		goto err_set_load;
-	}
-
 	return 0;
 
-err_set_load:
-	mipi_dsi_detach(dsi);
 err_dsi_attach:
 	drm_panel_remove(&ctx->panel);
 	return ret;

-- 
2.39.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F998984B6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6357511B32E;
	Thu,  4 Apr 2024 10:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CUVl/Zv6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F1B11B334
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:15 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a46de423039so50398466b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225294; x=1712830094; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PPN+AHE8y2MkIJuM9pYz2Ll5VT40Ao0mKYYFM9ZEDlc=;
 b=CUVl/Zv6e2MuCwH5qj5bap2522VJWt8ZxxL0zVqlLTaW7dlsZVovc9Kz8MhBz76N3Z
 KAOT6xpT8OohT4c29+rbqW1CtTRb2T+TCLqd/iseytOaKEc4x/XGWLSO42rrGe6tdjFl
 xN0wk5cYjT2wJKqVFWBgDjX+hnFkmaFD2R//duKwvlOBBmU+FZuLJPJOq3nAnLq5Y4b8
 kpKPKr2/sP7dAJur5/l2ea6xRnIaBEt04ZZaEc5kVsuFnyLO9PFdVXYZOdL223LCSoBT
 ABKUD54ToW8CNgTlEgKvH8dsF1mxwuILpIfbsxga5Ehotl0aqeS0BD92Fr2FVMNGfRr9
 nc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225294; x=1712830094;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PPN+AHE8y2MkIJuM9pYz2Ll5VT40Ao0mKYYFM9ZEDlc=;
 b=v8Ukky5TW8eUrbAu2pGk18jvTVB5lf4+3wW+dbbtdwcmqXGUMe7r8Y3G/QlOKwYbaR
 X+6fQUSVddkSq9/f6EqyohzJzPUmVYRW1J+qKHG6WAGDqVvADPiXryxTVtuhd65FCegm
 NmI9Oj5nyBWyEA3n1B9649GkuthFYPe73C26nDZl72Z4ov6naFLN8RucIbTN6stfx2Wd
 JMXE4gK9VYtwgCtQLWhkNQ+zK1hOr/Swcc+phM8551dYIOgf1Valh6XcT6MMrPr8oAok
 bBtsLAHq7pHcnq8TP9F5L46d70VrMUyG6kSkERLQ4lvwijFhkhQbDdKVfUJYDlN+eaJT
 teZQ==
X-Gm-Message-State: AOJu0YyH1BtD4ade2D9NOkDYCZ4k6Cy+EdtYfiEO7PJ0vQ4YxK4Ilb06
 w06ocVLGiqRXP7XwdQVjz9GNsOIuKfgryXd9TUPvfigDNqqt7JRhEVk/iS5Fo4U=
X-Google-Smtp-Source: AGHT+IG+bzEJEONgFdA3wAMbc5bzkjLYvW9jbIlri8O2GdxrDMhypvw8vGmRretwMNzBqrsEp+LLtw==
X-Received: by 2002:a50:9516:0:b0:56d:eb22:eaf2 with SMTP id
 u22-20020a509516000000b0056deb22eaf2mr1641222eda.21.1712225293709; 
 Thu, 04 Apr 2024 03:08:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:08:03 +0300
Subject: [PATCH 5/6] drm/panel: novatek-nt36672a: stop calling
 regulator_set_load manually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-5-9f56953c5fb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1557;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eCcqI9AuK/Z4GvlfkxunJCyaNrb4UqWmCkVQLFSw/nQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwGnnj+WYVJzPKl/9S+XC8FxF5CW7r/Do0cf
 314BZ0pIASJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BgAKCRCLPIo+Aiko
 1VZVB/4z5IlE0BLotgSxrMP0zTg3pTxhrC760H1bsEoAEATmeiT5vkTHU3LD95tNz3V8GnPGFDF
 YrGEzRLYnT0SOGtCu8HEXePqHwzQJyr1Wo900PMx/JZj56s91T5ya+wqhW4mZwda5H0yQVU2rk8
 l92jyhHDAuFtuL6Ey9S5DIR4w8zhC2C6GM/Pv6YBXS80WgqFUHMgjjzF3NM5FJCpxqgut29qpSs
 svgtDFYO5QNcRXro8ChmX0QRZNzX/tFAzKqf/kZtc5UEimqhbnM2eiQfdB8Os08R1FUioTI20em
 +CHMaTUzjjXXAjk+1ZwVOZizCsXDwF1x6pCj62qPSYbSBfFb
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
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 33fb3d715e54..3886372415c2 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -605,21 +605,16 @@ static int nt36672a_panel_add(struct nt36672a_panel *pinfo)
 	struct device *dev = &pinfo->link->dev;
 	int i, ret;
 
-	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++)
+	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
 		pinfo->supplies[i].supply = nt36672a_regulator_names[i];
+		pinfo->supplies[i].init_load_uA = nt36672a_regulator_enable_loads[i];
+	}
 
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(pinfo->supplies),
 				      pinfo->supplies);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-	for (i = 0; i < ARRAY_SIZE(pinfo->supplies); i++) {
-		ret = regulator_set_load(pinfo->supplies[i].consumer,
-					 nt36672a_regulator_enable_loads[i]);
-		if (ret)
-			return dev_err_probe(dev, ret, "failed to set regulator enable loads\n");
-	}
-
 	pinfo->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(pinfo->reset_gpio))
 		return dev_err_probe(dev, PTR_ERR(pinfo->reset_gpio),

-- 
2.39.2


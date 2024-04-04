Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCD98984BA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF5D11B335;
	Thu,  4 Apr 2024 10:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vhqeKXZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBC211B331
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:12 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-516bf5a145aso945834e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225291; x=1712830091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BdIQoQEcKOWWU/GbrzKgWkHTMEPIUceBmA7aLedovAc=;
 b=vhqeKXZG9xRrth5pPtknMFJphJ+5uVsxALCXVLR4tWafb4laPyVlOQWsCU8qQyT17F
 7Ufpduh9LxO8O6G6eTfFpc9xqyHdI0MZ7vV/H/U44p0Rohj62QzqpeFYj+7aFR7vP7VF
 O3jUJ5Pa1/FzQXICyWdJpD4LhXXqzkVCJsHFIZFjxpG1KOsENQjKRygtfn8RiuZjlFl3
 O5CZgGH9/3uavrherdvyYQ99QdsFbCJIiRL1tjZLsDyv+vLHDOdaD1d7eE80FM2Zvulr
 Z5aOsGfGgAZ7OlaoicExgFULiiR8c/0Kd3lHVCu88BtgiT/QfU9+HESZxA+D/mDkrtQJ
 fd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225291; x=1712830091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdIQoQEcKOWWU/GbrzKgWkHTMEPIUceBmA7aLedovAc=;
 b=tKvK10u6BbFf4BcLojkjH/GZiNVn8kS/9Kr64Q8Cer58yRuT7yRBm+FP/c3cb2nkDu
 lhYJyCKIjX8APjNtkVSk6Zgs7udbMA+y7eO5IvGi3MRzEeRaNv7K37+Adj3Xiy5eW3sd
 RS7agVmv5pKXyZlBNln7nhRQ8PnGJGKJJi8JUkC9V59d9SiM+LQW1cs2DzzbSuQjhB0U
 7Hn/sAyUDkVnRRQOuuXFIWr97x6INq3i3wdH/AUm7tEIM3ne/Fvi9HjCe79ifcRPhyMn
 9JAHxOt2pRfLEZlgyA3yDyr57iXl94wXEtJA0tjK5nbncO53E1mLNpvYxUCF5GocagPN
 hldQ==
X-Gm-Message-State: AOJu0Yz5GjsIwG6ux4caJxl6d/5+YGNLkEkzy8+KI7yI0el7lYzgAPw1
 38J4F7UFr7lx843UcysK6BbQBO7rl8smJjIouYU9EfY0LXDYeO1LRZ6dldj9m8A=
X-Google-Smtp-Source: AGHT+IGVlQ33RJEgohTvVD0EMCqh4p4Buhi5vVkciZI4lYNhGCrK13DBduxsmLyc55fg2pHBdTILcg==
X-Received: by 2002:a19:644f:0:b0:516:bfd7:de92 with SMTP id
 b15-20020a19644f000000b00516bfd7de92mr1308662lfj.43.1712225290902; 
 Thu, 04 Apr 2024 03:08:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 04 Apr 2024 13:08:01 +0300
Subject: [PATCH 3/6] drm/panel: novatek-nt36672e: stop setting register
 load before disable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-drop-panel-unregister-v1-3-9f56953c5fb9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rZ4pFCxBcKO4r0UopE2b8togAYR+akgCS3Rw6K0bDz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwFAm7x8NXoFqiIBscoezOHH9QYMPEReQDM6
 baVaKAbFWeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BQAKCRCLPIo+Aiko
 1ZRhB/0Umx3VwSsiurPyTfgDRGxeKFo9jV4d99djRhqqhRRDIYlh8kwO4kA/En/A9IdV0bOtlR9
 /tdlRL1lMwq5S/Z/XcOzVee8BHb9ffUqX1dOuUuTltDlMQWoOaDrLarzWzFAT31SxJPISPS2/Ba
 t7yEsKdIiV9/+9QaSvG35b8LNMeiCtyFsBkaNJrbiKOOTsCDquPJgIy9tVHDlHRtqbJ+8CBaexn
 QgKfxEqZCuj1lh7PHG2SoHaV1GeK0QD7pl6DA6kosRxf9TFkCE/IgmeNJdL3msAFWJcfb2mAwKv
 O7iqZ6oMAWOYwSEiq6XRjNpjv5vzQFFlPs194hg5J4rHFlyG
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

It is pointless to set register load before disabling the register. This
vote is going to be dropped as soon as the register is disabled. Drop
these register_set_load calls.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
index c39fe0fc5d69..9a870b9b6765 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672e.c
@@ -25,12 +25,6 @@ static const unsigned long regulator_enable_loads[] = {
 	100000,
 };
 
-static const unsigned long regulator_disable_loads[] = {
-	80,
-	100,
-	100,
-};
-
 struct panel_desc {
 	const struct drm_display_mode *display_mode;
 	u32 width_mm;
@@ -385,20 +379,9 @@ static int nt36672e_power_off(struct nt36672e_panel *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	int ret = 0;
-	int i;
 
 	gpiod_set_value(ctx->reset_gpio, 0);
 
-	for (i = 0; i < ARRAY_SIZE(ctx->supplies); i++) {
-		ret = regulator_set_load(ctx->supplies[i].consumer,
-				regulator_disable_loads[i]);
-		if (ret) {
-			dev_err(&dsi->dev, "regulator set load failed for supply %s: %d\n",
-				ctx->supplies[i].supply, ret);
-			return ret;
-		}
-	}
-
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
 	if (ret)
 		dev_err(&dsi->dev, "regulator bulk disable failed: %d\n", ret);

-- 
2.39.2


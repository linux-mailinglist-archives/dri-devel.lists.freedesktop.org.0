Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B559B4A3C06
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 01:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80181124CE;
	Mon, 31 Jan 2022 00:00:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E57F31124C4
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 00:00:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id bu18so23374939lfb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 16:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLMbzDUhFlSgdQoGKuc6SBBSjoGSeYRwJlFPN5QbfOY=;
 b=RK73TNDnpRXvhBX8A5kt8T9bMKrFqOWo89YfW3gK2p/ab1wByjnGog7fEXd3UVT+C3
 rHoNnE2KHQTRVgXgEbxLf8rq2dfS7RN2uauA94bDVKW9t7hI2Itkv6D/Uq9pEptbrU4B
 MvyYxY9eImtQTwr9x1xgphwI65LXw+PgF4X53+7EbnHJ6VlxsKylOfKocaC1+hwE8j+Y
 g8DqFpkq2bE3Fa6cxe4EJMV5QFxB9EbJQREG6E6dm9HB8VwRdFbjW8VZEaPRMYWxh0Fi
 xS0fx3jW1XZkk9AdVDpBkuIL04m469ZyC/8J5X48ZOiIy9CvayEu9GPYKAk+UziJs7Sz
 EAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLMbzDUhFlSgdQoGKuc6SBBSjoGSeYRwJlFPN5QbfOY=;
 b=mI7QwefldFj+j50BfaxYtTdwV/A64VRo9F9Msl/Fv+dF6LkFpVlHIu8cdiGtP6TrtV
 wWXcEArZrknQ2T1+TcjLus9GU5iKpkI9ZtNr/kH3vBGSSISIcm3n0s2vocr7HnyDeAAX
 9PP1Gc/hcyTnZ4RFnGnwCKtixOM0JOzj5cJqhdCLhFMtC3TKyXHuPzyy0m5/cq4MfOtW
 huM71S2x1fOBbbHjVQtss330tuS/JP0Te1jj470fi9uCmGFqP8DIkn0PvqV0aSV3GiSn
 JdGkNsU85hyLLinsGcoZ+d3hoQha0WMCS58MrX712nl15EG1SzKdyVLg3OAyvLCWG86P
 UN6A==
X-Gm-Message-State: AOAM532BGwxcDgg51Bt1BOjyC5Ld9SrTHknPe7+Y6nQuZKfwxcWqLpXy
 rarZokTzvIE1VUKs5qYO7P4=
X-Google-Smtp-Source: ABdhPJzQA1KKnOEKivxU5yFBm8z9Pa+/47HYUYIyiKAkcrhL57RR7avlrclppEY2U8tedf0Iy3kCEg==
X-Received: by 2002:a05:6512:1587:: with SMTP id
 bp7mr13852830lfb.671.1643587202164; 
 Sun, 30 Jan 2022 16:00:02 -0800 (PST)
Received: from localhost.localdomain (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.gmail.com with ESMTPSA id e7sm3443193lfb.17.2022.01.30.16.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 16:00:01 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v3 3/3] drm/panel: simple: Add support for HannStar HSD101PWW2
 panel
Date: Mon, 31 Jan 2022 02:59:45 +0300
Message-Id: <20220130235945.22746-4-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220130235945.22746-1-digetx@gmail.com>
References: <20220130235945.22746-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add definition of the HannStar HSD101PWW2 Rev0-A00/A01 LCD
SuperIPS+ HD panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9e46db5e359c..1bfa2d1b61fd 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1927,6 +1927,31 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing hannstar_hsd101pww2_timing = {
+	.pixelclock = { 64300000, 71100000, 82000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 1, 1, 10 },
+	.hback_porch = { 1, 1, 10 },
+	.hsync_len = { 58, 158, 661 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 1, 1, 10 },
+	.vback_porch = { 1, 1, 10 },
+	.vsync_len = { 1, 21, 203 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc hannstar_hsd101pww2 = {
+	.timings = &hannstar_hsd101pww2_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -3802,6 +3827,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd100pxn1",
 		.data = &hannstar_hsd100pxn1,
+	}, {
+		.compatible = "hannstar,hsd101pww2",
+		.data = &hannstar_hsd101pww2,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.34.1


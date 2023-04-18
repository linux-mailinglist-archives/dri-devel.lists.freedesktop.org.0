Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 623DE6E8B00
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D55010EB76;
	Thu, 20 Apr 2023 07:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DC210E797
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:23:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-506b2a08862so1054345a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681820597; x=1684412597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GdGbv/pLHp4CJFcAcJ86ZXlivHxj1oJPvxq3aUsz50w=;
 b=SeLoiOZUqsGaAFe74u/0uQeG/zFk/quEm0NBjlLRxwvHBx6ShOKVOGqsHkoTG4/K3B
 FBepw0m/Wdqn5RvBidh671DOovjyiPKf9FCz5PPaZ3mVrpDl5NoDGXl5cvmlH8Ei6J6C
 GAGWMSF9+KcBrhOQdcUldrhEUOnFYVOb/cWH5WnoWdOQ3ZmBVZOIPu/j+fi97ylVv42O
 gt52ZxTQkIgoeDnggmK109kxZUP2C3Jo0OtKHSwx79LrlgBihm5P+nl3gthN0dZttuq+
 qSkLxdJ+RWJi5Bqb4yI8CQCR0rTiX+PRrLYzzsw8CeIsPy2Tm4m0Y2GJACZ/RNy4O7gI
 ubdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820597; x=1684412597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GdGbv/pLHp4CJFcAcJ86ZXlivHxj1oJPvxq3aUsz50w=;
 b=KveayjWMmG+Jm00IBtRFG3L4tOmAEX404Z/QvBXEm8X0wqGrvCztiS5CixG2JoE2kG
 7fGaz3OfYk0TkqOptR9qMVn6lKOdveFDtlk7jjQZstXbNck4NVrbLiJuykgiltmbifz6
 TdgDG16je9H59i3MH0lwh92deuYACcUr7LGvBswbRSfb3J4USbkzYTG4xMZl2fZ6U7FI
 tJg+qEgHWGDak0E0GsQ331ZRh/mNJaNryQedVZlRoH2wYwlF0EW5T3O9HdTRvTDZbvb7
 /e3PcpAsJJbfcUpP1E1Rb5YmB/pRlFIfHjFCApvjQdoRO8fe4wl5gnJpm11S4CFGzOwI
 z13A==
X-Gm-Message-State: AAQBX9ffq5gPfNes0+4qeAuNyMZ7pbprso2nY4KcVBqcb33ULLtdUwjM
 eGq9+WqnAmikEBqPo31EE2Ou7PReKMV9wg==
X-Google-Smtp-Source: AKy350b+ahD+L+lkouLxjMxv8NwcC1kC8umXlp7wCK0mQjUby9PGcflfEPiAKgMExKBTZjARiJhaCw==
X-Received: by 2002:aa7:cb56:0:b0:4fa:b302:84d4 with SMTP id
 w22-20020aa7cb56000000b004fab30284d4mr2019716edt.13.1681820597500; 
 Tue, 18 Apr 2023 05:23:17 -0700 (PDT)
Received: from localhost.localdomain ([154.72.160.133])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a50cd8f000000b00506addaaab0sm2221252edi.32.2023.04.18.05.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 05:23:17 -0700 (PDT)
From: Brandon Cheo Fusi <fusibrandon13@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm: bridge: icn6211: Allow selection of video mode
Date: Tue, 18 Apr 2023 13:22:04 +0100
Message-Id: <20230418122205.16632-2-fusibrandon13@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230418122205.16632-1-fusibrandon13@gmail.com>
References: <20230418122205.16632-1-fusibrandon13@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Apr 2023 07:12:56 +0000
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
Cc: marex@denx.de, Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 robert.foss@linaro.org, jagan@amarulasolutions.com, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DSI burst mode is more energy efficient than the DSI sync pulse mode,
but doesn't always work with some DSI controllers (like sunxi's). Let the
user specify the video mode as a dt property, like in
https://community.nxp.com/pwmxy87654/attachments/pwmxy87654/imx-processors/167105/1/panel-bananapi-s070wv20-icn6211.c

Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 29 ++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 39de9a7c7..ec720ca1b 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -512,6 +512,7 @@ static int chipone_dsi_attach(struct chipone *icn)
 {
 	struct mipi_dsi_device *dsi = icn->dsi;
 	struct device *dev = icn->dev;
+	u32 video_mode;
 	int dsi_lanes, ret;
 
 	dsi_lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
@@ -526,8 +527,32 @@ static int chipone_dsi_attach(struct chipone *icn)
 		icn->dsi->lanes = dsi_lanes;
 
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
+	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM
+					| MIPI_DSI_MODE_NO_EOT_PACKET;
+	/*
+	 *	If the 'video-mode' property does not exist in DT or is invalid,
+	 *	default to non-burst mode with sync event
+	 */
+	ret = of_property_read_u32_index(dev->of_node, "video-mode", 0, &video_mode);
+	if (!ret) {
+		switch (video_mode) {
+		case 0:
+			/* burst mode */
+			dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
+			break;
+		case 1:
+			/* non-burst mode with sync pulse */
+			dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+			break;
+		case 2:
+			/* non-burst mode with sync event */
+			break;
+		default:
+			dev_warn(dev, "invalid video mode %d\n", video_mode);
+			break;
+		}
+	}
+
 	dsi->hs_rate = 500000000;
 	dsi->lp_rate = 16000000;
 
-- 
2.30.2


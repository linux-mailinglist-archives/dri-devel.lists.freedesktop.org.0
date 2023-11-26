Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E8C7F937C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 16:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C5F10E112;
	Sun, 26 Nov 2023 15:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83D010E0FE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 15:46:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a02c48a0420so466637266b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 07:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701013605; x=1701618405;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lH7aqPIDP5zDMXKB9fcIq0eCdhqCYxRoC/nv219ztfM=;
 b=DiM//yX5VoJFLNg9dfktN4AlwLIPMbJiOcnkYeNcYb1hWXZLXawrtPxp/4Qkszu11J
 Kcare4pG7WcKuRDV/XXVI4OgfQ4ZLeElWe+ag2O1aHc6KAQHutbMSY8TAGY5RuN8gg9Q
 yNcTD5mEgjtgfCdqfsDq+bpe0/CIr+FXAtWp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701013605; x=1701618405;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lH7aqPIDP5zDMXKB9fcIq0eCdhqCYxRoC/nv219ztfM=;
 b=Be8ZAKsP5UTr4+6tpUhYj6vQpJcwjz1mf69TfjPSpR9KsYLrbBFgJnYrsaQUYWTUMT
 zf1tablWi5jXw0rpcUw4zON+naB8pRJD+3+a06JEXxuw6S6qb2QOgytE/SDsRI33YdYb
 etrhO2r396ZSOvNG0RPvy8rITlt6bbj/eYWDLDTRVzp8nniZSmom9pTw9m8fsLPcJ1Vc
 6mSoz3wnURXuWEZI15CQZQwAViE08nkOjFuACrKuslcbNT5qGcwCm0m0ZDWSB71Mqd/u
 FpMjm272utHrEYZ3hwT7KOMcX3ANsDa5O81KtVP60jsa76gQjbXL43DmccU+hyq3PLFy
 MHXQ==
X-Gm-Message-State: AOJu0YximweIkgv5RBULWxMz85uJs9FRIlqmx3Ly4tfkbT2YWhYziM6K
 5BPSEiOh/GSdkyNZuCL8r1x6vg==
X-Google-Smtp-Source: AGHT+IFGjyPefy3qUCIckY94nu278KPo6arcbb0FbHr4msqDfJB29m5Zb9k76MVfQi0M0rApKumbVQ==
X-Received: by 2002:a17:907:d92:b0:a01:de07:5926 with SMTP id
 go18-20020a1709070d9200b00a01de075926mr7488722ejc.45.1701013605262; 
 Sun, 26 Nov 2023 07:46:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 h24-20020a170906591800b009fdc684a79esm4656158ejq.124.2023.11.26.07.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Nov 2023 07:46:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/11] drm: bridge: samsung-dsim: complete the CLKLANE_STOP
 setting
Date: Sun, 26 Nov 2023 16:44:56 +0100
Message-ID: <20231126154605.15767-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
References: <20231126154605.15767-1-dario.binacchi@amarulasolutions.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, michael@amarulasolutions.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The patch completes the setting of CLKLANE_STOP for the imx8mn and imx8mp
platforms (i. e. not exynos).

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/gpu/drm/bridge/samsung-dsim.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 15bf05b2bbe4..13f181c99d7e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -96,6 +96,7 @@
 #define DSIM_MFLUSH_VS			BIT(29)
 /* This flag is valid only for exynos3250/3472/5260/5430 */
 #define DSIM_CLKLANE_STOP		BIT(30)
+#define DSIM_NON_CONTINUOUS_CLKLANE	BIT(31)
 
 /* DSIM_ESCMODE */
 #define DSIM_TX_TRIGGER_RST		BIT(4)
@@ -945,8 +946,12 @@ static int samsung_dsim_init_link(struct samsung_dsim *dsi)
 	 * power consumption.
 	 */
 	if (driver_data->has_clklane_stop &&
-	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
+	    dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+		if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type))
+			reg |= DSIM_NON_CONTINUOUS_CLKLANE;
+
 		reg |= DSIM_CLKLANE_STOP;
+	}
 	samsung_dsim_write(dsi, DSIM_CONFIG_REG, reg);
 
 	lanes_mask = BIT(dsi->lanes) - 1;
-- 
2.42.0


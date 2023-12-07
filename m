Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE1808A2A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 15:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B34910E8D4;
	Thu,  7 Dec 2023 14:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B90010E8CD
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 14:17:34 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a00f67f120aso117939766b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Dec 2023 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701958653; x=1702563453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LRuU/Yf3+WOs2/s3BqHchrpBnPmBNhkaR5Vfu/UBGmU=;
 b=UNySYIbxSAAZ7P+NmWu1L1Wot/9huuaJR2KzQhl6bAl6e2bQrMcclFwIXaBzx/9eni
 3arI2bnFHsS3hdmtftNxKEbJUwemFT0sRnlL0Vhy77UxsXivpz4wNIFE4GufjRnxGjzK
 ZTEir0eD8mwR/XbHvtBvTJP129RgeZJwjMeXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701958653; x=1702563453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LRuU/Yf3+WOs2/s3BqHchrpBnPmBNhkaR5Vfu/UBGmU=;
 b=lLA7xYJn9rjiC/hU6n+qKaC9qM+MzQgpDOLQR1M9dRFzxNWQEo/cu//gdDk/uvIps/
 iMk+CZ6Sw9pW/TN7kv4AiGxJdaRJtTCCsEyv7lZQYWThl0QjaWmsP6DwPENCOdbItTqR
 h+7CBNNmAUEMK11I+P9vBkiubL0wIc9MxFBk2x78XembNQ3UNCc9TTy2u2i1X3RtKshq
 BJRpQHJjAf8Ul0chJqld3uPE1Q+JhoQ5hYJG07uH7ufERO2OX+84iPLtaXchGr1Y4+YL
 mAjDzAgOJC3bCf7E9m28uPExToX+usUr8aNnORDJlsF85JbEbALOPmBjGz+ajmFCai9k
 uFZQ==
X-Gm-Message-State: AOJu0YzwsxzpCQmZ7aK2XPspHOA2FhYK/ga2fNQtZMbZZKGuVFaaHDVe
 ao2pk9QNTg0JSOFcicgrHG3sCw==
X-Google-Smtp-Source: AGHT+IEXkPRNYwtzYN4bJ56aVKbKWo15GXlFCCREur+cBaC6pPT879kzp0Ctb2aW0i+7TuAVzZOEEQ==
X-Received: by 2002:a17:906:b759:b0:a19:a19b:55f4 with SMTP id
 fx25-20020a170906b75900b00a19a19b55f4mr1531281ejb.132.1701958653107; 
 Thu, 07 Dec 2023 06:17:33 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:9bf:959c:3c66:46c2])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906c09800b00a1e814b7155sm885421ejz.62.2023.12.07.06.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Dec 2023 06:17:32 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/10] drm: bridge: samsung-dsim: complete the CLKLANE_STOP
 setting
Date: Thu,  7 Dec 2023 15:16:33 +0100
Message-ID: <20231207141723.108004-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
References: <20231207141723.108004-1-dario.binacchi@amarulasolutions.com>
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
2.43.0


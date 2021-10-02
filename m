Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F94441FEB9
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5E06F51C;
	Sat,  2 Oct 2021 23:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEAE6F51E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w29so22119351wra.8
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wz/ee0QFf1zLzjYQvpsk8gV3BuqjIdVKipKwS9n+pgI=;
 b=K/zTxhdXTQysfV5PWX4oXKki31wkDTC9MgoHWPFDft+dweOOr+4vjue+nocqKqPUcK
 PMjE2Lu76QISmMx45veJyxwrnEepm1kcXuAkehF27rw4aXn77eq6Kp8fSXEQ9a0Y/fSe
 fYfl8Rz/NpTRxDeJYxfiPCHsZRgIYzR4SbPU2r61Cjmc7e87Gr9+j0EPE6CX61heeeeo
 ivM7wOkNqB6UkUMkBkTTAdLmeRUoU0MpHQuJIuKz7sv46G8Rccdb5mSMcKJIlhBJddDl
 xgE9JXsR6Nluuevivrmlhgf7Jf3mTDi6V22Y5loP4NU+hiOj//EmXuY+pSePwlcLX9+l
 SdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wz/ee0QFf1zLzjYQvpsk8gV3BuqjIdVKipKwS9n+pgI=;
 b=1uGomTFbZ0fNvnLJeg3myGyX7yKnbwKlBfTeuGNeWYGe1WDRAVsDIAgSHqk9EZoC5Z
 6W08NISAw0nxTYlA2CnlXSVa9scRDFzr3S0aXrnSnANRHckrCEdQBR7Exe5UPGGGsBLH
 32nCYd2uHS4OFOipYLUBr8QnCRd6KDBVgkpKPJsEMYOLv/Je0yxl0z3Z8RWgdaD7TihV
 wzR1ndtRmNSyOKyGlrLcBXYVELg+U3aphUqSni779+vkbvD8p2+SS0GnSCh0vRimmpbV
 67deLU3ivePY8/uq9CZNB1PV3Eebhc/0Wbf3MK1q7FVulqGfzbCskB8Wp9l6nIzHDK2e
 JvZg==
X-Gm-Message-State: AOAM533A+ZwzXtJfGiRhCaw7OFFx+cJ3BMDAO1Ugxp5DoRQhk8fG1Bk3
 HJwYzp2YY/Ih1k+rIu9GWF8=
X-Google-Smtp-Source: ABdhPJxIyqhYmTBR0l+9XPy2tnEYfTVC1/MvoAGO+pHYpgzUgq3Mj/Ni+7Fhf6cjpKFVf5s6e3VmPA==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr5551333wrs.65.1633217751392;
 Sat, 02 Oct 2021 16:35:51 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:51 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/5] drm/bridge: tc358768: Disable non-continuous clock mode
Date: Sun,  3 Oct 2021 02:34:46 +0300
Message-Id: <20211002233447.1105-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Non-continuous clock mode doesn't work because driver doesn't support it
properly. The bridge driver programs wrong bitfields that are required by
the non-continuous mode (BTACNTRL1 register bitfields are swapped in the
code), but fixing them doesn't help.

Display panel of ASUS Transformer TF700T tablet supports non-continuous
mode and display doesn't work at all using that mode. There are no
device-trees that are actively using this DSI bridge in upstream yet,
so clearly the broken mode wasn't ever tested properly. It's a bit too
difficult to get LP mode working, hence let's disable the offending mode
for now and fall back to continuous mode.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 5b3f8723bd3d..cfceba5ef3b8 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -631,6 +631,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct tc358768_priv *priv = bridge_to_tc358768(bridge);
 	struct mipi_dsi_device *dsi_dev = priv->output.dev;
+	unsigned long mode_flags = dsi_dev->mode_flags;
 	u32 val, val2, lptxcnt, hact, data_type;
 	const struct drm_display_mode *mode;
 	u32 dsibclk_nsk, dsiclk_nsk, ui_nsk, phy_delay_nsk;
@@ -638,6 +639,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	const u32 internal_delay = 40;
 	int ret, i;
 
+	if (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
+		dev_warn_once(priv->dev, "Non-continuous mode unimplemented, falling back to continuous\n");
+		mode_flags &= ~MIPI_DSI_CLOCK_NON_CONTINUOUS;
+	}
+
 	tc358768_hw_enable(priv);
 
 	ret = tc358768_sw_reset(priv);
@@ -776,7 +782,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		val |= BIT(i + 1);
 	tc358768_write(priv, TC358768_HSTXVREGEN, val);
 
-	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
 
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
@@ -864,7 +870,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	if (!(dsi_dev->mode_flags & MIPI_DSI_MODE_LPM))
 		val |= TC358768_DSI_CONTROL_TXMD;
 
-	if (!(dsi_dev->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
+	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
 		val |= TC358768_DSI_CONTROL_HSCKMD;
 
 	if (dsi_dev->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
-- 
2.32.0


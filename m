Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288BD3F6CFA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD16E0F1;
	Wed, 25 Aug 2021 01:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70096E0F1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 01:12:00 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id 2so5823417pfo.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 18:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vQeoNCuCerpnBP7H1FyByrk1/uy3hnxn2GxZuaGAVn0=;
 b=i2ds57vw0tfKS2lnftd9ksYeJGlna28Rp7mnasVgkDjOo+xkPqcBhVwUbxgVzrxiIW
 4tIdskbo6X0YQ64/nf/T4BK6nD6q+ZXrmQaOGAyVfhIyMYa7glpYRXmhb5SAt/B1XRxX
 sJel4LeLMz6a++SI001x9YJZZIC7si6h8T/0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vQeoNCuCerpnBP7H1FyByrk1/uy3hnxn2GxZuaGAVn0=;
 b=mQd2/SBzQUv53NYSDhAe11qVeHtijfxcAD6ue++AsHZgAhiF5CPL3CdzWa52AYeyOm
 /9XU33z8H+/A7vHd2KuK99dZbVPzwEoscIge6ovG1+cpt7glk6yhAZNb3TY5Ii9RQaHs
 cHapf2zLHcY4Ez7BLthl3Xq1okrchzrezskUz+rvzzKjt07gJ90bHuqv04oeagReDZS2
 svfYJ6gB3VslIHp9SkDM4D6JXX/3ienUGBmHnv2tgrAUN6GfaLMJH9Fx39XVdg/CZZrw
 K6JuGpaXgaIvirS2ZL7w/io9/qshoZ6EM+By3apEogqpyblJTWT/eP2me9LKoFTfJFzH
 x5aw==
X-Gm-Message-State: AOAM533yNm+dah1nG99DIvhUvYffAM1le+T2q7iq2SKvn6ph9vgAMX94
 LUvhm4S0NI3FhYVEqYv2Ev94mA==
X-Google-Smtp-Source: ABdhPJzL3EjTKKK9ta6tNugAfJzRFccY8dETwDnnVW7G1rwkErthmVFGOhL5nvKBYQiibsyAdydX6g==
X-Received: by 2002:aa7:9254:0:b029:3c9:268e:ae68 with SMTP id
 20-20020aa792540000b02903c9268eae68mr41908494pfp.58.1629853920529; 
 Tue, 24 Aug 2021 18:12:00 -0700 (PDT)
Received: from philipchen.mtv.corp.google.com
 ([2620:15c:202:201:869c:3ae3:4c6a:b3d5])
 by smtp.gmail.com with ESMTPSA id y5sm23246567pgs.27.2021.08.24.18.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 18:12:00 -0700 (PDT)
From: Philip Chen <philipchen@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: swboyd@chromium.org, dianders@chromium.org,
 Philip Chen <philipchen@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: parade-ps8640: Reorg the macros
Date: Tue, 24 Aug 2021 18:11:55 -0700
Message-Id: <20210824181140.v2.1.I8ead7431357409f2526e5739ec5bc3ddfd242243@changeid>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
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

Reorg the macros as follows:
(1) Group the registers on the same page together.
(2) Group the register and its bit operation together while indenting
the macros of the bit operation with one space.

Also fix a misnomer for the number of mipi data lanes.

Signed-off-by: Philip Chen <philipchen@chromium.org>
---

Changes in v2:
- Fix the double sign-off lines

 drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 7bd0affa057a..685e9c38b2db 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -18,16 +18,18 @@
 #include <drm/drm_print.h>
 
 #define PAGE2_GPIO_H		0xa7
-#define PS_GPIO9		BIT(1)
+#define  PS_GPIO9		BIT(1)
 #define PAGE2_I2C_BYPASS	0xea
-#define I2C_BYPASS_EN		0xd0
+#define  I2C_BYPASS_EN		0xd0
 #define PAGE2_MCS_EN		0xf3
-#define MCS_EN			BIT(0)
+#define  MCS_EN			BIT(0)
+
 #define PAGE3_SET_ADD		0xfe
-#define VDO_CTL_ADD		0x13
-#define VDO_DIS			0x18
-#define VDO_EN			0x1c
-#define DP_NUM_LANES		4
+#define  VDO_CTL_ADD		0x13
+#define  VDO_DIS		0x18
+#define  VDO_EN			0x1c
+
+#define NUM_MIPI_LANES		4
 
 /*
  * PS8640 uses multiple addresses:
@@ -254,7 +256,7 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO |
 			  MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
 	dsi->format = MIPI_DSI_FMT_RGB888;
-	dsi->lanes = DP_NUM_LANES;
+	dsi->lanes = NUM_MIPI_LANES;
 	ret = mipi_dsi_attach(dsi);
 	if (ret)
 		goto err_dsi_attach;
-- 
2.33.0.rc2.250.ged5fa647cd-goog


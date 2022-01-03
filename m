Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7958483103
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778D510E26B;
	Mon,  3 Jan 2022 12:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3058510E26B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:29:57 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id b85so31095912qkc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0CxFujlh28c7CKjIEL2Qf4pbTqTcdELNP8dgbFoyKTU=;
 b=j460XRO1VwFhPFWeLwJY7zhQ/84UA+ZeDyqmxco+c1eEkIPyWsC5vAIMeA0ipt3dIY
 3Wi14OxZeDb3wR0iDQJQ3WFzVFOiLl4uEFncZraSR0IrDQiIAcEm6Hw4MoUPqw4QbmFu
 DtOPyewYxk1+DOn+4ge9IZA/4mqPIEo3aRAVHaA8dwx5pC8oaBRxs0ZP40knCLCxJkOt
 GW58T7TmKEuxMpGKfV808rlCEi7tZ9bnZFQZoYLHoiwVNcsjc+XRmk4NnnFRnKRVFIyj
 NSS5KJX1FL7Buwz8RgVOSbg/49Gew6f3Jj38hnxLK01ejyJDwUpU7wpgnNdKmQFtwkef
 LnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0CxFujlh28c7CKjIEL2Qf4pbTqTcdELNP8dgbFoyKTU=;
 b=ugPTCUZt05Oxc/hIIPFYPRKdtOSjoTzmgdJ5xMkR31q8L8/W+FGkmBq7ADkMHQOltj
 pCQ4cNuIACkpJ1pG2t0AZrgMS/Oh0gbL6zpYl09UE3ZXQcFPTGrfDwy1H9bMf4mTf55u
 q8i4+nafM2eJUj96eCeKvx/ahdA1w01GpcY2/AhyhJrquf9nuMag1HOcLj2JA5qyyD/N
 z/mcX7vnDpTdrJydzTA2UsmbMQeUPK9EdANGa0fMFtR7bReHU6vaCgTCeEe/a9qBh0yh
 7E/GHvaonqEXz13SrHY9fMmym5bFjkk9nuCGGD1pMDJfZpQ0WAf7/wsIKw5hL66xrEyi
 iskQ==
X-Gm-Message-State: AOAM53006u4bpz07uKbS0nn437KiSQKAQ8eNOHl/lustlXRHyhPuyRbC
 z3VTpuTES7Fg+rqiDXHoMLs=
X-Google-Smtp-Source: ABdhPJy7vWNk3riOslCCsbwkq+9jk+3z6dwC4hyhzK357zja5ALtcsg/dPTn0jZ0VSex3g10qsJz2g==
X-Received: by 2002:a05:620a:298a:: with SMTP id
 r10mr31687939qkp.381.1641212996276; 
 Mon, 03 Jan 2022 04:29:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:9fae:13de:8196:cc8c])
 by smtp.gmail.com with ESMTPSA id
 h3sm28364424qko.78.2022.01.03.04.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 04:29:55 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux@armlinux.org.uk
Subject: [PATCH v2 1/2] drm/i2c/tda998x: Switch to atomic operations
Date: Mon,  3 Jan 2022 09:29:40 -0300
Message-Id: <20220103122941.371578-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: marex@denx.de, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com, tomm.merciai@gmail.com,
 pbrobinson@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the atomic version of the enable/disable operations to continue the
transition to the atomic API, started with the introduction of
.atomic_get_input_bus_fmts(). This will be needed to access the mode
from the atomic state.

Based on Laurent's commit a6ea7d268a63("drm: bridge: ti-sn65dsi83:
Switch to atomic operations").

Tested on a imx6sx-udoo-neo board.

Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Move .atomic_duplicate_state,.atomic_destroy_state .atomic_reset from
patch 2/2 to 1/2. (Laurent)

 drivers/gpu/drm/i2c/tda998x_drv.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index b7ec6c374fbd..45d52b8a4026 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1395,7 +1395,8 @@ static enum drm_mode_status tda998x_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void tda998x_bridge_enable(struct drm_bridge *bridge)
+static void tda998x_bridge_atomic_enable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
@@ -1413,7 +1414,8 @@ static void tda998x_bridge_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void tda998x_bridge_disable(struct drm_bridge *bridge)
+static void tda998x_bridge_atomic_disable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct tda998x_priv *priv = bridge_to_tda998x_priv(bridge);
 
@@ -1680,9 +1682,12 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
 	.mode_valid = tda998x_bridge_mode_valid,
-	.disable = tda998x_bridge_disable,
+	.atomic_disable = tda998x_bridge_atomic_disable,
 	.mode_set = tda998x_bridge_mode_set,
-	.enable = tda998x_bridge_enable,
+	.atomic_enable = tda998x_bridge_atomic_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 /* I2C driver functions */
-- 
2.25.1


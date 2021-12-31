Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804F48214B
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 02:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5612510E188;
	Fri, 31 Dec 2021 01:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92E610E188
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 01:39:41 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id u1so14301340vkn.10
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 17:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA3/Zv81Gg1tMXhdtY74A6kQWlZXIaDfxv6gG1YrSw4=;
 b=lXTs9iiaSOIfN4pTwFlRRta3qZkoyaZT7jRVFolTZ0LQhZjxjeIcSYw6W1hO2EOTOh
 qbmGNCtAzGbvsf1tDmq58krSBTHew+77qweiuUJUF2THh4HcxYELr5EEMN8pQlUMjW84
 +zUZ5bijGu6ofaJm598Y+BVqsNNBznodVc9H6RjoYEagVLvSqK5hAzcEMLDkVFmDw6+j
 1Q//c7XejvdQpRP2WZUekQTkVQZIMCuaAxASk/DxwSQKeUH/ODQAxR7pSsg9imE0+rnK
 0HimxSWUt54fBTanbZK8fr28Qvz0EtxfplXZcOQA4HRLrp7ufLb/q+k+81+EgiV3GQMT
 w/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NA3/Zv81Gg1tMXhdtY74A6kQWlZXIaDfxv6gG1YrSw4=;
 b=MF968LUbb08QdyNe0VNtcWW/ANIJSAywGciB5c07sPlpLFpxOLL+C/mv3v0fO3QBnC
 9JRCaBgdC6H1ykigXgYwixvpn2PEmXC+ipYYFXGy+8V87+ehe19dlyVMcK7vfJCU2yir
 +wSOo6ElVvrDj2Rx0x7MquWyVbtW6MjYAvfnNRKG79Npai68Cw3QQIRvvi9EjXWL6JBz
 cJ3qZ1NgKcFfsxu/Df9PAWUP7IRBHw6De/JICEL/qUNFtKMq76eQwW4MA5nogROgsGxR
 eNRGdbN7ix5022+o29qcqiHT1lwYGfastw1POpar62h48UKhGuZs/MzOIv8tZ90/GgnL
 AwBA==
X-Gm-Message-State: AOAM533BMZrAZq6RvMTNA3jY1G34kQn23Z2Qk09g9uFbHXy0jNhFttrS
 TTqKXD1Epo5gbfm6XBy1Ui8=
X-Google-Smtp-Source: ABdhPJx0DiuquTutl3ThrWnSdRn99Z2ksUAfyxFUKsLAjB0vKEy4QlpRQeE0p37KwdZFLHPgzCGWSw==
X-Received: by 2002:a1f:a4ca:: with SMTP id n193mr10994533vke.29.1640914780920; 
 Thu, 30 Dec 2021 17:39:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:d549:ed49:6dac:47ee])
 by smtp.gmail.com with ESMTPSA id
 t20sm3754993vsj.11.2021.12.30.17.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 17:39:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux@armlinux.org.uk
Subject: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
Date: Thu, 30 Dec 2021 22:39:29 -0300
Message-Id: <20211231013930.139754-1-festevam@gmail.com>
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
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index b7ec6c374fbd..adaa985af87e 100644
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
 
@@ -1680,9 +1682,9 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
 	.mode_valid = tda998x_bridge_mode_valid,
-	.disable = tda998x_bridge_disable,
+	.atomic_disable = tda998x_bridge_atomic_disable,
 	.mode_set = tda998x_bridge_mode_set,
-	.enable = tda998x_bridge_enable,
+	.atomic_enable = tda998x_bridge_atomic_enable,
 };
 
 /* I2C driver functions */
-- 
2.25.1


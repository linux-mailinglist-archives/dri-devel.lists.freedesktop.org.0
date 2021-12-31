Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 413EA48214C
	for <lists+dri-devel@lfdr.de>; Fri, 31 Dec 2021 02:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28D110E507;
	Fri, 31 Dec 2021 01:39:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5D610E507
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Dec 2021 01:39:44 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id u198so14570616vkb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 17:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OT9Xu/jnBb8H1U17d0/7iXcChZ/+dLJThXHPYF1IBv4=;
 b=ldcBoKa/nSPNkYtkxDEQw1R7JQuXE5xQHwX4JbE1W+zCW4RPXnI0lVDBQPvbX+POvc
 jiRag6fv0JVdBK4nNlweJVnuvEO1tVd9MctznKgPok8lA7PHf/2lPab/2MzHwECdAVtk
 vd137kiD/Sj9eQu4PxnO5R08srk9ymQtGcfobScrLDZwAhhpkxkt6a+DHayDYQtrcwhS
 pHV8p3q+rN5jroaeYIDpL0DXqRmaTJvwRo3LcsllU8XwdvnQBP6WL6Dubq7omDMC7wuo
 c369oznCBpnobwiAb29p+C4uAlzdq0knzTHn/21tb9HURT99tbcEz3DhDwBb6yoBDjpD
 Ag3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OT9Xu/jnBb8H1U17d0/7iXcChZ/+dLJThXHPYF1IBv4=;
 b=HsrfoOSnH97/JStUgQ7eKuYnNyqLq3vX+YTHVRy5hyr4BYU9o9Hv0EAqVP8ZcyJD+6
 itOaH1QMM8Ys97zutwgVFzvNiqlq9MgMLBS1HLSWzwboS19TYUu6gWfriahxsndzcvwr
 49gh+kGL9O/EGn/g5LMR+jwa9u/csNZQy9yjVnJSanGS2LFL01xmf/M0jUHfzcqSBo86
 S0TonuyKBcwbDlMj4g98xvpuVjYPU2jucYmHniHYxRduTLucwLfhCb7GII8KTBi9wmJV
 MUlcdxa54BbRjNR85utKiBil8HAYzU2wdxNfYuDvsUmc5rsjLDyJcHPSkvMf7u36hTWU
 +kTA==
X-Gm-Message-State: AOAM533ts5E9MJWPkJ42G1ZrO1LboKyqOpbbbGUzSeWUkZHnKziKxA3f
 BvhmjEJLf5Xbyc2jWU9ekq0=
X-Google-Smtp-Source: ABdhPJxCRthv8kjYM/PiFOfF0UMUkC0mSew1nncvGPv4zP3jfakjH9f/e1ldlr2CgZ2+jRaD+kxLyQ==
X-Received: by 2002:a05:6122:2001:: with SMTP id
 l1mr11507628vkd.16.1640914783792; 
 Thu, 30 Dec 2021 17:39:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:d549:ed49:6dac:47ee])
 by smtp.gmail.com with ESMTPSA id
 t20sm3754993vsj.11.2021.12.30.17.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 17:39:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: linux@armlinux.org.uk
Subject: [PATCH 2/2] drm/i2c/tda998x: Implement atomic_get_input_bus_fmts
Date: Thu, 30 Dec 2021 22:39:30 -0300
Message-Id: <20211231013930.139754-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211231013930.139754-1-festevam@gmail.com>
References: <20211231013930.139754-1-festevam@gmail.com>
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

Implement the .atomic_get_input_bus_fmts callback to let the bridge
indicate the pixel format it requires on the parallel bus to the LCDIF.

Based on Marek's commit db8b7ca5b232 ("drm/bridge: ti-sn65dsi83: Replace
connector format patching with atomic_get_input_bus_fmts").

Tested on a imx6sx-udoo-neo board.

Suggested-by: Marek Vasut <marex@denx.de>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/gpu/drm/i2c/tda998x_drv.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index adaa985af87e..d987481e97c1 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -1678,6 +1678,31 @@ static void tda998x_bridge_mode_set(struct drm_bridge *bridge,
 	mutex_unlock(&priv->audio_mutex);
 }
 
+#define MAX_INPUT_SEL_FORMATS  1
+
+static u32 *
+tda998x_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				   struct drm_bridge_state *bridge_state,
+				   struct drm_crtc_state *crtc_state,
+				   struct drm_connector_state *conn_state,
+				   u32 output_fmt,
+				   unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.attach = tda998x_bridge_attach,
 	.detach = tda998x_bridge_detach,
@@ -1685,6 +1710,10 @@ static const struct drm_bridge_funcs tda998x_bridge_funcs = {
 	.atomic_disable = tda998x_bridge_atomic_disable,
 	.mode_set = tda998x_bridge_mode_set,
 	.atomic_enable = tda998x_bridge_atomic_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts = tda998x_atomic_get_input_bus_fmts,
 };
 
 /* I2C driver functions */
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF6AF91E1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 13:53:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7EA010E07B;
	Fri,  4 Jul 2025 11:53:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GYQZWvnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAAC10E07B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751629981;
 bh=su1yYo+d3aL4MP7MFtVZnoayOFX9zNGZfH0IWJywWbk=;
 h=From:Date:Subject:To:Cc:From;
 b=GYQZWvnM5P23pCFUP4/3R64qkKvJtymb7wnz4xILvO77a2ASb3JjdYLVjtYz0MC1s
 2DdpxNG1143I+fNixeItbGyVe+0zizAcjuimPaCB9kCJT91FveIaetanV4oTRdmYw+
 ekqaoMNUObuYR8VBK5EQLsk/Bbp6n6P3g4XHdrcW2CM/uAM455e0Kq0hfG0VPRXs9P
 lkfwAYYf+vB+6zVklDlVKveo4fBZwCpRO8nFE44g5iHtYXdppFdAPWZo0ZlARl713o
 Kg9ucBKeUBhGfkIQapgGUyoozamhvMRGdLFOHLbYw9+g1lx5u8xm6CVjXMQAddFXvu
 ChXJfoTU4Jvgg==
Received: from localhost (unknown [212.93.144.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 7B8B117E090E;
 Fri,  4 Jul 2025 13:53:01 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 04 Jul 2025 14:52:54 +0300
Subject: [PATCH] drm/bridge: adv7511: Fix
 DRM_BRIDGE_OP_HDMI_{AUDIO|CEC_ADAPTER} setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-adv7511-bridge-ops-fix-v1-1-c1385922066e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAJXAZ2gC/x2MQQqAIBBFryKzbkBNsbpKtCidajYlChFEd29o+
 f7jvwcqFaYKg3qg0MWVz0PANAriPh8bISdhsNp6HbTDOV3BG4NL4ST2zBVXvrGLbW+is45sB3L
 OhWT+w+P0vh81L1MnaAAAAA==
X-Change-ID: 20250704-adv7511-bridge-ops-fix-8c391c424e28
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
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

When driver is built with either CONFIG_DRM_I2C_ADV7511_AUDIO or
CONFIG_DRM_I2C_ADV7511_CEC disabled, drm_bridge_connector_init() is
expected to fail with -EINVAL.  That is because all required audio (or
CEC) related callbacks in adv7511_bridge_funcs ended up being NULL.

Set DRM_BRIDGE_OP_HDMI_AUDIO and DRM_BRIDGE_OP_HDMI_CEC_ADAPTER bridge
ops only when the aforementioned kernel config options have been
enabled.

Fixes: ae01d3183d27 ("drm/bridge: adv7511: switch to the HDMI connector helpers")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 9df18a8f2e37ee53e5793700955404c34a1e01aa..f59d19b4b81a81de9604da13cd00ba9280972205 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1262,9 +1262,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 
 	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID |
-		DRM_BRIDGE_OP_HDMI |
-		DRM_BRIDGE_OP_HDMI_AUDIO |
-		DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
+		DRM_BRIDGE_OP_HDMI;
 	if (adv7511->i2c_main->irq)
 		adv7511->bridge.ops |= DRM_BRIDGE_OP_HPD;
 
@@ -1272,6 +1270,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 	adv7511->bridge.product = adv7511->info->name;
 
 #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
+	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_AUDIO;
 	adv7511->bridge.hdmi_audio_dev = dev;
 	adv7511->bridge.hdmi_audio_max_i2s_playback_channels = 2;
 	adv7511->bridge.hdmi_audio_i2s_formats = (SNDRV_PCM_FMTBIT_S16_LE |
@@ -1284,6 +1283,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 #endif
 
 #ifdef CONFIG_DRM_I2C_ADV7511_CEC
+	adv7511->bridge.ops |= DRM_BRIDGE_OP_HDMI_CEC_ADAPTER;
 	adv7511->bridge.hdmi_cec_dev = dev;
 	adv7511->bridge.hdmi_cec_adapter_name = dev_name(dev);
 	adv7511->bridge.hdmi_cec_available_las = ADV7511_MAX_ADDRS;

---
base-commit: 86c947b363f003153768d879ee15f8358cbf29c5
change-id: 20250704-adv7511-bridge-ops-fix-8c391c424e28


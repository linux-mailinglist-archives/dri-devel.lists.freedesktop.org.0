Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A0C2DF6E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 21:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1086F10E224;
	Mon,  3 Nov 2025 20:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Q2vteOr/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MJegUCeu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576910E224
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 20:03:25 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d0jFS1cGNz9stX;
 Mon,  3 Nov 2025 21:03:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762200204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrjUyrfTRhi5Iu9e4CkRP+k8MoshUCQjKNp114FeCjI=;
 b=Q2vteOr/czT7mMh7W8slR7W8knJiiMTSmvQOUFMcRiLn3M+7MPx8SuJ4r2GMOuWTp8pdhY
 Sr/S2LcFd20REnIDP0WAUXZW9Hb2p6v8N+dTGnjjI69E06dO0rHAJVJZ3ObVSj7wGRAUaQ
 R1SBdkXkSrYJOmwWVZFDibH1I45NULVMuWsBU5NLsUWiGsbwCH+09iM+p+G8Wbhhdvcvxy
 9bIi50zxGBWa/Fjjg6FGuIa1FsjAZ7jSnLXih6vYh9V00Xen4o1d8zIiKluCbItrb0QVwk
 v3KqMbCugvSBO1NuQle+94DF+ZpkVqG2y2IAeZOaNG2N34wayqadsHGJoq8n+g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762200202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=vrjUyrfTRhi5Iu9e4CkRP+k8MoshUCQjKNp114FeCjI=;
 b=MJegUCeunOH9BaOx5mrFfIcqdDx0/UI+wZ0ebhtqhmxoLALuaZcWj2coG/4JNpAXsdQ22q
 a9Xyx+Eo2bqRxMes9xaJVn18bU4kPRQLY8RxEBWiNg9dN3Fk2SwVA4Mn3KjNWu2w1mqhIF
 slAD62E/CILQHysdr3kzPfSGbsHEn9Mq0m1Xg//ERKj6RizSlpYnsRnAS1WxaTwfhjxUwZ
 ggKINS8NFlQnJOAdWzSciaCsJVd5LGLM7kbxq8/0CYLTeiBkKGS4nPI/A/v/RlTl/IF+4w
 +mD17XCaKtewDRHBOeZOka91+1eiiK5hj7lx/adPJ6ht29/iBjiqRfZ1F9QRNA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/display: bridge_connector: Assign
 bridge_connector->bridge_hdmi_cec before drmm_connector_hdmi_cec_register()
Date: Mon,  3 Nov 2025 21:02:54 +0100
Message-ID: <20251103200316.172531-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5y4kg1edw4i4dxf8ih5fsnb5d48jkaiz
X-MBO-RS-ID: 942780d85c2a4d9cee3
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

Set valid bridge_connector->bridge_hdmi_cec pointer before calling
possibly calling drmm_connector_hdmi_cec_register(), because
drmm_connector_hdmi_cec_register() directory calls
drm_bridge_connector_hdmi_cec_funcs .init callback,
which does access and use bridge_connector->bridge_hdmi_cec
and expects a valid pointer there.

Without this fix, on Renesas R-Car E3 R8A77990 , the system
crashes on NULL pointer dereference.

Fixes: 2be300f9a0b6 ("drm/display: bridge_connector: get/put the stored bridges")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7b18be3ff9a3..6b9d9694d959 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -855,14 +855,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		ret = drmm_connector_hdmi_cec_notifier_register(connector,
 								NULL,
 								bridge->hdmi_cec_dev);
 		if (ret)
 			return ERR_PTR(ret);
 	}
 
+	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
+
 	if (bridge_hdmi_cec &&
 	    bridge_hdmi_cec->ops & DRM_BRIDGE_OP_HDMI_CEC_ADAPTER) {
 		struct drm_bridge *bridge = bridge_hdmi_cec;
 
 		ret = drmm_connector_hdmi_cec_register(connector,
 						       &drm_bridge_connector_hdmi_cec_funcs,
 						       bridge->hdmi_cec_adapter_name,
@@ -890,12 +892,11 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	bridge_connector->bridge_edid       = drm_bridge_get(bridge_edid);
 	bridge_connector->bridge_hpd        = drm_bridge_get(bridge_hpd);
 	bridge_connector->bridge_detect     = drm_bridge_get(bridge_detect);
 	bridge_connector->bridge_modes      = drm_bridge_get(bridge_modes);
 	bridge_connector->bridge_hdmi       = drm_bridge_get(bridge_hdmi);
 	bridge_connector->bridge_hdmi_audio = drm_bridge_get(bridge_hdmi_audio);
 	bridge_connector->bridge_dp_audio   = drm_bridge_get(bridge_dp_audio);
-	bridge_connector->bridge_hdmi_cec   = drm_bridge_get(bridge_hdmi_cec);
 
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
-- 
2.51.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EA0AC3D11
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 11:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F6810E2CA;
	Mon, 26 May 2025 09:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="IKLDvxEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.74.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F1110E2CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1748252350;
 bh=Hk4LQge5dZN0PKJMnUNEwLr8KrYB0N4+j6gEFlg+Ep0=;
 h=From:To:Subject:Date:Message-Id;
 b=IKLDvxEvg+vDFMZYtrST0hkf59tURDMUhiMLt95MU+6aqwx9cKcrrF14+7wcV119l
 IneuxIaqIX8bibAoAAnsSrrI8CECfxF3m+7xBqE8U6x5O0Gj3sLFiRFjj5shMdDAiM
 sj+6STmKdB+FsJmSZPGHtD1543Fukelfl0/CqGcM=
X-QQ-mid: esmtpgz14t1748252348teb365f02
X-QQ-Originating-IP: yzT5xFtzjg3BpXAt1VENHE/RF5xaEqf0KDYL8emxbHc=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 26 May 2025 17:39:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17899155140509127111
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH] drm/bridge-connector: Fix bridge in
 drm_connector_hdmi_audio_init()
Date: Mon, 26 May 2025 17:38:27 +0800
Message-Id: <20250526093827.202-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MlQiyfGa8H9NF28VZTfoIrw9xK91dFQtI5g5XT9cHVDVUSGi/xDuMZds
 TB4F0Q94+xzclxU2Jm9/lf2cwcktpKPv97qS/KtyC4+H/l/f2+AoeQWelRFAZXI7O6ZnarN
 lJtxZ+2A0O+Ilts9rNSSJxVmj2NJ3cUObHEgoIVRNm26rcujPcQltj2EnrQ0mh3ORhoABNN
 52RfCzS0iDopBqOpPD9JHvEqbKMTwvL1uRYKFPZHCHbZKCiEjcOipMXEmHE+OkM98x4BvOq
 MwY/D1xsuZc8nGLczLrpPu6CrQFVGTZDYeoPml/SsfsGwHkBAt/jTIDOkkOxs0N2iQ0xPJj
 Zs88GqW4a7Z1fJVFnVNzV+Eu7RPAcb6Gko5osWDwb6x4cIDMBGGF4gwlr6CcauBIRY7p81S
 bQ6KPyFEUAgs9Fz0GvgCRGElQYSIBjNJfug5yvJ7ctesBd/b20NZELW00O9OjGXQv61UIAQ
 98tA4Huh1Cz7mw2S/hwPqJmEUnzKLwk6LWRb21NsvdmjhnKoSZYArNP8MQPB1j6CNXT58vM
 0PQY0X6Q24/iIaG34RuS38GwGWvCOg7KwP/xLYOLjKad6iMRUKRBvvr1uulKG7DzF472Xlf
 vHfkiAQC1+Yg/J5YgM2mKnfrAqYYZSdiWW8UNPb5cX2N7SHvS4CDMlwMNTrTM5a5Ryb3tc2
 4K3gHmnlyn/1f6urrNyNogOgI219WNqpgaZC5tJ7AWCa6NhkguTDEJbokXRoiJZPph7B+Re
 ztUnrGEjYnJc9QIBEo9KkobA0W0zXuZUc/FDKv+f37uG1+dOPuBdRXInu+2PNhTNKVMjDPp
 oKuMRL5wOTtsWRkniJoL8x/d88CtzP53b9GqEn5TsL8UlM8H9e2Bcw5nQf+U45MPAjAHnJq
 3f5/2HA3T0pgSPFbpamarYVhTQ/rNpBKHfCezsf97xaYDdKP/swjTVqF5BwYAwyJ/cv82rY
 x/8Dwheyuo33FkKwewAmuK2AaX+HmbbART8o=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The bridge used in drm_connector_hdmi_audio_init() does not correctly
point to the required audio bridge, which lead to incorrect audio
configuration input.

Fixes: 231adeda9f67 ("drm/bridge-connector: hook DisplayPort audio support")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 7d2e499ea5de..262e93e07a28 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -708,11 +708,14 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	if (bridge_connector->bridge_hdmi_audio ||
 	    bridge_connector->bridge_dp_audio) {
 		struct device *dev;
+		struct drm_bridge *bridge;
 
 		if (bridge_connector->bridge_hdmi_audio)
-			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_hdmi_audio;
 		else
-			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
+			bridge = bridge_connector->bridge_dp_audio;
+
+		dev = bridge->hdmi_audio_dev;
 
 		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
-- 
2.49.0


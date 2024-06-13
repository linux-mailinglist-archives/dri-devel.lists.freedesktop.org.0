Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6409906712
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 10:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDB310E990;
	Thu, 13 Jun 2024 08:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="KTAYPLxW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F9D10E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 08:38:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45D8c9oS013085;
 Thu, 13 Jun 2024 03:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718267889;
 bh=rnfhvDvJw5BDb0tI21qEyro5d0f4cvwu1uctUDeRUpc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=KTAYPLxWLKkYWkwONUUxW3pMU9WhDSsscu7nOS6HFs5iZ/o1CudEngNXvmMiZ5QsI
 XbagrNcU+LQhsTMQ0sFEn4iFW5n7rZ2Gbw+3515qhWbQNWVV12Jj4c+N5Hr4fdzZQV
 sPCTx7amKyAAFrqQg8TBIP1Xcy6TbTtv1eqYEfQs=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45D8c99d094221
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 13 Jun 2024 03:38:09 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Jun 2024 03:38:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Jun 2024 03:38:09 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.55])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45D8c8hb079355;
 Thu, 13 Jun 2024 03:38:09 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <dmitry.baryshkov@linaro.org>,
 <sui.jingfeng@linux.dev>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <sam@ravnborg.org>, <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 2/3] drm/bridge: sii902x: Support atomic bridge APIs
Date: Thu, 13 Jun 2024 14:08:04 +0530
Message-ID: <20240613083805.439337-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613083805.439337-1-j-choudhary@ti.com>
References: <20240613083805.439337-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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

Change exisitig enable() and disable() bridge hooks to their atomic
counterparts as the former hooks are deprecated.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 6a6055a4ccf9..00a8c469f553 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -322,7 +322,8 @@ static const struct drm_connector_helper_funcs sii902x_connector_helper_funcs =
 	.get_modes = sii902x_get_modes,
 };
 
-static void sii902x_bridge_disable(struct drm_bridge *bridge)
+static void sii902x_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_bridge_state)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
@@ -335,7 +336,8 @@ static void sii902x_bridge_disable(struct drm_bridge *bridge)
 	mutex_unlock(&sii902x->mutex);
 }
 
-static void sii902x_bridge_enable(struct drm_bridge *bridge)
+static void sii902x_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
 {
 	struct sii902x *sii902x = bridge_to_sii902x(bridge);
 
@@ -520,8 +522,8 @@ sii902x_bridge_mode_valid(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs sii902x_bridge_funcs = {
 	.attach = sii902x_bridge_attach,
 	.mode_set = sii902x_bridge_mode_set,
-	.disable = sii902x_bridge_disable,
-	.enable = sii902x_bridge_enable,
+	.atomic_disable = sii902x_bridge_atomic_disable,
+	.atomic_enable = sii902x_bridge_atomic_enable,
 	.detect = sii902x_bridge_detect,
 	.edid_read = sii902x_bridge_edid_read,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-- 
2.25.1


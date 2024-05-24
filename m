Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EE8CE393
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2024 11:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA5410E258;
	Fri, 24 May 2024 09:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="gX6P6YzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28710E258
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2024 09:35:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44O9ZE0n082222;
 Fri, 24 May 2024 04:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1716543314;
 bh=yNHllYLZp8VUFajO1ZSbz4JR76BCSglDPm2k6Bn2KIA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gX6P6YzFTFejJpJKeYuvr0RfqeRPqqIj8R2Vs7J/xpACKm9Z/W6G5lVRXqZ3nXTkD
 1mVF/8hmK0orpiprTF7g8ak5RlOGBCtkNmlnYeud1qgo+SF4F6y7l4h8tyUAqkR+G5
 oXduSJdUZdjMcvLK179ueoN2ipOWV69LgtWFoVB4=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44O9ZExV023870
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 24 May 2024 04:35:14 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 04:35:14 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 04:35:14 -0500
Received: from localhost (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com
 [172.24.227.102] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44O9ZDcO040590;
 Fri, 24 May 2024 04:35:14 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <linux-kernel@vger.kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <sam@ravnborg.org>,
 <mripard@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <j-choudhary@ti.com>
CC: <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <a-bhatia1@ti.com>
Subject: [PATCH v3 2/2] drm/bridge: Add pixel clock check in atomic_check
Date: Fri, 24 May 2024 15:05:09 +0530
Message-ID: <20240524093509.127189-3-j-choudhary@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240524093509.127189-1-j-choudhary@ti.com>
References: <20240524093509.127189-1-j-choudhary@ti.com>
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

Check the pixel clock for the mode in atomic_check and ensure that
it is within the range supported by the bridge.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/bridge/sii902x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index bae551e107f9..a5b7ee1e3bbe 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -517,6 +517,12 @@ static int sii902x_bridge_atomic_check(struct drm_bridge *bridge,
 				       struct drm_crtc_state *crtc_state,
 				       struct drm_connector_state *conn_state)
 {
+	if (crtc_state->mode.clock < SII902X_MIN_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_LOW;
+
+	if (crtc_state->mode.clock > SII902X_MAX_PIXEL_CLOCK_KHZ)
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * There might be flags negotiation supported in future but
 	 * set the bus flags in atomic_check statically for now.
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFEB67B17C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 12:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623AE10E796;
	Wed, 25 Jan 2023 11:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5858810E796
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 11:35:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZia4120986;
 Wed, 25 Jan 2023 05:35:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1674646544;
 bh=YNw16xWGpsD/uXggMokkTEYED+EdmUza/46l2QtEBuE=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=k6KWqtkUR+mL9LJd4SJ3ZjdgV6+2P5hw9d8Ro5jREh0ZrLIIzB981gI1/lUb57dD7
 BMj5UpYFTEbeGdjxqHyw7b86rFF9z1GBoxNBSt+ngimRK8QvzwhJUIZLMc2xd3oHHF
 fccgYoQt8rfHlL+/zEUyrWWp76rv99n4B4WjB9Ao=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30PBZixI013337
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 25 Jan 2023 05:35:44 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 25
 Jan 2023 05:35:43 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 25 Jan 2023 05:35:43 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30PBZght021900;
 Wed, 25 Jan 2023 05:35:43 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v7 6/6] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Date: Wed, 25 Jan 2023 17:05:29 +0530
Message-ID: <20230125113529.13952-7-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125113529.13952-1-a-bhatia1@ti.com>
References: <20230125113529.13952-1-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AM625 DSS IP contains 2 OLDI TXes which can work together to enable 2
cloned displays of or even a single dual-link display with higher
resolutions like WUXGA (1920x1200@60fps) with a reduced OLDI clock
frequency.

Configure the necessary register to enable and disable the OLDI TXes
with required modes configurations.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 0e03557bc142..79ad9743a93b 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1020,8 +1020,8 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 	int count = 0;
 
 	/*
-	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
-	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
+	 * For the moment MASTERSLAVE, and SRC bits of DISPC_VP_DSS_OLDI_CFG are
+	 * always set to 0.
 	 */
 
 	if (fmt->data_width == 24)
@@ -1038,6 +1038,26 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 
+	switch (dispc->oldi_mode) {
+	case OLDI_MODE_SINGLE_LINK:
+		/* All configuration is done for this mode.  */
+		break;
+
+	case OLDI_MODE_CLONE_SINGLE_LINK:
+		oldi_cfg |= BIT(5); /* CLONE MODE */
+		break;
+
+	case OLDI_MODE_DUAL_LINK:
+		oldi_cfg |= BIT(11); /* DUALMODESYNC */
+		oldi_cfg |= BIT(3); /* data-mapping field also indicates dual-link mode */
+		break;
+
+	default:
+		dev_warn(dispc->dev, "%s: Incorrect oldi mode. Returning.\n",
+			 __func__);
+		return;
+	}
+
 	dispc_vp_write(dispc, hw_videoport, DISPC_VP_DSS_OLDI_CFG, oldi_cfg);
 
 	while (!(oldi_reset_bit & dispc_read(dispc, DSS_SYSSTATUS)) &&
-- 
2.39.0


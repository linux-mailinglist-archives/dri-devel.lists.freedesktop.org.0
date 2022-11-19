Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55546630FD2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Nov 2022 18:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C7B10E272;
	Sat, 19 Nov 2022 17:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178D910E265
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Nov 2022 17:30:52 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUTve061516;
 Sat, 19 Nov 2022 11:30:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668879029;
 bh=vVyXYYrGImgHeS2T8n3G25Um5AWctifrL3oyuh/mSDc=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=GJ+wrrwetsff4R+KTE0HJL2jdG7gnA0nVglka44gRUv7X7F6/DdACyOTHLs+zHTtQ
 C6TO1Z+QcXFEEenLLbTuwywpv8v7YYJvx+iszoXQT3HROcQri4+aWUTCR1bbbC53XT
 hbOXnYbQjWhJx/oEWri+IrwMAKXv+QOHA5B4RawU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AJHUSXg011392
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sat, 19 Nov 2022 11:30:29 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 19
 Nov 2022 11:30:28 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 19 Nov 2022 11:30:28 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AJHUROB055715;
 Sat, 19 Nov 2022 11:30:28 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 5/5] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Date: Sat, 19 Nov 2022 23:00:19 +0530
Message-ID: <20221119173019.15643-6-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119173019.15643-1-a-bhatia1@ti.com>
References: <20221119173019.15643-1-a-bhatia1@ti.com>
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
 Jayesh Choudhary <j-choudhary@ti.com>, Rahul T R <r-ravikumar@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>,
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
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index f26129fb1d8f..cf43de6216a5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1012,8 +1012,8 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 	int count = 0;
 
 	/*
-	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
-	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
+	 * For the moment MASTERSLAVE, and SRC bits of DISPC_VP_DSS_OLDI_CFG are
+	 * always set to 0.
 	 */
 
 	if (fmt->data_width == 24)
@@ -1030,6 +1030,26 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 
+	switch (dispc->oldi_mode) {
+	case OLDI_SINGLE_LINK_SINGLE_MODE:
+		/* All configuration is done for this mode.  */
+		break;
+
+	case OLDI_SINGLE_LINK_CLONE_MODE:
+		oldi_cfg |= BIT(5); /* CLONE MODE */
+		break;
+
+	case OLDI_DUAL_LINK_MODE:
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
2.38.1


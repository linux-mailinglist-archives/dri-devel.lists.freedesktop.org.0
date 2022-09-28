Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DEC5EE3DA
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 20:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743BC10E540;
	Wed, 28 Sep 2022 18:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D55610E513
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 18:05:29 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqYX9068372;
 Wed, 28 Sep 2022 12:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664387554;
 bh=eBU6RB63V1iL2ffIaDQ+QSfpco5r9bcxX8wHzYv9+tw=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=uKivbSj87E91akrHwPWYTdWqiuIZ+ZRgkX3n519bI128fxAZWlkNVun7oG8AIzXCZ
 tRtVLE3+SB328hu504VRbg09u2MGIsUKxM2PGzykj/bap4ttcVoArDzMFDxZPyITfw
 GbpJLDnoB/4wDfdnEIGiNNVfA6ZDHh/+X4gEZlBc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28SHqXqG115197
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 28 Sep 2022 12:52:33 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 28
 Sep 2022 12:52:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 28 Sep 2022 12:52:33 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28SHqWQA001317;
 Wed, 28 Sep 2022 12:52:33 -0500
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>, Rob
 Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [RFC PATCH v5 6/6] drm/tidss: Enable Dual and Duplicate Modes for OLDI
Date: Wed, 28 Sep 2022 23:22:23 +0530
Message-ID: <20220928175223.15225-7-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220928175223.15225-1-a-bhatia1@ti.com>
References: <20220928175223.15225-1-a-bhatia1@ti.com>
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The AM625 DSS IP contains 2 OLDI TXes which can work to enable 2
duplicated displays of smaller resolutions or enable a single Dual Link
display with a higher resolution (1920x1200).

Configure the necessary register to enable and disable the OLDI TXes
with necessary modes configurations.

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 68444e0cd8d7..fd7f49535f0c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1003,8 +1003,8 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 	int count = 0;
 
 	/*
-	 * For the moment DUALMODESYNC, MASTERSLAVE, MODE, and SRC
-	 * bits of DISPC_VP_DSS_OLDI_CFG are set statically to 0.
+	 * For the moment MASTERSLAVE, and SRC bits of DISPC_VP_DSS_OLDI_CFG are
+	 * set statically to 0.
 	 */
 
 	if (fmt->data_width == 24)
@@ -1021,6 +1021,30 @@ static void dispc_enable_oldi(struct dispc_device *dispc, u32 hw_videoport,
 
 	oldi_cfg |= BIT(0); /* ENABLE */
 
+	switch (dispc->oldi_mode) {
+	case OLDI_MODE_OFF:
+		oldi_cfg &= ~BIT(0); /* DISABLE */
+		break;
+
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
2.37.0


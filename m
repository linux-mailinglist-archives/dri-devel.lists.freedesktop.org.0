Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A64D9569
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 08:36:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9734010E430;
	Tue, 15 Mar 2022 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 769 seconds by postgrey-1.36 at gabe;
 Mon, 14 Mar 2022 11:50:49 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FC710E71F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 11:50:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22EBbfEg003547;
 Mon, 14 Mar 2022 06:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647257861;
 bh=uAviE+ICta+te1V5taBxEX1+rY5ad3ad40dXTkQLikA=;
 h=From:To:CC:Subject:Date;
 b=oxNqZQJreYWTK8hOZTnf15j+RElxwl1L4cU79BJcCcDPRIdAWkdErk6EJ2Z6YbD2S
 JcHN6rWxbYZW+WF73+OZ1pD7zn/s5ph6WtuJPrIMepRmE6q2mbfVHnNEhcHHTr57uk
 LwVemee5OSDEex1b+J+z6ZncSKSGNWYz3xvwFFFU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22EBbfAS084991
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 14 Mar 2022 06:37:41 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 14
 Mar 2022 06:37:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 14 Mar 2022 06:37:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22EBbdZW020066;
 Mon, 14 Mar 2022 06:37:40 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>, <tomba@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/tidss: Soft Reset DISPC on startup
Date: Mon, 14 Mar 2022 17:07:39 +0530
Message-ID: <20220314113739.18000-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 15 Mar 2022 07:36:11 +0000
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
Cc: nm@ti.com, r-ravikumar@ti.com, devarsht@ti.com,
 tomi.valkeinen@ideasonboard.com, a-bhatia1@ti.com,
 laurent.pinchart@ideasonboard.com, nikhil.nd@ti.com,
 linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Soft reset the display subsystem controller on startup and wait for
the reset to complete. This helps the scenario where display was
already in use by some other core before the linux was booted.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 60b92df615aa..dae47853b728 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -2650,6 +2650,20 @@ static void dispc_init_errata(struct dispc_device *dispc)
 	}
 }
 
+static void dispc_softreset(struct dispc_device *dispc)
+{
+	u32 val;
+	int ret = 0;
+
+	/* Soft reset */
+	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
+	/* Wait for reset to complete */
+	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
+				 val, val & 1, 100, 5000);
+	if (ret)
+		dev_warn(dispc->dev, "failed to reset dispc\n");
+}
+
 int dispc_init(struct tidss_device *tidss)
 {
 	struct device *dev = tidss->dev;
@@ -2709,6 +2723,10 @@ int dispc_init(struct tidss_device *tidss)
 			return r;
 	}
 
+	/* K2G display controller does not support soft reset */
+	if (feat->subrev != DISPC_K2G)
+		dispc_softreset(dispc);
+
 	for (i = 0; i < dispc->feat->num_vps; i++) {
 		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
 		u32 *gamma_table;
-- 
2.17.1


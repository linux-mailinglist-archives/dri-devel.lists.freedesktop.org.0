Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4272AEEDF4
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 07:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF89910E25F;
	Tue,  1 Jul 2025 05:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="q4YTB79/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843FE10E25F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 05:50:27 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5615o4f33538314;
 Tue, 1 Jul 2025 00:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751349004;
 bh=3cPMkq4X1dcsq5SZpwGZYCzbnhDDSqUTCMHOl/O7qb4=;
 h=From:To:CC:Subject:Date;
 b=q4YTB79/6z+iHUjKXRZaiCetZgaR8nVIkU8D2Hp8L2otCT/l8HOBg44R2x5v6TW3/
 2BHIuNBh73Q3cP8oeq4TgZS+JnhqYU3fyq8z1oud/LdlCkDGo3a7B9LGbL1u+J7xHD
 J3MkvtvyRuTqegDFqCe0QR/aiRLEBOQwRpAQMRJU=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5615o3pW3800199
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 1 Jul 2025 00:50:03 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 00:50:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 00:50:03 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.167])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5615o2UV1007641;
 Tue, 1 Jul 2025 00:50:03 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
 <tomi.valkeinen@ideasonboard.com>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <j-choudhary@ti.com>
Subject: [PATCH] drm/tidss: oldi: convert to devm_drm_bridge_alloc() API
Date: Tue, 1 Jul 2025 11:20:02 +0530
Message-ID: <20250701055002.52336-1-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

DRM bridges now uses "devm_drm_bridge_alloc()" for allocation and
initialization. "devm_kzalloc()" is not allowed anymore and it results
in WARNING. So convert it.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Warning log:
<https://gist.github.com/Jayesh2000/e42c235bb57cb0f0af06c8c3bf886ef2>

 drivers/gpu/drm/tidss/tidss_oldi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8223b8fec8ce..b0f99656e87e 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -534,11 +534,10 @@ int tidss_oldi_init(struct tidss_device *tidss)
 			continue;
 		}
 
-		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
-		if (!oldi) {
-			ret = -ENOMEM;
-			goto err_put_node;
-		}
+		oldi = devm_drm_bridge_alloc(tidss->dev, struct tidss_oldi, bridge,
+					     &tidss_oldi_bridge_funcs);
+		if (IS_ERR(oldi))
+			return PTR_ERR(oldi);
 
 		oldi->parent_vp = parent_vp;
 		oldi->oldi_instance = oldi_instance;
@@ -577,7 +576,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		/* Register the bridge. */
 		oldi->bridge.of_node = child;
 		oldi->bridge.driver_private = oldi;
-		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C0B03C4B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B553010E452;
	Mon, 14 Jul 2025 10:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="PaagJttp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C796810E452
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:46:55 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EAjuC92359657;
 Mon, 14 Jul 2025 05:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1752489956;
 bh=m9QGcwxg2jM0MyzOfa5/VcVbOr2DjOXlGp1SoOM/jGg=;
 h=From:To:CC:Subject:Date;
 b=PaagJttpryxkfDKIfdNpGK868g02zbRac54K8tC0O5nbFD97bNWPcExm0Ju+mYgZh
 UvgcGBehoVygS6cmMdAOQi8lIkdB6pyKnU5jp7MJaTqhQO2r2SL+s007oTx1njJ1to
 WxyMd2xXFJnXlgpyzXvWX8Mnin6lhNqBHuqGTyp0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EAjtYH265538
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 14 Jul 2025 05:45:55 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 05:45:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 05:45:55 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.166])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EAjsRY409568;
 Mon, 14 Jul 2025 05:45:55 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>,
 <aradhya.bhatia@linux.dev>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <j-choudhary@ti.com>
Subject: [PATCH v2] drm/tidss: oldi: convert to devm_drm_bridge_alloc() API
Date: Mon, 14 Jul 2025 16:15:54 +0530
Message-ID: <20250714104554.13441-1-j-choudhary@ti.com>
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

DRM bridges now use "devm_drm_bridge_alloc()" for allocation and
initialization. "devm_kzalloc()" is not allowed anymore and it results
in WARNING. So convert it.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Reviewed-by: Devarsh Thakkar <devarsht@ti.com>
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---

Changelog v1->v2:
- Fix typo in commit message
- Put the oldi parent and child node in case of error before returning
  (as pointed out by Aradhya in v1)
- Pick up "R-by" tags

v1 patch link:
<https://lore.kernel.org/all/20250701055002.52336-1-j-choudhary@ti.com/>

 drivers/gpu/drm/tidss/tidss_oldi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8223b8fec8ce..8f25159d0666 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -534,9 +534,10 @@ int tidss_oldi_init(struct tidss_device *tidss)
 			continue;
 		}
 
-		oldi = devm_kzalloc(tidss->dev, sizeof(*oldi), GFP_KERNEL);
-		if (!oldi) {
-			ret = -ENOMEM;
+		oldi = devm_drm_bridge_alloc(tidss->dev, struct tidss_oldi, bridge,
+					     &tidss_oldi_bridge_funcs);
+		if (IS_ERR(oldi)) {
+			ret = PTR_ERR(oldi);
 			goto err_put_node;
 		}
 
@@ -577,7 +578,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		/* Register the bridge. */
 		oldi->bridge.of_node = child;
 		oldi->bridge.driver_private = oldi;
-		oldi->bridge.funcs = &tidss_oldi_bridge_funcs;
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D863BAEF3F8
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B4F10E57E;
	Tue,  1 Jul 2025 09:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Uz01lBSp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AAB10E17C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 09:56:06 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5619tiLI2880060;
 Tue, 1 Jul 2025 04:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1751363744;
 bh=t46HH1lnDwcDhBcYHwHyOdQEPWm3oHk/feg+ANDUvXQ=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Uz01lBSpy6nYTRiAaFomIDH8a/56cSlKwhqrBndPC6qIA17+36Sm+OwnLpK00+ffl
 w2NaSf35uh8gC4u2Q5QBDLzUD5Fg+gypEbxXDlhj5RgmZiy1IoJGh4onq8XFyH/PhF
 3kslXR4GfeNchVKGwecieBFXY6c/2CPu41X6G9jU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5619tis1107453
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Tue, 1 Jul 2025 04:55:44 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 04:55:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 04:55:44 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com
 [172.24.227.167])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5619thsK1349536;
 Tue, 1 Jul 2025 04:55:43 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <jyri.sarha@iki.fi>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <devarsht@ti.com>,
 <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <j-choudhary@ti.com>
Subject: [PATCH v3 1/3] drm/tidss: oldi: Add property to identify OLDI
 supported VP
Date: Tue, 1 Jul 2025 15:25:39 +0530
Message-ID: <20250701095541.190422-2-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701095541.190422-1-j-choudhary@ti.com>
References: <20250701095541.190422-1-j-choudhary@ti.com>
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

TIDSS should know which VP has OLDI output to avoid calling clock
functions for that VP as those are controlled by oldi driver. Add a
property "is_oldi_vp" to "tidss_device" structure for that. Mark it
'true' in tidss_oldi_init() and 'false' in tidss_oldi_deinit().

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 drivers/gpu/drm/tidss/tidss_drv.h  | 2 ++
 drivers/gpu/drm/tidss/tidss_oldi.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
index 0ae24f645582..82beaaceadb3 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.h
+++ b/drivers/gpu/drm/tidss/tidss_drv.h
@@ -24,6 +24,8 @@ struct tidss_device {
 
 	const struct dispc_features *feat;
 	struct dispc_device *dispc;
+	bool is_oldi_vp[TIDSS_MAX_PORTS];
+
 
 	unsigned int num_crtcs;
 	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index b0f99656e87e..63e07c8edeaa 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -430,6 +430,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
 	for (int i = 0; i < tidss->num_oldis; i++) {
 		if (tidss->oldis[i]) {
 			drm_bridge_remove(&tidss->oldis[i]->bridge);
+			tidss->is_oldi_vp[tidss->oldis[i]->parent_vp] = false;
 			tidss->oldis[i] = NULL;
 		}
 	}
@@ -579,6 +580,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
 		oldi->bridge.timings = &default_tidss_oldi_timings;
 
 		tidss->oldis[tidss->num_oldis++] = oldi;
+		tidss->is_oldi_vp[oldi->parent_vp] = true;
 		oldi->tidss = tidss;
 
 		drm_bridge_add(&oldi->bridge);
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611A62935F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:39:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37510E36C;
	Tue, 15 Nov 2022 08:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E91510E36C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:39:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2AF8dMlM108203;
 Tue, 15 Nov 2022 02:39:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668501562;
 bh=yKC6E4hT91afjosovCDsP6rLhDJyelPpRXQXl4YPz8s=;
 h=From:To:CC:Subject:Date;
 b=jjbRR2dGloRFw0iG0t/ZmgLq5X9rQmlpQntJ4NztfrbJkubyIvqZXgif6zk1uztSI
 2ofUZJB5zBn8OZ8EQZMZiCnUxsCPHpuHpXjH+0qR4JDEWfaVUYOFNMJh7SHgp6mSej
 pk64XRk9t0Goo5bvLZwUbhj0ngnRwvML4aPGqoU0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2AF8dMbe046360
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Nov 2022 02:39:22 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 15
 Nov 2022 02:39:22 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 15 Nov 2022 02:39:22 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2AF8dL05029656;
 Tue, 15 Nov 2022 02:39:21 -0600
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/bridge: cdns-dsi: Fix issue with phy init
Date: Tue, 15 Nov 2022 14:09:18 +0530
Message-ID: <20221115083918.23192-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.38.0
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se, tomi.valkeinen@ideasonboard.com,
 sjakhade@cadence.com, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 robert.foss@linaro.org, andrzej.hajda@intel.com, jpawar@cadence.com,
 Rahul T R <r-ravikumar@ti.com>, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Phy is not being initialized after suspend resume. Fix this by setting
phy_initialized flag to false in suspend callback

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 drivers/gpu/drm/bridge/cdns-dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 20bece84ff8c..1a988f53424a 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -1187,6 +1187,7 @@ static int __maybe_unused cdns_dsi_suspend(struct device *dev)
 	clk_disable_unprepare(dsi->dsi_p_clk);
 	reset_control_assert(dsi->dsi_p_rst);
 	dsi->link_initialized = false;
+	dsi->phy_initialized = false;
 	return 0;
 }
 
-- 
2.38.0


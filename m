Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66D1FEF00
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 11:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561F6E1E2;
	Thu, 18 Jun 2020 09:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E526E1E2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 09:52:06 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05I9q0wa125071;
 Thu, 18 Jun 2020 04:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1592473920;
 bh=G9sP1vrCrjN/lVI73aFDIHVuLLC9PV5ia5GovzSM3u0=;
 h=From:To:CC:Subject:Date;
 b=PaTFErnUHK+L1j5HFfHCSbO78p8VWqU9QERwxddMRPzzxUWHmZ0+yQGc35Wmo6m3f
 l7rMlMSijpbvI8/CoT0NFou1MJiG9aM/2p+GAFJq+Ue94OUGwQLYIk5rpv/EdgfQbj
 AhRCh5doE0vFUvoPOJyH3Z/r+vvDwM3AnBhP+Gf0=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05I9px8t057161
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jun 2020 04:52:00 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 18
 Jun 2020 04:51:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 18 Jun 2020 04:51:59 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05I9pv7j024166;
 Thu, 18 Jun 2020 04:51:58 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Tony Lindgren <tony@atomide.com>
Subject: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
Date: Thu, 18 Jun 2020 12:51:52 +0300
Message-ID: <20200618095153.611071-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use SET_LATE_SYSTEM_SLEEP_PM_OPS in DSS submodules to force runtime PM
suspend and resume.

We use suspend late version so that omapdrm's system suspend callback is
called first, as that will disable all the display outputs after which
it's safe to force DSS into suspend.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/dispc.c | 1 +
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 1 +
 drivers/gpu/drm/omapdrm/dss/dss.c   | 1 +
 drivers/gpu/drm/omapdrm/dss/venc.c  | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index 6639ee9b05d3..48593932bddf 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4915,6 +4915,7 @@ static int dispc_runtime_resume(struct device *dev)
 static const struct dev_pm_ops dispc_pm_ops = {
 	.runtime_suspend = dispc_runtime_suspend,
 	.runtime_resume = dispc_runtime_resume,
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver omap_dispchw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 79ddfbfd1b58..eeccf40bae41 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5467,6 +5467,7 @@ static int dsi_runtime_resume(struct device *dev)
 static const struct dev_pm_ops dsi_pm_ops = {
 	.runtime_suspend = dsi_runtime_suspend,
 	.runtime_resume = dsi_runtime_resume,
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver omap_dsihw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 4d5739fa4a5d..6ccbc29c4ce4 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1614,6 +1614,7 @@ static int dss_runtime_resume(struct device *dev)
 static const struct dev_pm_ops dss_pm_ops = {
 	.runtime_suspend = dss_runtime_suspend,
 	.runtime_resume = dss_runtime_resume,
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 struct platform_driver omap_dsshw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 9701843ccf09..01ee6c50b663 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -902,6 +902,7 @@ static int venc_runtime_resume(struct device *dev)
 static const struct dev_pm_ops venc_pm_ops = {
 	.runtime_suspend = venc_runtime_suspend,
 	.runtime_resume = venc_runtime_resume,
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static const struct of_device_id venc_of_match[] = {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 421631F382B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 12:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED356E11A;
	Tue,  9 Jun 2020 10:32:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F0D6E11A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 10:32:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 059AWQNl031818;
 Tue, 9 Jun 2020 05:32:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1591698746;
 bh=JG3ecx15d+gP3lA0SIDh3DIwhB8jqgs29oWHxWhV2KU=;
 h=From:To:CC:Subject:Date;
 b=ddMnbONpdHZL+OWWFef1W61XOXjzqkX7XJrOSiazKQf02ZMhNDGaj3Zlom9oOoErO
 LXmYe0y5xO2uEKpK3IskJnP/BuB9olyvTbp2gV2M2hgHIC9NBfJ/uvddVw6EAHFlXt
 L03mJLDlVqOoG3dweQBtTT2iMgFdJokhSDyjTc+A=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 059AWQuF100825
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Jun 2020 05:32:26 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 9 Jun
 2020 05:32:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 9 Jun 2020 05:32:25 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 059AWOZX045986;
 Tue, 9 Jun 2020 05:32:24 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Tony Lindgren <tony@atomide.com>, <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/omap: force runtime PM suspend on system suspend
Date: Tue, 9 Jun 2020 13:32:20 +0300
Message-ID: <20200609103220.753969-1-tomi.valkeinen@ti.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use suspend_late and resume_early callbacks in DSS submodules to force
runtime PM suspend and resume.

We use suspend_late callback so that omapdrm's system suspend callback
is called first, as that will disable all the display outputs after
which it's safe to force DSS into suspend.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---

Not fully tested, as I haven't been able to get AM4's system suspend to
work. Works with pm_test.

 drivers/gpu/drm/omapdrm/dss/dispc.c | 16 ++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/dsi.c   | 16 ++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/dss.c   | 16 ++++++++++++++++
 drivers/gpu/drm/omapdrm/dss/venc.c  | 16 ++++++++++++++++
 4 files changed, 64 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/dispc.c b/drivers/gpu/drm/omapdrm/dss/dispc.c
index dbb90f2d2ccd..1c9057d7db7b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dispc.c
+++ b/drivers/gpu/drm/omapdrm/dss/dispc.c
@@ -4933,9 +4933,25 @@ static int dispc_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int dispc_suspend_late(struct device *dev)
+{
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int dispc_resume_early(struct device *dev)
+{
+	pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops dispc_pm_ops = {
 	.runtime_suspend = dispc_runtime_suspend,
 	.runtime_resume = dispc_runtime_resume,
+	.suspend_late = dispc_suspend_late,
+	.resume_early = dispc_resume_early,
 };
 
 struct platform_driver omap_dispchw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 79ddfbfd1b58..bae954dc8a5b 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -5464,9 +5464,25 @@ static int dsi_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int dsi_suspend_late(struct device *dev)
+{
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int dsi_resume_early(struct device *dev)
+{
+	pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops dsi_pm_ops = {
 	.runtime_suspend = dsi_runtime_suspend,
 	.runtime_resume = dsi_runtime_resume,
+	.suspend_late = dsi_suspend_late,
+	.resume_early = dsi_resume_early,
 };
 
 struct platform_driver omap_dsihw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index 4d5739fa4a5d..65be4918db0c 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1611,9 +1611,25 @@ static int dss_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int dss_suspend_late(struct device *dev)
+{
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int dss_resume_early(struct device *dev)
+{
+	pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops dss_pm_ops = {
 	.runtime_suspend = dss_runtime_suspend,
 	.runtime_resume = dss_runtime_resume,
+	.suspend_late = dss_suspend_late,
+	.resume_early = dss_resume_early,
 };
 
 struct platform_driver omap_dsshw_driver = {
diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
index 766553bb2f87..3abc7e329121 100644
--- a/drivers/gpu/drm/omapdrm/dss/venc.c
+++ b/drivers/gpu/drm/omapdrm/dss/venc.c
@@ -942,9 +942,25 @@ static int venc_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int venc_suspend_late(struct device *dev)
+{
+	pm_runtime_force_suspend(dev);
+
+	return 0;
+}
+
+static int venc_resume_early(struct device *dev)
+{
+	pm_runtime_force_resume(dev);
+
+	return 0;
+}
+
 static const struct dev_pm_ops venc_pm_ops = {
 	.runtime_suspend = venc_runtime_suspend,
 	.runtime_resume = venc_runtime_resume,
+	.suspend_late = venc_suspend_late,
+	.resume_early = venc_resume_early,
 };
 
 static const struct of_device_id venc_of_match[] = {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

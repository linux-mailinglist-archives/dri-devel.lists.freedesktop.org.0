Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF5A46B99
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 20:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED2E10E9D2;
	Wed, 26 Feb 2025 19:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cfdF0/KH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B7310E9D2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=86JPmdxwe2LsA/nl1WU6ceGnFYY2LrlCANZO1hLIr/Y=; b=cfdF0/KHjGeAZXqNQ36ClFSjxO
 548V/PLHC+zWWMJoYLLM5xSZTMmdo9WIfOI++cZ5Ko/5LKeuI7WHa+vIjcWZRsRSLk7UyJeM0zPKF
 BjssTQ2sIJd+3V4BTEmuRwrF6QXujbb+MxADWw5aJSskOJ73LcKnAP6Zm+A8N6yYoJwn9ArtlmbSM
 MrQE6lcRC0zpr1tJ4mowH5kS6gc8pNVlzJYKuEc7us+5iWE3I8X58eAPpzqzokbNnn9pFsIYFzyf4
 QKZYuFy7MbphpYgrLZYIA9vji6a+idHoB71SwSHGCbRkxr+QAAJzE4Lu4adSDEQhCtVDKW3j4CGGy
 +SbgqebA==;
Received: from [187.36.213.55]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tnNZ8-0019lA-PU; Wed, 26 Feb 2025 20:59:40 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 26 Feb 2025 16:59:01 -0300
Subject: [PATCH 3/6] drm/v3d: Associate a V3D tech revision to all
 supported devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250226-v3d-gpu-reset-fixes-v1-3-83a969fdd9c1@igalia.com>
References: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
In-Reply-To: <20250226-v3d-gpu-reset-fixes-v1-0-83a969fdd9c1@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3506; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=RhcwA9JkfBHLo/G3gaQ2ajOhUspmoGHJ05yM61gi4hQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnv3KfbLQzw+EHvd+X5R11bT+NgQax+42wJWGZ4
 zMMUP1UMMqJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ79ynwAKCRA/8w6Kdoj6
 qn/yB/wPsi5v5Y1j+shdVMyA/XfOYPBAHMpvW5FJzGS6VvhSREgvFqhNELbmiy2Y2rUwz6f9haP
 F/8GVO9uhtIgR1dyeQqg/ksWDca2d7oIIzx4QP+ktrFhZhKDqTks4Jd2lOEyf/m0MbcSQizoNy/
 BFYjMg7tXuq6AeFr+DpsoxqpSDj661Jqo56pAY4Wm2rvXzSc9vZk4HJQ94XDtOK3Tl8vvNstZ93
 A7AIokepnCEQPuK2a8RFdjXYQQtxOH2h/JEXCUbAGTc4Ay7gTZyBZJQa3nhJWii/efaaIlZh4VM
 uTLUn9TdjpakvUce2sJvjyqFADD50h7U3IkK4SNuMBBBOSEn
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

The V3D driver currently determines the GPU tech version (33, 41...)
by reading a register. This approach has worked so far since this
information wasn’t needed before powering on the GPU.

V3D 7.1 introduces new registers that must be written to power on the
GPU, requiring us to know the V3D version beforehand. To address this,
associate each supported SoC with the corresponding VideoCore GPU version
as part of the device data.

To prevent possible mistakes, add an assertion to verify that the version
specified in the device data matches the one reported by the hardware.
If there is a mismatch, the kernel will trigger a warning.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 18 ++++++++++++++----
 drivers/gpu/drm/v3d/v3d_drv.h |  7 +++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 852015214e971c60f9939d34d893d8d8cb4e9b01..c5e5bec1c72d32128fb16136f136f5fa7f76a6bd 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -17,6 +17,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/sched/clock.h>
@@ -254,10 +255,10 @@ static const struct drm_driver v3d_drm_driver = {
 };
 
 static const struct of_device_id v3d_of_match[] = {
-	{ .compatible = "brcm,2711-v3d" },
-	{ .compatible = "brcm,2712-v3d" },
-	{ .compatible = "brcm,7268-v3d" },
-	{ .compatible = "brcm,7278-v3d" },
+	{ .compatible = "brcm,2711-v3d", .data = (void *)V3D_GEN_42 },
+	{ .compatible = "brcm,2712-v3d", .data = (void *)V3D_GEN_71 },
+	{ .compatible = "brcm,7268-v3d", .data = (void *)V3D_GEN_33 },
+	{ .compatible = "brcm,7278-v3d", .data = (void *)V3D_GEN_41 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, v3d_of_match);
@@ -274,6 +275,7 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct drm_device *drm;
 	struct v3d_dev *v3d;
+	enum v3d_gen gen;
 	int ret;
 	u32 mmu_debug;
 	u32 ident1, ident3;
@@ -287,6 +289,9 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, drm);
 
+	gen = (enum v3d_gen)of_device_get_match_data(dev);
+	v3d->ver = gen;
+
 	ret = map_regs(v3d, &v3d->hub_regs, "hub");
 	if (ret)
 		return ret;
@@ -316,6 +321,11 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 	ident1 = V3D_READ(V3D_HUB_IDENT1);
 	v3d->ver = (V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_TVER) * 10 +
 		    V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_REV));
+	/* Make sure that the V3D tech version retrieved from the HW is equal
+	 * to the one advertised by the device tree.
+	 */
+	WARN_ON(v3d->ver != gen);
+
 	v3d->cores = V3D_GET_FIELD(ident1, V3D_HUB_IDENT1_NCORES);
 	WARN_ON(v3d->cores > 1); /* multicore not yet implemented */
 
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 9deaefa0f95b71b842f1c5bef2c6a8a8ffc21fe2..a3a0a4c2e1c354766d6c7dda37d15c4a5e12a637 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -94,6 +94,13 @@ struct v3d_perfmon {
 	u64 values[] __counted_by(ncounters);
 };
 
+enum v3d_gen {
+	V3D_GEN_33 = 33,
+	V3D_GEN_41 = 41,
+	V3D_GEN_42 = 42,
+	V3D_GEN_71 = 71,
+};
+
 struct v3d_dev {
 	struct drm_device drm;
 

-- 
Git-154)


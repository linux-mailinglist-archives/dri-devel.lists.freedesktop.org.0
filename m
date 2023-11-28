Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6307FBA67
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 13:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1C310E501;
	Tue, 28 Nov 2023 12:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B3610E501
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 12:45:20 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2FAE766072E7;
 Tue, 28 Nov 2023 12:45:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701175519;
 bh=ZMbtd9WMiupIkiGjSbJtW0qTs1q9H3A+O0vlIJhbcWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ay8pftW9nEj5jELP6u1hSJNKi7DxYPH+ekBVtWYd0QA11aqkkpyerpACMcAlKyXmX
 tFbXDMpnh3MSTceU3YAxlKZtI5ELVV/nEenPgwvTEeEdJVY4mEbxfvEtNvIcI2fzRy
 mEqpNr5lFN2eVE6hjVbyOkMsQ5iorXRFC/yZ69/8uX76lbDSIZYhBDQGsr/PJih7iA
 P7kj7HA8DngAvRRuLu5uMHxOEGuP1Ee6ETOn21WeC36ogFb4uTg32zp3wCGMkQzzvG
 yamOoYZOXVAHhtlGeVOmcAcK1ARCOm8Ye8mg8OV0Y+7d3V7M9BBBkRiwmvt2DcF6tf
 3hyGpjpfMH5sg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 2/3] drm/panfrost: Add gpu_irq,
 mmu_irq to struct panfrost_device
Date: Tue, 28 Nov 2023 13:45:09 +0100
Message-ID: <20231128124510.391007-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
References: <20231128124510.391007-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, m.szyprowski@samsung.com, kernel@collabora.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for adding a IRQ synchronization mechanism for PM suspend
add gpu_irq and mmu_irq variables to struct panfrost_device and change
functions panfrost_gpu_init() and panfrost_mmu_init() to use those.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h |  2 ++
 drivers/gpu/drm/panfrost/panfrost_gpu.c    | 10 +++++-----
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 10 +++++-----
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 0fc558db6bfd..54a8aad54259 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -94,6 +94,8 @@ struct panfrost_device {
 	struct device *dev;
 	struct drm_device *ddev;
 	struct platform_device *pdev;
+	int gpu_irq;
+	int mmu_irq;
 
 	void __iomem *iomem;
 	struct clk *clock;
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index bd41617c5e4b..7adc4441fa14 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -454,7 +454,7 @@ void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 
 int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
-	int err, irq;
+	int err;
 
 	err = panfrost_gpu_soft_reset(pfdev);
 	if (err)
@@ -469,11 +469,11 @@ int panfrost_gpu_init(struct panfrost_device *pfdev)
 
 	dma_set_max_seg_size(pfdev->dev, UINT_MAX);
 
-	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
-	if (irq < 0)
-		return irq;
+	pfdev->gpu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "gpu");
+	if (pfdev->gpu_irq < 0)
+		return pfdev->gpu_irq;
 
-	err = devm_request_irq(pfdev->dev, irq, panfrost_gpu_irq_handler,
+	err = devm_request_irq(pfdev->dev, pfdev->gpu_irq, panfrost_gpu_irq_handler,
 			       IRQF_SHARED, KBUILD_MODNAME "-gpu", pfdev);
 	if (err) {
 		dev_err(pfdev->dev, "failed to request gpu irq");
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 846dd697c410..ac4296c1e54b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -753,13 +753,13 @@ static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
 
 int panfrost_mmu_init(struct panfrost_device *pfdev)
 {
-	int err, irq;
+	int err;
 
-	irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
-	if (irq < 0)
-		return irq;
+	pfdev->mmu_irq = platform_get_irq_byname(to_platform_device(pfdev->dev), "mmu");
+	if (pfdev->mmu_irq < 0)
+		return pfdev->mmu_irq;
 
-	err = devm_request_threaded_irq(pfdev->dev, irq,
+	err = devm_request_threaded_irq(pfdev->dev, pfdev->mmu_irq,
 					panfrost_mmu_irq_handler,
 					panfrost_mmu_irq_handler_thread,
 					IRQF_SHARED, KBUILD_MODNAME "-mmu",
-- 
2.42.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82D57DF4B5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF1F10E8C8;
	Thu,  2 Nov 2023 14:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA4B10E8C8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:15:15 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 203C06607033;
 Thu,  2 Nov 2023 14:15:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698934514;
 bh=cAv8iDJbPkwyr97yslzoCR0E+J9ioopOVLD7tn0xeaE=;
 h=From:To:Cc:Subject:Date:From;
 b=HqpIaYF1rO3cGnHd2r+erpo4hV2GzGpXpvcUY+S6BvEdi0pqjEu5FWy6QdvWTB3Gn
 sLX5M2x5Eba62EWJQeIhhroPsAOPWMocc59q2AuWBWBlax4+QBZzkgfoOdyFqPQbXF
 Y7hMqhsMlQszW/jpI8+JDDIRReCRzoRS38k39ZND8OCmYQjwIAov7wyhLEOh3B4a8K
 B14ZdeSjkbBKNhWSqF/sa/1vcE8KOscGZlWKXVKeDxxVrAu7PA0NcjV6DjsU7+mLU0
 /B6FVDPNyCX1zZQRdHj1Wv1SpIjqjXob6NB925dUEtepvVxB63XjzTVkIiW32H160F
 OWsLpYE84uuzA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Date: Thu,  2 Nov 2023 15:15:07 +0100
Message-ID: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
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
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
this means that in order to request poweroff of cores, we are supposed
to write a bitmask of cores that should be powered off!
This means that the panfrost_gpu_power_off() function has always been
doing nothing.

Fix powering off the GPU by writing a bitmask of the cores to poweroff
to the relevant PWROFF_LO registers and then check that the transition
(from ON to OFF) has finished by polling the relevant PWRTRANS_LO
registers.

While at it, in order to avoid code duplication, move the core mask
logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
function, used in both poweron and poweroff.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 65 ++++++++++++++++++-------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f0be7e19b13e..fad75b6e543e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -362,28 +362,38 @@ unsigned long long panfrost_cycle_counter_read(struct panfrost_device *pfdev)
 	return ((u64)hi << 32) | lo;
 }
 
+static u64 panfrost_get_core_mask(struct panfrost_device *pfdev)
+{
+	u64 core_mask;
+
+	if (pfdev->features.l2_present == 1)
+		return U64_MAX;
+
+	/*
+	 * Only support one core group now.
+	 * ~(l2_present - 1) unsets all bits in l2_present except
+	 * the bottom bit. (l2_present - 2) has all the bits in
+	 * the first core group set. AND them together to generate
+	 * a mask of cores in the first core group.
+	 */
+	core_mask = ~(pfdev->features.l2_present - 1) &
+		     (pfdev->features.l2_present - 2);
+	dev_info_once(pfdev->dev, "using only 1st core group (%lu cores from %lu)\n",
+		      hweight64(core_mask),
+		      hweight64(pfdev->features.shader_present));
+
+	return core_mask;
+}
+
 void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 {
 	int ret;
 	u32 val;
-	u64 core_mask = U64_MAX;
+	u64 core_mask;
 
 	panfrost_gpu_init_quirks(pfdev);
+	core_mask = panfrost_get_core_mask(pfdev);
 
-	if (pfdev->features.l2_present != 1) {
-		/*
-		 * Only support one core group now.
-		 * ~(l2_present - 1) unsets all bits in l2_present except
-		 * the bottom bit. (l2_present - 2) has all the bits in
-		 * the first core group set. AND them together to generate
-		 * a mask of cores in the first core group.
-		 */
-		core_mask = ~(pfdev->features.l2_present - 1) &
-			     (pfdev->features.l2_present - 2);
-		dev_info_once(pfdev->dev, "using only 1st core group (%lu cores from %lu)\n",
-			      hweight64(core_mask),
-			      hweight64(pfdev->features.shader_present));
-	}
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == (pfdev->features.l2_present & core_mask),
@@ -408,11 +418,30 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 
 void panfrost_gpu_power_off(struct panfrost_device *pfdev)
 {
-	gpu_write(pfdev, TILER_PWROFF_LO, 0);
-	gpu_write(pfdev, SHADER_PWROFF_LO, 0);
-	gpu_write(pfdev, L2_PWROFF_LO, 0);
+	u64 core_mask = panfrost_get_core_mask(pfdev);
+	int ret;
+	u32 val;
+
+	gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present & core_mask);
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
+					 val, !val, 1, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "shader power transition timeout");
+
+	gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
+	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
+					 val, !val, 1, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "tiler power transition timeout");
+
+	gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present & core_mask);
+	ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
+					 val, !val, 0, 1000);
+	if (ret)
+		dev_err(pfdev->dev, "l2 power transition timeout");
 }
 
+
 int panfrost_gpu_init(struct panfrost_device *pfdev)
 {
 	int err, irq;
-- 
2.42.0


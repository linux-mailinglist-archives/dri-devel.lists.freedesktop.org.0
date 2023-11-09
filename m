Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5B7E67E8
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 11:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D802710E89B;
	Thu,  9 Nov 2023 10:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF35610E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:25:51 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D92C7660748C;
 Thu,  9 Nov 2023 10:25:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699525549;
 bh=VutiVek57G2+kwr524Jb2GlK/BYf3oFU6xsK3CmnGxY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IEf1VhxQm+/YrzXxu0eX2Vp/pHu8nyLBdUXrysuB7D05srtm483iHG5cBEXi9m0+W
 V9wKVd8g+jqhRoD2CfHjL9KEj712PUwqFtErrTOAccAbMdu5f1LHmb77ITJ5XGR1s4
 w4qWhV/U02mblV0mYYqcgD+Q36FPULk5Eg4hVrcu1Ud4E9KUteIIn2O0Qd7+P4HiBm
 coHD52Egca4uqzE3cWey20IoxF6lXEgRrrHJ68zbVdLIpoAryvjy8oLVH4OiIey0pR
 cT7fSm/3xGfY+jWPv6bFAI0MLLZn+DhukSn7ytK9dWvpkNGR7Doz56bkQRcmdo0PZV
 Ft0tAZO5F8p9w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v3 1/6] drm/panfrost: Perform hard reset to recover GPU if
 soft reset fails
Date: Thu,  9 Nov 2023 11:25:38 +0100
Message-ID: <20231109102543.42971-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
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

Even though soft reset should ideally never fail, during development of
some power management features I managed to get some bits wrong: this
resulted in GPU soft reset failures, where the GPU was never able to
recover, not even after suspend/resume cycles, meaning that the only
way to get functionality back was to reboot the machine.

Perform a hard reset after a soft reset failure to be able to recover
the GPU during runtime (so, without any machine reboot).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c  | 13 ++++++++++---
 drivers/gpu/drm/panfrost/panfrost_regs.h |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f0be7e19b13e..ae3f7d97bb47 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -60,14 +60,21 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 
 	gpu_write(pfdev, GPU_INT_MASK, 0);
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_RESET_COMPLETED);
-	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 
+	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
 		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
 
 	if (ret) {
-		dev_err(pfdev->dev, "gpu soft reset timed out\n");
-		return ret;
+		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
+
+		gpu_write(pfdev, GPU_CMD, GPU_CMD_HARD_RESET);
+		ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT, val,
+						 val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
+		if (ret) {
+			dev_err(pfdev->dev, "gpu hard reset timed out\n");
+			return ret;
+		}
 	}
 
 	gpu_write(pfdev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 55ec807550b3..c25743b05c55 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -44,6 +44,7 @@
 	 GPU_IRQ_MULTIPLE_FAULT)
 #define GPU_CMD				0x30
 #define   GPU_CMD_SOFT_RESET		0x01
+#define   GPU_CMD_HARD_RESET		0x02
 #define   GPU_CMD_PERFCNT_CLEAR		0x03
 #define   GPU_CMD_PERFCNT_SAMPLE	0x04
 #define   GPU_CMD_CYCLE_COUNT_START	0x05
-- 
2.42.0


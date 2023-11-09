Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933477E67EE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 11:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A1710E8A1;
	Thu,  9 Nov 2023 10:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8FF10E89B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:25:52 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 06ED86607498;
 Thu,  9 Nov 2023 10:25:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699525550;
 bh=jhmRrLJp8PH/G9FAfR90YAI0hEC9baxhyFV4GjT06UY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TC3Ee+3kBEGYswGdMICLfNwD55LYTBEzx3QrQ79ZJac8J0ZTY9+wynVAUNrptV6fI
 mRXK7sRtgFV4Or1ReQGtXOJs7bdtF95l/t0ZgXsrxGQ2/IB35YqaPGUJZq9p+KJGUi
 T9Rbz3uP+3DwzOhMcusBlthxvnoLymyAwrO2dDAAAae8KA+bOq455C5uu7YBshWmFw
 TEy9bm2gyeGUUYmk8uQydmub5+epdiJsed0wUZe10QFoxSgmP0Cw+6aA8N4m9U+cfH
 2rR6EOJYj8JCzFUv7NYw7fpypkC69gIxlGeZRzUOinAoNaR04QI2yPRRcizC+69Stw
 TbTs4YjpmBmVQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v3 2/6] drm/panfrost: Tighten polling for soft reset and power
 on
Date: Thu,  9 Nov 2023 11:25:39 +0100
Message-ID: <20231109102543.42971-3-angelogioacchino.delregno@collabora.com>
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

In many cases, soft reset takes more than 1 microsecond, but definitely
less than 10; moreover in the poweron flow, tilers, shaders and l2 will
become ready (each) in less than 10 microseconds as well.

Even in the cases (at least on my platforms, rarely) in which those take
more than 10 microseconds, it's very unlikely to see both soft reset and
poweron to take more than 70 microseconds.

Shorten the polling delay to 10 microseconds to consistently reduce the
runtime resume time of the GPU.

As an indicative example, measurements taken on a MediaTek MT8195 SoC

Average runtime resume time in nanoseconds before this commit:
GDM, user selection up/down:            88435ns
GDM, Text Entry (typing user/password): 91489ns
GNOME Desktop, idling, GKRELLM running: 73200ns

After this commit:

GDM: user selection up/down:            26690ns
GDM: Text Entry (typing user/password): 27917ns
GNOME Desktop, idling, GKRELLM running:	25304ns

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index ae3f7d97bb47..69179bc9677d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -63,7 +63,7 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 
 	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
-		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
+		val, val & GPU_IRQ_RESET_COMPLETED, 10, 10000);
 
 	if (ret) {
 		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
@@ -394,7 +394,7 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == (pfdev->features.l2_present & core_mask),
-		100, 20000);
+		10, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu L2");
 
@@ -402,13 +402,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 		  pfdev->features.shader_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_READY_LO,
 		val, val == (pfdev->features.shader_present & core_mask),
-		100, 20000);
+		10, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu shader");
 
 	gpu_write(pfdev, TILER_PWRON_LO, pfdev->features.tiler_present);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_READY_LO,
-		val, val == pfdev->features.tiler_present, 100, 1000);
+		val, val == pfdev->features.tiler_present, 10, 1000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu tiler");
 }
-- 
2.42.0


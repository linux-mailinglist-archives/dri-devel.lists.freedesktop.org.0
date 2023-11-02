Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50447DF4EC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3BD10E8CF;
	Thu,  2 Nov 2023 14:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4C10E8CA
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:26:54 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8CBE7660716E;
 Thu,  2 Nov 2023 14:26:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698935213;
 bh=0UapFtlwwc/wpDFrrChMTi6BxCWRS7nEWTprLucLiIE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=id3kNstyDYcKb/QUOjDDknsO3GV8HjIOxMLvwtHZiJsGslypvZERsaeqYZnAaZRs3
 pioH67/s4u7nsbtZD47fblpN4FDtidk0LsiUb1rw1nmd7+h/9l4h4xm1mdheJ5Cl69
 0zytdQF35GRUZ6CoO9zHt4oImwfOY0oaGRaP+ir63yKigufYjNT02hT6w7ZiBzUH9q
 tEaoetZhjDotYiqm2RHuPgMoq0oM2iDK1O0/RbfJwL50qEEgnI6JML3mZUVZS/1Kmq
 pjdF3qklYVqLQk1zHtXhoArgyR4FtZPRJNnElXO7AQE06L4PN+4IGeNsPJCsoJBtOW
 so6Fer0ayHP+A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 2/6] drm/panfrost: Tighten polling for soft reset and power
 on
Date: Thu,  2 Nov 2023 15:26:39 +0100
Message-ID: <20231102142643.75288-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
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
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index 7e9e2cf26e4d..e264e8c2252d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -63,7 +63,7 @@ int panfrost_gpu_soft_reset(struct panfrost_device *pfdev)
 
 	gpu_write(pfdev, GPU_CMD, GPU_CMD_SOFT_RESET);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + GPU_INT_RAWSTAT,
-		val, val & GPU_IRQ_RESET_COMPLETED, 100, 10000);
+		val, val & GPU_IRQ_RESET_COMPLETED, 10, 10000);
 	if (ret) {
 		dev_err(pfdev->dev, "gpu soft reset timed out, attempting hard reset\n");
 
@@ -403,7 +403,7 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
 	gpu_write(pfdev, L2_PWRON_LO, pfdev->features.l2_present & core_mask);
 	ret = readl_relaxed_poll_timeout(pfdev->iomem + L2_READY_LO,
 		val, val == (pfdev->features.l2_present & core_mask),
-		100, 20000);
+		10, 20000);
 	if (ret)
 		dev_err(pfdev->dev, "error powering up gpu L2");
 
@@ -411,13 +411,13 @@ void panfrost_gpu_power_on(struct panfrost_device *pfdev)
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


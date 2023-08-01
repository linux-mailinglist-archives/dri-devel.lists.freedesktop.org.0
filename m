Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DDC76A55F
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 02:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11A910E09A;
	Tue,  1 Aug 2023 00:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C787310E036
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 00:16:34 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id ACBBF6606FCD;
 Tue,  1 Aug 2023 01:16:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690848993;
 bh=S7knx5egzrTAirnUxqfoRPb8R6N7s1X8bGrSKkYmowM=;
 h=From:To:Cc:Subject:Date:From;
 b=oFHeD2e8efQb5MMGRKIoxSOrkmqqtIVFtIFodNbd486+hkL/12fkbxmBIwWg7EI5U
 5lXVP6QcCO3IVxdKVh60sxA+xoU7UgUlfCEiNULKBL/WEuaeCvhxO0nE4A6+zyJ6J1
 ZGCG57sLCoPAYwSFn00gA9rjf6HLEF7pnrZvy98BMJBRcbUNA3oiJA/g6JPgd7246n
 Nmo+NAmFEXzF9UdBCJxT1hbOlgkEy32aaeQ295i3M6a514CC+5U767aUGwlTvfL6At
 xDVuM0v+KNv0LCv7HId1R8y5iNb+zv2dRNkOfzsPm7AqDRKbv8t+Ohiuc4ImWCHAhk
 /rXYC4mwRE9zA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v3] drm/panfrost: Sync IRQ by job's timeout handler
Date: Tue,  1 Aug 2023 03:14:27 +0300
Message-ID: <20230801001427.176981-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panfrost IRQ handler may stuck for a long time, for example this happens
when there is a bad HDMI connection and HDMI handler takes a long time to
finish processing, holding Panfrost. Make Panfrost's job timeout handler
to sync IRQ before checking fence signal status in order to prevent
spurious job timeouts due to a slow IRQ processing.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> # MediaTek MT8192 and MT8195 Chromebooks:
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v3: - Added comment to the code as was suggested by Boris

    - Added r-b/t-b from Steven and Angelo

v2: - Moved synchronize_irq() after first signal-check to avoid unnecessary
      blocking on syncing.

    - Added warn message about high interrupt latency.

 drivers/gpu/drm/panfrost/panfrost_job.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..ea1149354f9d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -720,6 +720,21 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	if (dma_fence_is_signaled(job->done_fence))
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 
+	/*
+	 * Panfrost IRQ handler may take long time to process if there is
+	 * another IRQ handler hogging the processing. For example, HDMI
+	 * may stuck in IRQ handler for a significant time in a case of bad
+	 * cable connection. In order to catch such cases and not report
+	 * spurious Panfrost job timeouts, synchronize the IRQ handler and
+	 * re-check the fence status.
+	 */
+	synchronize_irq(pfdev->js->irq);
+
+	if (dma_fence_is_signaled(job->done_fence)) {
+		dev_warn(pfdev->dev, "unexpectedly high interrupt latency\n");
+		return DRM_GPU_SCHED_STAT_NOMINAL;
+	}
+
 	dev_err(pfdev->dev, "gpu sched timeout, js=%d, config=0x%x, status=0x%x, head=0x%x, tail=0x%x, sched_job=%p",
 		js,
 		job_read(pfdev, JS_CONFIG(js)),
-- 
2.41.0


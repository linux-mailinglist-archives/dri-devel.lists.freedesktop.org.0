Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3920475DF73
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 02:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0519710E1E9;
	Sun, 23 Jul 2023 00:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D9410E1E9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 00:02:55 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id F11386606EFD;
 Sun, 23 Jul 2023 01:02:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1690070574;
 bh=GUuN4Hv+kEehufgIB+sVRE0fxNfkqINjDEaKIO9+P1Q=;
 h=From:To:Cc:Subject:Date:From;
 b=AqGbeV6pC2fIb/cqylud/UkiC8DxdE0s/TJYG5HnWornI3FbcLwir3HZxPb08Rh63
 DKmQkuJyJ9/New8LCz6h5fxvTfnjGAxOJ0q2u0+27itaQXiOjHcMRpBmA8sI7KBixO
 9xnu4sVyGaGGXVMB7UFZt8Fx9irW6ZiuaWBbREuDxkmNNqULMlnUOyyoXK2us5Vfn1
 KCcMz4pTLl7k79AFBBr1QLzvPvsi92e5aMo5GjeInznloDxr2Hhjj2Jo6z7GTtMrjv
 zoHkRk+sJbFteXAi+WwSt0mNQKw9rzt2wLnups1KKQSQ2Briyf8Ujy6eh9I+sktCbQ
 7PcR+ZKCGuUGA==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v2] drm/panfrost: Sync IRQ by job's timeout handler
Date: Sun, 23 Jul 2023 03:01:42 +0300
Message-ID: <20230723000142.206908-1-dmitry.osipenko@collabora.com>
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

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v2: - Moved synchronize_irq() after first signal-check to avoid unnecessary
      blocking on syncing.

    - Added warn message about high interrupt latency.

 drivers/gpu/drm/panfrost/panfrost_job.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index dbc597ab46fb..a7663d7847a2 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -720,6 +720,13 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
 	if (dma_fence_is_signaled(job->done_fence))
 		return DRM_GPU_SCHED_STAT_NOMINAL;
 
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


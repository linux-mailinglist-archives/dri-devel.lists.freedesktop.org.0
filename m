Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E017A0BC7B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826AF10E6EF;
	Mon, 13 Jan 2025 15:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ty75acya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EF310E6EF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uosi0zQK/hSh96tx/tUEPhM7NYwuW5h6GwNxrk35paw=; b=Ty75acya4MervbPO4xVkubqmdP
 Gzk5b+I0g6iOyB0it77+bjHvnzCdXI+u4biHlm8AVHQk9TIT3dIECuU6DwKfEe85WpGO00DJ4tQ+Q
 9U9wYM5KjbfdpKel0lfM57xk2JTz2B4KJiG48a35DRwMPlG1IY12uzdSR1eDxUFPCU9JjZk1Jt0ai
 8+motikZqKUzpq5ykDLElk3egnOffik1qM7FhIMMxAjt997AbQC0hf6ieRNvK6AggfTSow6KpI9Pf
 OhUGAbWyUWsijyZ9uwkz2/CEsOQIDDPFfJognd6zhNsII/8dnjG6gO4cSW7vKafBR5PpSc5vOQSny
 2siSZUdg==;
Received: from [187.36.213.55] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1tXMfM-00FEpb-Tx; Mon, 13 Jan 2025 16:47:49 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 1/2] drm/v3d: Ensure job pointer is set to NULL after job
 completion
Date: Mon, 13 Jan 2025 12:47:40 -0300
Message-Id: <20250113154741.67520-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After a job completes, the corresponding pointer in the device must
be set to NULL. Failing to do so triggers a warning when unloading
the driver, as it appears the job is still active. To prevent this,
assign the job pointer to NULL after completing the job and signaling
the fence, indicating the job has finished.

Fixes: 14d1d1908696 ("drm/v3d: Remove the bad signaled() implementation")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_irq.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
index 20bf33702c3c..da203045df9b 100644
--- a/drivers/gpu/drm/v3d/v3d_irq.c
+++ b/drivers/gpu/drm/v3d/v3d_irq.c
@@ -108,6 +108,7 @@ v3d_irq(int irq, void *arg)
 		v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
 		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
+		v3d->bin_job = NULL;
 		status = IRQ_HANDLED;
 	}
 
@@ -118,6 +119,7 @@ v3d_irq(int irq, void *arg)
 		v3d_job_update_stats(&v3d->render_job->base, V3D_RENDER);
 		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
+		v3d->render_job = NULL;
 		status = IRQ_HANDLED;
 	}
 
@@ -128,6 +130,7 @@ v3d_irq(int irq, void *arg)
 		v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
 		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
+		v3d->csd_job = NULL;
 		status = IRQ_HANDLED;
 	}
 
@@ -165,6 +168,7 @@ v3d_hub_irq(int irq, void *arg)
 		v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
 		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
 		dma_fence_signal(&fence->base);
+		v3d->tfu_job = NULL;
 		status = IRQ_HANDLED;
 	}
 
-- 
2.39.5 (Apple Git-154)


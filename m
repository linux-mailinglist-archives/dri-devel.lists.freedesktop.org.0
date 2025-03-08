Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A43A57B10
	for <lists+dri-devel@lfdr.de>; Sat,  8 Mar 2025 15:34:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7F210E21B;
	Sat,  8 Mar 2025 14:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="TmxDxOQ0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF77510E21B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FcMGhykXB4u4YxIGnBy/HoDy7WeSl1BAMrtIHGKlZ4g=; b=TmxDxOQ0rvne4pTPdPJqhGNxCT
 Rz/KgNkrPUjkF4mYIfWlUW3NPnUsTognzx70+pqBlENc66DlIwxjZ3XHbxhrtL/lIBeJs/ETtXeyz
 mBCKyRgV+NCJn3CiZh8g+oWtvOAcWrVBEwc4EAZ+ykNW2j+CKX9b31ZDeEyx1SbfpcLNyjCFjjZAV
 MHv9h/zQklPXSJvJ/RQlScJ0yTlgltXq4/6/7sYgfzS0WK3RtUnityXk49mlUI0LGOndjFz7oIJQB
 wF5CpJUWTym20VwLs88rN1s4Bol/4lvlCaa07nlIl1tAKfrShn4wszOHTtIXzKAca5adRoRXlDx4N
 +QDAhlJg==;
Received: from [189.7.87.170]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tqvFl-005pPS-1P; Sat, 08 Mar 2025 15:34:19 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 08 Mar 2025 11:33:40 -0300
Subject: [PATCH v2 1/6] drm/v3d: Don't run jobs that have errors flagged in
 its fence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250308-v3d-gpu-reset-fixes-v2-1-2939c30f0cc4@igalia.com>
References: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
In-Reply-To: <20250308-v3d-gpu-reset-fixes-v2-0-2939c30f0cc4@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 kernel-dev@igalia.com, stable@vger.kernel.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2200; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pUXjA+I7tCLIoH3bNrkO4IB28zYBbl1H9vaCVIpHHNI=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBnzFVi++EmDNEIABjpW1dFJsVTM9TUkcaJMjH1H
 Mn24WxE5VaJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ8xVYgAKCRA/8w6Kdoj6
 qncxCAC1BsVE/+rd/5CBk99dP6q258eaIklztgwalzAbiAUwshdzyLG9cyZ6u2ytuxTBrqTbrWp
 smHnDQZacnljblWiy6NJr/ly5cUEKsAfJn1TU8gKt5WCtLS/FE7qUUuBGx22R5YilueAXP65oYh
 RfDNjYPv8QaMiWVHvIip5w04wGOsdxc1Wnw8RDFIyOrtsjTEVIKQt8iEZhtYI6syqq3M5XQTwFw
 iK9ucM8EPbKJzSCtY44v0ncyQPcEy1dqrpAh6dvoPuSSEZkKRHePNcBV5M73S2CnibZr1MoAdCj
 XSENA1clkVLEyxpKXMfBOPI796KoB9ZbMz87CHJy64vqe6e+
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

The V3D driver still relies on `drm_sched_increase_karma()` and
`drm_sched_resubmit_jobs()` for resubmissions when a timeout occurs.
The function `drm_sched_increase_karma()` marks the job as guilty, while
`drm_sched_resubmit_jobs()` sets an error (-ECANCELED) in the DMA fence of
that guilty job.

Because of this, we must check whether the job’s DMA fence has been
flagged with an error before executing the job. Otherwise, the same guilty
job may be resubmitted indefinitely, causing repeated GPU resets.

This patch adds a check for an error on the job's fence to prevent running
a guilty job that was previously flagged when the GPU timed out.

Note that the CPU and CACHE_CLEAN queues do not require this check, as
their jobs are executed synchronously once the DRM scheduler starts them.

Cc: stable@vger.kernel.org
Fixes: d223f98f0209 ("drm/v3d: Add support for compute shader dispatch.")
Fixes: 1584f16ca96e ("drm/v3d: Add support for submitting jobs to the TFU.")
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 80466ce8c7df669280e556c0793490b79e75d2c7..c2010ecdb08f4ba3b54f7783ed33901552d0eba1 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -327,11 +327,15 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
+	if (unlikely(job->base.base.s_fence->finished.error))
+		return NULL;
+
+	v3d->tfu_job = job;
+
 	fence = v3d_fence_create(v3d, V3D_TFU);
 	if (IS_ERR(fence))
 		return NULL;
 
-	v3d->tfu_job = job;
 	if (job->base.irq_fence)
 		dma_fence_put(job->base.irq_fence);
 	job->base.irq_fence = dma_fence_get(fence);
@@ -369,6 +373,9 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int i, csd_cfg0_reg;
 
+	if (unlikely(job->base.base.s_fence->finished.error))
+		return NULL;
+
 	v3d->csd_job = job;
 
 	v3d_invalidate_caches(v3d);

-- 
Git-154)


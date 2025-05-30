Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F82AC90EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D269410E86B;
	Fri, 30 May 2025 14:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qj/4cClg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C3110E86B;
 Fri, 30 May 2025 14:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kLpIUMnbN4l/bbHtM3rH1KL6Dfyais9D1USbXWrKJa0=; b=qj/4cClgzmUDGG+r7qoifFSxa0
 eDjrZDRXCgs10s3eZdwXkJM0NYCOcLhGYbOu8+XUe+p8Y240VQ/b9jSZur5AJuEc3GNxbMlMunj8T
 CW1yyjBVxk5azKsLzKW6VBB6rX6W4iVbuFLw1hSPm25g9xGJWEiB08K5Ok1mL2xgtEcwb14RZJHiQ
 pVAPyRKBqOXgI+yIpDor9N4Kvq4TV0YBY8KHGJNONPf8ZHFzBATUJMEgFjn4Kwq5mlDGub7/o824l
 rlW8FaEzmoGLH4Ui7URPl1lWFuTa63N2sFRaxC5uCtVuU7zq9dCO5C6EEpm/TD27kStdNPAFQPk62
 N7u/0TJQ==;
Received: from [189.7.87.163]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uL0K3-00FFzl-20; Fri, 30 May 2025 16:02:59 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 30 May 2025 11:01:36 -0300
Subject: [PATCH v2 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sched-skip-reset-v2-7-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=aXuRIWaU9551VluZchZ6PYhW63rrSuQBtRFVU2gp1CM=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoObpVWxmhKNnqOGxJQCxeXDT2wXvywk9Bqcn77
 pFQc2maAhWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaDm6VQAKCRA/8w6Kdoj6
 qnWrCADZb9xD7XL6CvyqydGyI3sF5mwUtcU19Qr+ueRxy/gh32nYldOFQaQHuVCz3MhXeIg6bYZ
 Iegi9oSAFgih5yAVAEtkI+2ju1ZCrYeSoUExP4rvYVW6e82VMg0fmIDcMxOgzQQzj03ibfC7T85
 C6TmB2cbQnF9/G+pKtuvS941oAnV2fNGWnVgW6qHvOZhYewMd3mYgMb09/pHWBdz15lnGLaTo4O
 PqN/E3dmGDpmBFmdWLgZc+qbqru4rEF6xWtwXAXVWuV+p/l1tOiiJWZkp5MIiJfFT2Jg91Hw55s
 77b1bmvTQq9gwuE9k2ELQmdD5mTC0XE6tdEBPmxJG0r2yeyZ
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

Xe can skip the reset if TDR has fired before the free job worker and can
also re-arm the timeout timer in some scenarios. Instead of using the
scheduler internals to add the job to the pending list, use the
DRM_GPU_SCHED_STAT_NO_HANG status to skip the reset and re-arm the timer.

Note that, in the first case, there is no need to restart submission if it
hasn't been stopped.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 98363d688cbbf884e17e6610366202a3372f5fe0..0149c85aa1a85b2b2e739774310d7b3265e33228 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1067,12 +1067,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_sched_add_pending_job(sched, job);
-		xe_sched_submission_start(sched);
-
-		return DRM_GPU_SCHED_STAT_RESET;
-	}
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
@@ -1247,10 +1243,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
-	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
-
-	return DRM_GPU_SCHED_STAT_RESET;
+	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)

-- 
2.49.0


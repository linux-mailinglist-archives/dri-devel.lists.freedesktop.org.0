Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96C1A5CD81
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 19:14:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA1910E660;
	Tue, 11 Mar 2025 18:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XuITvY7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0B810E65F
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Glfxkk93kLTkDL1Uqox9uWKHfSjCb00r31qIcpMQ4Bo=; b=XuITvY7sAUTJbhC8CR+inRL7+x
 kfQBnPo+oV6sTAa5D2FHLENPU5cOvSxDxTXVtDzdL4M8lU78fu70tLOzO8M+kCc7EedjHbMKs49ar
 9JyNZW4t5/WJYoDs/Cby25aO213Z4xbpnEZ13P09ibeo6lmWRPA9VZBSEXAJmSPBl8rqmwon3NVM/
 qtOyPc98R8AFRohJ5gKTmKOonGjZo+3Wxz0JNqvxO4hIhfsTFiKQYOIQgY2ebr2euZh17Gv9yvAQ9
 cHfGI1/cgZgwOdFnZbXR7/xictpYiLZnc2yjJ6NIJrFzuvcD/zooivRrdonYej2umMvAgas3ny5SK
 1KEVdE0A==;
Received: from [189.7.87.170] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ts47Q-007Dal-9z; Tue, 11 Mar 2025 19:14:26 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 11 Mar 2025 15:13:44 -0300
Subject: [PATCH v3 2/7] drm/v3d: Set job pointer to NULL when the job's
 fence has an error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250311-v3d-gpu-reset-fixes-v3-2-64f7a4247ec0@igalia.com>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
In-Reply-To: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, kernel-dev@igalia.com, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2839; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=rseNujO8UsyKs/oHYgAXBvqaoSwHFpy7vMnbmHRQuZY=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBn0H110uw/+B8Y0Bilj5K3Co/BoS2co3x9bj4gr
 hrA9cpbsPCJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCZ9B9dQAKCRA/8w6Kdoj6
 qvqOCADOL8EEtdkGZQSy5SlMbxskwDeTprSxmXj0Zoeua2GIWmx9nBEEBvP5ECCZxYstnsPQWgF
 O5JAAHXKOb8Ja21wrZIod4yBiOmAuTUOZVpiXjRg67UM9T5VGtsUE6iOnM9n5cGHGtQLjPyg8W2
 BKjEktTPg1jd60Jvw7tQ7Z6yeqZESuWrTORUpV7Bs6dLrx4OcjqAuqtB3N3lVE1ys/xhcQCDj7y
 HEwI9ZR6ysCShI25cnABurAt1d4Ks8+qNnrRxNLxpEmbEPMoJdypLSs0izD1QuLI9Innk6NPNmV
 YEBko9LZiHxTbJjdukV40JWC+9iKRXmYalBtgS15xxauR+VP
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

Similar to commit e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to
NULL after job completion"), ensure the job pointer is set to `NULL` when
a job's fence has an error. Failing to do so can trigger kernel warnings
in specific scenarios, such as:

1. v3d_csd_job_run() assigns `v3d->csd_job = job`
2. CSD job exceeds hang limit, causing a timeout → v3d_gpu_reset_for_timeout()
3. GPU reset
4. drm_sched_resubmit_jobs() sets the job's fence to `-ECANCELED`.
5. v3d_csd_job_run() detects the fence error and returns NULL, not
   submitting the job to the GPU
6. User-space runs `modprobe -r v3d`
7. v3d_gem_destroy()

v3d_gem_destroy() triggers a warning indicating that the CSD job never
ended, as we didn't set `v3d->csd_job` to NULL after the timeout. The same
can also happen to BIN, RENDER, and TFU jobs.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index c2010ecdb08f4ba3b54f7783ed33901552d0eba1..34c42d6e12cde656d3b51a18be324976199eceae 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -226,8 +226,12 @@ static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	unsigned long irqflags;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		spin_lock_irqsave(&v3d->job_lock, irqflags);
+		v3d->bin_job = NULL;
+		spin_unlock_irqrestore(&v3d->job_lock, irqflags);
 		return NULL;
+	}
 
 	/* Lock required around bin_job update vs
 	 * v3d_overflow_mem_work().
@@ -281,8 +285,10 @@ static struct dma_fence *v3d_render_job_run(struct drm_sched_job *sched_job)
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->render_job = NULL;
 		return NULL;
+	}
 
 	v3d->render_job = job;
 
@@ -327,8 +333,10 @@ v3d_tfu_job_run(struct drm_sched_job *sched_job)
 	struct drm_device *dev = &v3d->drm;
 	struct dma_fence *fence;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->tfu_job = NULL;
 		return NULL;
+	}
 
 	v3d->tfu_job = job;
 
@@ -373,8 +381,10 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
 	struct dma_fence *fence;
 	int i, csd_cfg0_reg;
 
-	if (unlikely(job->base.base.s_fence->finished.error))
+	if (unlikely(job->base.base.s_fence->finished.error)) {
+		v3d->csd_job = NULL;
 		return NULL;
+	}
 
 	v3d->csd_job = job;
 

-- 
Git-154)


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E807AF85E6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 05:06:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CD610E923;
	Fri,  4 Jul 2025 03:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Uq/e4eJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62ABB10E923;
 Fri,  4 Jul 2025 03:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lrLB2w6XrBgAxl5WGmLus+DTYqxCa+sn6BI6H1HllKo=; b=Uq/e4eJI2lwXVCTC52RtDGs9hK
 UcMgFPHuTq+Io5OQWpkta3DpG2kw6OyaST+NrYx5jz0Vt4WG3o7f47NzZz8Lk7erPchG+K34t17s3
 GYAUgNVInwxuMABkq7fP8uMbNB0wUsiCZtvdfoA44Coa6nAscNdhfXilKrkL/QEfdQ8pdcx71A9cx
 7s9i1yw12bzNsdTiUz/4usb4dMF1X6oShVZLnfisevlWYTH00HLjJw0IHyGIKZHQmOjXcVlQnVZIH
 J5O/e17kZA5TqqTrmk96dJClgOEXCDjbIYFiTH9wJK5bWWGpWgHxcKtphaQU2InbS6vmZPFTpXjXN
 1uz72BYw==;
Received: from [179.100.5.63] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uXWl5-00CBhm-JO; Fri, 04 Jul 2025 05:06:39 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Dave Airlie <airlied@gmail.com>
Subject: [PATCH] drm/amdgpu: Fix lifetime of struct amdgpu_task_info after
 ring reset
Date: Fri,  4 Jul 2025 00:06:29 -0300
Message-ID: <20250704030629.1064397-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
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

When a ring reset happens, amdgpu calls drm_dev_wedged_event() using
struct amdgpu_task_info *ti as one of the arguments. After using *ti, a
call to amdgpu_vm_put_task_info(ti) is required to correctly track its
lifetime.

However, it's called from a place that the ring reset path never reaches
due to a goto after drm_dev_wedged_event() is called. Move
amdgpu_vm_put_task_info() bellow the exit label to make sure that it's
called regardless of the code path.

amdgpu_vm_put_task_info() can only accept a valid address or NULL as
argument, so initialise *ti to make sure we can call this function if
*ti isn't used.

Fixes: a72002cb181f ("drm/amdgpu: Make use of drm_wedge_task_info")
Reported-by: Dave Airlie <airlied@gmail.com>
Closes: https://lore.kernel.org/dri-devel/CAPM=9tz0rQP8VZWKWyuF8kUMqRScxqoa6aVdwWw9=5yYxyYQ2Q@mail.gmail.com/
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 1e24590ae144..e69366401f6b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -90,7 +90,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_job->sched);
 	struct amdgpu_job *job = to_amdgpu_job(s_job);
 	struct drm_wedge_task_info *info = NULL;
-	struct amdgpu_task_info *ti;
+	struct amdgpu_task_info *ti = NULL;
 	struct amdgpu_device *adev = ring->adev;
 	int idx;
 	int r;
@@ -172,8 +172,6 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	}
 	dma_fence_set_error(&s_job->s_fence->finished, -ETIME);
 
-	amdgpu_vm_put_task_info(ti);
-
 	if (amdgpu_device_should_recover_gpu(ring->adev)) {
 		struct amdgpu_reset_context reset_context;
 		memset(&reset_context, 0, sizeof(reset_context));
@@ -199,6 +197,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(struct drm_sched_job *s_job)
 	}
 
 exit:
+	amdgpu_vm_put_task_info(ti);
 	drm_dev_exit(idx);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6243AA82D6
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2DA10E231;
	Sat,  3 May 2025 21:00:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XyDr2o3t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827C910E22D;
 Sat,  3 May 2025 21:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tqfA2+4260HrEQlv2u+oOMLeXtASIKN6f20W7p0MxWA=; b=XyDr2o3tbAjU3KIXdmPUeJPz15
 ARR2If1Gjvu1/51hNQuREwSy0WkRTRgMNhgiCtfnmbqRW2XxLzIWmcBbONBGVVHkNTBBTbtXVULW3
 GVWkY22zsOd36tQBQYV/zCqywr9OcnK8H7aqhhdfvtUGQrULBnDrge+VVplcTobiyPgmaj8ctVipS
 9yM6txBfiQ9ESkIy1dP2/ohl/NbvBTPG4l/KN0/N9F2ONE5DHw0K1+UTYAPauvo9mL2ewaCTEXaQX
 B5Ez3AYEncyJARNRi/rdyCFcmDHAG/ho9Bznzkl0/hkbJVFle3yqjssR24SukO0AJVH1Po2thhb5h
 WBQ/xXIA==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJw6-002dbs-4r; Sat, 03 May 2025 23:00:42 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:53 -0300
Subject: [PATCH 2/8] drm/sched: Always free the job after the timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-2-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3141; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=5wGqnyH66Huj/9y95IX2zDjrhXIFjuJprdlIo9HtFHE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoFoPmygWxPmF+bE6RkcMf+CeaOIDmDyaizdBzX
 IgaH9/+fgyJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaBaD5gAKCRA/8w6Kdoj6
 qjHYCACLD/WSaqL27cYjrNeyX8N5G+z2aUa0NiIhIRJ0fgEk9is2TMJei8QLlVK4e4jgk/pmnZV
 WEMzduOqCkmkISMoNTpr55eEGN7g5siZKWPC/AxsXNishHMExiRhY8TNfqXQokB8GihXSj9cCLQ
 V3/tDvuEO2GpZog0jdRfAWBJJstOW1AbRf9kuV1ZA4PkDo4ZTpaSYiFRVqdHyS5HaUrLViZuCbl
 pYLIwgT65XICJXrG0SMIq+On0FCICPpTeAFO3TNn7Iu7mTSm4Upnyxx66qXx67IBKlcCvKw8ImM
 Kz34Wl+sNhPmtbpCWnQIADkg4oGkONOgRlJUTQ5K54kiC0Nu
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

Currently, if we add the assertions presented in this commit to the mock
scheduler, we will see the following output:

[15:47:08] ============== [PASSED] drm_sched_basic_tests ==============
[15:47:08] ======== drm_sched_basic_timeout_tests (1 subtest) =========
[15:47:08] # drm_sched_basic_timeout: ASSERTION FAILED at drivers/gpu/drm/scheduler/tests/tests_basic.c:246
[15:47:08] Expected list_empty(&sched->job_list) to be true, but is false
[15:47:08] [FAILED] drm_sched_basic_timeout
[15:47:08] # module: drm_sched_tests

This occurs because `mock_sched_timedout_job()` doesn't properly handle
the hang. From the DRM sched documentation, `drm_sched_stop()` and
`drm_sched_start()` are typically used for reset recovery. If these
functions are not used, the offending job won't be freed and should be
freed by the caller.

Currently, the mock scheduler doesn't use the functions provided by the
API, nor does it handle the freeing of the job. As a result, the job isn't
removed from the job list.

This commit mocks a GPU reset by stopping the scheduler affected by the
reset, waiting a couple of microseconds to mimic a hardware reset, and
then restart the affected scheduler.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 10 ++++++++++
 drivers/gpu/drm/scheduler/tests/tests_basic.c    |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index f999c8859cf7adb8f06fc8a37969656dd3249fa7..e9af202d84bd55ea5cc048215e39f5407bc84458 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (c) 2025 Valve Corporation */
 
+#include <linux/delay.h>
+
 #include "sched_tests.h"
 
 /*
@@ -203,10 +205,18 @@ static struct dma_fence *mock_sched_run_job(struct drm_sched_job *sched_job)
 static enum drm_gpu_sched_stat
 mock_sched_timedout_job(struct drm_sched_job *sched_job)
 {
+	struct drm_mock_scheduler *sched =
+		drm_sched_to_mock_sched(sched_job->sched);
 	struct drm_mock_sched_job *job = drm_sched_job_to_mock_job(sched_job);
 
 	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
 
+	drm_sched_stop(&sched->base, &job->base);
+
+	usleep_range(200, 500);
+
+	drm_sched_start(&sched->base, 0);
+
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594c6246f02608f07fcb1f8d738ac75..8f960f0fd31d0af7873f410ceba2d636f58a5474 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -241,6 +241,9 @@ static void drm_sched_basic_timeout(struct kunit *test)
 			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
 			DRM_MOCK_SCHED_JOB_TIMEDOUT);
 
+	KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
+	KUNIT_ASSERT_TRUE(test, list_empty(&sched->done_list));
+
 	drm_mock_sched_entity_free(entity);
 }
 

-- 
2.49.0


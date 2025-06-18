Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A8ADF023
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA99210E88C;
	Wed, 18 Jun 2025 14:49:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="JNaStKwA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B2810E884;
 Wed, 18 Jun 2025 14:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CvRjQqs1qamojFdh4wzODKgKrCiVjomWIXbZwNRbmbM=; b=JNaStKwAVQ9rcS2j/1NtqMFfRK
 09IB3SOgbKk9TanzBBG1FNl4GciF379lNVZtU6mhRHOwTW+dT/bNaPqTPlaJI3yrv+htyxSJ3JCqc
 bmXpVqBwrqayx6F2Rn6b7xIQasRoZA/aWjGkNFz4tx/XxApOwlLzkK9Ej2brlV8+EAXCmJUayIDKk
 DTIRmRob0HmzRLn5ZtEYMu5E6uDEjxi68PQ7ghrAyQhmE6eIv5Hs5sphyAb9r+WBdaODJ8AGXY7WA
 eEJcdNWjd0UMATSUyggsV+Jv64NKSIeOcmhPIbpU+LGFeXhnxErshY34ceKEQlKDett/EEaqbBpTm
 6csT+3tw==;
Received: from [189.7.87.79] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRu6h-0056pP-G2; Wed, 18 Jun 2025 16:49:43 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Jun 2025 11:47:44 -0300
Subject: [PATCH v3 3/8] drm/sched: Make timeout KUnit tests faster
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-sched-skip-reset-v3-3-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
In-Reply-To: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2159; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3Dg4drx8bcCtUQ4KKND1C5QifG7tgX4SBkKNyxkK3yU=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoUtHk6Nd2JYW5e0FRe4X51zK6EWWBr0jEBwtu4
 jXXVYa4IByJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaFLR5AAKCRA/8w6Kdoj6
 qhEyB/99E0sUJuQTff3GsqfLzt9WCPvi5roNziPCA+DCtcs0oFkZb0MIbLGgntIfCRfVpQCWQvY
 krICUXQH7ATAa8quDXJ3URWcttzjADvfrGNoVBqX1VXv3+jl/TsSBeqXC/+Cw23ap6kbprdBJyN
 BeAsl8F0f5DPNl2c3PiTWgEhSfVPudOHHfq8chx9mPg5CaCCERL4yDupkKOMGdq6c5J86Xlzu+p
 IQEfh/nJ9i1H2EgnyqFh6tz9Ci9Szx+Ah3vzZUxpd+F8yYkXXXCK8qJXE8F09wbZVURD3aAjwlA
 8ofKlH4FG3plEhPb2m9g7YbDCxiY1VCI/0w5+Ut6mRlKbbt0
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

As more KUnit tests are introduced to evaluate the basic capabilities of
the `timedout_job()` hook, the test suite will continue to increase in
duration. To reduce the overall running time of the test suite, decrease
the scheduler's timeout for the timeout tests.

Before this commit:

[15:42:26] Elapsed time: 15.637s total, 0.002s configuring, 10.387s building, 5.229s running

After this commit:

[15:45:26] Elapsed time: 9.263s total, 0.002s configuring, 5.168s building, 4.037s running

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index 7230057e0594c6246f02608f07fcb1f8d738ac75..41c648782f4548e202bd8711b45d28eead9bd0b2 100644
--- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
+++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
@@ -5,6 +5,8 @@
 
 #include "sched_tests.h"
 
+#define MOCK_TIMEOUT (HZ / 5)
+
 /*
  * DRM scheduler basic tests should check the basic functional correctness of
  * the scheduler, including some very light smoke testing. More targeted tests,
@@ -28,7 +30,7 @@ static void drm_sched_basic_exit(struct kunit *test)
 
 static int drm_sched_timeout_init(struct kunit *test)
 {
-	test->priv = drm_mock_sched_new(test, HZ);
+	test->priv = drm_mock_sched_new(test, MOCK_TIMEOUT);
 
 	return 0;
 }
@@ -227,14 +229,14 @@ static void drm_sched_basic_timeout(struct kunit *test)
 	done = drm_mock_sched_job_wait_scheduled(job, HZ);
 	KUNIT_ASSERT_TRUE(test, done);
 
-	done = drm_mock_sched_job_wait_finished(job, HZ / 2);
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT / 2);
 	KUNIT_ASSERT_FALSE(test, done);
 
 	KUNIT_ASSERT_EQ(test,
 			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
 			0);
 
-	done = drm_mock_sched_job_wait_finished(job, HZ);
+	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
 	KUNIT_ASSERT_FALSE(test, done);
 
 	KUNIT_ASSERT_EQ(test,

-- 
2.49.0


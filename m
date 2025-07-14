Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C3B04A01
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7474510E4F4;
	Mon, 14 Jul 2025 22:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QAE3RKXg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F23A10E4F4;
 Mon, 14 Jul 2025 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d7QkvqccB6PBnZc3Jmi5DcNB1b+Ga1qarORCeJAcAqw=; b=QAE3RKXgD/0XSrTBxFbegP9hkF
 YqLP8yvoG3oFFYheJBatECFHvJ7AofJ0UrCcHHdnjvpCvn1AWXpJe8OqCmcjLNYQty9wHbzI4/+b1
 212V5BEf3KSGH40kYFaF87cisxaaFUp3OEb5dA6hlJ1ApQnwLF45Ux7Rsba8WyiAPr/Pgsx+6DGdo
 zMvZsHowiCa9Mc3WCaoO8vMqIETqg7ddV00KRJL12tMrO+peOh490/Ca02RQFPgbOVUrrI+EHttEa
 MCn7lQ0hzpDb9oCjOiyoEzkxzTnPFQ7vLRa60u96DKX4jjCQ56TQ6a/YtnoYzbZ+w+yNH46j5V2ID
 Mj5HVfSw==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRL5-00Gaod-7t; Tue, 15 Jul 2025 00:07:59 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:04 -0300
Subject: [PATCH v6 3/8] drm/sched: Make timeout KUnit tests faster
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-3-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2206; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=pjjPSupreEZqKAsVzoiMdXtmJX1TIrJVPhUbQ7QpD/k=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+acQiDrEVEmtS599vrYq4R9XSJD2F5z9wAU
 udb91jE3u+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mgAKCRA/8w6Kdoj6
 qrALB/0XsmNxiDvoENtgGBrt5sLhdqSI6hNvAXqcXrqA8adWbuH8UjEYawtUktynwnvQcAYJ6zx
 /L0LC1oD2vtT62TFoVe3J2podJZJytIyBscHpPlZHNT+oKuVhKzblgO/LHWZAOVUEAFB/ecPoU5
 J38XbKK3X+MGTmwGv0j2Ach1TTnhmSxHRVQFdfS/+ukWc1S8CxHmdgPRuD2rX+1e543etcrNF6q
 Y8d/pYppvefNlELI17TIcQvvSqhZMBRTWL1hbE1kMNslf/AKVm3/+TPEL4xxcQHPHS9QlYkeEs4
 dACBx1H++1nsgEYm/BPLF7eHE9lMHAIuSdMuzYftyA9zO484
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
Acked-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
index b1ae10c6bb3735f04471e5c59815e2d601b32ef2..8153c2e7af772cd9f12c1479815678464df6c47b 100644
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
@@ -268,14 +270,14 @@ static void drm_sched_basic_timeout(struct kunit *test)
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
2.50.0


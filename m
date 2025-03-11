Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2152A5BC0A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A6010E53F;
	Tue, 11 Mar 2025 09:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MngOh1n9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE68410E53E
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TkvCdGqsOLPVAtwvMfdp4GA8VI0AUKRvpqoDXz229Cc=; b=MngOh1n98jvZtwwS0UXQ4qWNIa
 cPn7B579zZ2BEwupa9vgSI7thiUyhHt/xhu0wTF3/bUayJXhie7AOBeLT78EBJlLh6siSslf8YRsV
 F8WhGqhrUTs0HZ5aCWKf/IUhdedPMsKmR0qpMFrFDWy23hhwUCoeTs7wsyeZRg+/xmJjqUQdhe9g4
 z78R3C5WMtX4BgOHjCLglbDEcVVhr1IzHt2kjLg8CMe3afvoY0mKESNFEz6d9Wb039K5OFrRv/2nR
 W2/3KJ6vVHjp/Z7exXPuMVzNgNqmBFATrzoKwsU7CA5tYiUcBrlVMCwsoX3i4LAjYwz9hnNf/VrYB
 kiMWzo3g==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1trvpr-006yTB-4h; Tue, 11 Mar 2025 10:23:45 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v7 3/7] drm/sched: Add aspirational unit test mode
Date: Tue, 11 Mar 2025 09:23:35 +0000
Message-ID: <20250311092339.52199-4-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
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

Aspirational unit test mode can be activated via
CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL and will test the scheduler not
against the criteria of how it is implemented today, but according to the
future design goals and agreements.

First example of this is the scheduler cleanup flow which currently can
leak jobs from drivers which fail to implement own tear down of in-flight
submissions.

The test which can demonstrate this is
drm_sched_basic_entity_cleanup which, based on this kconfig, will skip the
mock scheduler specific cleanup and instead rely on drm_sched_fini to idle
and free everything. That will not currently happen and therefore
drm_mock_sched_fini will assert on test exit.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Suggested-by: Philipp Stanner <phasta@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/Kconfig.debug                    | 13 +++++++++++++
 drivers/gpu/drm/scheduler/tests/mock_scheduler.c | 10 ++++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig.debug b/drivers/gpu/drm/Kconfig.debug
index 6fd4c5669400..e98ff556e4c4 100644
--- a/drivers/gpu/drm/Kconfig.debug
+++ b/drivers/gpu/drm/Kconfig.debug
@@ -111,5 +111,18 @@ config DRM_SCHED_KUNIT_TEST
 
 	  If in doubt, say "N".
 
+config DRM_SCHED_KUNIT_TEST_ASPIRATIONAL
+	bool "Aspirational mode for DRM scheduler unit tests" if !KUNIT_ALL_TESTS
+	depends on DRM && KUNIT && DRM_SCHED_KUNIT_TEST
+	default n
+	help
+	  Choose this option to make the DRM scheduler unit tests test for
+	  behaviour which was agreed as a design goal, even if the current
+	  implementation can make specific tests fail.
+
+	  Recommended for driver developers only.
+
+	  If in doubt, say "N".
+
 config DRM_EXPORT_FOR_TESTS
 	bool
diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
index b7d4890a1651..69b963b619d5 100644
--- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
+++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
@@ -261,9 +261,13 @@ struct drm_mock_scheduler *drm_mock_sched_new(struct kunit *test)
 void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 {
 	struct drm_mock_sched_job *job, *next;
+	struct kunit  *test = sched->test;
 	unsigned long flags;
 	LIST_HEAD(signal);
 
+	if (IS_ENABLED(CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL))
+		goto sched_fini;
+
 	drm_sched_wqueue_stop(&sched->base);
 
 	spin_lock_irqsave(&sched->lock, flags);
@@ -278,7 +282,13 @@ void drm_mock_sched_fini(struct drm_mock_scheduler *sched)
 		drm_sched_job_cleanup(&job->base);
 	}
 
+sched_fini:
 	drm_sched_fini(&sched->base);
+
+	if (IS_ENABLED(CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL)) {
+		KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
+		KUNIT_ASSERT_TRUE(test, list_empty(&sched->base.pending_list));
+	}
 }
 
 /**
-- 
2.48.0


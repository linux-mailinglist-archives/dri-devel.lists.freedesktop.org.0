Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E77A5BC09
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 10:24:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AB8D10E53B;
	Tue, 11 Mar 2025 09:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GJIM0J9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7BE10E53A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 09:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vRPPkJQfi0HPx+7pSPDJXtg72XU+Fk79I+K8Re++rD4=; b=GJIM0J9dJQrd4Lwgww/3M+V+ha
 3fGXGtyg+RCU6gu3+Jwwq4pMhifxea9dUrvLzYDIdiNUfxrA+DmzDLOOZArbZ+wlgjhn3W5fKE5wm
 KtJgIV+W2u1sIiA9hUMdKnF52RjB1t5re+mya6NlQhPyzduv8v3UigL8948OG9VR1CExGr5WS9TB3
 jncGgdYLMLqs8rzfdeh53eDfpgv5nQcE6N1Ms2I5KFvW2iQpWoEKjxL4HbwUJ2JhKI3iHmtHZ2wl0
 Wok2oqDqhvXED93qN9HskY2cZL1X+kj5LopWd95pnsVgAnnGS097VxEY6u2SyLHKeLmtVeX8zMRVM
 y4hUeTkw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1trvpo-006ySy-V2; Tue, 11 Mar 2025 10:23:42 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v7 0/7] DRM scheduler kunit tests
Date: Tue, 11 Mar 2025 09:23:32 +0000
Message-ID: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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

There has repeatedly been quite a bit of apprehension when any change to the DRM
scheduler is proposed, with two main reasons being code base is considered
fragile, not well understood and not very well documented, and secondly the lack
of systematic testing outside the vendor specific tests suites and/or test
farms.

This series is an attempt to dislodge this status quo by adding some unit tests
using the kunit framework.

General approach is that there is a mock "hardware" backend which can be
controlled from tests, which in turn allows exercising various scheduler code
paths.

Only some simple basic tests get added in the series and hopefully it is easy to
understand what tests are doing.

An obligatory "screenshot" for reference:

[14:09:05] ============ drm_sched_basic_tests (3 subtests) ============
[14:09:06] [PASSED] drm_sched_basic_submit
[14:09:06] ================== drm_sched_basic_test  ===================
[14:09:06] [PASSED] A queue of jobs in a single entity
[14:09:06] [PASSED] A chain of dependent jobs across multiple entities
[14:09:06] [PASSED] Multiple independent job queues
[14:09:06] [PASSED] Multiple inter-dependent job queues
[14:09:07] ============== [PASSED] drm_sched_basic_test ===============
[14:09:07] [PASSED] drm_sched_basic_entity_cleanup
[14:09:07] ============== [PASSED] drm_sched_basic_tests ==============
[14:09:07] ======== drm_sched_basic_timeout_tests (1 subtest) =========
[14:09:08] [PASSED] drm_sched_basic_timeout
[14:09:08] ========== [PASSED] drm_sched_basic_timeout_tests ==========
[14:09:08] ======= drm_sched_basic_priority_tests (2 subtests) ========
[14:09:10] [PASSED] drm_sched_priorities
[14:09:10] [PASSED] drm_sched_change_priority
[14:09:10] ========= [PASSED] drm_sched_basic_priority_tests ==========
[14:09:10] ====== drm_sched_basic_modify_sched_tests (1 subtest) ======
[14:09:11] [PASSED] drm_sched_test_modify_sched
[14:09:11] ======= [PASSED] drm_sched_basic_modify_sched_tests ========
[14:09:11] ======== drm_sched_basic_credits_tests (1 subtest) =========
[14:09:12] [PASSED] drm_sched_test_credits
[14:09:12] ========== [PASSED] drm_sched_basic_credits_tests ==========
[14:09:12] ============================================================
[14:09:12] Testing complete. Ran 11 tests: passed: 11
[14:09:13] Elapsed time: 13.539s total, 0.001s configuring, 3.004s building, 10.462s running

v2:
 * Parameterize a bunch of similar tests.
 * Improve test commentary.
 * Rename TDR test to timeout. (Christian)
 * Improve quality and consistency of naming. (Philipp)

RFC v2 -> series v1:
 * Rebased for drm_sched_init changes.
 * Fixed modular build.
 * Added some comments.
 * Filename renames. (Philipp)

v2:
 * Dealt with a bunch of checkpatch warnings.

v3:
 * Some mock API renames, kerneldoc grammar fixes and indentation fixes.

v4:
 * Fix use after free caused by relying on scheduler fence for querying status.
 * Kerneldoc fixes.

v5:
 * Cleanup in-flight jobs on scheduler shutdown.
 * Change hang_limit to 1.

v6:
 * Use KUNIT_ASSERT_TRUE/FALSE.
 * Fixed patch titles.
 * Added credit_limit test.
 * Added CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL.

v7:
 * v6 omitted to send the first patch by mistake.

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (7):
  drm: Move some options to separate new Kconfig
  drm/sched: Add scheduler unit testing infrastructure and some basic
    tests
  drm/sched: Add aspirational unit test mode
  drm/sched: Add a simple timeout test
  drm/sched: Add basic priority tests
  drm/sched: Add a basic test for modifying entities scheduler list
  drm/sched: Add a basic test for checking credit limit

 drivers/gpu/drm/Kconfig                       | 109 +---
 drivers/gpu/drm/Kconfig.debug                 | 128 +++++
 drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
 drivers/gpu/drm/scheduler/Makefile            |   2 +
 drivers/gpu/drm/scheduler/tests/Makefile      |   7 +
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 345 +++++++++++++
 drivers/gpu/drm/scheduler/tests/sched_tests.h | 224 +++++++++
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 476 ++++++++++++++++++
 8 files changed, 1199 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c

-- 
2.48.0


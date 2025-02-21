Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126F0A3F3D5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 13:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B165910E1EF;
	Fri, 21 Feb 2025 12:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LJ6FgWjH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F3B10E1EF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IOjStTKrVf3IbIGuIwjljxpDQTnM5rUwDE1kwXUYODs=; b=LJ6FgWjHKVqCv84O8R5jcJUc+G
 0Ox6/rde5QzbBHFbiNqDJP64J60jfjPX8+TS9aCPDAEniTXT85RniPuvblaAXeZwf92yD8oPj/6jW
 MHQIurGg8vIAaXscbNTIHsSnra1mC82l4buiBB008plkfJRlVLUNb6dixNoZF0uucFHMkanANun8O
 Wtg7jJJnogys2EWe5R2YILkbhxmRja40EQ6y8jkYNFRtGvXQjX0cFKpTB2ES/UI3k4eHkYhKDfvTy
 f2CXcVbFpddmmf5nwian1mHnB8GG1L7+6tlU4cNNE6F8eRoUexDNEL7PU2uGDcbbfr+Mrfg2WcjKP
 auvibCzQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tlRqD-00G5G1-K2; Fri, 21 Feb 2025 13:09:19 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v2 0/5] DRM scheduler kunit tests
Date: Fri, 21 Feb 2025 12:09:12 +0000
Message-ID: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
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

[14:29:37] ============ drm_sched_basic_tests (3 subtests) ============
[14:29:38] [PASSED] drm_sched_basic_submit
[14:29:38] ================== drm_sched_basic_test  ===================
[14:29:38] [PASSED] A queue of jobs in a single entity
[14:29:38] [PASSED] A chain of dependent jobs across multiple entities
[14:29:38] [PASSED] Multiple independent job queues
[14:29:38] [PASSED] Multiple inter-dependent job queues
[14:29:38] ============== [PASSED] drm_sched_basic_test ===============
[14:29:38] [PASSED] drm_sched_basic_entity_cleanup
[14:29:38] ============== [PASSED] drm_sched_basic_tests ==============
[14:29:38] ======== drm_sched_basic_timeout_tests (1 subtest) =========
[14:29:40] [PASSED] drm_sched_basic_timeout
[14:29:40] ========== [PASSED] drm_sched_basic_timeout_tests ==========
[14:29:40] ======= drm_sched_basic_priority_tests (2 subtests) ========
[14:29:42] [PASSED] drm_sched_priorities
[14:29:42] [PASSED] drm_sched_change_priority
[14:29:42] ========= [PASSED] drm_sched_basic_priority_tests ==========
[14:29:42] ====== drm_sched_basic_modify_sched_tests (1 subtest) ======
[14:29:43] [PASSED] drm_sched_test_modify_sched
[14:29:43] ======= [PASSED] drm_sched_basic_modify_sched_tests ========
[14:29:43] ============================================================
[14:29:43] Testing complete. Ran 10 tests: passed: 10
[14:29:43] Elapsed time: 13.330s total, 0.001s configuring, 4.005s building, 9.276s running

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

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (5):
  drm: Move some options to separate new Kconfig
  drm/scheduler: Add scheduler unit testing infrastructure and some
    basic tests
  drm/scheduler: Add a simple timeout test
  drm/scheduler: Add basic priority tests
  drm/scheduler: Add a basic test for modifying entities scheduler list

 drivers/gpu/drm/Kconfig                       | 109 +----
 drivers/gpu/drm/Kconfig.debug                 | 115 +++++
 drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
 drivers/gpu/drm/scheduler/Makefile            |   2 +
 drivers/gpu/drm/scheduler/tests/Makefile      |   6 +
 .../gpu/drm/scheduler/tests/mock_scheduler.c  | 324 +++++++++++++
 drivers/gpu/drm/scheduler/tests/sched_tests.h | 222 +++++++++
 drivers/gpu/drm/scheduler/tests/tests_basic.c | 425 ++++++++++++++++++
 8 files changed, 1111 insertions(+), 104 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c

-- 
2.48.0


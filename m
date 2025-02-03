Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4CA25EB1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 16:30:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5315810E117;
	Mon,  3 Feb 2025 15:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ip10a0Lv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE1510E021
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=n7yEzfTFiJNwpSgkUjYMH61SLfUC8V6kCLsoTkkJP20=; b=Ip10a0LvCzGNzF79ZaPcPoMB6C
 oLVQyWEHGZUNFm/4z/z8jgUZSd7m37U+tSSqPjSFhMEibTQICrL5Bb17xBZ9HvqQ9CCWiW2Iett0T
 pmRhr8taqtOCmGiV1jSJnqKzVnxwl/ObrKikJpAyQRF5I3qPlfcp8Hb1T06mE1DGZxx8Lo5jMNSnT
 AwbVCEVycxU01dMpnJTwj3QEZ0ETsZN7ms3zn7YOf1RpQ/ccTEWiAk9cIKmF0kH1/GkvL1RVEFCos
 OtngjS0BmIceeE2gM/J+rtQ3W/dcayeHJ0KOeIr5jTx1nRyoH/UfxgPICWLWRZZfXqfZkB9k/6Amn
 PpWFHzuw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1teyOl-0035qz-DS; Mon, 03 Feb 2025 16:30:13 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <phasta@kernel.org>
Subject: [RFC 0/5] DRM scheduler kunit tests
Date: Mon,  3 Feb 2025 15:30:01 +0000
Message-ID: <20250203153007.63400-1-tvrtko.ursulin@igalia.com>
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

This RFC is an attempt to dislodge this status quo by adding some unit tests
using the kunit framework.

General approach is that there is a mock "hardware" backend which can be
controlled from tests, which in turn allows exercising various scheduler code
paths.

I am sending this early as an RFC so we can get alignment on the general idea
and high level approach. Once past that point we can polish and then hopefully
people can go crazy and start adding more advanced tests, testing corner cases
and what not.

Only some simple basic tests get added in the series and hopefully it is easy to
understand what tests are doing.

My usage of the kunit framework may not be perfect though, since this series is
my first attempt to use it.

An obligatory "screenshot" for reference:

[15:16:33] ============ drm_sched_basic_tests (6 subtests) ============
[15:16:33] [PASSED] drm_sched_basic_submit
[15:16:33] [PASSED] drm_sched_basic_queue
[15:16:34] [PASSED] drm_sched_basic_chain
[15:16:34] [PASSED] drm_sched_basic_entities
[15:16:34] [PASSED] drm_sched_basic_entities_chain
[15:16:34] [PASSED] drm_sched_basic_entity_cleanup
[15:16:34] ============== [PASSED] drm_sched_basic_tests ==============
[15:16:34] ========== drm_sched_basic_tdr_tests (1 subtest) ===========
[15:16:36] [PASSED] drm_sched_basic_tdr
[15:16:36] ============ [PASSED] drm_sched_basic_tdr_tests ============
[15:16:36] ======= drm_sched_basic_priority_tests (2 subtests) ========
[15:16:37] [PASSED] drm_sched_priorities
[15:16:37] [PASSED] drm_sched_change_priority
[15:16:37] ========= [PASSED] drm_sched_basic_priority_tests ==========
[15:16:37] ====== drm_sched_basic_modify_sched_tests (1 subtest) ======
[15:16:39] [PASSED] drm_sched_test_modify_sched
[15:16:39] ======= [PASSED] drm_sched_basic_modify_sched_tests ========
[15:16:39] ============================================================
[15:16:39] Testing complete. Ran 10 tests: passed: 10
[15:16:39] Elapsed time: 13.442s total, 0.001s configuring, 4.117s building, 9.248s running

Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <phasta@kernel.org>

Tvrtko Ursulin (5):
  drm: Move some options to separate new Kconfig.debug
  drm/scheduler: Add scheduler unit testing infrastructure and some
    basic tests
  drm/scheduler: Add a simple TDR test
  drm/scheduler: Add basic priority tests
  drm/scheduler: Add a basic test for modifying entities scheduler list

 drivers/gpu/drm/Kconfig                       |  98 +---
 drivers/gpu/drm/Kconfig.debug                 | 104 ++++
 drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
 drivers/gpu/drm/scheduler/Makefile            |   1 +
 drivers/gpu/drm/scheduler/tests/Makefile      |   4 +
 .../gpu/drm/scheduler/tests/drm_mock_entity.c |  29 ++
 .../gpu/drm/scheduler/tests/drm_mock_job.c    |   3 +
 .../drm/scheduler/tests/drm_mock_scheduler.c  | 260 ++++++++++
 .../gpu/drm/scheduler/tests/drm_sched_tests.h | 128 +++++
 .../scheduler/tests/drm_sched_tests_basic.c   | 464 ++++++++++++++++++
 10 files changed, 1010 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/drm/Kconfig.debug
 create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
 create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
 create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_entity.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_job.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/drm_mock_scheduler.c
 create mode 100644 drivers/gpu/drm/scheduler/tests/drm_sched_tests.h
 create mode 100644 drivers/gpu/drm/scheduler/tests/drm_sched_tests_basic.c

-- 
2.48.0


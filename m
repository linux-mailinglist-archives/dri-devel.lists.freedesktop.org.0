Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236FA4C5F4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 17:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB2B10E214;
	Mon,  3 Mar 2025 16:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LVE0g6Fo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA3F10E214
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PcnRc0W4HhORcATicwPLGFcIU3+W1Z9Avq+GECEJ/uw=; b=LVE0g6FoXcOphWh2W5hdltBtO0
 tVpOHsUCaD+2hw0k2xduOSG62kbjXYAzTedwX45dR1WSfs36GrKpg0GmAXGLfk4b/uEkLqTs5tlos
 6rp/1yFkXoYy70zR2zqQYq3X3q018f/OdNvWK89KLxzVs0zscTbyGaShA1a4ILid6cxHKBczHA/bb
 jmb4HTVEa1ulVSqtkuiOBDPxJgHJ38Jx/TCJalXTHprlzjKuHpIsbqIls2swbUM0r2V87+dgKhZhD
 wmoaChmmyecHFo9cvQUplHD9m9wC84xxm5HapKr/8FCLWXJXhMIjozR8hX3F7FaI780GF5DSL2lkA
 jcbgOzjw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tp8Ew-003KSm-FR; Mon, 03 Mar 2025 17:02:04 +0100
Message-ID: <49b9e664-eff7-4f8e-aeeb-3ee24f10a72f@igalia.com>
Date: Mon, 3 Mar 2025 16:02:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] DRM scheduler kunit tests
To: phasta@kernel.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250221120917.80617-1-tvrtko.ursulin@igalia.com>
 <3163eb252a5fd3ceeec42fb3b369e18dd94a8419.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <3163eb252a5fd3ceeec42fb3b369e18dd94a8419.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 03/03/2025 13:58, Philipp Stanner wrote:
> On Fri, 2025-02-21 at 12:09 +0000, Tvrtko Ursulin wrote:
>> There has repeatedly been quite a bit of apprehension when any change
>> to the DRM
>> scheduler is proposed, with two main reasons being code base is
>> considered
>> fragile, not well understood and not very well documented, and
>> secondly the lack
>> of systematic testing outside the vendor specific tests suites and/or
>> test
>> farms.
>>
>> This series is an attempt to dislodge this status quo by adding some
>> unit tests
>> using the kunit framework.
>>
>> General approach is that there is a mock "hardware" backend which can
>> be
>> controlled from tests, which in turn allows exercising various
>> scheduler code
>> paths.
>>
>> Only some simple basic tests get added in the series and hopefully it
>> is easy to
>> understand what tests are doing.
>>
>> An obligatory "screenshot" for reference:
>>
>> [14:29:37] ============ drm_sched_basic_tests (3 subtests)
>> ============
>> [14:29:38] [PASSED] drm_sched_basic_submit
>> [14:29:38] ================== drm_sched_basic_test
>> ===================
>> [14:29:38] [PASSED] A queue of jobs in a single entity
>> [14:29:38] [PASSED] A chain of dependent jobs across multiple
>> entities
>> [14:29:38] [PASSED] Multiple independent job queues
>> [14:29:38] [PASSED] Multiple inter-dependent job queues
>> [14:29:38] ============== [PASSED] drm_sched_basic_test
>> ===============
>> [14:29:38] [PASSED] drm_sched_basic_entity_cleanup
>> [14:29:38] ============== [PASSED] drm_sched_basic_tests
>> ==============
>> [14:29:38] ======== drm_sched_basic_timeout_tests (1 subtest)
>> =========
>> [14:29:40] [PASSED] drm_sched_basic_timeout
>> [14:29:40] ========== [PASSED] drm_sched_basic_timeout_tests
>> ==========
>> [14:29:40] ======= drm_sched_basic_priority_tests (2 subtests)
>> ========
>> [14:29:42] [PASSED] drm_sched_priorities
>> [14:29:42] [PASSED] drm_sched_change_priority
>> [14:29:42] ========= [PASSED] drm_sched_basic_priority_tests
>> ==========
>> [14:29:42] ====== drm_sched_basic_modify_sched_tests (1 subtest)
>> ======
>> [14:29:43] [PASSED] drm_sched_test_modify_sched
>> [14:29:43] ======= [PASSED] drm_sched_basic_modify_sched_tests
>> ========
>> [14:29:43]
>> ============================================================
>> [14:29:43] Testing complete. Ran 10 tests: passed: 10
>> [14:29:43] Elapsed time: 13.330s total, 0.001s configuring, 4.005s
>> building, 9.276s running
>>
>> v2:
>>   * Parameterize a bunch of similar tests.
>>   * Improve test commentary.
>>   * Rename TDR test to timeout. (Christian)
>>   * Improve quality and consistency of naming. (Philipp)
>>
>> RFC v2 -> series v1:
>>   * Rebased for drm_sched_init changes.
>>   * Fixed modular build.
>>   * Added some comments.
>>   * Filename renames. (Philipp)
>>
>> v2:
>>   * Dealt with a bunch of checkpatch warnings.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>>
>> Tvrtko Ursulin (5):
>>    drm: Move some options to separate new Kconfig
> 
> Scheduler people aren't on CC in that patch. Would be nice to be on CC,
> too, for completeness in the mailbox and since I think that the
> scheduler maintainers would take the entire series, unless Dave and
> Sima guard the kconfig in some way

Added Cc locally (for next respin).

> Has there been any feedback by the two yet IRW the config changes?

Not yet. Beer is warm, pizza is cold, and turntable is skipping on the 
leadout track. (Referencing your "late to the party" comment.) :)

Regards,

Tvrtko


> Thanks
> P.
> 
>>    drm/scheduler: Add scheduler unit testing infrastructure and some
>>      basic tests
>>    drm/scheduler: Add a simple timeout test
>>    drm/scheduler: Add basic priority tests
>>    drm/scheduler: Add a basic test for modifying entities scheduler
>> list
>>
>>   drivers/gpu/drm/Kconfig                       | 109 +----
>>   drivers/gpu/drm/Kconfig.debug                 | 115 +++++
>>   drivers/gpu/drm/scheduler/.kunitconfig        |  12 +
>>   drivers/gpu/drm/scheduler/Makefile            |   2 +
>>   drivers/gpu/drm/scheduler/tests/Makefile      |   6 +
>>   .../gpu/drm/scheduler/tests/mock_scheduler.c  | 324 +++++++++++++
>>   drivers/gpu/drm/scheduler/tests/sched_tests.h | 222 +++++++++
>>   drivers/gpu/drm/scheduler/tests/tests_basic.c | 425
>> ++++++++++++++++++
>>   8 files changed, 1111 insertions(+), 104 deletions(-)
>>   create mode 100644 drivers/gpu/drm/Kconfig.debug
>>   create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
>>   create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
>>
> 


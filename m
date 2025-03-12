Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439BA5DA8E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 11:39:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F048910E0A3;
	Wed, 12 Mar 2025 10:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="btTmHZqn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30D510E0A3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 10:39:44 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:b231:465::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ZCRvv18KDz9t6L;
 Wed, 12 Mar 2025 11:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1741775979; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8JQFUhoL1xLpqckYny0zB881zikEKN/x+qwzl/qgho=;
 b=btTmHZqnbLT7znav66Nc2E1IFpvtqrtl48mD6zoRP9rFDs92oM3E3OZa+3mXDzKZqZHJrL
 13gyyZW1O3i8SZRjdERiohoIXBWlu5El245ICL4Tw4zz5CxJh/cggLxDldqe9mJJFHESgi
 oRMbDh4f7Pt288CenCui9YzJ74P6SbC9641K56NWdjccgCiSX8J2mDxhykpqwNSl4yqmjf
 BIXY7ZULRMPFaCDykOlK3uPhSgSCfObhTULb6cEJEHqtQFxvt1mgADyu75FhydhPzyfQn6
 +aRd82Ko8zBeyNXt7qBJQP5rt+tC2qO3P6Nawz1+SGONIJ9RDXfyhmMoLqkO0g==
Message-ID: <d92d3b58fa34f4beb957feeb372f9e18237d1c1c.camel@mailbox.org>
Subject: Re: [PATCH v7 0/7] DRM scheduler kunit tests
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Wed, 12 Mar 2025 11:39:35 +0100
In-Reply-To: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
References: <20250311092339.52199-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: apjqwatjhid7u94yfxrq3ry68h8xryd9
X-MBO-RS-ID: 10b5fc3a7e9c692f7fa
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2025-03-11 at 09:23 +0000, Tvrtko Ursulin wrote:
> There has repeatedly been quite a bit of apprehension when any change
> to the DRM
> scheduler is proposed, with two main reasons being code base is
> considered
> fragile, not well understood and not very well documented, and
> secondly the lack
> of systematic testing outside the vendor specific tests suites and/or
> test
> farms.
>=20
> This series is an attempt to dislodge this status quo by adding some
> unit tests
> using the kunit framework.
>=20
> General approach is that there is a mock "hardware" backend which can
> be
> controlled from tests, which in turn allows exercising various
> scheduler code
> paths.
>=20
> Only some simple basic tests get added in the series and hopefully it
> is easy to
> understand what tests are doing.
>=20
> An obligatory "screenshot" for reference:
>=20
> [14:09:05] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_tests (3 =
subtests)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:06] [PASSED] drm_sched_basic_submit
> [14:09:06] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D drm_sch=
ed_basic_test=C2=A0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:06] [PASSED] A queue of jobs in a single entity
> [14:09:06] [PASSED] A chain of dependent jobs across multiple
> entities
> [14:09:06] [PASSED] Multiple independent job queues
> [14:09:06] [PASSED] Multiple inter-dependent job queues
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_test
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:07] [PASSED] drm_sched_basic_entity_cleanup
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_=
basic_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:07] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_timeout_tests (1 subt=
est)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:08] [PASSED] drm_sched_basic_timeout
> [14:09:08] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_timeou=
t_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:08] =3D=3D=3D=3D=3D=3D=3D drm_sched_basic_priority_tests (2 subtes=
ts)
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:10] [PASSED] drm_sched_priorities
> [14:09:10] [PASSED] drm_sched_change_priority
> [14:09:10] =3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_priority_=
tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:10] =3D=3D=3D=3D=3D=3D drm_sched_basic_modify_sched_tests (1 subte=
st)
> =3D=3D=3D=3D=3D=3D
> [14:09:11] [PASSED] drm_sched_test_modify_sched
> [14:09:11] =3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_modify_sched_te=
sts
> =3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:11] =3D=3D=3D=3D=3D=3D=3D=3D drm_sched_basic_credits_tests (1 subt=
est)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12] [PASSED] drm_sched_test_credits
> [14:09:12] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] drm_sched_basic_credit=
s_tests
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [14:09:12] Testing complete. Ran 11 tests: passed: 11
> [14:09:13] Elapsed time: 13.539s total, 0.001s configuring, 3.004s
> building, 10.462s running
>=20
> v2:
> =C2=A0* Parameterize a bunch of similar tests.
> =C2=A0* Improve test commentary.
> =C2=A0* Rename TDR test to timeout. (Christian)
> =C2=A0* Improve quality and consistency of naming. (Philipp)
>=20
> RFC v2 -> series v1:
> =C2=A0* Rebased for drm_sched_init changes.
> =C2=A0* Fixed modular build.
> =C2=A0* Added some comments.
> =C2=A0* Filename renames. (Philipp)
>=20
> v2:
> =C2=A0* Dealt with a bunch of checkpatch warnings.
>=20
> v3:
> =C2=A0* Some mock API renames, kerneldoc grammar fixes and indentation
> fixes.
>=20
> v4:
> =C2=A0* Fix use after free caused by relying on scheduler fence for
> querying status.
> =C2=A0* Kerneldoc fixes.
>=20
> v5:
> =C2=A0* Cleanup in-flight jobs on scheduler shutdown.
> =C2=A0* Change hang_limit to 1.
>=20
> v6:
> =C2=A0* Use KUNIT_ASSERT_TRUE/FALSE.
> =C2=A0* Fixed patch titles.
> =C2=A0* Added credit_limit test.

Please don't add new tests in a settled series. Doing so may seem
efficient, but causes another round of review and can cause you and me
trouble when trying to find the cause of issues such as the one
mentioned below:

> =C2=A0* Added CONFIG_DRM_SCHED_KUNIT_TEST_ASPIRATIONAL.
>=20
> v7:
> =C2=A0* v6 omitted to send the first patch by mistake.

I either see a new NULL ptr deref added through the new test or an old
one that has slipped us. My test setup is unchanged.

On which commit do you apply and test this series? Tell me, then I test aga=
in.


P.


[    3.902457] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    3.903376] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    3.904064] platform regulatory.0: Direct firmware load for regulatory.d=
b failed with error -2
[    3.904673] cfg80211: failed to load regulatory.db
[    3.905037] ALSA device list:
[    3.905376]   No soundcards found.
[    3.905631] KTAP version 1
[    3.905834] 1..17
[    3.906732]     KTAP version 1
[    3.906999]     # Subtest: kunit_executor_test
[    3.907335]     # module: kunit
[    3.907337]     1..8
[    3.908476]     ok 1 parse_filter_test
[    3.909064]     ok 2 filter_suites_test
[    3.909801]     ok 3 filter_suites_test_glob_test
[    3.910678]     ok 4 filter_suites_to_empty_test
[    3.911621]     ok 5 parse_filter_attr_test
[    3.912641]     ok 6 filter_attr_test
[    3.913511]     ok 7 filter_attr_empty_test
[    3.914081]     ok 8 filter_attr_skip_test
[    3.914400] # kunit_executor_test: pass:8 fail:0 skip:0 total:8
[    3.914685] # Totals: pass:8 fail:0 skip:0 total:8
[    3.915121] ok 1 kunit_executor_test
[    3.915736]     KTAP version 1
[    3.915949]     # Subtest: kunit-try-catch-test
[    3.916314]     # module: kunit_test
[    3.916315]     1..2
[    3.917655]     ok 1 kunit_test_try_catch_successful_try_no_catch
[    3.917979]     ok 2 kunit_test_try_catch_unsuccessful_try_does_catch
[    3.918630] # kunit-try-catch-test: pass:2 fail:0 skip:0 total:2
[    3.919118] # Totals: pass:2 fail:0 skip:0 total:2
[    3.919578] ok 2 kunit-try-catch-test
[    3.920248]     KTAP version 1
[    3.920473]     # Subtest: kunit-resource-test
[    3.920796]     # module: kunit_test
[    3.920797]     1..12
[    3.921565]     ok 1 kunit_resource_test_init_resources
[    3.921793]     ok 2 kunit_resource_test_alloc_resource
[    3.922449]     ok 3 kunit_resource_test_destroy_resource
[    3.923013]     ok 4 kunit_resource_test_remove_resource
[    3.924438]     ok 5 kunit_resource_test_cleanup_resources
[    3.925834]     ok 6 kunit_resource_test_proper_free_ordering
[    3.926700]     ok 7 kunit_resource_test_static
[    3.927588]     ok 8 kunit_resource_test_named
[    3.928244]     ok 9 kunit_resource_test_action
[    3.928774]     ok 10 kunit_resource_test_remove_action
[    3.929309]     ok 11 kunit_resource_test_release_action
[    3.929826] action_order_2
[    3.930325] action_order_2
[    3.930521] action_order_1
[    3.931007]     ok 12 kunit_resource_test_action_ordering
[    3.931308] # kunit-resource-test: pass:12 fail:0 skip:0 total:12
[    3.931702] # Totals: pass:12 fail:0 skip:0 total:12
[    3.932183] ok 3 kunit-resource-test
[    3.932809]     KTAP version 1
[    3.933040]     # Subtest: kunit-log-test
[    3.933367]     # module: kunit_test
[    3.933368]     1..2
[    3.934030] put this in log.
[    3.934033] this too.
[    3.934305] add to suite log.
[    3.934500] along with this.
[    3.934982]     ok 1 kunit_log_test
[    3.935405]     # kunit_log_newline_test: Add newline
[    3.936164]     ok 2 kunit_log_newline_test # SKIP only useful when debu=
gfs is enabled
[    3.936166] # kunit-log-test: pass:1 fail:0 skip:1 total:2
[    3.936752] # Totals: pass:1 fail:0 skip:1 total:2
[    3.937197] ok 4 kunit-log-test
[    3.937776]     KTAP version 1
[    3.938004]     # Subtest: kunit_status
[    3.938324]     # module: kunit_test
[    3.938325]     1..2
[    3.938921]     ok 1 kunit_status_set_failure_test
[    3.939049]     ok 2 kunit_status_mark_skipped_test
[    3.939445] # kunit_status: pass:2 fail:0 skip:0 total:2
[    3.939816] # Totals: pass:2 fail:0 skip:0 total:2
[    3.940436] ok 5 kunit_status
[    3.941142]     KTAP version 1
[    3.941508]     # Subtest: kunit_current
[    3.941793]     # module: kunit_test
[    3.941794]     1..2
[    3.942526]     ok 1 kunit_current_test
[    3.942596]     # fake test: lib/kunit/kunit-test.c:722: This should mak=
e `fake` test fail.
[    3.943302]     ok 2 kunit_current_fail_test
[    3.943908] # kunit_current: pass:2 fail:0 skip:0 total:2
[    3.944271] # Totals: pass:2 fail:0 skip:0 total:2
[    3.944661] ok 6 kunit_current
[    3.945285]     KTAP version 1
[    3.945511]     # Subtest: kunit_device
[    3.945789]     # module: kunit_test
[    3.945790]     1..3
[    3.946905]     ok 1 kunit_device_test
[    3.947420]     ok 2 kunit_device_cleanup_test
[    3.948621]     ok 3 kunit_device_driver_test
[    3.948972] # kunit_device: pass:3 fail:0 skip:0 total:3
[    3.949349] # Totals: pass:3 fail:0 skip:0 total:3
[    3.949760] ok 7 kunit_device
[    3.950395]     KTAP version 1
[    3.950617]     # Subtest: kunit_fault
[    3.950889]     # module: kunit_test
[    3.950890]     1..1
[    3.951773] Oops: general protection fault, probably for non-canonical a=
ddress 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN PTI
[    3.952672] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000=
000000007]
[    3.953239] CPU: 2 UID: 0 PID: 225 Comm: kunit_try_catch Tainted: G     =
            N 6.14.0-rc4-00388-g712b7c2f4d5d #21
[    3.954000] Tainted: [N]=3DTEST
[    3.954245] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.16.3-2.fc40 04/01/2014
[    3.954850] RIP: 0010:kunit_test_null_dereference+0x4a/0x150
[    3.955285] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48 c1 ed 03 48 c7 44 =
24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42 04 01 f3 f3 f3 <0f=
> b6 04
[    3.956604] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a06
[    3.956972] RAX: dffffc0000000000 RBX: ffff88810088fb30 RCX: ffffffffb65=
da11d
[    3.957651] RDX: ffffed1021241fc0 RSI: 0000000000000008 RDI: ffff8881008=
8fb30
[    3.958317] RBP: 1ffff11021241fc0 R08: 0000000000000000 R09: ffffed10207=
de600
[    3.958849] R10: ffff888103ef3007 R11: 0000000000000000 R12: ffffffffb73=
baf40
[    3.959425] R13: ffffffffb73b1c60 R14: ffff8881038a9d80 R15: ffff8881091=
c6ac0
[    3.959917] FS:  0000000000000000(0000) GS:ffff888a88700000(0000) knlGS:=
0000000000000000
[    3.960521] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.960920] CR2: 0000000000000000 CR3: 0000000b1406a000 CR4: 00000000000=
006f0
[    3.961480] Call Trace:
[    3.961655]  <TASK>
[    3.961805]  ? die_addr+0x3b/0xa0
[    3.962052]  ? exc_general_protection+0x151/0x220
[    3.962439]  ? asm_exc_general_protection+0x26/0x30
[    3.962801]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[    3.963447]  ? __pfx_kunit_test_null_dereference+0x10/0x10
[    3.964150]  ? __kthread_parkme+0x7d/0x140
[    3.964443]  ? kunit_test_null_dereference+0x4a/0x150
[    3.964785]  ? __pfx_kunit_test_null_dereference+0x10/0x10
[    3.965205]  ? __kthread_parkme+0x7d/0x140
[    3.965494]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[    3.965859]  kthread+0x30f/0x620
[    3.966108]  ? __pfx_kthread+0x10/0x10
[    3.966406]  ? __pfx_kthread+0x10/0x10
[    3.966680]  ret_from_fork+0x2f/0x70
[    3.966941]  ? __pfx_kthread+0x10/0x10
[    3.967264]  ret_from_fork_asm+0x1a/0x30
[    3.967560]  </TASK>
[    3.967722] Modules linked in:
[    3.967989] ---[ end trace 0000000000000000 ]---
[    3.968368] RIP: 0010:kunit_test_null_dereference+0x4a/0x150
[    3.968780] Code: b5 41 48 c7 44 24 08 98 95 51 ba 48 c1 ed 03 48 c7 44 =
24 10 40 af 3b b7 48 8d 54 05 00 c7 02 f1 f1 f1 f1 c7 42 04 01 f3 f3 f3 <0f=
> b6 04
[    3.970211] RSP: 0000:ffff88810920fe00 EFLAGS: 00010a06
[    3.970567] RAX: dffffc0000000000 RBX: ffff88810088fb30 RCX: ffffffffb65=
da11d
[    3.971074] RDX: ffffed1021241fc0 RSI: 0000000000000008 RDI: ffff8881008=
8fb30
[    3.971580] RBP: 1ffff11021241fc0 R08: 0000000000000000 R09: ffffed10207=
de600
[    3.972089] R10: ffff888103ef3007 R11: 0000000000000000 R12: ffffffffb73=
baf40
[    3.972629] R13: ffffffffb73b1c60 R14: ffff8881038a9d80 R15: ffff8881091=
c6ac0
[    3.973176] FS:  0000000000000000(0000) GS:ffff888a88700000(0000) knlGS:=
0000000000000000
[    3.973720] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    3.974148] CR2: 0000000000000000 CR3: 0000000b1406a000 CR4: 00000000000=
006f0
[    3.974659] kunit_try_catch (225) used greatest stack depth: 28416 bytes=
 left
[    3.974764]     # kunit_test_fault_null_dereference: try faulted: last l=
ine seen lib/kunit/kunit-test.c:95
[    3.976367]     ok 1 kunit_test_fault_null_dereference
[    3.976370] ok 8 kunit_fault
[    3.976946]     KTAP version 1
[    3.977208]     # Subtest: kunit_platform_device
[    3.977549]     # module: platform_test
[    3.977550]     1..4
[    3.978550]     ok 1 kunit_platform_device_alloc_test
[    3.978989]     ok 2 kunit_platform_device_add_test
[    3.980097] sysfs: cannot create duplicate filename '/devices/platform/k=
unit-platform-add-2'
[    3.981138] CPU: 7 UID: 0 PID: 231 Comm: kunit_try_catch Tainted: G     =
 D          N 6.14.0-rc4-00388-g712b7c2f4d5d #21
[    3.981142] Tainted: [D]=3DDIE, [N]=3DTEST
[    3.981143] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.16.3-2.fc40 04/01/2014
[    3.981144] Call Trace:
[    3.981145]  <TASK>
[    3.981146]  dump_stack_lvl+0x53/0x70
[    3.981151]  sysfs_warn_dup+0x70/0x90
[    3.981154]  sysfs_create_dir_ns+0x209/0x280
[    3.981156]  ? __pfx_sysfs_create_dir_ns+0x10/0x10
[    3.981159]  ? _raw_spin_lock+0x80/0xe0
[    3.981161]  kobject_add_internal+0x216/0x8b0
[    3.981163]  kobject_add+0x13b/0x200
[    3.981165]  ? __pfx_kobject_add+0x10/0x10
[    3.981167]  ? kobject_get+0x50/0xe0
[    3.981169]  device_add+0x217/0x1460
[    3.981171]  ? __pfx_device_add+0x10/0x10
[    3.981173]  ? _raw_spin_lock_irqsave+0x86/0xe0
[    3.981174]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[    3.981176]  ? device_initialize+0x1f4/0x410
[    3.981179]  ? platform_device_alloc+0x97/0x200
[    3.981182]  platform_device_add+0x375/0x5b0
[    3.981184]  kunit_platform_device_add+0x20/0x2c0
[    3.981186]  kunit_platform_device_add_twice_fails_test+0x1f5/0x420
[    3.981189]  ? __pfx_kunit_platform_device_add_twice_fails_test+0x10/0x1=
0
[    3.981191]  ? __schedule+0xdda/0x24f0
[    3.981193]  ? kvm_clock_get_cycles+0x18/0x30
[    3.981196]  ? ktime_get_ts64+0x7d/0x220
[    3.981200]  kunit_try_run_case+0x1ae/0x490
[    3.981202]  ? __pfx_kunit_try_run_case+0x10/0x10
[    3.981204]  ? _raw_spin_lock_irqsave+0x86/0xe0
[    3.981205]  ? __pfx_kunit_try_run_case+0x10/0x10
[    3.981207]  ? __pfx_kunit_generic_run_threadfn_adapter+0x10/0x10
[    3.981210]  kunit_generic_run_threadfn_adapter+0x7b/0xe0
[    3.981212]  kthread+0x30f/0x620
[    3.981214]  ? __pfx_kthread+0x10/0x10
[    3.981216]  ? __pfx_kthread+0x10/0x10
[    3.981217]  ret_from_fork+0x2f/0x70
[    3.981223]  ? __pfx_kthread+0x10/0x10
[    3.981225]  ret_from_fork_asm+0x1a/0x30
[    3.981227]  </TASK>
[    3.981232] kobject: kobject_add_internal failed for kunit-platform-add-=
2 with -EEXIST, don't try to register things with the same name in the same=
 direc.
[    3.995255] kunit_try_catch (231) used greatest stack depth: 27528 bytes=
 left
[    3.995525]     ok 3 kunit_platform_device_add_twice_fails_test
[    3.996247]     ok 4 kunit_platform_device_add_cleans_up
[    3.996678] # kunit_platform_device: pass:4 fail:0 skip:0 total:4
[    3.997073] # Totals: pass:4 fail:0 skip:0 total:4
[    3.997530] ok 9 kunit_platform_device
[    3.998130]     KTAP version 1
[    3.998356]     # Subtest: kunit_platform_driver
[    3.998664]     # module: platform_test
[    3.998665]     1..2
[    3.999663]     ok 1 kunit_platform_driver_register_test
[    4.000372]     ok 2 kunit_platform_device_prepare_wait_for_probe_comple=
tes_when_already_probed
[    4.000750] # kunit_platform_driver: pass:2 fail:0 skip:0 total:2
[    4.001372] # Totals: pass:2 fail:0 skip:0 total:2
[    4.001777] ok 10 kunit_platform_driver
[    4.002412]     KTAP version 1
[    4.002618]     # Subtest: string-stream-test
[    4.002909]     # module: string_stream_test
[    4.002910]     1..12
[    4.003643]     ok 1 string_stream_managed_init_test
[    4.003919]     ok 2 string_stream_unmanaged_init_test
[    4.004581]     ok 3 string_stream_managed_free_test
[    4.005295]     ok 4 string_stream_resource_free_test
[    4.007076]     ok 5 string_stream_line_add_test
[    4.008801]     ok 6 string_stream_variable_length_line_test
[    4.009944]     ok 7 string_stream_append_test
[    4.010840]     ok 8 string_stream_append_auto_newline_test
[    4.011461]     ok 9 string_stream_append_empty_string_test
[    4.012233]     ok 10 string_stream_no_auto_newline_test
[    4.013158]     ok 11 string_stream_auto_newline_test
[    4.063760]     # string_stream_performance_test: Time elapsed:         =
  49385 us
[    4.064713]     # string_stream_performance_test: Total string length:  =
  573890
[    4.065271]     # string_stream_performance_test: Bytes requested:      =
  823930
[    4.065803]     # string_stream_performance_test: Actual bytes allocated=
: 1048312
[    4.098820]     ok 12 string_stream_performance_test
[    4.098826] # string-stream-test: pass:12 fail:0 skip:0 total:12
[    4.099348] # Totals: pass:12 fail:0 skip:0 total:12
[    4.099814] ok 11 string-stream-test
[    4.100495]     KTAP version 1
[    4.100735]     # Subtest: kunit-assert
[    4.101048]     # module: assert_test
[    4.101050]     1..11
[    4.101943]     ok 1 kunit_test_is_literal
[    4.102331]     ok 2 kunit_test_is_str_literal
[    4.103177]     ok 3 kunit_test_assert_prologue
[    4.103996]     ok 4 kunit_test_assert_print_msg
[    4.104867]     ok 5 kunit_test_unary_assert_format
[    4.105908]     ok 6 kunit_test_ptr_not_err_assert_format
[    4.107022]     ok 7 kunit_test_binary_assert_format
[    4.107868]     ok 8 kunit_test_binary_ptr_assert_format
[    4.108702]     ok 9 kunit_test_binary_str_assert_format
[    4.109969]     ok 10 kunit_test_assert_hexdump
[    4.111490]     ok 11 kunit_test_mem_assert_format
[    4.111845] # kunit-assert: pass:11 fail:0 skip:0 total:11
[    4.112522] # Totals: pass:11 fail:0 skip:0 total:11
[    4.112949] ok 12 kunit-assert
[    4.113628]     KTAP version 1
[    4.113867]     # Subtest: drm_sched_basic_tests
[    4.114281]     # module: drm_sched_tests
[    4.114283]     1..3
[    4.234223] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input3
[    4.617191]     ok 1 drm_sched_basic_submit
[    4.617197]         KTAP version 1
[    4.617765]         # Subtest: drm_sched_basic_test
[    4.719657]         ok 1 A queue of jobs in a single entity
[    4.821976]         ok 2 A chain of dependent jobs across multiple entit=
ies
[    4.924015]         ok 3 Multiple independent job queues
[    5.026465]         ok 4 Multiple inter-dependent job queues
[    5.026907]     # drm_sched_basic_test: pass:4 fail:0 skip:0 total:4
[    5.027322]     ok 2 drm_sched_basic_test
[    5.080020]     ok 3 drm_sched_basic_entity_cleanup
[    5.080317] # drm_sched_basic_tests: pass:3 fail:0 skip:0 total:3
[    5.080657] # Totals: pass:6 fail:0 skip:0 total:6
[    5.081103] ok 13 drm_sched_basic_tests
[    5.081679]     KTAP version 1
[    5.081881]     # Subtest: drm_sched_basic_timeout_tests
[    5.082259]     # module: drm_sched_tests
[    5.082260]     1..1



>=20
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
>=20
> Tvrtko Ursulin (7):
> =C2=A0 drm: Move some options to separate new Kconfig
> =C2=A0 drm/sched: Add scheduler unit testing infrastructure and some basi=
c
> =C2=A0=C2=A0=C2=A0 tests
> =C2=A0 drm/sched: Add aspirational unit test mode
> =C2=A0 drm/sched: Add a simple timeout test
> =C2=A0 drm/sched: Add basic priority tests
> =C2=A0 drm/sched: Add a basic test for modifying entities scheduler list
> =C2=A0 drm/sched: Add a basic test for checking credit limit
>=20
> =C2=A0drivers/gpu/drm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 109 +---
> =C2=A0drivers/gpu/drm/Kconfig.debug=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 128 +++++
> =C2=A0drivers/gpu/drm/scheduler/.kunitconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 12 +
> =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/scheduler/tests/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 7 +
> =C2=A0.../gpu/drm/scheduler/tests/mock_scheduler.c=C2=A0 | 345 ++++++++++=
+++
> =C2=A0drivers/gpu/drm/scheduler/tests/sched_tests.h | 224 +++++++++
> =C2=A0drivers/gpu/drm/scheduler/tests/tests_basic.c | 476
> ++++++++++++++++++
> =C2=A08 files changed, 1199 insertions(+), 104 deletions(-)
> =C2=A0create mode 100644 drivers/gpu/drm/Kconfig.debug
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/.kunitconfig
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/Makefile
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/sched_tests.h
> =C2=A0create mode 100644 drivers/gpu/drm/scheduler/tests/tests_basic.c
>=20


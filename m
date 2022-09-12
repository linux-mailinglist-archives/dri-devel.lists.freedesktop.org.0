Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD935B5DC1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 18:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EA010E5C4;
	Mon, 12 Sep 2022 16:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0884F10E5C4;
 Mon, 12 Sep 2022 16:00:00 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4MRBBQ6nf4z9sLj;
 Mon, 12 Sep 2022 15:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1662998399; bh=iHXqhs0DjyCTV/rP5THbvHQv5zl20wh2HqknCzmvch0=;
 h=From:To:Cc:Subject:Date:From;
 b=Rx+UAZSi6MIXwa1kbIkbucKeMfYiXBi0Z4mcd8I+7dnCIfCeZvk2YBYpQ+ZjKbai9
 hfEQ2R/eVb+WqyU4Y3hdXbFLhC/Xl25F/waTaULiyLwIZhAeSMO5UKBEAhNYPdCayB
 QCFpfr1FcyqQE+k+CwOrnIfYr7Nwh9NV/O6CqGzQ=
X-Riseup-User-ID: 9D1E5EA36CFF0EFBBF17DE9112F944517AA8C0051642BB09609C4A314D6E64A2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4MRBBG0Jnvz5vgp;
 Mon, 12 Sep 2022 15:59:49 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>
Subject: [PATCH v3 0/8] drm/amd/display: Introduce KUnit to Display Mode
 Library
Date: Mon, 12 Sep 2022 12:59:11 -0300
Message-Id: <20220912155919.39877-1-mairacanal@riseup.net>
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
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series is version 3 of the introduction of unit testing to the
AMDPGU driver [1].

Our main goal is to bring unit testing to the AMD display driver; in
particular, we'll focus on the Display Mode Library (DML) for DCN2.0,
DMUB, and some of the DCE functions. This implementation intends to
help developers to recognize bugs before they are merged into the
mainline and also makes it possible for future code refactors of the
AMD display driver.

For the implementation of the tests, we decided to go with the Kernel
Unit Testing Framework (KUnit). KUnit makes it possible to run test
suites on kernel boot or load the tests as a module. It reports all test
case results through a TAP (Test Anything Protocol) in the kernel log.
Moreover, KUnit unifies the test structure and provides tools to
simplify the testing for developers and CI systems.

In regards to CI pipelines, we believe kunit_tool [2] provides
ease of use, but we are also working on integrating KUnit into IGT [3].

Since the second version, we've chosen a mix of approaches to integrate
KUnit tests into amdgpu:
    1. Tests that use static functions are included through guards [4].
    2. Tests without static functions are included through a Makefile.

We understand that testing static functions is not ideal, but taking into
consideration that this driver relies heavily on static functions with
complex behavior which would benefit from unit testing, otherwise, black-box
tested through public functions with dozens of arguments and sometimes high
cyclomatic complexity.

The first seven patches represent what we intend to do for the rest of the
DML modules: systematic testing of the DML functions, especially mathematically
complicated functions. Also, it shows how simple it is to add new tests to the DML.

Among the tests, we highlight the dcn20_fpu_test, which, had it existed
then, could catch the defects introduced to dcn20_fpu.c by 8861c27a6c [5]
later fixed by 9ad5d02c2a [6].

In this series, there's also an example of how unit tests can help avoid
regressions and keep track of changes in behavior.

Applying this series on top of the amd-staging-drm-next (787df47adb1f)
and running its tests will fail the `dc_dmub_srv` test, you can verify
that with:

$ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
    --kunitconfig=drivers/gpu/drm/amd/display/tests

``
...
[17:37:28] # Subtest: populate_subvp_cmd_drr_info_test
[17:37:28] # populate_subvp_cmd_drr_info_test: pass:0 fail:5 skip:0 total:5
[17:37:28] not ok 1 - populate_subvp_cmd_drr_info_test
[17:37:28] ======== [FAILED] populate_subvp_cmd_drr_info_test =========
[17:37:28] # Subtest: dc_dmub_srv
[17:37:28] 1..1
[17:37:28] # Totals: pass:0 fail:5 skip:0 total:5
[17:37:28] not ok 4 - dc_dmub_srv
[17:37:28] =================== [FAILED] dc_dmub_srv ===================
[17:37:28] ============================================================
[17:37:28] Testing complete. Passed: 88, Failed: 5, Crashed: 0, Skipped: 0, Errors: 0
``
Full output at: https://pastebin.com/PfmbXAJ9

This is due to a known regression introduced by commit 5da7f4134357
("drm/amd/display: fix 32 bit compilation errors in dc_dmub_srv.c")
[7], which resulted in the struct's members being zero. As an
exercise, you can revert the offending patch, run the tests again, and
the test-series will result in success.

``
[17:41:44] Testing complete. Passed: 93, Failed: 0, Crashed: 0, Skipped: 0, Errors: 0
``
Full successful output: https://pastebin.com/Nn2rRRkd

This series depends on a couple of KUnit patches already merged into
torvalds/master, which themselves depend on older patches:

commit 61695f8c5d51 ("kunit: split resource API from test.h into new resource.h")
commit 2852ca7fba9f ("panic: Taint kernel if tests are run")
commit cfc1d277891e ("module: Move all into module/")
commit cdebea6968fa ("kunit: split resource API impl from test.c into new resource.c")
commit cae56e1740f5 ("kunit: rename print_subtest_{start,end} for clarity (s/subtest/suite)")
commit 1cdba21db2ca ("kunit: add ability to specify suite-level init and exit functions")
commit c272612cb4a2 ("kunit: Taint the kernel when KUnit tests are run")
commit 3d6e44623841 ("kunit: unify module and builtin suite definitions")
commit a02353f49162 ("kunit: bail out of test filtering logic quicker if OOM")
commit 1b11063d32d7 ("kunit: fix executor OOM error handling logic on non-UML")
commit e5857d396f35 ("kunit: flatten kunit_suite*** to kunit_suite** in .kunit_test_suites")
commit 94681e289bf5 ("kunit: executor: Fix a memory leak on failure in kunit_filter_tests")

You can get a for branch ready for compilation at
https://gitlab.freedesktop.org/isinyaaa/linux/-/tree/for-amd-mixed

Thanks in advance for your time taking a look and sending any feedback!

Best regards,
Isabella Basso, Magali Lemes, Maíra Canal, and Tales Aparecida

[1] https://summerofcode.withgoogle.com/programs/2022/organizations/xorg-foundation
[2] https://www.kernel.org/doc/html/latest/dev-tools/kunit/kunit-tool.html
[3] https://patchwork.freedesktop.org/series/105294/
[4] https://docs.kernel.org/dev-tools/kunit/usage.html#testing-static-functions
[5] https://lore.kernel.org/amd-gfx/20220603185042.3408844-6-Rodrigo.Siqueira@amd.com/
[6] https://lore.kernel.org/amd-gfx/20220608164856.1870594-1-sunpeng.li@amd.com/
[7] https://lore.kernel.org/amd-gfx/20220708052650.1029150-1-alexander.deucher@amd.com/

---
v1 -> v2: https://lore.kernel.org/amd-gfx/20220811004010.61299-1-tales.aparecida@gmail.com/

- Add comments to display_mode_vba_20_test and display_rq_dlg_calc_20_test (Maíra Canal).
- Fix checkpatch warnings (Maíra Canal).
- Add three more tests to display_mode_vba_20 (Maíra Canal).
- Create three Kconfig entries for the tests (Tales Aparecida).
- Add a "depends on" in the Kconfig to assure no broken configs with UML (David Gow).
- Create a Makefile for tests that don´t hold static function testing (Tales Aparecida).
- Update the documentation with new Kconfig entries and more details on how to add new tests.
- Add David's Reviewed-by.

v2 -> v3: https://lore.kernel.org/dri-devel/20220831172239.344446-1-mairacanal@riseup.net/

- Rebase on top of amd-staging-drm-next.
---

Isabella Basso (1):
  drm/amd/display: Introduce KUnit tests to display_rq_dlg_calc_20

Magali Lemes (1):
  drm/amd/display: Introduce KUnit tests for dcn20_fpu

Maíra Canal (5):
  drm/amd/display: Introduce KUnit tests to the bw_fixed library
  drm/amd/display: Introduce KUnit tests to the display_mode_vba library
  drm/amd/display: Introduce KUnit to dcn20/display_mode_vba_20 library
  drm/amd/display: Introduce KUnit tests to dc_dmub_srv library
  Documentation/gpu: Add Display Core Unit Test documentation

Tales Aparecida (1):
  drm/amd/display: Introduce KUnit tests for fixed31_32 library

 .../gpu/amdgpu/display/display-test.rst       |  88 ++
 Documentation/gpu/amdgpu/display/index.rst    |   1 +
 drivers/gpu/drm/amd/display/Kconfig           |  51 +
 drivers/gpu/drm/amd/display/Makefile          |   2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |   4 +
 .../drm/amd/display/dc/dml/calcs/bw_fixed.c   |   3 +
 .../dc/dml/dcn20/display_mode_vba_20.c        |   4 +
 .../dc/dml/dcn20/display_rq_dlg_calc_20.c     |   4 +
 .../gpu/drm/amd/display/tests/.kunitconfig    |   9 +
 drivers/gpu/drm/amd/display/tests/Makefile    |  18 +
 .../display/tests/dc/basics/fixpt31_32_test.c | 232 +++++
 .../amd/display/tests/dc/dc_dmub_srv_test.c   | 285 ++++++
 .../tests/dc/dml/calcs/bw_fixed_test.c        | 323 +++++++
 .../tests/dc/dml/dcn20/dcn20_fpu_test.c       | 561 +++++++++++
 .../dc/dml/dcn20/display_mode_vba_20_test.c   | 888 ++++++++++++++++++
 .../dml/dcn20/display_rq_dlg_calc_20_test.c   | 124 +++
 .../tests/dc/dml/display_mode_vba_test.c      | 741 +++++++++++++++
 17 files changed, 3337 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/gpu/amdgpu/display/display-test.rst
 create mode 100644 drivers/gpu/drm/amd/display/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dc_dmub_srv_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/calcs/bw_fixed_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/dcn20_fpu_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_mode_vba_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/dcn20/display_rq_dlg_calc_20_test.c
 create mode 100644 drivers/gpu/drm/amd/display/tests/dc/dml/display_mode_vba_test.c

-- 
2.37.3


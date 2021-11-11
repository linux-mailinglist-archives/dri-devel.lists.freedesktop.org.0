Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18E44CE60
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 01:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2ED6E435;
	Thu, 11 Nov 2021 00:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B54C6E0F0;
 Thu, 11 Nov 2021 00:35:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tonyk) with ESMTPSA id CFB2C1F457AE
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636590928; bh=rih67FC9fbnKGpO8s27uOY5eiSnixP/oX0VKta2KqMk=;
 h=From:To:Cc:Subject:Date:From;
 b=vD8RsDIsXcuOAvql/h9PUay1vN6/PxoS9l7idJv+WG6NLTn0/h53wWbGeH6LIfGAe
 ugEK2YpmEaFcFVjNoK01P5/Kfrbuw8oBp1No3w5nh5Rq0mhUxiAcDXiTZ4ELICSRGN
 3LHOmdjP8Z3z5mDYwEjGnXnlNXrmTbkwkkii2wmGljqD5LV/7/aIyrXhB3ZXKPLtGS
 q1wtTsleEbphNMpKBSdzmnhFQaeVeYCQ4pIt/F9SANhL8Xc/E4FLSNh7R1L4CAL11u
 17vKLdIPRfeJRValBgiXBBrI4Zu9jz5SeKHQO0uXHrrZHJin58iJXDtCmKEbDQvDS2
 euc6z4OuNJg+Q==
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
To: Daniel Vetter <daniel@ffwll.ch>, Shuah Khan <skhan@linuxfoundation.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Daniel Latypov <dlatypov@google.com>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 dri-devel@lists.freedesktop.org, daniel@fooishbar.org,
 igt-dev@lists.freedesktop.org, leandro.ribeiro@collabora.com,
 n@nfraprado.net, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 ~lkcamp/discussion@lists.sr.ht, isabbasso@riseup.net, maira.canal@usp.br,
 arthur.grillo@usp.br, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] drm: selftest: Convert to KUnit
Date: Wed, 10 Nov 2021 21:34:52 -0300
Message-Id: <20211111003453.209115-1-andrealmeid@collabora.com>
X-Mailer: git-send-email 2.33.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This RFC is a preview of the progress we made in the KUnit hackathon[0].
This patch, made by Maíra and Arthur, converts the damage helper test
from the original DRM selftest framework to use the KUnit framework.

[0] https://groups.google.com/g/kunit-dev/c/YqFR1q2uZvk/m/IbvItSfHBAAJ

The IGT part of this work can be found here:
https://gitlab.freedesktop.org/isinyaaa/igt-gpu-tools/-/tree/introduce-kunit

We also have patches in progress converting the following tests:
framebuffer, cmdline_parser, dp_mst_helper, rect and dma-buf. As soon as
we sort out if this is the right way to proceed in both kernel and IGT
side, the hackathon participants will submit them.

Below, a dmesg output followed by the IGT output of the damage helper
test.

Thanks!

[   32.502165] [IGT] kms_kunit: executing
[   32.896062]     # Subtest: drm_damage_helper_tests
[   32.896115]     1..21
[   32.906500]     ok 1 - igt_damage_iter_no_damage
[   32.907957]     ok 2 - igt_damage_iter_no_damage_fractional_src
[   32.922087]     ok 3 - igt_damage_iter_no_damage_src_moved
[   32.926174]     ok 4 - igt_damage_iter_no_damage_fractional_src_moved
[   32.931746]     ok 5 - igt_damage_iter_no_damage_not_visible
[   32.935329]     ok 6 - igt_damage_iter_no_damage_no_crtc
[   32.939826]     ok 7 - igt_damage_iter_no_damage_no_fb
[   32.942118]     ok 8 - igt_damage_iter_simple_damage
[   32.944158]     ok 9 - igt_damage_iter_single_damage
[   32.945583]     ok 10 - igt_damage_iter_single_damage_intersect_src
[   32.946565]     ok 11 - igt_damage_iter_single_damage_outside_src
[   32.949206]     ok 12 - igt_damage_iter_single_damage_fractional_src
[   32.952464]     ok 13 - igt_damage_iter_single_damage_intersect_fractional_src
[   32.954321]     ok 14 - igt_damage_iter_single_damage_outside_fractional_src
[   32.957147]     ok 15 - igt_damage_iter_single_damage_src_moved
[   32.959162]     ok 16 - igt_damage_iter_single_damage_fractional_src_moved
[   32.961100]     ok 17 - igt_damage_iter_damage
[   32.963609]     ok 18 - igt_damage_iter_damage_one_intersect
[   32.964913]     ok 19 - igt_damage_iter_damage_one_outside
[   32.966389]     ok 20 - igt_damage_iter_damage_src_moved
[   32.968279]     ok 21 - igt_damage_iter_damage_not_visible
[   32.971710] # drm_damage_helper_tests: pass:21 fail:0 skip:0 total:21
[   32.973887] # Totals: pass:21 fail:0 skip:0 total:21
[   32.975511] ok 1 - drm_damage_helper_tests
[   33.051033] [IGT] kms_kunit: exiting, ret=0

IGT-Version: 1.26-g71e8eceb (x86_64) (Linux: 5.15.0-rc7amd-fix+ x86_64)
[IGT] running 21 tests...
[IGT] SUBTEST ok 1 - igt_damage_iter_no_damage
[IGT] SUBTEST ok 2 - igt_damage_iter_no_damage_fractional_src
[IGT] SUBTEST ok 3 - igt_damage_iter_no_damage_src_moved
[IGT] SUBTEST ok 4 - igt_damage_iter_no_damage_fractional_src_moved
[IGT] SUBTEST ok 5 - igt_damage_iter_no_damage_not_visible
[IGT] SUBTEST ok 6 - igt_damage_iter_no_damage_no_crtc
[IGT] SUBTEST ok 7 - igt_damage_iter_no_damage_no_fb
[IGT] SUBTEST ok 8 - igt_damage_iter_simple_damage
[IGT] SUBTEST ok 9 - igt_damage_iter_single_damage
[IGT] SUBTEST ok 10 - igt_damage_iter_single_damage_intersect_src
[IGT] SUBTEST ok 11 - igt_damage_iter_single_damage_outside_src
[IGT] SUBTEST ok 12 - igt_damage_iter_single_damage_fractional_src
[IGT] SUBTEST ok 13 - igt_damage_iter_single_damage_intersect_fractional_src
[IGT] SUBTEST ok 14 - igt_damage_iter_single_damage_outside_fractional_src
[IGT] SUBTEST ok 15 - igt_damage_iter_single_damage_src_moved
[IGT] SUBTEST ok 16 - igt_damage_iter_single_damage_fractional_src_moved
[IGT] SUBTEST ok 17 - igt_damage_iter_damage
[IGT] SUBTEST ok 18 - igt_damage_iter_damage_one_intersect
[IGT] SUBTEST ok 19 - igt_damage_iter_damage_one_outside
[IGT] SUBTEST ok 20 - igt_damage_iter_damage_src_moved
[IGT] SUBTEST ok 21 - igt_damage_iter_damage_not_visible
[IGT] TEST SUCCEEDED ok 1 - drm_damage_helper_tests
SUCCESS (0.465s) 

Maíra Canal (1):
  drm: selftest: convert drm_damage_helper selftest to KUnit

 drivers/gpu/drm/Kconfig                       |  13 ++
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/selftests/Makefile            |   5 +-
 .../gpu/drm/selftests/drm_modeset_selftests.h |  21 --
 .../drm/selftests/test-drm_damage_helper.c    | 215 +++++++++---------
 5 files changed, 127 insertions(+), 129 deletions(-)

-- 
2.33.1


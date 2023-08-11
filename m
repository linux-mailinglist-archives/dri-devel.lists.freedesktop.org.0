Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F67796F3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A1B10E6CF;
	Fri, 11 Aug 2023 18:18:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EC810E6CF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 18:18:20 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RMsVM5F8qz9t7t;
 Fri, 11 Aug 2023 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1691777899; bh=ehGDO4hnLOzJ03iq2cOgLJA30cTdmibmlZqqGmY5py8=;
 h=From:Subject:Date:To:Cc:From;
 b=bdtaett16QztcoRYWqiJFbxgcxELW7wsiQbCDZ+UxAoOuizqf3ccWVLHwvv2TaLIM
 IMD/q6U8aHjlJw/eCXI3EyVHF98b1ymtapeBDVm4BUTMnRge7A5caah+VpOiHr4r2y
 7G60iIWDuDoUqOU2NpgQ8idVJndoR0gXxod4P3rE=
X-Riseup-User-ID: C06AB3D0B1DF58527398503829BAA1A700B9C8D0C9953054E0E9C148D64E32F7
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4RMsV56yDfzFpZR;
 Fri, 11 Aug 2023 18:18:05 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v2 0/6] Increase code coverage on drm_format_helper.c
Date: Fri, 11 Aug 2023 15:17:38 -0300
Message-Id: <20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEJ71mQC/w3LQQqAIBAAwK/EnltQI7B+o7apUAq71iX8ex7nM
 B8IcSaBffqA6c2Saxkw8wQhuRIJ8zEMRplFWa0wSg148I1n5ds1bCQNX4N6s9upLGm9ehjbOyH
 07EpI45fnunr/AWwgFdRuAAAA
To: dri-devel@lists.freedesktop.org
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, tales.aparecida@gmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, mairacanal@riseup.net,
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following series include improvements and new KUnit tests to some
functions on drm_format_helper.c.

The first patch improves existing conversion tests to assure that the
default pitch is used when NULL is used on the `dst_pitch` argument.

Patches 2, 3, 4, and 6 add the new parametrized tests to the following
functions:

- drm_fb_swab()
- drm_fb_clip_offset()
- drm_fb_build_fourcc_list()
- drm_fb_memcpy()

The 5th patch is a change to the conversion_buf_size() helper used on
the tests, this change was needed to make the patch 6.

a coverage report for the file can be found below:
https://grillo-0.github.io/coverage-reports/gsoc-drm-format-test/drivers/gpu/drm/drm_format_helper.c.gcov.html

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---

v1->v2: https://lore.kernel.org/r/20230721182316.560649-1-arthurgrillo@riseup.net
- Change patch prefix to "drm/tests" (Maíra Canal)
- Simplify the code by changing to an ternary operator on the
  pitch (Maíra Canal)
- Explain how the expected swab colors were obtained (André Almeida)
- Fix multi-line comment style (André Almeida)
- Remove unnecessary use of drm_kunit_helper_free_device() (Maíra Canal)
- Hard-code the expected number of fourcss (Maíra Canal & Andre Almeida)
- Fix some sparce warnings (kernel test robot)

---
Arthur Grillo (6):
      drm/tests: Test default pitch fallback
      drm/tests: Add KUnit tests for drm_fb_swab()
      drm/tests: Add KUnit tests for drm_fb_clip_offset()
      drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()
      drm/tests: Add multi-plane support to conversion_buf_size()
      drm/tests: Add KUnit tests for drm_fb_memcpy()

 drivers/gpu/drm/tests/drm_format_helper_test.c | 848 +++++++++++++++++++++++--
 1 file changed, 790 insertions(+), 58 deletions(-)
---
base-commit: b31f784ffff96643fa6dec31b182a3466cf4139e
change-id: 20230810-gsoc-drm-format-test-v2-1989f08e115b

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>


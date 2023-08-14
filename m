Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D7077C348
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 00:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3773A10E10A;
	Mon, 14 Aug 2023 22:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867E610E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 22:12:15 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4RPpXv0mn5z9t4T;
 Mon, 14 Aug 2023 22:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1692051135; bh=sXlJzG/h8bphgMnwETDxud+3PwELns1MNhKxzHgeruI=;
 h=From:Subject:Date:To:Cc:From;
 b=oGTLoIQLQldtegxHEp4ZXHm3jJ9/VlzdtI1kqVEZ7C/+ei05+xvUpm1cRhrloeTEf
 4qaEKNSUrAGItoRIL4QIXCmg5KNLQGSXarJARxYKL0YRm8vOzX2MHYBIdJKnpaWWF4
 UPyWbPuSjO6AYLjXBAg3mQyxbA0vjFHPvCiuZI4w=
X-Riseup-User-ID: F918AEFA5154A8704562A981B567B8AF09727266FDDAB270CDDE71809B65BAD4
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4RPpXr30SrzJmsJ;
 Mon, 14 Aug 2023 22:12:12 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH v3 0/6] Increase code coverage on drm_format_helper.c
Date: Mon, 14 Aug 2023 19:11:59 -0300
Message-Id: <20230814-gsoc-drm-format-test-v2-v3-0-bd3e9f9bc2fb@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALCm2mQC/3WNwQqDMBBEf0Vy7pYkWo099T9KD4muGtBEslEo4
 r93KfRYGBhmYN4cgjB5JHEvDpFw9+Rj4FBeCtFNNowIvucstNSlNErCSLGDPi0wxLTYDBkpw65
 BtaYdpEGlbk7w2llCcMmGbuJ92OaZy8lTjun9fds12/MHVn/BLAlNXTrVmFbWVfVInnBbrwGze
 J3n+QFH99YjxAAAAA==
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

v2->v3: https://lore.kernel.org/r/20230811-gsoc-drm-format-test-v2-v2-0-763b17890644@riseup.net
- Hard-code the number of native fourcss (Maíra Canal)
- Change to a ternary operator on them memcpy test too (Maíra Canal)
- Remove the memcpy_result and place the expected values with the
  parameters
- s/multi_plane_op/fb_memcpy/ (Maíra Canal)

---
Arthur Grillo (6):
      drm/tests: Test default pitch fallback
      drm/tests: Add KUnit tests for drm_fb_swab()
      drm/tests: Add KUnit tests for drm_fb_clip_offset()
      drm/tests: Add KUnit tests for drm_fb_build_fourcc_list()
      drm/tests: Add multi-plane support to conversion_buf_size()
      drm/tests: Add KUnit tests for drm_fb_memcpy()

 drivers/gpu/drm/tests/drm_format_helper_test.c | 815 +++++++++++++++++++++++--
 1 file changed, 757 insertions(+), 58 deletions(-)
---
base-commit: b31f784ffff96643fa6dec31b182a3466cf4139e
change-id: 20230810-gsoc-drm-format-test-v2-1989f08e115b

Best regards,
-- 
Arthur Grillo <arthurgrillo@riseup.net>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952D7D5B24
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 21:10:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB5A10E47E;
	Tue, 24 Oct 2023 19:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4270E10E481
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 19:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 1572141ABF;
 Tue, 24 Oct 2023 21:10:06 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jBO0zo_4Om2j; Tue, 24 Oct 2023 21:10:05 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1698174605; bh=9/om77KRAQXqnLYR6x5JabysQl8Rpe3P0M8fWzDjNtM=;
 h=From:To:Cc:Subject:Date;
 b=f71+17UotWbRcfDU2yDgVQCaUuQfH0+BldZGN7VQmudvC+E1x5KoHJfGlOErw1ei3
 jCggCfGj/ky24AS+hNV230L2uqpC/rlZbg/WJGjnS7U88igqfjwBmv1rh7HPPTHSkm
 2/IfJfQTyLb5gxMzC+/cNvYE5Dr81OhwD0aCJFU+kwJiDzR8SQDIWbcsXAA6ZKg+4l
 70Q8siBhYbigrD7/lq6xJMDwPJgoYgDvoUgRmgEoBYO8NJXXJBRVxcwyQJOgIx4CmL
 rDYB8GvxVditjxojXZUPFA0B2ua9/LP9yU75CK2IYga61lG0no/9J5oz+3jWSIQf9O
 ZKiIZSvgIOy9A==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/11] Increase coverage on drm_framebuffer.c
Date: Tue, 24 Oct 2023 16:09:51 -0300
Message-ID: <20231024191002.1620-1-gcarlos@disroot.org>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset includes new KUnit tests for 7 untested functions from
drm_framebuffer.c and improvements to the existent one.

The first patch replace the use of dev_private member from drm_device
mock on the existent test by embedding it into an outer struct containing
a generic pointer.

The patches 2 and 4 extends the test of drm_internal_framebuffer_create()
by creating a new test case and adding new parameters to the existent case.

The patch 3 just replace a strcpy() call to strscpy().

Finally, the remainder of this set contains 7 new test cases, one for each
of the follow functions:

- drm_framebuffer_check_src_coords()
- drm_framebuffer_cleanup()
- drm_framebuffer_lookup()
- drm_framebuffer_init()
- drm_framebuffer_free()
- drm_mode_addfb2()
- drm_fb_release()

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
v2:
  - Split strcpy to strscpy change on drm_test_framebuffer_create test
  into a separate patch [PATCH 03/11].
  - Extensively use drm_kunit_helper_alloc_drm_device() for drm_device mock.
  - Reorder kunit cases alphabetically.
  - Rename check_src_coords_case.
  - Remove unnecessary comments.
  - Add framebuffer size as a parameter on drm_framebuffer_check_src_coords
  case.
  - Replace drm_mode_object_add() call to drm_framebuffer_init() on
  drm_framebuffer_lookup() test.
  - Let fb1.dev unset instead of set it to wrong_drm to test mismatched
  drm_device passed as drm_framebuffer_init() argument on
  drm_framebuffer_init() test.
  - Clean the framebuffer object on drm_framebuffer_init_test.
---
Carlos Eduardo Gallo Filho (11):
  drm/tests: Stop using deprecated dev_private member on drm_framebuffer
    tests
  drm/tests: Add parameters to the drm_test_framebuffer_create test
  drm/tests: Replace strcpy to strscpy on drm_test_framebuffer_create
    test
  drm/tests: Add test case for drm_internal_framebuffer_create()
  drm/tests: Add test for drm_framebuffer_check_src_coords()
  drm/tests: Add test for drm_framebuffer_cleanup()
  drm/tests: Add test for drm_framebuffer_lookup()
  drm/tests: Add test for drm_framebuffer_init()
  drm/tests: Add test for drm_framebuffer_free()
  drm/tests: Add test for drm_mode_addfb2()
  drm/tests: Add test for drm_fb_release()

 drivers/gpu/drm/drm_framebuffer.c            |   1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 562 ++++++++++++++++++-
 2 files changed, 549 insertions(+), 14 deletions(-)

-- 
2.41.0


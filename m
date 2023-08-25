Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A4788CEB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 18:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EAC10E6C7;
	Fri, 25 Aug 2023 16:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B2510E6C7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 6040740EBE;
 Fri, 25 Aug 2023 18:08:07 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wOKBR8V-1c0U; Fri, 25 Aug 2023 18:08:06 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1692979686; bh=3IyoMa9kZ3Wnf06ZUY5MS7t88xPPUMYOdJ/lnUvnbZc=;
 h=From:To:Cc:Subject:Date;
 b=ghAELO269QF99aFeBB3u9y4it/wjDhJdkJxTSmHLvHlQpyYsrDt0I/kLH1PN7YtzS
 oGOGbMfHEOIggdwSu2aDPZ9k+EPiV9IBZlq6H1EJB9XmVyLH/MJXmiPvQ2LZbGRhQt
 /Zm4Fj2ONvyYkYKAEbIaGOohsbbXIfI8EW/ql5ECMp0riVgGT0WqO7ckfMnaJP6rVQ
 R+ASDmi7UHCjhDdhi/4bmXk9OoXhcXia27issO9EDbaRniBgcpVFuB6RBb/NqmF2tH
 b2h+z9Bi46U+2I5D3nLl1nEn2f6tN+oH908aYhMHR3RvLefb2vaeuaY+tsN23sNZbt
 3yNcfty7d5kJw==
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] Increase coverage on drm_framebuffer.c
Date: Fri, 25 Aug 2023 13:07:15 -0300
Message-ID: <20230825160725.12861-1-gcarlos@disroot.org>
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
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset includes new KUnit tests for 7 untested functions from
drm_framebuffer.c and improvements to the existent one.

The first patch replace the use of dev_private member from drm_device
mock on the existent test by embedding it into an outer struct containing
a generic pointer.

The patches 2 and 3 extends the test of drm_internal_framebuffer_create()
by creating a new test case and adding new parameters to the existent case.

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
Carlos Eduardo Gallo Filho (10):
  drm/tests: Stop using deprecated dev_private member on drm_framebuffer
    tests
  drm/tests: Add parameters to the drm_test_framebuffer_create test
  drm/tests: Add test case for drm_internal_framebuffer_create()
  drm/tests: Add test for drm_framebuffer_check_src_coords()
  drm/tests: Add test for drm_framebuffer_cleanup()
  drm/tests: Add test for drm_framebuffer_lookup()
  drm/tests: Add test for drm_framebuffer_init()
  drm/tests: Add test for drm_framebuffer_free()
  drm/tests: Add test for drm_mode_addfb2()
  drm/tests: Add test for drm_fb_release()

 drivers/gpu/drm/drm_framebuffer.c            |   1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 563 ++++++++++++++++++-
 2 files changed, 553 insertions(+), 11 deletions(-)

-- 
2.41.0


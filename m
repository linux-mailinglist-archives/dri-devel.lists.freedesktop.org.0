Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB242948626
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 01:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E910E2AD;
	Mon,  5 Aug 2024 23:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Mm7sSh6x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92F610E2AD
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 23:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id A9E52419DB;
 Tue,  6 Aug 2024 01:37:56 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wRpAp4zixH5; Tue,  6 Aug 2024 01:37:55 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1722901075; bh=djT8aiZFrDVys0I06aQXqIiiRoxPzTqsCo/+qg8gQPU=;
 h=From:To:Cc:Subject:Date;
 b=Mm7sSh6x9K/HOffZz1YUxfmE2xMD7eQTRIiSRD3VhUt0aVcKPbK9h92tT+6YXQxUl
 xUQh5Ilgw88GxaIuH6R+r3F6n4pQl19aUodzL7caMLReunuw5mPkf3XNA+HICULgek
 iNd073EUuHY6ksThMSIAzTkumlNnuvJXB7FqfAS4vQBajOfifCfN6ixXkTA3ZB+MGg
 G1iRIpusKH8v+aPPhIwXyh3YxxvOg76Ywh01xDIrTQkGOhxaDm32ueDFMyj0Hh6C+U
 tenxwy0BdSlPMlCEhb99Q9OUv8pI57OJb4rl7J31jbb3VuV3Zge/OrkPmfHK7m9lj8
 gKY4dxKt7BOsg==
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
Subject: [PATCH v4 0/9] Increase coverage on drm_framebuffer.c
Date: Mon,  5 Aug 2024 20:39:25 -0300
Message-ID: <20240805234022.18586-1-gcarlos@disroot.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset includes new KUnit tests for 5 untested functions from
drm_framebuffer.c and improvements to the existent one.

The first patch replace the use of dev_private member from drm_device
mock on the existent test by embedding it into an outer struct containing
a generic pointer.

The patches 2 and 4 extends the test of drm_internal_framebuffer_create()
by creating a new test case and adding new parameters to the existent case.

The patch 3 just replace a strcpy() call to strscpy().

Finally, the remainder of this set contains 5 new test cases, one for each
of the follow functions:

- drm_framebuffer_check_src_coords()
- drm_framebuffer_cleanup()
- drm_framebuffer_lookup()
- drm_framebuffer_init()
- drm_framebuffer_free()

---
v3:
  - Drop drm_mode_addfb2 and drm_fb_release tests (patches 10 and 11 from v2)
---

Carlos Eduardo Gallo Filho (9):
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

 drivers/gpu/drm/drm_framebuffer.c            |   2 +
 drivers/gpu/drm/drm_mode_object.c            |   1 +
 drivers/gpu/drm/tests/drm_framebuffer_test.c | 373 ++++++++++++++++++-
 3 files changed, 359 insertions(+), 17 deletions(-)

-- 
2.44.2


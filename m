Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B45766826
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E8F10E6A6;
	Fri, 28 Jul 2023 09:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA9810E6A6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:06:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B39BA62091;
 Fri, 28 Jul 2023 09:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1666FC433C8;
 Fri, 28 Jul 2023 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690535181;
 bh=z71umijlxmTAL6fmeqF7sXIHYBkziN7MrblCPM0z1qU=;
 h=From:Subject:Date:To:Cc:From;
 b=L03GYaCqlbKhW+nIfq+i8DR2wabhrsTy4zMBGpLFcCZUGMjx61km5LmkcDQgjzQ21
 S6uRT8J12TQlt8GG4PtIEo0Bv1tfp5XskUIYVnI7VMLa8NhplyGWoTbMldT69FiM3H
 SnoQsE2WRuKtFpZCSNeM7CiC7j8fULtqmuXZX555nKm9a34cnqdizl7zW+GyZS+oem
 G8xv3uIggct0Dp+i4ZgTyGpcv2F68z3fSiXVC+nM1r+cf4KJECMfn5T+747Jl10NtV
 yEbPefhAvU4iHd94JrwjBZXNbJ+jw8vvVOwJ4g5lC5kEgXRPZRzFC0bHK2oEbqiysq
 EkQSM4X+wg5jQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/11] drm: kunit: Switch to kunit actions
Date: Fri, 28 Jul 2023 11:06:13 +0200
Message-Id: <20230728-kms-kunit-actions-rework-v3-0-952565ccccfe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAWFw2QC/43NwQ7CIAyA4VcxnMVACUM9+R7GwwZ1IyiYMqdm2
 bvLdtKL8fg37deRZSSPme1XIyMcfPYpllDrFbNdHVvk3pVmIEAJIwUP18zDPfqe17Yvy5kTPhI
 Frp2slKnA7lTDyvmN8OyfC308le587hO9lk+DnKd/oIPkghsAq7fOgDVwCEgRL5tELZvVAT4k+
 CVBkaTRQprG6apuvqRpmt4wTD9qCwEAAA==
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2216; i=mripard@kernel.org;
 h=from:subject:message-id; bh=z71umijlxmTAL6fmeqF7sXIHYBkziN7MrblCPM0z1qU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmHWzkXrdfJTwr95F2i8+Cv1DTxK8/NejVFbBTe7Y0tz
 d3J73+yo5SFQYyLQVZMkSVG2HxJ3KlZrzvZ+ObBzGFlAhnCwMUpABPJ2cnI8GKBgLPzfDsnbtew
 80s2iL+odN63kWN+loHf7Ysq367IvGdk+PV4xXkz8UpG/qDfNc+t16at9v+U+MUkzWl2ud1nkx5
 9DgA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: linux-kselftest@vger.kernel.org,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>,
 Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Since v6.5-rc1, kunit gained a devm/drmm-like mechanism that makes tests
resources much easier to cleanup.

This series converts the existing tests to use those new actions where
relevant.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Fixed the build cast warnings by switching to wrapper functions 
- Link to v2: https://lore.kernel.org/r/20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org

Changes in v2:
- Fix some typos
- Use plaltform_device_del instead of removing the call to
  platform_device_put after calling platform_device_add
- Link to v1: https://lore.kernel.org/r/20230710-kms-kunit-actions-rework-v1-0-722c58d72c72@kernel.org

---
Maxime Ripard (11):
      drm/tests: helpers: Switch to kunit actions
      drm/tests: client-modeset: Remove call to drm_kunit_helper_free_device()
      drm/tests: modes: Remove call to drm_kunit_helper_free_device()
      drm/tests: probe-helper: Remove call to drm_kunit_helper_free_device()
      drm/tests: helpers: Create a helper to allocate a locking ctx
      drm/tests: helpers: Create a helper to allocate an atomic state
      drm/vc4: tests: pv-muxing: Remove call to drm_kunit_helper_free_device()
      drm/vc4: tests: mock: Use a kunit action to unregister DRM device
      drm/vc4: tests: pv-muxing: Switch to managed locking init
      drm/vc4: tests: Switch to atomic state allocation helper
      drm/vc4: tests: pv-muxing: Document test scenario

 drivers/gpu/drm/tests/drm_client_modeset_test.c |   8 --
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 141 +++++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_modes_test.c          |   8 --
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |   8 --
 drivers/gpu/drm/vc4/tests/vc4_mock.c            |  12 ++
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 115 +++++++------------
 include/drm/drm_kunit_helpers.h                 |   7 ++
 7 files changed, 198 insertions(+), 101 deletions(-)
---
base-commit: d7b3af5a77e8d8da28f435f313e069aea5bcf172
change-id: 20230710-kms-kunit-actions-rework-5d163762c93b

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


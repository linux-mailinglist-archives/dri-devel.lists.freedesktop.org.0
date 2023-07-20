Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AC75ACAF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 13:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8D10E5A2;
	Thu, 20 Jul 2023 11:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7810E5A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 11:15:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B0ED61A2A;
 Thu, 20 Jul 2023 11:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8AAAC433C7;
 Thu, 20 Jul 2023 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689851755;
 bh=73gGluoq2h/z3lT1moMzLu5ggv2o12BR1rQu/YvuDqY=;
 h=From:Subject:Date:To:Cc:From;
 b=AADqVC6n/KiENfSQgakkG568Mj9vRtv0ERfGsfDctE6jDIVSEN6cMtCGWbrLGmqKR
 L3SIW0TdsOkVo+xu6/8erHdegTNEs8vpHC6lixIgddDkM/2gVvjXLPLswIUMjXTilO
 59DoFDb0Y68jl4akGEGNPTx1PNnCOz0kIl018edRfuLPycDuF+TR1dNXZCfuxBenel
 DCrO4z299FCeicz7yLBJWiir/vYXu7GTFs5c20jjoeQWtBfjngKr4ub92lIOiYfwdj
 /LW8f0v/Xb6enJJqo052utJOKgyA7owoyQ3s6kb+8If4e/akvHxp+Bj6fOUJAllSA1
 UsOxQOK7alz2Q==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 00/11] drm: kunit: Switch to kunit actions
Date: Thu, 20 Jul 2023 13:15:45 +0200
Message-Id: <20230720-kms-kunit-actions-rework-v2-0-175017bd56ab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEXuWQC/42NQQ6CMBBFr0Jm7Zh2CFRdeQ/DAssITbUlU0QN4
 e5WTuDy/fz//gKJxXGCU7GA8OySiyED7QqwQxt6RtdlBlJUKqMV+kdC/wxuwtZOuZxQ+BXFY9X
 pujQ12WN5hTwfhW/uvakvTebBpSnKZ3ua9S/9QzprVGiIbHXoDFlDZ88S+L6P0kOzrusXP7+xq
 cEAAAA=
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=mripard@kernel.org;
 h=from:subject:message-id; bh=73gGluoq2h/z3lT1moMzLu5ggv2o12BR1rQu/YvuDqY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCk7xTNWPPmlmWOcu0Oi23rVl1XGqpOqOL5N+H3u4vnEy
 sWKaxUfdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiL+YyMnSKrZ36OHzmhbBv
 dk/MJgpcFJT4N72hPY9Hfcsugctlx3IYfrMeqdK8sq500gHZ/W+nzDfx1P33Ja+mm0k4eKWus5X
 ZEW4A
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
 drivers/gpu/drm/tests/drm_kunit_helpers.c       | 108 +++++++++++++++++++++-
 drivers/gpu/drm/tests/drm_modes_test.c          |   8 --
 drivers/gpu/drm/tests/drm_probe_helper_test.c   |   8 --
 drivers/gpu/drm/vc4/tests/vc4_mock.c            |   5 ++
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c  | 115 +++++++++---------------
 include/drm/drm_kunit_helpers.h                 |   7 ++
 7 files changed, 158 insertions(+), 101 deletions(-)
---
base-commit: c58c49dd89324b18a812762a2bfa5a0458e4f252
change-id: 20230710-kms-kunit-actions-rework-5d163762c93b

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


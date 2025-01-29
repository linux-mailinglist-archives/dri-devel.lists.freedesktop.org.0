Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920DA21EF4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 15:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4010E0DD;
	Wed, 29 Jan 2025 14:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uVcMhwdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8050210E0DD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2025 14:22:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9D3A4A419A9;
 Wed, 29 Jan 2025 14:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B970BC4CED1;
 Wed, 29 Jan 2025 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738160524;
 bh=zlwTZDYiDcP20fDfhTpAMiEjpQF0Tna17N/6izt8lj8=;
 h=From:Subject:Date:To:Cc:From;
 b=uVcMhwdyy6tZKov1CtFw0z6NftB43qCZJz4oXoZQ3eGQBX1wDnS8miiqF9/FHWpye
 ezT5tZionHtDDgPm8gHt/MDaWePbobg/LLx4BrDxHMgbKx6GrVCWfdy3Y/PnyAxblA
 bgPiUwm2ecI2rwmn5noL2rvjJRXv406zYUACdJZtIdmuchrNPJmpOKtJ6Cv0mZ08WC
 MYKt2yd2oYdETswEhboBolI1qfmxxQvI76h4fd/vzc4KlH0+HIyv4c/X9aN+SiMcOm
 Htt7Jyadh/vqDW0xyNtYgPt9TirjXBK7oeuOvrUxeFIhaFgBJ3994S3T/Fm6SHCwSW
 H8nfYp5BVVERw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v2 0/4] drm/tests: Fix locking issues (kind of)
Date: Wed, 29 Jan 2025 15:21:52 +0100
Message-Id: <20250129-test-kunit-v2-0-fe59c43805d5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIA5mmcC/x3MywqDMBCF4VeRWTcySQxoV32P4sLLqINtlEkqL
 eK7N7r8D5xvh0DCFOCe7SC0ceDFpzC3DLqp8SMp7lODQeNQm0pFClHNH89RubaxHdp2GFqEdFi
 FBv5e2LNOPXGIi/wue9PnejKFRqux0s6VuSmsKx0qrd7CayP9Yybx9MoXGaE+juMPA6sHPaAAA
 AA=
X-Change-ID: 20250129-test-kunit-5ba3c03bffb0
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2837; i=mripard@kernel.org;
 h=from:subject:message-id; bh=zlwTZDYiDcP20fDfhTpAMiEjpQF0Tna17N/6izt8lj8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmzLNssqhISn+yWDtnRl9EtP2dN2sS224Zfy87YfuRwc
 H5wXle/YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwk7ydjrXCPjLmv6crmhl13
 b3PxMx+Ifjk34UXRXdXUF7MMjx2TK78wr/371g2HlDad6hQMuF1syFin+WSR4Gmmi+y/F/Wd/7L
 Iyf6w57ZHwu42zltvrF2XdkHp7vmv6+TTV7W+3PCl/J7odN+1AA==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's another attempt at fixing the current locking issues with the
HDMI kunit tests.

The initial issue was reported by Dave here:
https://lore.kernel.org/all/CAPM=9tzJ4-ERDxvuwrCyUPY0=+P44orhp1kLWVGL7MCfpQjMEQ@mail.gmail.com/

After fixing it, there was still a lockdep warning for a circular
dependency. This series is also fixing the issue.

There's still an issue though. When running the tests, I get:

KTAP version 1
1..1
    KTAP version 1
    # Subtest: drm_atomic_helper_connector_hdmi_check
    # module: drm_hdmi_state_helper_test
    1..1

====================================
WARNING: kunit_try_catch/25 still has locks held!
6.13.0-rc2-00410-gbd9d16533367 #18 Tainted: G                 N
------------------------------------
2 locks held by kunit_try_catch/25:
 #0: fff00000021586f0 (crtc_ww_class_acquire){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0
 #1: fff0000002158718 (crtc_ww_class_mutex){+.+.}-{0:0}, at: drm_kunit_helper_acquire_ctx_alloc+0x5c/0xf0

stack backtrace:
CPU: 0 UID: 0 PID: 25 Comm: kunit_try_catch Tainted: G                 N 6.13.0-rc2-00410-gbd9d16533367 #18
Tainted: [N]=TEST
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x18/0x30 (C)
 dump_stack_lvl+0x70/0x98
 dump_stack+0x18/0x24
 debug_check_no_locks_held+0x9c/0xa4
 do_exit+0x52c/0x970
 kthread_exit+0x28/0x30
 kthread+0xdc/0xf0
 ret_from_fork+0x10/0x20
    ok 1 drm_test_check_hdmi_funcs_reject_rate
ok 1 drm_atomic_helper_connector_hdmi_check

I believe it's due to the fact that drm_kunit_helper_acquire_ctx_alloc()
will acquire the lock directly, but will release it as a deferred kunit
action. It's not unsafe, as the lock is eventually released, but I don't
really know what the best course of action is here:

  * Forget about the idea of a context tied to the lifetime of a test
  * Make lockdep know that it's ok, and we know what to do 

I've tried the latter, using lockdep_pin/unpin_lock, but that didn't fix
the issue so I must have done something wrong.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v2:
- Fix circular dependency warning
- Link to v1: https://lore.kernel.org/r/20241031091558.2435850-1-mripard@kernel.org

---
Maxime Ripard (4):
      drm/tests: hdmi: Fix WW_MUTEX_SLOWPATH failures
      drm/tests: hdmi: Remove redundant assignments
      drm/tests: hdmi: Reorder DRM entities variables assignment
      drm/tests: hdmi: Fix recursive locking

 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 200 +++++++++++----------
 1 file changed, 103 insertions(+), 97 deletions(-)
---
base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
change-id: 20250129-test-kunit-5ba3c03bffb0

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


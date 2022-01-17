Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4E4490339
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 08:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7610F172;
	Mon, 17 Jan 2022 07:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jan 2022 07:55:46 UTC
Received: from qq.com (smtpbg410.qq.com [113.96.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BCC810F172;
 Mon, 17 Jan 2022 07:55:45 +0000 (UTC)
X-QQ-mid: bizesmtp37t1642405658tdskzx5s
Received: from localhost.localdomain (unknown [111.207.172.18])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 17 Jan 2022 15:47:32 +0800 (CST)
X-QQ-SSF: 01400000002000B0F000B00E0000000
X-QQ-FEAT: vmnbzJorTWTgkQ7DWUHbMUg6c+p2EVa1iwQeuJc8z5eKeQySQBOoCsunHtT3G
 mzT2Emv+ANyWCsJ8UXxzXWSzMaBJVOxLSxIjpy5v2UnWf+Q3ryU5ck4gdDJnUqLVbxnwt3Q
 pmbqFAYQ/hRxi2ngXdplqXsPu2RZ4fcrTD7nBS1TT71Ph84qJwaEaED2UkA34RqJuE8c44u
 XHyMajZbIVvcoCSSRBqE3kQJdEcxtxo3zO5hNGNAIaHCmStEx5G0k88XIGsWYri7bvexWwC
 1n1tSixwomDe2P9tp0AhNGkwj0m+5tSDpHXsNdGmBS7nmV2Z/b4sQCPulDiazx5gZwBoe7S
 DWaSInlUPo8h/OBRU4=
X-QQ-GoodBg: 2
From: Qiang Ma <maqianga@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/radeon: fix UVD suspend error
Date: Mon, 17 Jan 2022 15:47:31 +0800
Message-Id: <20220117074731.29882-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
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
Cc: Qiang Ma <maqianga@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I met a bug recently and the kernel log:

[  330.171875] radeon 0000:03:00.0: couldn't schedule ib
[  330.175781] [drm:radeon_uvd_suspend [radeon]] *ERROR* Error destroying UVD (-22)!

In radeon drivers, using UVD suspend is as follows:

if (rdev->has_uvd) {
        uvd_v1_0_fini(rdev);
        radeon_uvd_suspend(rdev);
}

In radeon_ib_schedule function, we check the 'ring->ready' state,
but in uvd_v1_0_fini funciton, we've cleared the ready state.
So, just modify the suspend code flow to fix error.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 drivers/gpu/drm/radeon/cik.c       | 2 +-
 drivers/gpu/drm/radeon/evergreen.c | 2 +-
 drivers/gpu/drm/radeon/ni.c        | 2 +-
 drivers/gpu/drm/radeon/r600.c      | 2 +-
 drivers/gpu/drm/radeon/rv770.c     | 2 +-
 drivers/gpu/drm/radeon/si.c        | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 81b4de7be9f2..5819737c21c6 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -8517,8 +8517,8 @@ int cik_suspend(struct radeon_device *rdev)
 	cik_cp_enable(rdev, false);
 	cik_sdma_enable(rdev, false);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	if (rdev->has_vce)
 		radeon_vce_suspend(rdev);
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index eeb590d2dec2..455f8036aa54 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -5156,8 +5156,8 @@ int evergreen_suspend(struct radeon_device *rdev)
 	radeon_pm_suspend(rdev);
 	radeon_audio_fini(rdev);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	r700_cp_stop(rdev);
 	r600_dma_stop(rdev);
diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
index 4a364ca7a1be..927e5f42e97d 100644
--- a/drivers/gpu/drm/radeon/ni.c
+++ b/drivers/gpu/drm/radeon/ni.c
@@ -2323,8 +2323,8 @@ int cayman_suspend(struct radeon_device *rdev)
 	cayman_cp_enable(rdev, false);
 	cayman_dma_stop(rdev);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	evergreen_irq_suspend(rdev);
 	radeon_wb_disable(rdev);
diff --git a/drivers/gpu/drm/radeon/r600.c b/drivers/gpu/drm/radeon/r600.c
index ca3fcae2adb5..dd78fc499402 100644
--- a/drivers/gpu/drm/radeon/r600.c
+++ b/drivers/gpu/drm/radeon/r600.c
@@ -3232,8 +3232,8 @@ int r600_suspend(struct radeon_device *rdev)
 	radeon_audio_fini(rdev);
 	r600_cp_stop(rdev);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	r600_irq_suspend(rdev);
 	radeon_wb_disable(rdev);
diff --git a/drivers/gpu/drm/radeon/rv770.c b/drivers/gpu/drm/radeon/rv770.c
index e592e57be1bb..38796af4fadd 100644
--- a/drivers/gpu/drm/radeon/rv770.c
+++ b/drivers/gpu/drm/radeon/rv770.c
@@ -1894,8 +1894,8 @@ int rv770_suspend(struct radeon_device *rdev)
 	radeon_pm_suspend(rdev);
 	radeon_audio_fini(rdev);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	r700_cp_stop(rdev);
 	r600_dma_stop(rdev);
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 013e44ed0f39..8d5e4b25609d 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -6800,8 +6800,8 @@ int si_suspend(struct radeon_device *rdev)
 	si_cp_enable(rdev, false);
 	cayman_dma_stop(rdev);
 	if (rdev->has_uvd) {
-		uvd_v1_0_fini(rdev);
 		radeon_uvd_suspend(rdev);
+		uvd_v1_0_fini(rdev);
 	}
 	if (rdev->has_vce)
 		radeon_vce_suspend(rdev);
-- 
2.20.1




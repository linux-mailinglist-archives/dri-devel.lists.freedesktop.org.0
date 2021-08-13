Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6F3EB407
	for <lists+dri-devel@lfdr.de>; Fri, 13 Aug 2021 12:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B796E5A9;
	Fri, 13 Aug 2021 10:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.180])
 by gabe.freedesktop.org (Postfix) with ESMTP id 81A606E5A5;
 Fri, 13 Aug 2021 10:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B1BA320201B;
 Fri, 13 Aug 2021 12:29:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0p1l-mWD0BLT; Fri, 13 Aug 2021 12:29:21 +0200 (CEST)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPA id 601C320201A;
 Fri, 13 Aug 2021 12:29:21 +0200 (CEST)
Received: from daenzer by kaveri with local (Exim 4.94.2)
 (envelope-from <michel@daenzer.net>)
 id 1mEURE-0000ua-9l; Fri, 13 Aug 2021 12:29:20 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
Date: Fri, 13 Aug 2021 12:29:20 +0200
Message-Id: <20210813102920.3458-1-michel@daenzer.net>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811165211.6811-1-michel@daenzer.net>
References: <20210811165211.6811-1-michel@daenzer.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michel Dänzer <mdaenzer@redhat.com>

schedule_delayed_work does not push back the work if it was already
scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
was disabled and re-enabled again during those 100 ms.

This resulted in frame drops / stutter with the upcoming mutter 41
release on Navi 14, due to constantly enabling GFXOFF in the HW and
disabling it again (for getting the GPU clock counter).

To fix this, call cancel_delayed_work_sync when GFXOFF transitions from
enabled to disabled. This makes sure the delayed work will be scheduled
as intended in the reverse case.

In order to avoid a deadlock, amdgpu_device_delay_enable_gfx_off needs
to use mutex_trylock instead of mutex_lock.

v2:
* Use cancel_delayed_work_sync & mutex_trylock instead of
  mod_delayed_work.

Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 ++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 13 +++++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h    |  3 +++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index f3fd5ec710b6..8b025f70706c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2777,7 +2777,16 @@ static void amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
 	struct amdgpu_device *adev =
 		container_of(work, struct amdgpu_device, gfx.gfx_off_delay_work.work);
 
-	mutex_lock(&adev->gfx.gfx_off_mutex);
+	/* mutex_lock could deadlock with cancel_delayed_work_sync in amdgpu_gfx_off_ctrl. */
+	if (!mutex_trylock(&adev->gfx.gfx_off_mutex)) {
+		/* If there's a bug which causes amdgpu_gfx_off_ctrl to be called with enable=true
+		 * when adev->gfx.gfx_off_req_count is already 0, we might race with that.
+		 * Re-schedule to make sure gfx off will be re-enabled in the HW eventually.
+		 */
+		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
+		return;
+	}
+
 	if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
 		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, true))
 			adev->gfx.gfx_off_state = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a0be0772c8b3..da4c46db3093 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -28,9 +28,6 @@
 #include "amdgpu_rlc.h"
 #include "amdgpu_ras.h"
 
-/* delay 0.1 second to enable gfx off feature */
-#define GFX_OFF_DELAY_ENABLE         msecs_to_jiffies(100)
-
 /*
  * GPU GFX IP block helpers function.
  */
@@ -569,9 +566,13 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device *adev, bool enable)
 		adev->gfx.gfx_off_req_count--;
 
 	if (enable && !adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
-		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, GFX_OFF_DELAY_ENABLE);
-	} else if (!enable && adev->gfx.gfx_off_state) {
-		if (!amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
+		schedule_delayed_work(&adev->gfx.gfx_off_delay_work, AMDGPU_GFX_OFF_DELAY_ENABLE);
+	} else if (!enable) {
+		if (adev->gfx.gfx_off_req_count == 1 && !adev->gfx.gfx_off_state)
+			cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
+
+		if (adev->gfx.gfx_off_state &&
+		    !amdgpu_dpm_set_powergating_by_smu(adev, AMD_IP_BLOCK_TYPE_GFX, false)) {
 			adev->gfx.gfx_off_state = false;
 
 			if (adev->gfx.funcs->init_spm_golden) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index d43fe2ed8116..dcdb505bb7f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -32,6 +32,9 @@
 #include "amdgpu_rlc.h"
 #include "soc15.h"
 
+/* delay 0.1 second to enable gfx off feature */
+#define AMDGPU_GFX_OFF_DELAY_ENABLE msecs_to_jiffies(100)
+
 /* GFX current status */
 #define AMDGPU_GFX_NORMAL_MODE			0x00000000L
 #define AMDGPU_GFX_SAFE_MODE			0x00000001L
-- 
2.32.0


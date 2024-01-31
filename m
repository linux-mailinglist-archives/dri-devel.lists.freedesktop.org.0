Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0633843866
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA49E113A35;
	Wed, 31 Jan 2024 08:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 80490 seconds by postgrey-1.36 at gabe;
 Wed, 31 Jan 2024 08:00:56 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.73.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A5A113A36;
 Wed, 31 Jan 2024 08:00:55 +0000 (UTC)
X-QQ-mid: bizesmtp89t1706688027th56win0
X-QQ-Originating-IP: KQpK/PDyDmc54dnUtVZv7CyrvU17uca8QXqUDFp2hRU=
Received: from localhost.localdomain ( [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 31 Jan 2024 16:00:25 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: CR3LFp2JE4mvgzHDt8GZfGezvQzfNYVF+11pE6LOuVF6n18ZsLrVMir3YiUr5
 Yl11v7yw06d0eMvVAQsLOahZW5ms0a/GIJeTYOK8UOs1snl0xjnuz3qi7sIlzzNKONSiY9X
 lZxG/NiavXGgRJEEXqOYsBOkwHu63WNaiSfy3AlY3LgVUZ5vhtz/iMmsh0Qp/nRhRj1nL+V
 JD2givdVKbBy+D7fD48q2olGvEQlSKQFf+X30NKwrKYvYsko1DyFAAPUAPawdagcH+gZ5Od
 M16d5beHDeafVjmeb1+SwtdgsLxXEOm4MfVn91RBaRPIgBVyl3z/94BKlwg+vk/NjwH+SKH
 SL2G4yx9/yyKB/G37NYymu/cGCOK8TncDTD1NUhWals3BPJNVZHwfsxKZwgj5Lo7vzHK0gW
 lI18A5kr6tI=
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11701286619557200158
From: Qiang Ma <maqianga@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, srinivasan.shanmugam@amd.com,
 sunran001@208suo.com
Subject: [PATCH v2] drm/amdgpu: Clear the hotplug interrupt ack bit before hpd
 initialization
Date: Wed, 31 Jan 2024 15:57:03 +0800
Message-Id: <20240131075703.24600-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0
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

Problem:
The computer in the bios initialization process, unplug the HDMI display,
wait until the system up, plug in the HDMI display, did not enter the
hotplug interrupt function, the display is not bright.

Fix:
After the above problem occurs, and the hpd ack interrupt bit is 1,
the interrupt should be cleared during hpd_init initialization so that
when the driver is ready, it can respond to the hpd interrupt normally.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
v2:
 - Remove unused variable 'tmp'
 - Fixed function spelling errors
 
drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 22 ++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 22 ++++++++++++++++++----
 4 files changed, 40 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index bb666cb7522e..12a8ba929a72 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -51,6 +51,7 @@
 
 static void dce_v10_0_set_display_funcs(struct amdgpu_device *adev);
 static void dce_v10_0_set_irq_funcs(struct amdgpu_device *adev);
+static void dce_v10_0_hpd_int_ack(struct amdgpu_device *adev, int hpd);
 
 static const u32 crtc_offsets[] = {
 	CRTC0_REGISTER_OFFSET,
@@ -363,6 +364,7 @@ static void dce_v10_0_hpd_init(struct amdgpu_device *adev)
 				    AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
 		WREG32(mmDC_HPD_TOGGLE_FILT_CNTL + hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
 
+		dce_v10_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
 		dce_v10_0_hpd_set_polarity(adev, amdgpu_connector->hpd.hpd);
 		amdgpu_irq_get(adev, &adev->hpd_irq,
 			       amdgpu_connector->hpd.hpd);
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index 7af277f61cca..745e4fdffade 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -51,6 +51,7 @@
 
 static void dce_v11_0_set_display_funcs(struct amdgpu_device *adev);
 static void dce_v11_0_set_irq_funcs(struct amdgpu_device *adev);
+static void dce_v11_0_hpd_int_ack(struct amdgpu_device *adev, int hpd);
 
 static const u32 crtc_offsets[] =
 {
@@ -387,6 +388,7 @@ static void dce_v11_0_hpd_init(struct amdgpu_device *adev)
 				    AMDGPU_HPD_DISCONNECT_INT_DELAY_IN_MS);
 		WREG32(mmDC_HPD_TOGGLE_FILT_CNTL + hpd_offsets[amdgpu_connector->hpd.hpd], tmp);
 
+		dce_v11_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
 		dce_v11_0_hpd_set_polarity(adev, amdgpu_connector->hpd.hpd);
 		amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector->hpd.hpd);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 143efc37a17f..28c4a735716b 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -272,6 +272,21 @@ static void dce_v6_0_hpd_set_polarity(struct amdgpu_device *adev,
 	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
 }
 
+static void dce_v6_0_hpd_int_ack(struct amdgpu_device *adev,
+				 int hpd)
+{
+	u32 tmp;
+
+	if (hpd >= adev->mode_info.num_hpd) {
+		DRM_DEBUG("invalid hdp %d\n", hpd);
+		return;
+	}
+
+	tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
+	tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
+	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
+}
+
 /**
  * dce_v6_0_hpd_init - hpd setup callback.
  *
@@ -311,6 +326,7 @@ static void dce_v6_0_hpd_init(struct amdgpu_device *adev)
 			continue;
 		}
 
+		dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
 		dce_v6_0_hpd_set_polarity(adev, amdgpu_connector->hpd.hpd);
 		amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector->hpd.hpd);
 	}
@@ -3088,7 +3104,7 @@ static int dce_v6_0_hpd_irq(struct amdgpu_device *adev,
 			    struct amdgpu_irq_src *source,
 			    struct amdgpu_iv_entry *entry)
 {
-	uint32_t disp_int, mask, tmp;
+	uint32_t disp_int, mask;
 	unsigned hpd;
 
 	if (entry->src_data[0] >= adev->mode_info.num_hpd) {
@@ -3101,9 +3117,7 @@ static int dce_v6_0_hpd_irq(struct amdgpu_device *adev,
 	mask = interrupt_status_offsets[hpd].hpd;
 
 	if (disp_int & mask) {
-		tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
-		tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
-		WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
+		dce_v6_0_hpd_int_ack(adev, hpd);
 		schedule_delayed_work(&adev->hotplug_work, 0);
 		DRM_DEBUG("IH: HPD%d\n", hpd + 1);
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index adeddfb7ff12..8ff2b5adfd95 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -264,6 +264,21 @@ static void dce_v8_0_hpd_set_polarity(struct amdgpu_device *adev,
 	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
 }
 
+static void dce_v8_0_hpd_int_ack(struct amdgpu_device *adev,
+				 int hpd)
+{
+	u32 tmp;
+
+	if (hpd >= adev->mode_info.num_hpd) {
+		DRM_DEBUG("invalid hdp %d\n", hpd);
+		return;
+	}
+
+	tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
+	tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
+	WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
+}
+
 /**
  * dce_v8_0_hpd_init - hpd setup callback.
  *
@@ -303,6 +318,7 @@ static void dce_v8_0_hpd_init(struct amdgpu_device *adev)
 			continue;
 		}
 
+		dce_v8_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
 		dce_v8_0_hpd_set_polarity(adev, amdgpu_connector->hpd.hpd);
 		amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector->hpd.hpd);
 	}
@@ -3176,7 +3192,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
 			    struct amdgpu_irq_src *source,
 			    struct amdgpu_iv_entry *entry)
 {
-	uint32_t disp_int, mask, tmp;
+	uint32_t disp_int, mask;
 	unsigned hpd;
 
 	if (entry->src_data[0] >= adev->mode_info.num_hpd) {
@@ -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
 	mask = interrupt_status_offsets[hpd].hpd;
 
 	if (disp_int & mask) {
-		tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
-		tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
-		WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
+		dce_v8_0_hpd_int_ack(adev, hpd);
 		schedule_delayed_work(&adev->hotplug_work, 0);
 		DRM_DEBUG("IH: HPD%d\n", hpd + 1);
 	}
-- 
2.20.1


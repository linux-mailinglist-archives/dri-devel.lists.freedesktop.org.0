Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8AC841FE1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 10:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEEC10F00A;
	Tue, 30 Jan 2024 09:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Tue, 30 Jan 2024 09:41:25 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D75C10EC2A;
 Tue, 30 Jan 2024 09:41:25 +0000 (UTC)
X-QQ-mid: bizesmtp66t1706607524t8ljfom5
X-QQ-Originating-IP: MNSEeMuOZ9lvFqensrikzTfnoUJDWSKe36HfiiCwqdY=
Received: from localhost.localdomain ( [123.114.60.34])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 30 Jan 2024 17:38:42 +0800 (CST)
X-QQ-SSF: 01400000000000E0L000000A0000000
X-QQ-FEAT: HXiF522FjMjWLRmR8bTORYhARGnWrOcrgyElIPyt8kAHCwHZECQDBFeqATL3C
 8c7qFuKJxAeancrgd0kdGIOcCftL24HUfKOFw/GpbUS+L17iA7IOnA419/RC1nq+YG+FOJA
 3QGeDJ8RqCZ7+OTCLt6Zc2JczZBztM8meAMRiwmCZ8aEjioDewYc3FEjgoLhylMDki4hrWz
 J5pPRYW0a0APCSDIM9yFVVi8jO7lAv1dtS/UyKYjzdcbgkrHxlTim26gQQJyQgEJX57UN5A
 NzaSe1Ro53wL5LFEQH4wHfEY1x4plzuAy9wUxDtp+hsVYWM9YKO6B1fpDmzBMg/7JN3pNTN
 J0ZrRoY0llUQ6ZXAtZG8n3mt/hWy0kw51uMIgIO3NRG6SulEJO6BOclFGX3XqvQq5SDPOsS
 z1J9Ty9RXmU=
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10257619297343523134
From: Qiang Ma <maqianga@uniontech.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, sunran001@208suo.com,
 srinivasan.shanmugam@amd.com
Subject: [PATCH] drm/amdgpu: Clear the hotplug interrupt ack bit before hpd
 initialization
Date: Tue, 30 Jan 2024 17:38:08 +0800
Message-Id: <20240130093808.23890-1-maqianga@uniontech.com>
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
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c |  2 ++
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c  | 20 +++++++++++++++++---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c  | 20 +++++++++++++++++---
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index bb666cb7522e..11859059fd10 100644
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
 
+		dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
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
index 143efc37a17f..f8e15ebf74b4 100644
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
index adeddfb7ff12..141e33a01686 100644
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
 
+		dce_v6_0_hpd_int_ack(adev, amdgpu_connector->hpd.hpd);
 		dce_v8_0_hpd_set_polarity(adev, amdgpu_connector->hpd.hpd);
 		amdgpu_irq_get(adev, &adev->hpd_irq, amdgpu_connector->hpd.hpd);
 	}
@@ -3189,9 +3205,7 @@ static int dce_v8_0_hpd_irq(struct amdgpu_device *adev,
 	mask = interrupt_status_offsets[hpd].hpd;
 
 	if (disp_int & mask) {
-		tmp = RREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd]);
-		tmp |= DC_HPD1_INT_CONTROL__DC_HPD1_INT_ACK_MASK;
-		WREG32(mmDC_HPD1_INT_CONTROL + hpd_offsets[hpd], tmp);
+		dce_v6_0_hpd_int_ack(adev, hpd);
 		schedule_delayed_work(&adev->hotplug_work, 0);
 		DRM_DEBUG("IH: HPD%d\n", hpd + 1);
 	}
-- 
2.20.1


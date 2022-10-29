Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F326A61296A
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 10:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B1110E079;
	Sun, 30 Oct 2022 09:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 976 seconds by postgrey-1.36 at gabe;
 Sat, 29 Oct 2022 19:29:56 UTC
Received: from moc6.cz (hosting.moc6.cz [IPv6:2a02:c60:c70:8900::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4A310E2D8;
 Sat, 29 Oct 2022 19:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=moc6.cz;
 s=mail20201116; h=Message-ID:Subject:Cc:To:From:Date:Reply-To:In-Reply-To;
 bh=/KZ42D3HakbTGEBmYLFXIwAxUy17kAfEEriya9xR94A=; b=PI3A0ss1I9FqpoZTYN1cM8Pqlm
 gyf8SayurTBFU91SklIzKzQDvMU/BubynTVmXOqvH3HvWB5XrD3to50VSlCzfhy7skuIQMc7geuvu
 Bg1WoWqA7i9sXYpDj3239B+0qQwSC2RpObTCjmUtyfbGFmn3DB6pBvnmZtEc1CQSw8u3+xp7fKHmW
 xzrk2m/zwuDQ6wuw+/Ocu091I7BCTsb9WIHieLucVGZG5s/waUOBnzymCL7p2/m5kUj+49Cfmb/pk
 IbfKx+LlnS6G4DhglkJ8lx9t0MNSr3jnzkkouyiTL00dcaGXKbYqMKYeib17XZ8oYovwqW0wfhKux
 2f+DF/D5Rk7FT0DzxLX0zWUCa2wVC1YW+58/aF5EJ8fUzUeB4kdqdGGasRfVlJEmtvrQpZVaRv10d
 MLB2IjGkQb7aXZkOzCAD9K00HwUdlUtC5ozBqCa2P5deRjm7RtRknRX112aBbgXAkLFNdRDq+H6vk
 qJQzcIs7iCao17FP288ypEopfQCg4TA9QDlCz1ucFGsVaXDkcYv4uft5PBKMwnmKjxumFILsH+Xhc
 4Zw/nSVSYRcQVX7e28YdcDQBebcjfU1WA9rHo3OjmAI/3PuuxScdWvwmzZ9OAYq1woGB55yTQekd5
 UZKFq3qAZwgQxc64kt0GyFWueAXvF6BI57eNlok9Y=;
Received: from Debian-exim by moc6.cz with local (Exim 4.94.2)
 (envelope-from <Debian-exim@moc6.cz>) authenticated: Debian-exim
 id 1oorGu-000siT-5T; Sat, 29 Oct 2022 21:13:32 +0200
Date: Sat, 29 Oct 2022 21:13:32 +0200
From: Filip Moc <dev@moc6.cz>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/amd/display: add parameter backlight_min
Message-ID: <Y117XNaSP6/8bH+3@moc6.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:26:02 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are some devices on which amdgpu won't allow user to set brightness
to sufficiently low values even though the hardware would support it just
fine.

This usually happens in two cases when either configuration of brightness
levels via ACPI/ATIF is not available and amdgpu falls back to defaults
(currently 12 for minimum level) which may be too high for some devices or
even the configuration via ATIF is available but the minimum brightness
level provided by the manufacturer is set to unreasonably high value.

In either case user can use this new module parameter to adjust the
minimum allowed backlight brightness level.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=203439
Signed-off-by: Filip Moc <dev@moc6.cz>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  3 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           | 15 +++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 15 +++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 0e6ddf05c23c..c5445402c49d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -200,6 +200,9 @@ extern uint amdgpu_dc_debug_mask;
 extern uint amdgpu_dc_visual_confirm;
 extern uint amdgpu_dm_abm_level;
 extern int amdgpu_backlight;
+#ifdef CONFIG_DRM_AMD_DC
+extern int amdgpu_backlight_override_min[];
+#endif
 extern struct amdgpu_mgpu_info mgpu_info;
 extern int amdgpu_ras_enable;
 extern uint amdgpu_ras_mask;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 16f6a313335e..f2fb549ac52f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -43,6 +43,7 @@
 #include "amdgpu_irq.h"
 #include "amdgpu_dma_buf.h"
 #include "amdgpu_sched.h"
+#include "amdgpu_dm.h"
 #include "amdgpu_fdinfo.h"
 #include "amdgpu_amdkfd.h"
 
@@ -853,6 +854,20 @@ int amdgpu_backlight = -1;
 MODULE_PARM_DESC(backlight, "Backlight control (0 = pwm, 1 = aux, -1 auto (default))");
 module_param_named(backlight, amdgpu_backlight, bint, 0444);
 
+/**
+ * DOC: backlight_min (array of int)
+ * Override minimum allowed backlight brightness signal (per display).
+ * Must be less than the maximum brightness signal.
+ * Negative value means no override.
+ *
+ * Defaults to all -1 (no override on any display).
+ */
+#ifdef CONFIG_DRM_AMD_DC
+int amdgpu_backlight_override_min[AMDGPU_DM_MAX_NUM_EDP] = {[0 ... (AMDGPU_DM_MAX_NUM_EDP-1)] = -1};
+MODULE_PARM_DESC(backlight_min, "Override minimum backlight brightness signal (0..max-1, -1 = no override (default))");
+module_param_array_named(backlight_min, amdgpu_backlight_override_min, int, NULL, 0444);
+#endif
+
 /**
  * DOC: tmz (int)
  * Trusted Memory Zone (TMZ) is a method to protect data being written
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index eb4ce7216104..e2c36ba93d05 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3911,6 +3911,21 @@ static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
 	dm->backlight_caps[bl_idx].min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
 	dm->backlight_caps[bl_idx].max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
 #endif
+
+	if (amdgpu_backlight_override_min[bl_idx] >= 0) {
+		if (amdgpu_backlight_override_min[bl_idx] < dm->backlight_caps[bl_idx].max_input_signal) {
+			DRM_INFO("amdgpu: backlight[%i]: overriding minimum brightness from %i to %i\n",
+				  bl_idx,
+				  dm->backlight_caps[bl_idx].min_input_signal,
+				  amdgpu_backlight_override_min[bl_idx]);
+			dm->backlight_caps[bl_idx].min_input_signal = amdgpu_backlight_override_min[bl_idx];
+		} else {
+			DRM_ERROR("amdgpu: backlight[%i]: minimum brightness override (%i) is not below maximum (%i)\n",
+				  bl_idx,
+				  amdgpu_backlight_override_min[bl_idx],
+				  dm->backlight_caps[bl_idx].max_input_signal);
+		}
+	}
 }
 
 static int get_brightness_range(const struct amdgpu_dm_backlight_caps *caps,

base-commit: d8c03bfe146fd5e081a252cd34f3f12ca0255357
-- 
2.30.2


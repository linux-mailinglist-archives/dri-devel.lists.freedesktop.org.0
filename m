Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8754119F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D47410E8BF;
	Tue,  7 Jun 2022 19:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3710E8BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654630767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5oKkn33xwnFu7muBAJb4fepXgwP2QtkLfSMMNuhsJBQ=;
 b=huIrPTuMMjpWYRIjSBlbN5kP1AS2JzuoeX/0MzXRBnt0Ra+Ztx35FgQ1vBWEx+U7umGBwZ
 SlFk4qkMIUk3qgHUpiCq7AATHLgzehYqEidsvCWMOAY1FV4Qnx509FLO5SenwXOxocUnv7
 IF2D7LST9lfldV/3R3LxEz2H1tdYHxA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-zphWG6ZvOyOyoposXXjMrg-1; Tue, 07 Jun 2022 15:39:21 -0400
X-MC-Unique: zphWG6ZvOyOyoposXXjMrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C570485A588;
 Tue,  7 Jun 2022 19:37:50 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1CA62D1745E;
 Tue,  7 Jun 2022 19:37:21 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND RFC 17/18] drm/radeon: Drop legacy MST support
Date: Tue,  7 Jun 2022 15:29:32 -0400
Message-Id: <20220607192933.1333228-18-lyude@redhat.com>
In-Reply-To: <20220607192933.1333228-1-lyude@redhat.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Right now, radeon is technically the only non-atomic driver still making
use of the MST helpers - and thus the final user of all of the legacy MST
helpers. Originally I was going to look into seeing if we could move legacy
MST into the radeon driver itself, however:

* SI and CIK both can use amdgpu, which still supports MST
* It currently doesn't work according to my own testing. I'm sure with some
  troubleshooting we could likely fix it, but that brings me to point #2:
* It was never actually enabled by default, and is still marked as
  experimental in the module parameter description
* If people were using it, someone probably would have probably seen a bug
  report about how it is currently not functional by now. That certainly
  doesn't appear to be the case, since before getting access to my own
  hardware I had to go out of my way to try finding someone to help test
  whether this legacy MST code even works - even amongst AMD employees.
* Getting rid of this code and only having atomic versions of the MST
  helpers to maintain is likely going to be a lot easier in the long run,
  and will make it a lot easier for others contributing to this code to
  follow along with what's happening.

FWIW - if anyone still wants this code to be in the tree and has a good
idea of how to support this without needing to maintain the legacy MST
helpers (trying to move them would probably be acceptable), I'm happy to
suggestions. But my hope is that we can just drop this code and forget
about it. I've already run this idea by Harry Wentland and Alex Deucher a
few times as well.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/radeon/Makefile            |   2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c     |  11 +-
 drivers/gpu/drm/radeon/atombios_encoders.c |  59 --
 drivers/gpu/drm/radeon/radeon_atombios.c   |   2 -
 drivers/gpu/drm/radeon/radeon_connectors.c |  61 +-
 drivers/gpu/drm/radeon/radeon_device.c     |   1 -
 drivers/gpu/drm/radeon/radeon_dp_mst.c     | 778 ---------------------
 drivers/gpu/drm/radeon/radeon_drv.c        |   4 -
 drivers/gpu/drm/radeon/radeon_encoders.c   |  14 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c    |  10 +-
 drivers/gpu/drm/radeon/radeon_mode.h       |  40 --
 11 files changed, 7 insertions(+), 975 deletions(-)
 delete mode 100644 drivers/gpu/drm/radeon/radeon_dp_mst.c

diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index ea5380e24c3c..b783ab39a075 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -49,7 +49,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
 	rv770_smc.o cypress_dpm.o btc_dpm.o sumo_dpm.o sumo_smc.o trinity_dpm.o \
 	trinity_smc.o ni_dpm.o si_smc.o si_dpm.o kv_smc.o kv_dpm.o ci_smc.o \
 	ci_dpm.o dce6_afmt.o radeon_vm.o radeon_ucode.o radeon_ib.o \
-	radeon_sync.o radeon_audio.o radeon_dp_auxch.o radeon_dp_mst.o
+	radeon_sync.o radeon_audio.o radeon_dp_auxch.o
 
 radeon-$(CONFIG_MMU_NOTIFIER) += radeon_mn.o
 
diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
index c94e429e75f9..e27da31d4f62 100644
--- a/drivers/gpu/drm/radeon/atombios_crtc.c
+++ b/drivers/gpu/drm/radeon/atombios_crtc.c
@@ -616,13 +616,6 @@ static u32 atombios_adjust_pll(struct drm_crtc *crtc,
 		}
 	}
 
-	if (radeon_encoder->is_mst_encoder) {
-		struct radeon_encoder_mst *mst_enc = radeon_encoder->enc_priv;
-		struct radeon_connector_atom_dig *dig_connector = mst_enc->connector->con_priv;
-
-		dp_clock = dig_connector->dp_clock;
-	}
-
 	/* use recommended ref_div for ss */
 	if (radeon_encoder->devices & (ATOM_DEVICE_LCD_SUPPORT)) {
 		if (radeon_crtc->ss_enabled) {
@@ -971,9 +964,7 @@ static bool atombios_crtc_prepare_pll(struct drm_crtc *crtc, struct drm_display_
 	radeon_crtc->bpc = 8;
 	radeon_crtc->ss_enabled = false;
 
-	if (radeon_encoder->is_mst_encoder) {
-		radeon_dp_mst_prepare_pll(crtc, mode);
-	} else if ((radeon_encoder->active_device & (ATOM_DEVICE_LCD_SUPPORT | ATOM_DEVICE_DFP_SUPPORT)) ||
+	if ((radeon_encoder->active_device & (ATOM_DEVICE_LCD_SUPPORT | ATOM_DEVICE_DFP_SUPPORT)) ||
 	    (radeon_encoder_get_dp_bridge_encoder_id(radeon_crtc->encoder) != ENCODER_OBJECT_ID_NONE)) {
 		struct radeon_encoder_atom_dig *dig = radeon_encoder->enc_priv;
 		struct drm_connector *connector =
diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
index 70bd84b7ef2b..597446a8df34 100644
--- a/drivers/gpu/drm/radeon/atombios_encoders.c
+++ b/drivers/gpu/drm/radeon/atombios_encoders.c
@@ -681,15 +681,7 @@ atombios_get_encoder_mode(struct drm_encoder *encoder)
 	struct drm_connector *connector;
 	struct radeon_connector *radeon_connector;
 	struct radeon_connector_atom_dig *dig_connector;
-	struct radeon_encoder_atom_dig *dig_enc;
 
-	if (radeon_encoder_is_digital(encoder)) {
-		dig_enc = radeon_encoder->enc_priv;
-		if (dig_enc->active_mst_links)
-			return ATOM_ENCODER_MODE_DP_MST;
-	}
-	if (radeon_encoder->is_mst_encoder || radeon_encoder->offset)
-		return ATOM_ENCODER_MODE_DP_MST;
 	/* dp bridges are always DP */
 	if (radeon_encoder_get_dp_bridge_encoder_id(encoder) != ENCODER_OBJECT_ID_NONE)
 		return ATOM_ENCODER_MODE_DP;
@@ -1737,10 +1729,6 @@ radeon_atom_encoder_dpms_dig(struct drm_encoder *encoder, int mode)
 	case DRM_MODE_DPMS_SUSPEND:
 	case DRM_MODE_DPMS_OFF:
 
-		/* don't power off encoders with active MST links */
-		if (dig->active_mst_links)
-			return;
-
 		if (ASIC_IS_DCE4(rdev)) {
 			if (ENCODER_MODE_IS_DP(atombios_get_encoder_mode(encoder)) && connector)
 				atombios_dig_encoder_setup(encoder, ATOM_ENCODER_CMD_DP_VIDEO_OFF, 0);
@@ -2006,53 +1994,6 @@ atombios_set_encoder_crtc_source(struct drm_encoder *encoder)
 	radeon_atombios_encoder_crtc_scratch_regs(encoder, radeon_crtc->crtc_id);
 }
 
-void
-atombios_set_mst_encoder_crtc_source(struct drm_encoder *encoder, int fe)
-{
-	struct drm_device *dev = encoder->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_crtc *radeon_crtc = to_radeon_crtc(encoder->crtc);
-	int index = GetIndexIntoMasterTable(COMMAND, SelectCRTC_Source);
-	uint8_t frev, crev;
-	union crtc_source_param args;
-
-	memset(&args, 0, sizeof(args));
-
-	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
-		return;
-
-	if (frev != 1 && crev != 2)
-		DRM_ERROR("Unknown table for MST %d, %d\n", frev, crev);
-
-	args.v2.ucCRTC = radeon_crtc->crtc_id;
-	args.v2.ucEncodeMode = ATOM_ENCODER_MODE_DP_MST;
-
-	switch (fe) {
-	case 0:
-		args.v2.ucEncoderID = ASIC_INT_DIG1_ENCODER_ID;
-		break;
-	case 1:
-		args.v2.ucEncoderID = ASIC_INT_DIG2_ENCODER_ID;
-		break;
-	case 2:
-		args.v2.ucEncoderID = ASIC_INT_DIG3_ENCODER_ID;
-		break;
-	case 3:
-		args.v2.ucEncoderID = ASIC_INT_DIG4_ENCODER_ID;
-		break;
-	case 4:
-		args.v2.ucEncoderID = ASIC_INT_DIG5_ENCODER_ID;
-		break;
-	case 5:
-		args.v2.ucEncoderID = ASIC_INT_DIG6_ENCODER_ID;
-		break;
-	case 6:
-		args.v2.ucEncoderID = ASIC_INT_DIG7_ENCODER_ID;
-		break;
-	}
-	atom_execute_table(rdev->mode_info.atom_context, index, (uint32_t *)&args);
-}
-
 static void
 atombios_apply_encoder_quirks(struct drm_encoder *encoder,
 			      struct drm_display_mode *mode)
diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
index 28c4413f4dc8..204127bad89c 100644
--- a/drivers/gpu/drm/radeon/radeon_atombios.c
+++ b/drivers/gpu/drm/radeon/radeon_atombios.c
@@ -826,8 +826,6 @@ bool radeon_get_atom_connector_info_from_object_table(struct drm_device *dev)
 	}
 
 	radeon_link_encoder_connector(dev);
-
-	radeon_setup_mst_connector(dev);
 	return true;
 }
 
diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index 58db79921cd3..f7431d224604 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -37,33 +37,12 @@
 #include <linux/pm_runtime.h>
 #include <linux/vga_switcheroo.h>
 
-static int radeon_dp_handle_hpd(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	int ret;
-
-	ret = radeon_dp_mst_check_status(radeon_connector);
-	if (ret == -EINVAL)
-		return 1;
-	return 0;
-}
 void radeon_connector_hotplug(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
 
-	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
-		struct radeon_connector_atom_dig *dig_connector =
-			radeon_connector->con_priv;
-
-		if (radeon_connector->is_mst_connector)
-			return;
-		if (dig_connector->is_mst) {
-			radeon_dp_handle_hpd(connector);
-			return;
-		}
-	}
 	/* bail if the connector does not have hpd pin, e.g.,
 	 * VGA, TV, etc.
 	 */
@@ -1664,9 +1643,6 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 	struct drm_encoder *encoder = radeon_best_single_encoder(connector);
 	int r;
 
-	if (radeon_dig_connector->is_mst)
-		return connector_status_disconnected;
-
 	if (!drm_kms_helper_is_poll_worker()) {
 		r = pm_runtime_get_sync(connector->dev->dev);
 		if (r < 0) {
@@ -1729,21 +1705,12 @@ radeon_dp_detect(struct drm_connector *connector, bool force)
 		radeon_dig_connector->dp_sink_type = radeon_dp_getsinktype(radeon_connector);
 		if (radeon_hpd_sense(rdev, radeon_connector->hpd.hpd)) {
 			ret = connector_status_connected;
-			if (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) {
+			if (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT)
 				radeon_dp_getdpcd(radeon_connector);
-				r = radeon_dp_mst_probe(radeon_connector);
-				if (r == 1)
-					ret = connector_status_disconnected;
-			}
 		} else {
 			if (radeon_dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) {
-				if (radeon_dp_getdpcd(radeon_connector)) {
-					r = radeon_dp_mst_probe(radeon_connector);
-					if (r == 1)
-						ret = connector_status_disconnected;
-					else
-						ret = connector_status_connected;
-				}
+				if (radeon_dp_getdpcd(radeon_connector))
+					ret = connector_status_connected;
 			} else {
 				/* try non-aux ddc (DP to DVI/HDMI/etc. adapter) */
 				if (radeon_ddc_probe(radeon_connector, false))
@@ -2561,25 +2528,3 @@ radeon_add_legacy_connector(struct drm_device *dev,
 	connector->display_info.subpixel_order = subpixel_order;
 	drm_connector_register(connector);
 }
-
-void radeon_setup_mst_connector(struct drm_device *dev)
-{
-	struct radeon_device *rdev = dev->dev_private;
-	struct drm_connector *connector;
-	struct radeon_connector *radeon_connector;
-
-	if (!ASIC_IS_DCE5(rdev))
-		return;
-
-	if (radeon_mst == 0)
-		return;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		radeon_connector = to_radeon_connector(connector);
-
-		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
-
-		radeon_dp_mst_init(radeon_connector);
-	}
-}
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index 15692cb241fc..10548a184cc5 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1437,7 +1437,6 @@ int radeon_device_init(struct radeon_device *rdev,
 		goto failed;
 
 	radeon_gem_debugfs_init(rdev);
-	radeon_mst_debugfs_init(rdev);
 
 	if (rdev->flags & RADEON_IS_AGP && !rdev->accel_working) {
 		/* Acceleration not working on AGP card try again
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
deleted file mode 100644
index 54ced1f4ff67..000000000000
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ /dev/null
@@ -1,778 +0,0 @@
-// SPDX-License-Identifier: MIT
-
-#include <drm/display/drm_dp_mst_helper.h>
-#include <drm/drm_fb_helper.h>
-#include <drm/drm_file.h>
-#include <drm/drm_probe_helper.h>
-
-#include "atom.h"
-#include "ni_reg.h"
-#include "radeon.h"
-
-static struct radeon_encoder *radeon_dp_create_fake_mst_encoder(struct radeon_connector *connector);
-
-static int radeon_atom_set_enc_offset(int id)
-{
-	static const int offsets[] = { EVERGREEN_CRTC0_REGISTER_OFFSET,
-				       EVERGREEN_CRTC1_REGISTER_OFFSET,
-				       EVERGREEN_CRTC2_REGISTER_OFFSET,
-				       EVERGREEN_CRTC3_REGISTER_OFFSET,
-				       EVERGREEN_CRTC4_REGISTER_OFFSET,
-				       EVERGREEN_CRTC5_REGISTER_OFFSET,
-				       0x13830 - 0x7030 };
-
-	return offsets[id];
-}
-
-static int radeon_dp_mst_set_be_cntl(struct radeon_encoder *primary,
-				     struct radeon_encoder_mst *mst_enc,
-				     enum radeon_hpd_id hpd, bool enable)
-{
-	struct drm_device *dev = primary->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-	uint32_t reg;
-	int retries = 0;
-	uint32_t temp;
-
-	reg = RREG32(NI_DIG_BE_CNTL + primary->offset);
-
-	/* set MST mode */
-	reg &= ~NI_DIG_FE_DIG_MODE(7);
-	reg |= NI_DIG_FE_DIG_MODE(NI_DIG_MODE_DP_MST);
-
-	if (enable)
-		reg |= NI_DIG_FE_SOURCE_SELECT(1 << mst_enc->fe);
-	else
-		reg &= ~NI_DIG_FE_SOURCE_SELECT(1 << mst_enc->fe);
-
-	reg |= NI_DIG_HPD_SELECT(hpd);
-	DRM_DEBUG_KMS("writing 0x%08x 0x%08x\n", NI_DIG_BE_CNTL + primary->offset, reg);
-	WREG32(NI_DIG_BE_CNTL + primary->offset, reg);
-
-	if (enable) {
-		uint32_t offset = radeon_atom_set_enc_offset(mst_enc->fe);
-
-		do {
-			temp = RREG32(NI_DIG_FE_CNTL + offset);
-		} while ((temp & NI_DIG_SYMCLK_FE_ON) && retries++ < 10000);
-		if (retries == 10000)
-			DRM_ERROR("timed out waiting for FE %d %d\n", primary->offset, mst_enc->fe);
-	}
-	return 0;
-}
-
-static int radeon_dp_mst_set_stream_attrib(struct radeon_encoder *primary,
-					   int stream_number,
-					   int fe,
-					   int slots)
-{
-	struct drm_device *dev = primary->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-	u32 temp, val;
-	int retries  = 0;
-	int satreg, satidx;
-
-	satreg = stream_number >> 1;
-	satidx = stream_number & 1;
-
-	temp = RREG32(NI_DP_MSE_SAT0 + satreg + primary->offset);
-
-	val = NI_DP_MSE_SAT_SLOT_COUNT0(slots) | NI_DP_MSE_SAT_SRC0(fe);
-
-	val <<= (16 * satidx);
-
-	temp &= ~(0xffff << (16 * satidx));
-
-	temp |= val;
-
-	DRM_DEBUG_KMS("writing 0x%08x 0x%08x\n", NI_DP_MSE_SAT0 + satreg + primary->offset, temp);
-	WREG32(NI_DP_MSE_SAT0 + satreg + primary->offset, temp);
-
-	WREG32(NI_DP_MSE_SAT_UPDATE + primary->offset, 1);
-
-	do {
-		unsigned value1, value2;
-		udelay(10);
-		temp = RREG32(NI_DP_MSE_SAT_UPDATE + primary->offset);
-
-		value1 = temp & NI_DP_MSE_SAT_UPDATE_MASK;
-		value2 = temp & NI_DP_MSE_16_MTP_KEEPOUT;
-
-		if (!value1 && !value2)
-			break;
-	} while (retries++ < 50);
-
-	if (retries == 10000)
-		DRM_ERROR("timed out waitin for SAT update %d\n", primary->offset);
-
-	/* MTP 16 ? */
-	return 0;
-}
-
-static int radeon_dp_mst_update_stream_attribs(struct radeon_connector *mst_conn,
-					       struct radeon_encoder *primary)
-{
-	struct drm_device *dev = mst_conn->base.dev;
-	struct stream_attribs new_attribs[6];
-	int i;
-	int idx = 0;
-	struct radeon_connector *radeon_connector;
-	struct drm_connector *connector;
-
-	memset(new_attribs, 0, sizeof(new_attribs));
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		struct radeon_encoder *subenc;
-		struct radeon_encoder_mst *mst_enc;
-
-		radeon_connector = to_radeon_connector(connector);
-		if (!radeon_connector->is_mst_connector)
-			continue;
-
-		if (radeon_connector->mst_port != mst_conn)
-			continue;
-
-		subenc = radeon_connector->mst_encoder;
-		mst_enc = subenc->enc_priv;
-
-		if (!mst_enc->enc_active)
-			continue;
-
-		new_attribs[idx].fe = mst_enc->fe;
-		new_attribs[idx].slots = drm_dp_mst_get_vcpi_slots(&mst_conn->mst_mgr, mst_enc->port);
-		idx++;
-	}
-
-	for (i = 0; i < idx; i++) {
-		if (new_attribs[i].fe != mst_conn->cur_stream_attribs[i].fe ||
-		    new_attribs[i].slots != mst_conn->cur_stream_attribs[i].slots) {
-			radeon_dp_mst_set_stream_attrib(primary, i, new_attribs[i].fe, new_attribs[i].slots);
-			mst_conn->cur_stream_attribs[i].fe = new_attribs[i].fe;
-			mst_conn->cur_stream_attribs[i].slots = new_attribs[i].slots;
-		}
-	}
-
-	for (i = idx; i < mst_conn->enabled_attribs; i++) {
-		radeon_dp_mst_set_stream_attrib(primary, i, 0, 0);
-		mst_conn->cur_stream_attribs[i].fe = 0;
-		mst_conn->cur_stream_attribs[i].slots = 0;
-	}
-	mst_conn->enabled_attribs = idx;
-	return 0;
-}
-
-static int radeon_dp_mst_set_vcp_size(struct radeon_encoder *mst, s64 avg_time_slots_per_mtp)
-{
-	struct drm_device *dev = mst->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder_mst *mst_enc = mst->enc_priv;
-	uint32_t val, temp;
-	uint32_t offset = radeon_atom_set_enc_offset(mst_enc->fe);
-	int retries = 0;
-	uint32_t x = drm_fixp2int(avg_time_slots_per_mtp);
-	uint32_t y = drm_fixp2int_ceil((avg_time_slots_per_mtp - x) << 26);
-
-	val = NI_DP_MSE_RATE_X(x) | NI_DP_MSE_RATE_Y(y);
-
-	WREG32(NI_DP_MSE_RATE_CNTL + offset, val);
-
-	do {
-		temp = RREG32(NI_DP_MSE_RATE_UPDATE + offset);
-		udelay(10);
-	} while ((temp & 0x1) && (retries++ < 10000));
-
-	if (retries >= 10000)
-		DRM_ERROR("timed out wait for rate cntl %d\n", mst_enc->fe);
-	return 0;
-}
-
-static int radeon_dp_mst_get_ddc_modes(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct radeon_connector *master = radeon_connector->mst_port;
-	struct edid *edid;
-	int ret = 0;
-
-	edid = drm_dp_mst_get_edid(connector, &master->mst_mgr, radeon_connector->port);
-	radeon_connector->edid = edid;
-	DRM_DEBUG_KMS("edid retrieved %p\n", edid);
-	if (radeon_connector->edid) {
-		drm_connector_update_edid_property(&radeon_connector->base, radeon_connector->edid);
-		ret = drm_add_edid_modes(&radeon_connector->base, radeon_connector->edid);
-		return ret;
-	}
-	drm_connector_update_edid_property(&radeon_connector->base, NULL);
-
-	return ret;
-}
-
-static int radeon_dp_mst_get_modes(struct drm_connector *connector)
-{
-	return radeon_dp_mst_get_ddc_modes(connector);
-}
-
-static enum drm_mode_status
-radeon_dp_mst_mode_valid(struct drm_connector *connector,
-			struct drm_display_mode *mode)
-{
-	/* TODO - validate mode against available PBN for link */
-	if (mode->clock < 10000)
-		return MODE_CLOCK_LOW;
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		return MODE_H_ILLEGAL;
-
-	return MODE_OK;
-}
-
-static struct
-drm_encoder *radeon_mst_best_encoder(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-
-	return &radeon_connector->mst_encoder->base;
-}
-
-static int
-radeon_dp_mst_detect(struct drm_connector *connector,
-		     struct drm_modeset_acquire_ctx *ctx,
-		     bool force)
-{
-	struct radeon_connector *radeon_connector =
-		to_radeon_connector(connector);
-	struct radeon_connector *master = radeon_connector->mst_port;
-
-	if (drm_connector_is_unregistered(connector))
-		return connector_status_disconnected;
-
-	return drm_dp_mst_detect_port(connector, ctx, &master->mst_mgr,
-				      radeon_connector->port);
-}
-
-static const struct drm_connector_helper_funcs radeon_dp_mst_connector_helper_funcs = {
-	.get_modes = radeon_dp_mst_get_modes,
-	.mode_valid = radeon_dp_mst_mode_valid,
-	.best_encoder = radeon_mst_best_encoder,
-	.detect_ctx = radeon_dp_mst_detect,
-};
-
-static void
-radeon_dp_mst_connector_destroy(struct drm_connector *connector)
-{
-	struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-	struct radeon_encoder *radeon_encoder = radeon_connector->mst_encoder;
-
-	drm_encoder_cleanup(&radeon_encoder->base);
-	kfree(radeon_encoder);
-	drm_connector_cleanup(connector);
-	kfree(radeon_connector);
-}
-
-static const struct drm_connector_funcs radeon_dp_mst_connector_funcs = {
-	.dpms = drm_helper_connector_dpms,
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = radeon_dp_mst_connector_destroy,
-};
-
-static struct drm_connector *radeon_dp_add_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
-							 struct drm_dp_mst_port *port,
-							 const char *pathprop)
-{
-	struct radeon_connector *master = container_of(mgr, struct radeon_connector, mst_mgr);
-	struct drm_device *dev = master->base.dev;
-	struct radeon_connector *radeon_connector;
-	struct drm_connector *connector;
-
-	radeon_connector = kzalloc(sizeof(*radeon_connector), GFP_KERNEL);
-	if (!radeon_connector)
-		return NULL;
-
-	radeon_connector->is_mst_connector = true;
-	connector = &radeon_connector->base;
-	radeon_connector->port = port;
-	radeon_connector->mst_port = master;
-	DRM_DEBUG_KMS("\n");
-
-	drm_connector_init(dev, connector, &radeon_dp_mst_connector_funcs, DRM_MODE_CONNECTOR_DisplayPort);
-	drm_connector_helper_add(connector, &radeon_dp_mst_connector_helper_funcs);
-	radeon_connector->mst_encoder = radeon_dp_create_fake_mst_encoder(master);
-
-	drm_object_attach_property(&connector->base, dev->mode_config.path_property, 0);
-	drm_object_attach_property(&connector->base, dev->mode_config.tile_property, 0);
-	drm_connector_set_path_property(connector, pathprop);
-
-	return connector;
-}
-
-static const struct drm_dp_mst_topology_cbs mst_cbs = {
-	.add_connector = radeon_dp_add_mst_connector,
-};
-
-static struct
-radeon_connector *radeon_mst_find_connector(struct drm_encoder *encoder)
-{
-	struct drm_device *dev = encoder->dev;
-	struct drm_connector *connector;
-
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		struct radeon_connector *radeon_connector = to_radeon_connector(connector);
-		if (!connector->encoder)
-			continue;
-		if (!radeon_connector->is_mst_connector)
-			continue;
-
-		DRM_DEBUG_KMS("checking %p vs %p\n", connector->encoder, encoder);
-		if (connector->encoder == encoder)
-			return radeon_connector;
-	}
-	return NULL;
-}
-
-void radeon_dp_mst_prepare_pll(struct drm_crtc *crtc, struct drm_display_mode *mode)
-{
-	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
-	struct drm_device *dev = crtc->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder *radeon_encoder = to_radeon_encoder(radeon_crtc->encoder);
-	struct radeon_encoder_mst *mst_enc = radeon_encoder->enc_priv;
-	struct radeon_connector *radeon_connector = radeon_mst_find_connector(&radeon_encoder->base);
-	int dp_clock;
-	struct radeon_connector_atom_dig *dig_connector = mst_enc->connector->con_priv;
-
-	if (radeon_connector) {
-		radeon_connector->pixelclock_for_modeset = mode->clock;
-		if (radeon_connector->base.display_info.bpc)
-			radeon_crtc->bpc = radeon_connector->base.display_info.bpc;
-		else
-			radeon_crtc->bpc = 8;
-	}
-
-	DRM_DEBUG_KMS("dp_clock %p %d\n", dig_connector, dig_connector->dp_clock);
-	dp_clock = dig_connector->dp_clock;
-	radeon_crtc->ss_enabled =
-		radeon_atombios_get_asic_ss_info(rdev, &radeon_crtc->ss,
-						 ASIC_INTERNAL_SS_ON_DP,
-						 dp_clock);
-}
-
-static void
-radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
-{
-	struct drm_device *dev = encoder->dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder *radeon_encoder, *primary;
-	struct radeon_encoder_mst *mst_enc;
-	struct radeon_encoder_atom_dig *dig_enc;
-	struct radeon_connector *radeon_connector;
-	struct drm_crtc *crtc;
-	struct radeon_crtc *radeon_crtc;
-	int slots;
-	s64 fixed_pbn, fixed_pbn_per_slot, avg_time_slots_per_mtp;
-	if (!ASIC_IS_DCE5(rdev)) {
-		DRM_ERROR("got mst dpms on non-DCE5\n");
-		return;
-	}
-
-	radeon_connector = radeon_mst_find_connector(encoder);
-	if (!radeon_connector)
-		return;
-
-	radeon_encoder = to_radeon_encoder(encoder);
-
-	mst_enc = radeon_encoder->enc_priv;
-
-	primary = mst_enc->primary;
-
-	dig_enc = primary->enc_priv;
-
-	crtc = encoder->crtc;
-	DRM_DEBUG_KMS("got connector %d\n", dig_enc->active_mst_links);
-
-	switch (mode) {
-	case DRM_MODE_DPMS_ON:
-		dig_enc->active_mst_links++;
-
-		radeon_crtc = to_radeon_crtc(crtc);
-
-		if (dig_enc->active_mst_links == 1) {
-			mst_enc->fe = dig_enc->dig_encoder;
-			mst_enc->fe_from_be = true;
-			atombios_set_mst_encoder_crtc_source(encoder, mst_enc->fe);
-
-			atombios_dig_encoder_setup(&primary->base, ATOM_ENCODER_CMD_SETUP, 0);
-			atombios_dig_transmitter_setup2(&primary->base, ATOM_TRANSMITTER_ACTION_ENABLE,
-							0, 0, dig_enc->dig_encoder);
-
-			if (radeon_dp_needs_link_train(mst_enc->connector) ||
-			    dig_enc->active_mst_links == 1) {
-				radeon_dp_link_train(&primary->base, &mst_enc->connector->base);
-			}
-
-		} else {
-			mst_enc->fe = radeon_atom_pick_dig_encoder(encoder, radeon_crtc->crtc_id);
-			if (mst_enc->fe == -1)
-				DRM_ERROR("failed to get frontend for dig encoder\n");
-			mst_enc->fe_from_be = false;
-			atombios_set_mst_encoder_crtc_source(encoder, mst_enc->fe);
-		}
-
-		DRM_DEBUG_KMS("dig encoder is %d %d %d\n", dig_enc->dig_encoder,
-			      dig_enc->linkb, radeon_crtc->crtc_id);
-
-		slots = drm_dp_find_vcpi_slots(&radeon_connector->mst_port->mst_mgr,
-					       mst_enc->pbn);
-		drm_dp_mst_allocate_vcpi(&radeon_connector->mst_port->mst_mgr,
-					 radeon_connector->port,
-					 mst_enc->pbn, slots);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
-
-		radeon_dp_mst_set_be_cntl(primary, mst_enc,
-					  radeon_connector->mst_port->hpd.hpd, true);
-
-		mst_enc->enc_active = true;
-		radeon_dp_mst_update_stream_attribs(radeon_connector->mst_port, primary);
-
-		fixed_pbn = drm_int2fixp(mst_enc->pbn);
-		fixed_pbn_per_slot = drm_int2fixp(radeon_connector->mst_port->mst_mgr.pbn_div);
-		avg_time_slots_per_mtp = drm_fixp_div(fixed_pbn, fixed_pbn_per_slot);
-		radeon_dp_mst_set_vcp_size(radeon_encoder, avg_time_slots_per_mtp);
-
-		atombios_dig_encoder_setup2(&primary->base, ATOM_ENCODER_CMD_DP_VIDEO_ON, 0,
-					    mst_enc->fe);
-		drm_dp_check_act_status(&radeon_connector->mst_port->mst_mgr);
-
-		drm_dp_update_payload_part2(&radeon_connector->mst_port->mst_mgr);
-
-		break;
-	case DRM_MODE_DPMS_STANDBY:
-	case DRM_MODE_DPMS_SUSPEND:
-	case DRM_MODE_DPMS_OFF:
-		DRM_ERROR("DPMS OFF %d\n", dig_enc->active_mst_links);
-
-		if (!mst_enc->enc_active)
-			return;
-
-		drm_dp_mst_reset_vcpi_slots(&radeon_connector->mst_port->mst_mgr, mst_enc->port);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
-
-		drm_dp_check_act_status(&radeon_connector->mst_port->mst_mgr);
-		/* and this can also fail */
-		drm_dp_update_payload_part2(&radeon_connector->mst_port->mst_mgr);
-
-		drm_dp_mst_deallocate_vcpi(&radeon_connector->mst_port->mst_mgr, mst_enc->port);
-
-		mst_enc->enc_active = false;
-		radeon_dp_mst_update_stream_attribs(radeon_connector->mst_port, primary);
-
-		radeon_dp_mst_set_be_cntl(primary, mst_enc,
-					  radeon_connector->mst_port->hpd.hpd, false);
-		atombios_dig_encoder_setup2(&primary->base, ATOM_ENCODER_CMD_DP_VIDEO_OFF, 0,
-					    mst_enc->fe);
-
-		if (!mst_enc->fe_from_be)
-			radeon_atom_release_dig_encoder(rdev, mst_enc->fe);
-
-		mst_enc->fe_from_be = false;
-		dig_enc->active_mst_links--;
-		if (dig_enc->active_mst_links == 0) {
-			/* drop link */
-		}
-
-		break;
-	}
-
-}
-
-static bool radeon_mst_mode_fixup(struct drm_encoder *encoder,
-				   const struct drm_display_mode *mode,
-				   struct drm_display_mode *adjusted_mode)
-{
-	struct radeon_encoder_mst *mst_enc;
-	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
-	struct radeon_connector_atom_dig *dig_connector;
-	int bpp = 24;
-
-	mst_enc = radeon_encoder->enc_priv;
-
-	mst_enc->pbn = drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp, false);
-
-	mst_enc->primary->active_device = mst_enc->primary->devices & mst_enc->connector->devices;
-	DRM_DEBUG_KMS("setting active device to %08x from %08x %08x for encoder %d\n",
-		      mst_enc->primary->active_device, mst_enc->primary->devices,
-		      mst_enc->connector->devices, mst_enc->primary->base.encoder_type);
-
-
-	drm_mode_set_crtcinfo(adjusted_mode, 0);
-	dig_connector = mst_enc->connector->con_priv;
-	dig_connector->dp_lane_count = drm_dp_max_lane_count(dig_connector->dpcd);
-	dig_connector->dp_clock = drm_dp_max_link_rate(dig_connector->dpcd);
-	DRM_DEBUG_KMS("dig clock %p %d %d\n", dig_connector,
-		      dig_connector->dp_lane_count, dig_connector->dp_clock);
-	return true;
-}
-
-static void radeon_mst_encoder_prepare(struct drm_encoder *encoder)
-{
-	struct radeon_connector *radeon_connector;
-	struct radeon_encoder *radeon_encoder, *primary;
-	struct radeon_encoder_mst *mst_enc;
-	struct radeon_encoder_atom_dig *dig_enc;
-
-	radeon_connector = radeon_mst_find_connector(encoder);
-	if (!radeon_connector) {
-		DRM_DEBUG_KMS("failed to find connector %p\n", encoder);
-		return;
-	}
-	radeon_encoder = to_radeon_encoder(encoder);
-
-	radeon_mst_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
-
-	mst_enc = radeon_encoder->enc_priv;
-
-	primary = mst_enc->primary;
-
-	dig_enc = primary->enc_priv;
-
-	mst_enc->port = radeon_connector->port;
-
-	if (dig_enc->dig_encoder == -1) {
-		dig_enc->dig_encoder = radeon_atom_pick_dig_encoder(&primary->base, -1);
-		primary->offset = radeon_atom_set_enc_offset(dig_enc->dig_encoder);
-		atombios_set_mst_encoder_crtc_source(encoder, dig_enc->dig_encoder);
-
-
-	}
-	DRM_DEBUG_KMS("%d %d\n", dig_enc->dig_encoder, primary->offset);
-}
-
-static void
-radeon_mst_encoder_mode_set(struct drm_encoder *encoder,
-			     struct drm_display_mode *mode,
-			     struct drm_display_mode *adjusted_mode)
-{
-	DRM_DEBUG_KMS("\n");
-}
-
-static void radeon_mst_encoder_commit(struct drm_encoder *encoder)
-{
-	radeon_mst_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
-	DRM_DEBUG_KMS("\n");
-}
-
-static const struct drm_encoder_helper_funcs radeon_mst_helper_funcs = {
-	.dpms = radeon_mst_encoder_dpms,
-	.mode_fixup = radeon_mst_mode_fixup,
-	.prepare = radeon_mst_encoder_prepare,
-	.mode_set = radeon_mst_encoder_mode_set,
-	.commit = radeon_mst_encoder_commit,
-};
-
-static void radeon_dp_mst_encoder_destroy(struct drm_encoder *encoder)
-{
-	drm_encoder_cleanup(encoder);
-	kfree(encoder);
-}
-
-static const struct drm_encoder_funcs radeon_dp_mst_enc_funcs = {
-	.destroy = radeon_dp_mst_encoder_destroy,
-};
-
-static struct radeon_encoder *
-radeon_dp_create_fake_mst_encoder(struct radeon_connector *connector)
-{
-	struct drm_device *dev = connector->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_encoder *radeon_encoder;
-	struct radeon_encoder_mst *mst_enc;
-	struct drm_encoder *encoder;
-	const struct drm_connector_helper_funcs *connector_funcs = connector->base.helper_private;
-	struct drm_encoder *enc_master = connector_funcs->best_encoder(&connector->base);
-
-	DRM_DEBUG_KMS("enc master is %p\n", enc_master);
-	radeon_encoder = kzalloc(sizeof(*radeon_encoder), GFP_KERNEL);
-	if (!radeon_encoder)
-		return NULL;
-
-	radeon_encoder->enc_priv = kzalloc(sizeof(*mst_enc), GFP_KERNEL);
-	if (!radeon_encoder->enc_priv) {
-		kfree(radeon_encoder);
-		return NULL;
-	}
-	encoder = &radeon_encoder->base;
-	switch (rdev->num_crtc) {
-	case 1:
-		encoder->possible_crtcs = 0x1;
-		break;
-	case 2:
-	default:
-		encoder->possible_crtcs = 0x3;
-		break;
-	case 4:
-		encoder->possible_crtcs = 0xf;
-		break;
-	case 6:
-		encoder->possible_crtcs = 0x3f;
-		break;
-	}
-
-	drm_encoder_init(dev, &radeon_encoder->base, &radeon_dp_mst_enc_funcs,
-			 DRM_MODE_ENCODER_DPMST, NULL);
-	drm_encoder_helper_add(encoder, &radeon_mst_helper_funcs);
-
-	mst_enc = radeon_encoder->enc_priv;
-	mst_enc->connector = connector;
-	mst_enc->primary = to_radeon_encoder(enc_master);
-	radeon_encoder->is_mst_encoder = true;
-	return radeon_encoder;
-}
-
-int
-radeon_dp_mst_init(struct radeon_connector *radeon_connector)
-{
-	struct drm_device *dev = radeon_connector->base.dev;
-	int max_link_rate;
-
-	if (!radeon_connector->ddc_bus->has_aux)
-		return 0;
-
-	if (radeon_connector_is_dp12_capable(&radeon_connector->base))
-		max_link_rate = 0x14;
-	else
-		max_link_rate = 0x0a;
-
-	radeon_connector->mst_mgr.cbs = &mst_cbs;
-	return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
-					    &radeon_connector->ddc_bus->aux, 16, 6,
-					    4, drm_dp_bw_code_to_link_rate(max_link_rate),
-					    radeon_connector->base.base.id);
-}
-
-int
-radeon_dp_mst_probe(struct radeon_connector *radeon_connector)
-{
-	struct radeon_connector_atom_dig *dig_connector = radeon_connector->con_priv;
-	struct drm_device *dev = radeon_connector->base.dev;
-	struct radeon_device *rdev = dev->dev_private;
-	int ret;
-	u8 msg[1];
-
-	if (!radeon_mst)
-		return 0;
-
-	if (!ASIC_IS_DCE5(rdev))
-		return 0;
-
-	if (dig_connector->dpcd[DP_DPCD_REV] < 0x12)
-		return 0;
-
-	ret = drm_dp_dpcd_read(&radeon_connector->ddc_bus->aux, DP_MSTM_CAP, msg,
-			       1);
-	if (ret) {
-		if (msg[0] & DP_MST_CAP) {
-			DRM_DEBUG_KMS("Sink is MST capable\n");
-			dig_connector->is_mst = true;
-		} else {
-			DRM_DEBUG_KMS("Sink is not MST capable\n");
-			dig_connector->is_mst = false;
-		}
-
-	}
-	drm_dp_mst_topology_mgr_set_mst(&radeon_connector->mst_mgr,
-					dig_connector->is_mst);
-	return dig_connector->is_mst;
-}
-
-int
-radeon_dp_mst_check_status(struct radeon_connector *radeon_connector)
-{
-	struct radeon_connector_atom_dig *dig_connector = radeon_connector->con_priv;
-	int retry;
-
-	if (dig_connector->is_mst) {
-		u8 esi[16] = { 0 };
-		int dret;
-		int ret = 0;
-		bool handled;
-
-		dret = drm_dp_dpcd_read(&radeon_connector->ddc_bus->aux,
-				       DP_SINK_COUNT_ESI, esi, 8);
-go_again:
-		if (dret == 8) {
-			DRM_DEBUG_KMS("got esi %3ph\n", esi);
-			ret = drm_dp_mst_hpd_irq(&radeon_connector->mst_mgr, esi, &handled);
-
-			if (handled) {
-				for (retry = 0; retry < 3; retry++) {
-					int wret;
-					wret = drm_dp_dpcd_write(&radeon_connector->ddc_bus->aux,
-								 DP_SINK_COUNT_ESI + 1, &esi[1], 3);
-					if (wret == 3)
-						break;
-				}
-
-				dret = drm_dp_dpcd_read(&radeon_connector->ddc_bus->aux,
-							DP_SINK_COUNT_ESI, esi, 8);
-				if (dret == 8) {
-					DRM_DEBUG_KMS("got esi2 %3ph\n", esi);
-					goto go_again;
-				}
-			} else
-				ret = 0;
-
-			return ret;
-		} else {
-			DRM_DEBUG_KMS("failed to get ESI - device may have failed %d\n", ret);
-			dig_connector->is_mst = false;
-			drm_dp_mst_topology_mgr_set_mst(&radeon_connector->mst_mgr,
-							dig_connector->is_mst);
-			/* send a hotplug event */
-		}
-	}
-	return -EINVAL;
-}
-
-#if defined(CONFIG_DEBUG_FS)
-
-static int radeon_debugfs_mst_info_show(struct seq_file *m, void *unused)
-{
-	struct radeon_device *rdev = (struct radeon_device *)m->private;
-	struct drm_device *dev = rdev->ddev;
-	struct drm_connector *connector;
-	struct radeon_connector *radeon_connector;
-	struct radeon_connector_atom_dig *dig_connector;
-	int i;
-
-	drm_modeset_lock_all(dev);
-	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
-		if (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)
-			continue;
-
-		radeon_connector = to_radeon_connector(connector);
-		dig_connector = radeon_connector->con_priv;
-		if (radeon_connector->is_mst_connector)
-			continue;
-		if (!dig_connector->is_mst)
-			continue;
-		drm_dp_mst_dump_topology(m, &radeon_connector->mst_mgr);
-
-		for (i = 0; i < radeon_connector->enabled_attribs; i++)
-			seq_printf(m, "attrib %d: %d %d\n", i,
-				   radeon_connector->cur_stream_attribs[i].fe,
-				   radeon_connector->cur_stream_attribs[i].slots);
-	}
-	drm_modeset_unlock_all(dev);
-	return 0;
-}
-
-DEFINE_SHOW_ATTRIBUTE(radeon_debugfs_mst_info);
-#endif
-
-void radeon_mst_debugfs_init(struct radeon_device *rdev)
-{
-#if defined(CONFIG_DEBUG_FS)
-	struct dentry *root = rdev->ddev->primary->debugfs_root;
-
-	debugfs_create_file("radeon_mst_info", 0444, root, rdev,
-			    &radeon_debugfs_mst_info_fops);
-
-#endif
-}
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 956c72b5aa33..a28d5ceab628 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -172,7 +172,6 @@ int radeon_use_pflipirq = 2;
 int radeon_bapm = -1;
 int radeon_backlight = -1;
 int radeon_auxch = -1;
-int radeon_mst = 0;
 int radeon_uvd = 1;
 int radeon_vce = 1;
 
@@ -263,9 +262,6 @@ module_param_named(backlight, radeon_backlight, int, 0444);
 MODULE_PARM_DESC(auxch, "Use native auxch experimental support (1 = enable, 0 = disable, -1 = auto)");
 module_param_named(auxch, radeon_auxch, int, 0444);
 
-MODULE_PARM_DESC(mst, "DisplayPort MST experimental support (1 = enable, 0 = disable)");
-module_param_named(mst, radeon_mst, int, 0444);
-
 MODULE_PARM_DESC(uvd, "uvd enable/disable uvd support (1 = enable, 0 = disable)");
 module_param_named(uvd, radeon_uvd, int, 0444);
 
diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 46549d5179ee..35c535e48b8d 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -244,16 +244,7 @@ radeon_get_connector_for_encoder(struct drm_encoder *encoder)
 
 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 		radeon_connector = to_radeon_connector(connector);
-		if (radeon_encoder->is_mst_encoder) {
-			struct radeon_encoder_mst *mst_enc;
-
-			if (!radeon_connector->is_mst_connector)
-				continue;
-
-			mst_enc = radeon_encoder->enc_priv;
-			if (mst_enc->connector == radeon_connector->mst_port)
-				return connector;
-		} else if (radeon_encoder->active_device & radeon_connector->devices)
+		if (radeon_encoder->active_device & radeon_connector->devices)
 			return connector;
 	}
 	return NULL;
@@ -399,9 +390,6 @@ bool radeon_dig_monitor_is_duallink(struct drm_encoder *encoder,
 	case DRM_MODE_CONNECTOR_DVID:
 	case DRM_MODE_CONNECTOR_HDMIA:
 	case DRM_MODE_CONNECTOR_DisplayPort:
-		if (radeon_connector->is_mst_connector)
-			return false;
-
 		dig_connector = radeon_connector->con_priv;
 		if ((dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) ||
 		    (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_eDP))
diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index 3907785d0798..da2173435edd 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -100,16 +100,8 @@ static void radeon_hotplug_work_func(struct work_struct *work)
 
 static void radeon_dp_work_func(struct work_struct *work)
 {
-	struct radeon_device *rdev = container_of(work, struct radeon_device,
-						  dp_work);
-	struct drm_device *dev = rdev->ddev;
-	struct drm_mode_config *mode_config = &dev->mode_config;
-	struct drm_connector *connector;
-
-	/* this should take a mutex */
-	list_for_each_entry(connector, &mode_config->connector_list, head)
-		radeon_connector_hotplug(connector);
 }
+
 /**
  * radeon_driver_irq_preinstall_kms - drm irq preinstall callback
  *
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index 3485e7f142e9..fc98361bd7a3 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -31,7 +31,6 @@
 #define RADEON_MODE_H
 
 #include <drm/display/drm_dp_helper.h>
-#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
@@ -440,24 +439,12 @@ struct radeon_encoder_atom_dig {
 	int panel_mode;
 	struct radeon_afmt *afmt;
 	struct r600_audio_pin *pin;
-	int active_mst_links;
 };
 
 struct radeon_encoder_atom_dac {
 	enum radeon_tv_std tv_std;
 };
 
-struct radeon_encoder_mst {
-	int crtc;
-	struct radeon_encoder *primary;
-	struct radeon_connector *connector;
-	struct drm_dp_mst_port *port;
-	int pbn;
-	int fe;
-	bool fe_from_be;
-	bool enc_active;
-};
-
 struct radeon_encoder {
 	struct drm_encoder base;
 	uint32_t encoder_enum;
@@ -479,8 +466,6 @@ struct radeon_encoder {
 	enum radeon_output_csc output_csc;
 	bool can_mst;
 	uint32_t offset;
-	bool is_mst_encoder;
-	/* front end for this mst encoder */
 };
 
 struct radeon_connector_atom_dig {
@@ -491,7 +476,6 @@ struct radeon_connector_atom_dig {
 	int dp_clock;
 	int dp_lane_count;
 	bool edp_on;
-	bool is_mst;
 };
 
 struct radeon_gpio_rec {
@@ -535,11 +519,6 @@ enum radeon_connector_dither {
 	RADEON_FMT_DITHER_ENABLE = 1,
 };
 
-struct stream_attribs {
-	uint16_t fe;
-	uint16_t slots;
-};
-
 struct radeon_connector {
 	struct drm_connector base;
 	uint32_t connector_id;
@@ -562,14 +541,6 @@ struct radeon_connector {
 	enum radeon_connector_audio audio;
 	enum radeon_connector_dither dither;
 	int pixelclock_for_modeset;
-	bool is_mst_connector;
-	struct radeon_connector *mst_port;
-	struct drm_dp_mst_port *port;
-	struct drm_dp_mst_topology_mgr mst_mgr;
-
-	struct radeon_encoder *mst_encoder;
-	struct stream_attribs cur_stream_attribs[6];
-	int enabled_attribs;
 };
 
 #define ENCODER_MODE_IS_DP(em) (((em) == ATOM_ENCODER_MODE_DP) || \
@@ -771,8 +742,6 @@ extern void atombios_dig_transmitter_setup(struct drm_encoder *encoder,
 extern void atombios_dig_transmitter_setup2(struct drm_encoder *encoder,
 					    int action, uint8_t lane_num,
 					    uint8_t lane_set, int fe);
-extern void atombios_set_mst_encoder_crtc_source(struct drm_encoder *encoder,
-						 int fe);
 extern void radeon_atom_ext_encoder_setup_ddc(struct drm_encoder *encoder);
 extern struct drm_encoder *radeon_get_external_encoder(struct drm_encoder *encoder);
 void radeon_atom_copy_swap(u8 *dst, u8 *src, u8 num_bytes, bool to_le);
@@ -990,15 +959,6 @@ void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id);
 
 int radeon_align_pitch(struct radeon_device *rdev, int width, int bpp, bool tiled);
 
-/* mst */
-int radeon_dp_mst_init(struct radeon_connector *radeon_connector);
-int radeon_dp_mst_probe(struct radeon_connector *radeon_connector);
-int radeon_dp_mst_check_status(struct radeon_connector *radeon_connector);
-void radeon_mst_debugfs_init(struct radeon_device *rdev);
-void radeon_dp_mst_prepare_pll(struct drm_crtc *crtc, struct drm_display_mode *mode);
-
-void radeon_setup_mst_connector(struct drm_device *dev);
-
 int radeon_atom_pick_dig_encoder(struct drm_encoder *encoder, int fe_idx);
 void radeon_atom_release_dig_encoder(struct radeon_device *rdev, int enc_idx);
 #endif
-- 
2.35.3


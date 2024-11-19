Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8E29D2EED
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 20:40:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43AF310E2BF;
	Tue, 19 Nov 2024 19:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="e9MCuXBD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com
 [209.85.128.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12B110E2BF
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 19:40:47 +0000 (UTC)
Received: by mail-yw1-f193.google.com with SMTP id
 00721157ae682-6eebb54fc48so2698117b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 11:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1732045246; x=1732650046;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zj53YdOKAiN+fdRey0Q4FomT1f6IJduGZ0tnYXmiERA=;
 b=e9MCuXBDnOMc0/XNpTp94VXjuMGw3wB/FvsOHsp+7we2le5+IcUl3amGpOI5/f3A3j
 4oGud5nT64qOyAF/4wphqCrJmVTlOPfLPFhcM9JGcydO7gCj7d2wp6QmHt38dbZIbomO
 4sEwyGlKQAK1wsfh1zYErVEcECGw8J7dWXcKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732045246; x=1732650046;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zj53YdOKAiN+fdRey0Q4FomT1f6IJduGZ0tnYXmiERA=;
 b=F/QoW5teoGqD+ovmB83Ona/tFZvMMagxBzRPj4yHyky7fNTPmWrMEWS+oUyq1JGE2t
 hw2MKGv69xTDcYE1T6MKSlBLvn+aWLF9+Rk8q4a6b+Qc/uyICTH/s/7canHlDuQNPbKf
 FnI5RjdSG6DTj9i+vh/Pd8vaMjT6st2qK65S+wIE4Zx6hlvXueVC3XQMc8DME2X4Godf
 bBD5rOZBIiKsIFoE1N+Nok1SM/sogc5tudc3roT7k8tb0YZbzhRXNjkwH+X7XZrW0x7U
 S/jGaL+XSuyH0ySvuCHKllGACVFeJCyI+Ng6ny2BTu8wfVd3ueQRPBQoLvNXBzo9Mf58
 2IEQ==
X-Gm-Message-State: AOJu0YwCFvxmkz42hjcQpFC+51pcR06JqTKes/hHDoAyYPgVg57G9St2
 CaYDZUE2N904b4qKDa8dSKVNj50EZTJZ8WJC9hJ+V7o5PzfD81KzC1yq/fCO/D3Jzi0GutN5dBK
 4kBSRysDVI0zC8WWxdKXfBH1LoHJdqT8Zz79o75J5NDH+joErrBlyCOSqoQXhLclwMFanUnlwIf
 bHRZwtF9pVk6BGCiM3dtLDIfpA2cPGbpmGEBBoFN0kmI9jQuqFe81N1lo=
X-Google-Smtp-Source: AGHT+IEoYn7+8VBZdvzqLIJKEwwuaIXfLbO6AWeE/OyziP5n3zHMWAToKXZp0KFyubh4z8VyPryJKw==
X-Received: by 2002:a05:690c:4982:b0:6e7:e1aa:ba80 with SMTP id
 00721157ae682-6eebd163539mr676007b3.18.1732045246327; 
 Tue, 19 Nov 2024 11:40:46 -0800 (PST)
Received: from mtt-opossum.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6d40dd88063sm51740686d6.104.2024.11.19.11.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 11:40:45 -0800 (PST)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: [PATCH] drm/vmwgfx: Add Fake EDID
Date: Tue, 19 Nov 2024 13:40:38 -0600
Message-Id: <20241119194038.530779-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
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

Most compositors are using a change in EDID as an indicator to
refresh their connector information on hotplug regardless of whether the
connector was previously connected. Originally the hotplug_mode_update
property was supposed to provide a hint to userspace to always refresh
connector info on hotplug as virtual devices such as vmwgfx and QXL
changed the connector without disconnecting it first. This was done to
implement Autofit. Unfortunately hotplug_mode_update was not widely
adopted and compositors used other heuristics to determine whether to
refresh the connector info.

Currently a change in EDID is the one heuristic that seems to be universal.
No compositors currently implement hotplug_mode_update correctly or at all.
By implementing a fake EDID blob we can ensure that our EDID changes on
hotplug and therefore userspace will refresh the connector info so that
Autofit will work. This is the approach that virtio takes.

This also removes the need to add hotplug_mode_update support for all
compositors as traditionally this niche feature has fallen on
virtualized driver developers to implement.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 172 ++++++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |   3 +
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |   2 +
 3 files changed, 176 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 5a1192496d49..9d9d0b8539dd 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -37,7 +37,6 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_rect.h>
 #include <drm/drm_sysfs.h>
-#include <drm/drm_edid.h>
 
 void vmw_du_init(struct vmw_display_unit *du)
 {
@@ -2662,6 +2661,175 @@ enum drm_mode_status vmw_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
+/*
+ * Average pixels per millimeter and centimeter for a circa 2020 display
+ */
+#define VMW_FAKE_PPMM 4
+#define VMW_FAKE_PPCM 40
+
+static void vmw_mode_to_timing(const struct drm_display_mode *mode,
+			       struct detailed_timing *timing)
+{
+	struct detailed_pixel_timing *dpt = &timing->data.pixel_data;
+
+	const u8 hblank = (mode->htotal - mode->hdisplay);
+	const u8 hfront = (mode->hsync_start - mode->hdisplay);
+	const u8 hsync  = (mode->hsync_end - mode->hsync_start);
+
+	const u8 vblank = (mode->vtotal - mode->vdisplay);
+	const u8 vfront = (mode->vsync_start - mode->vdisplay);
+	const u8 vsync  = (mode->vsync_end - mode->vsync_start);
+
+	const unsigned int wmm = mode->hdisplay / VMW_FAKE_PPMM;
+	const unsigned int hmm = mode->vdisplay / VMW_FAKE_PPMM;
+
+	timing->pixel_clock = mode->clock / 10;
+	memset(dpt, 0, sizeof(*dpt));
+
+	// horizontal
+	dpt->hactive_lo = mode->hdisplay & 0xFF;
+	dpt->hblank_lo = hblank & 0xFF;
+
+	dpt->hactive_hblank_hi |= (mode->hdisplay >> 4) & 0xF0;
+	dpt->hactive_hblank_hi |= (hblank >> 8) & 0x0F;
+
+	dpt->hsync_offset_lo      = hfront & 0xFF;
+	dpt->hsync_pulse_width_lo =  hsync & 0xFF;
+
+	dpt->hsync_vsync_offset_pulse_width_hi |= (hfront >> 2) & 0xC0;
+	dpt->hsync_vsync_offset_pulse_width_hi |= (hsync  >> 4) & 0x30;
+
+	// vertical
+	dpt->vactive_lo = mode->vdisplay & 0xFF;
+	dpt->vactive_vblank_hi |= (mode->vdisplay >> 4) & 0xF0;
+
+	dpt->vblank_lo = vblank & 0xFF;
+	dpt->vactive_vblank_hi |= (vblank >> 8) & 0x0F;
+
+	dpt->vsync_offset_pulse_width_lo |= (vfront & 0x0F) << 4;
+	dpt->vsync_offset_pulse_width_lo |= (vsync  & 0x0F) << 0;
+
+	dpt->hsync_vsync_offset_pulse_width_hi |= (vfront >> 4) & 0x0C;
+	dpt->hsync_vsync_offset_pulse_width_hi |= (vsync  >> 8) & 0x03;
+
+	// physical sizes
+	dpt->width_mm_lo  = wmm & 0xFF;
+	dpt->height_mm_lo = hmm & 0xFF;
+	dpt->width_height_mm_hi |= (wmm >> 4) & 0xF0;
+	dpt->width_height_mm_hi |= (hmm >> 8) & 0x0F;
+
+	dpt->hborder = 0;
+	dpt->vborder = 0;
+	dpt->misc |= 0x18;
+	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0x2 : 0;
+	dpt->misc |= (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0x4 : 0;
+}
+
+/* Our encoded Plug & Play ID
+ * See: https://uefi.org/PNP_ACPI_Registry and https://uefi.org/PNP_ID_List
+ */
+static inline __be16 vmw_pnp_id(void)
+{
+	return cpu_to_be16((('V' - '@') << 10) |
+			   (('M' - '@') <<  5) |
+			   (('W' - '@') <<  0));
+}
+
+/*
+ * Fills in the fake EDID using the preferred mode.
+ * See 'Vesa Enhanced EDID Standard Release A Revision 2' and
+ * 'VESA DMT Standard Version 1.0 Revision 13'.
+ */
+static void vmw_fill_fake_edid(const struct drm_display_mode *pref_mode,
+			       unsigned int unit, struct edid *e)
+{
+	int checksum = 0;
+
+	/*
+	 * Bump the manufacture week ever time we fill the edid so that
+	 * it will change on every hotplug. This way even if the screen
+	 * size does not change userspace will rescan the connector. A
+	 * hotplug with no changes in resolution is likely a multi-mon change
+	 * and the suggested_X/Y will have changed and we want userspace to
+	 * pick up this. Use this field to only fill the constant data once
+	 * by checking for zero.
+	 */
+	if (e->mfg_week++ == 0) {
+		memset(e->header + 1, 0xFF, 6);
+
+		e->product_id.manufacturer_name = vmw_pnp_id();
+		e->mfg_year = 32; // 2022
+
+		e->prod_code[0] = 'V';
+		e->prod_code[1] = 'M';
+		e->serial = 0xABC0 | unit;
+
+		e->version = 1;
+		e->revision = 4;
+
+		e->input = 0xA0;
+		e->gamma = 120; // 2.20
+		e->features = 0x26;
+
+		// Standard sRGB color space
+		e->red_green_lo = 0xEE;
+		e->blue_white_lo = 0x91;
+		e->red_x = 0xA3;
+		e->red_y = 0x54;
+		e->green_x = 0x4C;
+		e->green_y = 0x99;
+		e->blue_x  = 0x26;
+		e->blue_y  = 0x0F;
+		e->white_x = 0x50;
+		e->white_y = 0x54;
+
+		e->established_timings.t1 = 0x21;
+		e->established_timings.t2 = 0x08;
+
+		e->standard_timings[0].hsize = 0x81;
+		e->standard_timings[0].vfreq_aspect =  0xC0; // 720p60
+
+		e->standard_timings[1].hsize = 0xD1;
+		e->standard_timings[1].vfreq_aspect =  0xC0; // 1080p60
+
+		e->standard_timings[2].hsize = 0x81;
+		e->standard_timings[2].vfreq_aspect =  0x80; // 1280x1024@60
+
+		e->standard_timings[3].hsize = 0xD1;
+		e->standard_timings[3].vfreq_aspect =  0x40; // 1920x1440@60
+
+		e->standard_timings[4].hsize = 0xE1;
+		e->standard_timings[4].vfreq_aspect =  0xC0; // 2048x1152@60
+
+		e->standard_timings[5].hsize = 0xA9;
+		e->standard_timings[5].vfreq_aspect =  0x40; // 1600x1200@60
+
+		e->standard_timings[6].hsize = 0xB3;
+		e->standard_timings[6].vfreq_aspect =  0x00; // 2048x1152@60
+
+		e->standard_timings[7].hsize = 0x95;
+		e->standard_timings[7].vfreq_aspect =  0x00; // 1440x900@60
+
+		e->detailed_timings[1].data.other_data.type = EDID_DETAIL_MONITOR_NAME;
+		memcpy(e->detailed_timings[1].data.other_data.data.str.str,
+		       "VMware Screen", 13);
+
+		e->detailed_timings[2].data.other_data.type = 0x10;
+		e->detailed_timings[3].data.other_data.type = 0x10;
+
+		e->extensions = 0;
+	}
+	e->width_cm = DIV_ROUND_CLOSEST(pref_mode->hdisplay, VMW_FAKE_PPCM);
+	e->height_cm = DIV_ROUND_CLOSEST(pref_mode->vdisplay, VMW_FAKE_PPCM);
+	// This is the preferred/native mode
+	vmw_mode_to_timing(pref_mode, &e->detailed_timings[0]);
+
+	for (int i = 0; i < sizeof(struct edid) - 1; i++)
+		checksum += ((u8 *)e)[i];
+
+	e->checksum = 0x100 - checksum;
+}
+
 /*
  * Common modes not present in the VESA DMT standard or assigned a VIC.
  */
@@ -2699,6 +2867,8 @@ int vmw_connector_get_modes(struct drm_connector *connector)
 	drm_mode_probed_add(connector, mode);
 	num_modes++;
 	drm_dbg_kms(dev, "preferred mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
+	vmw_fill_fake_edid(mode, du->unit, &du->fake_edid);
+	drm_connector_update_edid_property(connector, &du->fake_edid);
 
 	/* Probe connector for all modes not exceeding our geom limits */
 	max_width  = dev_priv->texture_max_width;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
index 6a8bb60c507d..56c739d78582 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -32,6 +32,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_edid.h>
 
 #include "vmwgfx_drv.h"
 
@@ -363,6 +364,8 @@ struct vmw_display_unit {
 	unsigned pref_height;
 	bool pref_active;
 
+	struct edid fake_edid;
+
 	/*
 	 * Gui positioning
 	 */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 82d18b88f4a7..3defdf00a975 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1631,6 +1631,8 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
 	drm_object_attach_property(&connector->base,
 				   dev->mode_config.suggested_y_property, 0);
 
+	drm_connector_attach_edid_property(connector);
+
 	vmw_du_init(&stdu->base);
 
 	return 0;
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875A6BCB1B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AE810EA60;
	Thu, 16 Mar 2023 09:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9E210E0A4;
 Thu, 16 Mar 2023 09:37:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F12DF1FE05;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGgrvMN4XYpUqH0YMHYr3XeZF33NW5279yqGlkHiGSU=;
 b=iicGLPa5zvlLJu7JLnJIdUDnPZCelLlk4L68WnyHi3mV9gy7ne/9X7MrVgBRrbvawr2zFc
 MslwOqdodg3A8CKfUga7nel+oK8QvX08D//yjJgOQUWMn3Ivm7m7Ym1U1ecL6Kw2WcXYvS
 /NZs09XSaLKj6QTNOBIG64xQQbkjXns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGgrvMN4XYpUqH0YMHYr3XeZF33NW5279yqGlkHiGSU=;
 b=rZyzsYjMzTirchI3ldEolFiVDtVuUhCfukUXk/dOUUxYYSAlg/iQKbRKWS86jN5Hwp8725
 icHn15jsdBVFdDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C39CC13A71;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CCjnLmXjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 10/10] drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is
 set
Date: Thu, 16 Mar 2023 10:37:38 +0100
Message-Id: <20230316093738.28866-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make building fbdev emulation depend on DRM_FBDEV_EMULATION. Also
rename the source file to radeon_fbdev.c to align with other fbdev
files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/Makefile                       |  3 ++-
 .../gpu/drm/radeon/{radeon_fb.c => radeon_fbdev.c}    |  0
 drivers/gpu/drm/radeon/radeon_mode.h                  | 11 +++++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)
 rename drivers/gpu/drm/radeon/{radeon_fb.c => radeon_fbdev.c} (100%)

diff --git a/drivers/gpu/drm/radeon/Makefile b/drivers/gpu/drm/radeon/Makefile
index bb4e56f2f170..a8734b7d0485 100644
--- a/drivers/gpu/drm/radeon/Makefile
+++ b/drivers/gpu/drm/radeon/Makefile
@@ -36,7 +36,7 @@ radeon-y += radeon_device.o radeon_asic.o radeon_kms.o \
 	atom.o radeon_fence.o radeon_ttm.o radeon_object.o radeon_gart.o \
 	radeon_legacy_crtc.o radeon_legacy_encoders.o radeon_connectors.o \
 	radeon_encoders.o radeon_display.o radeon_cursor.o radeon_i2c.o \
-	radeon_clocks.o radeon_fb.o radeon_gem.o radeon_ring.o radeon_irq_kms.o \
+	radeon_clocks.o radeon_gem.o radeon_ring.o radeon_irq_kms.o \
 	radeon_cs.o radeon_bios.o radeon_benchmark.o r100.o r300.o r420.o \
 	rs400.o rs600.o rs690.o rv515.o r520.o r600.o rv770.o radeon_test.o \
 	r200.o radeon_legacy_tv.o r600_cs.o \
@@ -76,6 +76,7 @@ radeon-y += \
 	vce_v1_0.o \
 	vce_v2_0.o
 
+radeon-$(CONFIG_DRM_FBDEV_EMULATION) += radeon_fbdev.o
 radeon-$(CONFIG_VGA_SWITCHEROO) += radeon_atpx_handler.o
 radeon-$(CONFIG_ACPI) += radeon_acpi.o
 
diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fbdev.c
similarity index 100%
rename from drivers/gpu/drm/radeon/radeon_fb.c
rename to drivers/gpu/drm/radeon/radeon_fbdev.c
diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
index d81f61e5a95c..1decdcec0264 100644
--- a/drivers/gpu/drm/radeon/radeon_mode.h
+++ b/drivers/gpu/drm/radeon/radeon_mode.h
@@ -939,9 +939,20 @@ void dce4_program_fmt(struct drm_encoder *encoder);
 void dce8_program_fmt(struct drm_encoder *encoder);
 
 /* fbdev layer */
+#if defined(CONFIG_DRM_FBDEV_EMULATION)
 void radeon_fbdev_setup(struct radeon_device *rdev);
 void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state);
 bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj);
+#else
+static inline void radeon_fbdev_setup(struct radeon_device *rdev)
+{ }
+static inline void radeon_fbdev_set_suspend(struct radeon_device *rdev, int state)
+{ }
+static inline bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
+{
+	return false;
+}
+#endif
 
 void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
 
-- 
2.39.2


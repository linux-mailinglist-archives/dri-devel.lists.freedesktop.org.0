Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CF1434BF2
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 15:19:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0717889DC1;
	Wed, 20 Oct 2021 13:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F15897C3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 13:19:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 028BB1FDA3;
 Wed, 20 Oct 2021 13:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634735983; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TVSEOgLjjF4JA3LzUvxHSFpJyk/S+O6W8Lv7eRY+W8=;
 b=KA9aTubES0YbAet0PsER31+hFAElp5VMgq5SSYWEMqq02M8XjEdafx39o0F9O5Q1eoHd6v
 drHmRcH/5uctOveJi6hxdc2On05lLu12nTt6QYkQhea/v7zU1Ys/NZdqsbkhiI8TFvwthx
 UhiLuHy1cvOPP7RWaE7pGtjCQC7IuDk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634735983;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1TVSEOgLjjF4JA3LzUvxHSFpJyk/S+O6W8Lv7eRY+W8=;
 b=biGkutShMlrfV24IxJGZPVO3Tx5rhusQkJcKMthNk4AopgskV95R/9aycCOfG09Jbvv5Bx
 NsD4d+iS83okFMCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D060E13B29;
 Wed, 20 Oct 2021 13:19:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yMvzMW4XcGHsdwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Oct 2021 13:19:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/3] drm: Link several object files into drm_kms_helper.ko
Date: Wed, 20 Oct 2021 15:19:40 +0200
Message-Id: <20211020131941.15367-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211020131941.15367-1-tzimmermann@suse.de>
References: <20211020131941.15367-1-tzimmermann@suse.de>
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

Several core DRM functions are not used by the DRM core. Link the
object files into the KMS helper library.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 6f07609fa453..0f8dae0a21c5 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -8,16 +8,15 @@ drm-y       :=	drm_aperture.o drm_auth.o drm_cache.o \
 		drm_drv.o \
 		drm_sysfs.o drm_hashtab.o drm_mm.o \
 		drm_crtc.o drm_fourcc.o drm_modes.o drm_edid.o drm_displayid.o \
-		drm_encoder_slave.o \
 		drm_trace_points.o drm_prime.o \
-		drm_rect.o drm_vma_manager.o drm_flip_work.o \
+		drm_vma_manager.o \
 		drm_modeset_lock.o drm_atomic.o drm_bridge.o \
 		drm_framebuffer.o drm_connector.o drm_blend.o \
 		drm_encoder.o drm_mode_object.o drm_property.o \
 		drm_plane.o drm_color_mgmt.o drm_print.o \
 		drm_dumb_buffers.o drm_mode_config.o drm_vblank.o \
 		drm_syncobj.o drm_lease.o drm_writeback.o drm_client.o \
-		drm_client_modeset.o drm_atomic_uapi.o drm_hdcp.o \
+		drm_client_modeset.o drm_atomic_uapi.o \
 		drm_managed.o drm_vblank_work.o
 
 drm-$(CONFIG_DRM_LEGACY) += drm_agpsupport.o drm_bufs.o drm_context.o drm_dma.o \
@@ -43,14 +42,15 @@ drm_ttm_helper-y := drm_gem_ttm_helper.o
 obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o drm_dp_helper.o \
-		drm_dsc.o drm_probe_helper.o \
+		drm_dsc.o drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
+		drm_probe_helper.o \
 		drm_plane_helper.o drm_dp_mst_topology.o drm_atomic_helper.o \
 		drm_kms_helper_common.o drm_dp_dual_mode_helper.o \
 		drm_simple_kms_helper.o drm_modeset_helper.o \
 		drm_scdc_helper.o drm_gem_atomic_helper.o \
 		drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o drm_self_refresh_helper.o
+		drm_format_helper.o drm_self_refresh_helper.o drm_rect.o
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
-- 
2.33.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHqcDsfFnWnsRwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FC718922E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 16:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C316710E5C2;
	Tue, 24 Feb 2026 15:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="BxZOool+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RruO6a/k";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BxZOool+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RruO6a/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBF810E5C1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 15:37:36 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C50A5BCF9;
 Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpiRqvx71b1w21o9LKK/18fPTo7j+7UxTsC1vB2ocKk=;
 b=BxZOool+Di4IPMKkE5tlO3E+HomT8Y3MSPegAOAoELBe/u7lRAiS/hg6Vu6IhNeHmLENS8
 FEk/BIlS+lgbTGjIFD1n1S8yDXZRDNMxovmECoMcva5R5TZWHl8gXr3Og+qxxOI07GXtP4
 8hYwQNVfsPm0/QHZnaPHxoMrx5Qt8Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpiRqvx71b1w21o9LKK/18fPTo7j+7UxTsC1vB2ocKk=;
 b=RruO6a/kkaSRDbhPjsuYcP5AXattRtcoANo5Lsez7XizxE9hx5E/Qq5DW/tycc9MG5O+zX
 l1WNjNDLupo/KqCw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BxZOool+;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="RruO6a/k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771947427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpiRqvx71b1w21o9LKK/18fPTo7j+7UxTsC1vB2ocKk=;
 b=BxZOool+Di4IPMKkE5tlO3E+HomT8Y3MSPegAOAoELBe/u7lRAiS/hg6Vu6IhNeHmLENS8
 FEk/BIlS+lgbTGjIFD1n1S8yDXZRDNMxovmECoMcva5R5TZWHl8gXr3Og+qxxOI07GXtP4
 8hYwQNVfsPm0/QHZnaPHxoMrx5Qt8Nk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771947427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BpiRqvx71b1w21o9LKK/18fPTo7j+7UxTsC1vB2ocKk=;
 b=RruO6a/kkaSRDbhPjsuYcP5AXattRtcoANo5Lsez7XizxE9hx5E/Qq5DW/tycc9MG5O+zX
 l1WNjNDLupo/KqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B93F3EA68;
 Tue, 24 Feb 2026 15:37:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2D+NBaPFnWm0FgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 24 Feb 2026 15:37:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, lanzano.alex@gmail.com, kamlesh.gurudasani@gmail.com,
 david@lechnology.com, architanant5@gmail.com, wens@kernel.org,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/16] drm/simple-kms: Deprecate simple-kms helpers
Date: Tue, 24 Feb 2026 16:24:53 +0100
Message-ID: <20260224153656.261351-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224153656.261351-1-tzimmermann@suse.de>
References: <20260224153656.261351-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:javierm@redhat.com,m:lanzano.alex@gmail.com,m:kamlesh.gurudasani@gmail.com,m:david@lechnology.com,m:architanant5@gmail.com,m:wens@kernel.org,m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:simona@ffwll.ch,m:airlied@gmail.com,m:tzimmermann@suse.de,m:lanzanoalex@gmail.com,m:kamleshgurudasani@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,lechnology.com,kernel.org,linux.intel.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C9FC718922E
X-Rspamd-Action: no action

Deprecate simple-encoder and simple-display-pipe helpers in favor of
regular atomic helpers. Remove the related documentation. Add TODO
item for converting the remaining drivers.

These helpers have been deprecated for years and many drivers have
been updated to not use them. Still there are a few left and we
occasionally receive new drivers build upon them. Marking them as
deprecated will hopefully resolve these problems. The TODO items
should be easy enough for getting new voluteers started on DRM driver
development.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-kms-helpers.rst   |  12 --
 Documentation/gpu/introduction.rst      |   5 -
 Documentation/gpu/todo.rst              |  32 ++++
 drivers/gpu/drm/drm_crtc.c              |   6 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c |  22 ---
 drivers/gpu/drm/drm_modeset_helper.c    |   3 -
 drivers/gpu/drm/drm_simple_kms_helper.c |  83 ---------
 include/drm/drm_simple_kms_helper.h     | 216 +-----------------------
 8 files changed, 39 insertions(+), 340 deletions(-)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 781129f78b06..b4a9e5ae81f6 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -104,18 +104,6 @@ VBLANK Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_vblank_helper.c
    :export:
 
-Simple KMS Helper Reference
-===========================
-
-.. kernel-doc:: drivers/gpu/drm/drm_simple_kms_helper.c
-   :doc: overview
-
-.. kernel-doc:: include/drm/drm_simple_kms_helper.h
-   :internal:
-
-.. kernel-doc:: drivers/gpu/drm/drm_simple_kms_helper.c
-   :export:
-
 fbdev Helper Functions Reference
 ================================
 
diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b94..911ebfec8609 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -120,11 +120,6 @@ The DRM subsystem contains a lot of helper functions to ease writing drivers for
 simple graphic devices. For example, the `drivers/gpu/drm/tiny/` directory has a
 set of drivers that are simple enough to be implemented in a single source file.
 
-These drivers make use of the `struct drm_simple_display_pipe_funcs`, that hides
-any complexity of the DRM subsystem and just requires drivers to implement a few
-functions needed to operate the device. This could be used for devices that just
-need a display pipeline with one full-screen scanout buffer feeding one output.
-
 The tiny DRM drivers are good examples to understand how DRM drivers should look
 like. Since are just a few hundreds lines of code, they are quite easy to read.
 
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 520da44a04a6..bc9f14c8a2ec 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -29,6 +29,38 @@ refactorings already and are an expert in the specific area
 Subsystem-wide refactorings
 ===========================
 
+Open-code drm_simple_encoder_init()
+-----------------------------------
+
+The helper drm_simple_encoder_init() was supposed to simplify encoder
+initialization. Instead it only added an intermediate layer between atomic
+modesetting and the DRM driver.
+
+The task here is to remove drm_simple_encoder_init(). Search for a driver
+that calls drm_simple_encoder_init() and inline the helper. The driver will
+also need its own instance of drm_encoder_funcs.
+
+Contact: Thomas Zimmermann, respective driver maintainer
+
+Level: Easy
+
+Replace struct drm_simple_display_pipe with regular atomic helpers
+------------------------------------------------------------------
+
+The data type struct drm_simple_display_pipe and its helpers were supposed
+to simplify driver development. Instead they only added an intermediate layer
+between atomic modesetting and the DRM driver.
+
+There are still drivers that use drm_simple_display_pipe. The task here is to
+convert them to use regular atomic helpers. Search for a driver that calls
+drm_simple_display_pipe_init() and inline all helpers from drm_simple_kms_helper.c
+into the driver, such that no simple-KMS interfaces are required. Please also
+rename all inlined fucntions according to driver conventions.
+
+Contact: Thomas Zimmermann, respective driver maintainer
+
+Level: Easy
+
 Remove custom dumb_map_offset implementations
 ---------------------------------------------
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 8d6f721c2c9a..63ead8ba6756 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -340,8 +340,7 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
  * Inits a new object created as base part of a driver crtc object. Drivers
  * should use this function instead of drm_crtc_init(), which is only provided
  * for backwards compatibility with drivers which do not yet support universal
- * planes). For really simple hardware which has only 1 plane look at
- * drm_simple_display_pipe_init() instead.
+ * planes).
  * The &drm_crtc_funcs.destroy hook should call drm_crtc_cleanup() and kfree()
  * the crtc structure. The crtc structure should not be allocated with
  * devm_kzalloc().
@@ -424,8 +423,7 @@ static int __drmm_crtc_init_with_planes(struct drm_device *dev,
  * Inits a new object created as base part of a driver crtc object. Drivers
  * should use this function instead of drm_crtc_init(), which is only provided
  * for backwards compatibility with drivers which do not yet support universal
- * planes). For really simple hardware which has only 1 plane look at
- * drm_simple_display_pipe_init() instead.
+ * planes).
  *
  * Cleanup is automatically handled through registering
  * drmm_crtc_cleanup() with drmm_add_action(). The crtc structure should
diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 421c460ac972..abef865c5f2c 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -87,28 +87,6 @@
  * A mapping address for each of the framebuffer's buffer object is stored in
  * struct &drm_shadow_plane_state.map. The mappings are valid while the state
  * is being used.
- *
- * Drivers that use struct drm_simple_display_pipe can use
- * %DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS to initialize the rsp
- * callbacks. Access to shadow-buffer mappings is similar to regular
- * atomic_update.
- *
- * .. code-block:: c
- *
- *	struct drm_simple_display_pipe_funcs driver_pipe_funcs = {
- *		...,
- *		DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
- *	};
- *
- *	void driver_pipe_enable(struct drm_simple_display_pipe *pipe,
- *				struct drm_crtc_state *crtc_state,
- *				struct drm_plane_state *plane_state)
- *	{
- *		struct drm_shadow_plane_state *shadow_plane_state =
- *			to_drm_shadow_plane_state(plane_state);
- *
- *		// access shadow buffer via shadow_plane_state->map
- *	}
  */
 
 /*
diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index a57f6a10ada4..d7721df744e7 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -135,9 +135,6 @@ static const struct drm_plane_funcs primary_plane_funcs = {
  *
  * This is purely a backwards compatibility helper for old drivers. Drivers
  * should instead implement their own primary plane. Atomic drivers must do so.
- * Drivers with the above hardware restriction can look into using &struct
- * drm_simple_display_pipe, which encapsulates the above limitations into a nice
- * interface.
  *
  * Returns:
  * Zero on success, error code on failure.
diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index fcbcaaa36b5f..4d91513a1e34 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -16,55 +16,10 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
-/**
- * DOC: overview
- *
- * This helper library provides helpers for drivers for simple display
- * hardware.
- *
- * drm_simple_display_pipe_init() initializes a simple display pipeline
- * which has only one full-screen scanout buffer feeding one output. The
- * pipeline is represented by &struct drm_simple_display_pipe and binds
- * together &drm_plane, &drm_crtc and &drm_encoder structures into one fixed
- * entity. Some flexibility for code reuse is provided through a separately
- * allocated &drm_connector object and supporting optional &drm_bridge
- * encoder drivers.
- *
- * Many drivers require only a very simple encoder that fulfills the minimum
- * requirements of the display pipeline and does not add additional
- * functionality. The function drm_simple_encoder_init() provides an
- * implementation of such an encoder.
- */
-
 static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
 	.destroy = drm_encoder_cleanup,
 };
 
-/**
- * drm_simple_encoder_init - Initialize a preallocated encoder with
- *                           basic functionality.
- * @dev: drm device
- * @encoder: the encoder to initialize
- * @encoder_type: user visible type of the encoder
- *
- * Initialises a preallocated encoder that has no further functionality.
- * Settings for possible CRTC and clones are left to their initial values.
- * The encoder will be cleaned up automatically as part of the mode-setting
- * cleanup.
- *
- * The caller of drm_simple_encoder_init() is responsible for freeing
- * the encoder's memory after the encoder has been cleaned up. At the
- * moment this only works reliably if the encoder data structure is
- * stored in the device structure. Free the encoder's memory as part of
- * the device release function.
- *
- * Note: consider using drmm_simple_encoder_alloc() instead of
- * drm_simple_encoder_init() to let the DRM managed resource infrastructure
- * take care of cleanup and deallocation.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
 int drm_simple_encoder_init(struct drm_device *dev,
 			    struct drm_encoder *encoder,
 			    int encoder_type)
@@ -370,20 +325,6 @@ static const struct drm_plane_funcs drm_simple_kms_plane_funcs = {
 	.format_mod_supported   = drm_simple_kms_format_mod_supported,
 };
 
-/**
- * drm_simple_display_pipe_attach_bridge - Attach a bridge to the display pipe
- * @pipe: simple display pipe object
- * @bridge: bridge to attach
- *
- * Makes it possible to still use the drm_simple_display_pipe helpers when
- * a DRM bridge has to be used.
- *
- * Note that you probably want to initialize the pipe by passing a NULL
- * connector to drm_simple_display_pipe_init().
- *
- * Returns:
- * Zero on success, negative error code on failure.
- */
 int drm_simple_display_pipe_attach_bridge(struct drm_simple_display_pipe *pipe,
 					  struct drm_bridge *bridge)
 {
@@ -391,30 +332,6 @@ int drm_simple_display_pipe_attach_bridge(struct drm_simple_display_pipe *pipe,
 }
 EXPORT_SYMBOL(drm_simple_display_pipe_attach_bridge);
 
-/**
- * drm_simple_display_pipe_init - Initialize a simple display pipeline
- * @dev: DRM device
- * @pipe: simple display pipe object to initialize
- * @funcs: callbacks for the display pipe (optional)
- * @formats: array of supported formats (DRM_FORMAT\_\*)
- * @format_count: number of elements in @formats
- * @format_modifiers: array of formats modifiers
- * @connector: connector to attach and register (optional)
- *
- * Sets up a display pipeline which consist of a really simple
- * plane-crtc-encoder pipe.
- *
- * If a connector is supplied, the pipe will be coupled with the provided
- * connector. You may supply a NULL connector when using drm bridges, that
- * handle connectors themselves (see drm_simple_display_pipe_attach_bridge()).
- *
- * Teardown of a simple display pipe is all handled automatically by the drm
- * core through calling drm_mode_config_cleanup(). Drivers afterwards need to
- * release the memory for the structure themselves.
- *
- * Returns:
- * Zero on success, negative error code on failure.
- */
 int drm_simple_display_pipe_init(struct drm_device *dev,
 			struct drm_simple_display_pipe *pipe,
 			const struct drm_simple_display_pipe_funcs *funcs,
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index b2486d073763..cb672ce0e856 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -3,6 +3,11 @@
  * Copyright (C) 2016 Noralf Trønnes
  */
 
+/*
+ * Simple KMS helpers are deprected in favor of regular atomic helpers. Do not
+ * use the min new code.
+ */
+
 #ifndef __LINUX_DRM_SIMPLE_KMS_HELPER_H
 #define __LINUX_DRM_SIMPLE_KMS_HELPER_H
 
@@ -12,233 +17,38 @@
 
 struct drm_simple_display_pipe;
 
-/**
- * struct drm_simple_display_pipe_funcs - helper operations for a simple
- *                                        display pipeline
- */
 struct drm_simple_display_pipe_funcs {
-	/**
-	 * @mode_valid:
-	 *
-	 * This callback is used to check if a specific mode is valid in the
-	 * crtc used in this simple display pipe. This should be implemented
-	 * if the display pipe has some sort of restriction in the modes
-	 * it can display. For example, a given display pipe may be responsible
-	 * to set a clock value. If the clock can not produce all the values
-	 * for the available modes then this callback can be used to restrict
-	 * the number of modes to only the ones that can be displayed. Another
-	 * reason can be bandwidth mitigation: the memory port on the display
-	 * controller can have bandwidth limitations not allowing pixel data
-	 * to be fetched at any rate.
-	 *
-	 * This hook is used by the probe helpers to filter the mode list in
-	 * drm_helper_probe_single_connector_modes(), and it is used by the
-	 * atomic helpers to validate modes supplied by userspace in
-	 * drm_atomic_helper_check_modeset().
-	 *
-	 * This function is optional.
-	 *
-	 * NOTE:
-	 *
-	 * Since this function is both called from the check phase of an atomic
-	 * commit, and the mode validation in the probe paths it is not allowed
-	 * to look at anything else but the passed-in mode, and validate it
-	 * against configuration-invariant hardware constraints.
-	 *
-	 * RETURNS:
-	 *
-	 * drm_mode_status Enum
-	 */
 	enum drm_mode_status (*mode_valid)(struct drm_simple_display_pipe *pipe,
 					   const struct drm_display_mode *mode);
-
-	/**
-	 * @enable:
-	 *
-	 * This function should be used to enable the pipeline.
-	 * It is called when the underlying crtc is enabled.
-	 * This hook is optional.
-	 */
 	void (*enable)(struct drm_simple_display_pipe *pipe,
 		       struct drm_crtc_state *crtc_state,
 		       struct drm_plane_state *plane_state);
-	/**
-	 * @disable:
-	 *
-	 * This function should be used to disable the pipeline.
-	 * It is called when the underlying crtc is disabled.
-	 * This hook is optional.
-	 */
 	void (*disable)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @check:
-	 *
-	 * This function is called in the check phase of an atomic update,
-	 * specifically when the underlying plane is checked.
-	 * The simple display pipeline helpers already check that the plane is
-	 * not scaled, fills the entire visible area and is always enabled
-	 * when the crtc is also enabled.
-	 * This hook is optional.
-	 *
-	 * RETURNS:
-	 *
-	 * 0 on success, -EINVAL if the state or the transition can't be
-	 * supported, -ENOMEM on memory allocation failure and -EDEADLK if an
-	 * attempt to obtain another state object ran into a &drm_modeset_lock
-	 * deadlock.
-	 */
 	int (*check)(struct drm_simple_display_pipe *pipe,
 		     struct drm_plane_state *plane_state,
 		     struct drm_crtc_state *crtc_state);
-	/**
-	 * @update:
-	 *
-	 * This function is called when the underlying plane state is updated.
-	 * This hook is optional.
-	 *
-	 * This is the function drivers should submit the
-	 * &drm_pending_vblank_event from. Using either
-	 * drm_crtc_arm_vblank_event(), when the driver supports vblank
-	 * interrupt handling, or drm_crtc_send_vblank_event() for more
-	 * complex case. In case the hardware lacks vblank support entirely,
-	 * drivers can set &struct drm_crtc_state.no_vblank in
-	 * &struct drm_simple_display_pipe_funcs.check and let DRM's
-	 * atomic helper fake a vblank event.
-	 */
 	void (*update)(struct drm_simple_display_pipe *pipe,
 		       struct drm_plane_state *old_plane_state);
-
-	/**
-	 * @prepare_fb:
-	 *
-	 * Optional, called by &drm_plane_helper_funcs.prepare_fb.  Please read
-	 * the documentation for the &drm_plane_helper_funcs.prepare_fb hook for
-	 * more details.
-	 *
-	 * For GEM drivers who neither have a @prepare_fb nor @cleanup_fb hook
-	 * set, drm_gem_plane_helper_prepare_fb() is called automatically
-	 * to implement this. Other drivers which need additional plane
-	 * processing can call drm_gem_plane_helper_prepare_fb() from
-	 * their @prepare_fb hook.
-	 */
 	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *plane_state);
-
-	/**
-	 * @cleanup_fb:
-	 *
-	 * Optional, called by &drm_plane_helper_funcs.cleanup_fb.  Please read
-	 * the documentation for the &drm_plane_helper_funcs.cleanup_fb hook for
-	 * more details.
-	 */
 	void (*cleanup_fb)(struct drm_simple_display_pipe *pipe,
 			   struct drm_plane_state *plane_state);
-
-	/**
-	 * @begin_fb_access:
-	 *
-	 * Optional, called by &drm_plane_helper_funcs.begin_fb_access. Please read
-	 * the documentation for the &drm_plane_helper_funcs.begin_fb_access hook for
-	 * more details.
-	 */
 	int (*begin_fb_access)(struct drm_simple_display_pipe *pipe,
 			       struct drm_plane_state *new_plane_state);
-
-	/**
-	 * @end_fb_access:
-	 *
-	 * Optional, called by &drm_plane_helper_funcs.end_fb_access. Please read
-	 * the documentation for the &drm_plane_helper_funcs.end_fb_access hook for
-	 * more details.
-	 */
 	void (*end_fb_access)(struct drm_simple_display_pipe *pipe,
 			      struct drm_plane_state *plane_state);
-
-	/**
-	 * @enable_vblank:
-	 *
-	 * Optional, called by &drm_crtc_funcs.enable_vblank. Please read
-	 * the documentation for the &drm_crtc_funcs.enable_vblank hook for
-	 * more details.
-	 */
 	int (*enable_vblank)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @disable_vblank:
-	 *
-	 * Optional, called by &drm_crtc_funcs.disable_vblank. Please read
-	 * the documentation for the &drm_crtc_funcs.disable_vblank hook for
-	 * more details.
-	 */
 	void (*disable_vblank)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @reset_crtc:
-	 *
-	 * Optional, called by &drm_crtc_funcs.reset. Please read the
-	 * documentation for the &drm_crtc_funcs.reset hook for more details.
-	 */
 	void (*reset_crtc)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @duplicate_crtc_state:
-	 *
-	 * Optional, called by &drm_crtc_funcs.atomic_duplicate_state. Please
-	 * read the documentation for the &drm_crtc_funcs.atomic_duplicate_state
-	 * hook for more details.
-	 */
 	struct drm_crtc_state * (*duplicate_crtc_state)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @destroy_crtc_state:
-	 *
-	 * Optional, called by &drm_crtc_funcs.atomic_destroy_state. Please
-	 * read the documentation for the &drm_crtc_funcs.atomic_destroy_state
-	 * hook for more details.
-	 */
 	void (*destroy_crtc_state)(struct drm_simple_display_pipe *pipe,
 				   struct drm_crtc_state *crtc_state);
-
-	/**
-	 * @reset_plane:
-	 *
-	 * Optional, called by &drm_plane_funcs.reset. Please read the
-	 * documentation for the &drm_plane_funcs.reset hook for more details.
-	 */
 	void (*reset_plane)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @duplicate_plane_state:
-	 *
-	 * Optional, called by &drm_plane_funcs.atomic_duplicate_state.  Please
-	 * read the documentation for the &drm_plane_funcs.atomic_duplicate_state
-	 * hook for more details.
-	 */
 	struct drm_plane_state * (*duplicate_plane_state)(struct drm_simple_display_pipe *pipe);
-
-	/**
-	 * @destroy_plane_state:
-	 *
-	 * Optional, called by &drm_plane_funcs.atomic_destroy_state.  Please
-	 * read the documentation for the &drm_plane_funcs.atomic_destroy_state
-	 * hook for more details.
-	 */
 	void (*destroy_plane_state)(struct drm_simple_display_pipe *pipe,
 				    struct drm_plane_state *plane_state);
 };
 
-/**
- * struct drm_simple_display_pipe - simple display pipeline
- * @crtc: CRTC control structure
- * @plane: Plane control structure
- * @encoder: Encoder control structure
- * @connector: Connector control structure
- * @funcs: Pipeline control functions (optional)
- *
- * Simple display pipeline with plane, crtc and encoder collapsed into one
- * entity. It should be initialized by calling drm_simple_display_pipe_init().
- */
 struct drm_simple_display_pipe {
 	struct drm_crtc crtc;
 	struct drm_plane plane;
@@ -265,22 +75,6 @@ int drm_simple_encoder_init(struct drm_device *dev,
 void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
 				  size_t offset, int encoder_type);
 
-/**
- * drmm_simple_encoder_alloc - Allocate and initialize an encoder with basic
- *                             functionality.
- * @dev: drm device
- * @type: the type of the struct which contains struct &drm_encoder
- * @member: the name of the &drm_encoder within @type.
- * @encoder_type: user visible type of the encoder
- *
- * Allocates and initializes an encoder that has no further functionality.
- * Settings for possible CRTC and clones are left to their initial values.
- * Cleanup is automatically handled through registering drm_encoder_cleanup()
- * with drmm_add_action().
- *
- * Returns:
- * Pointer to new encoder, or ERR_PTR on failure.
- */
 #define drmm_simple_encoder_alloc(dev, type, member, encoder_type) \
 	((type *)__drmm_simple_encoder_alloc(dev, sizeof(type), \
 					     offsetof(type, member), \
-- 
2.52.0


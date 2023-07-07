Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 357A974B9A4
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 00:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6DDC10E609;
	Fri,  7 Jul 2023 22:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E502E10E5F9;
 Fri,  7 Jul 2023 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mFfau7nIYSTNFQZxA6ftp9PAp8q78Z2XWdM3YuMBn/Y=; b=FIxhstkaSARJbAONjxSef/UG+1
 LVzJ1Z0c9ikFDoE/jcdWB6ETgq7y6dtXVNzzVuZHhD7tkRabiKD6fZIITaAg5P4hSLmsVMYB5AK9P
 cZf6D9zCekZ7TGjNVzh1l6WkTtUXDu6jsTlUo/wtNOazW58QWsVSwHsMeaPQZkRCD9szLkFmViP4O
 iQ0SscA7GC0fViXWGypXjUaJ1q9SnRlY0pAp2lqlm9gYGGp99XLM7pzlc1GN4Lzh251iCpoA4s2p1
 qOjcn4CqViJUwg/pqPgBrquIHWhfXDnHxSkpTz2ZuScpf+/Z5A+V4FTEqJlql1WtFPbiNWQoqM1hz
 bydqMhvg==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qHu8l-00AP6e-5e; Sat, 08 Jul 2023 00:41:27 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v5 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Date: Fri,  7 Jul 2023 19:40:56 -0300
Message-ID: <20230707224059.305474-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707224059.305474-1-andrealmeid@igalia.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 hwentlan@amd.com, kernel-dev@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Simon Ser <contact@emersion.fr>

This new field indicates whether the driver has the necessary logic
to support async page-flips via the atomic uAPI. This is leveraged by
the next commit to allow user-space to use this functionality.

All atomic drivers setting drm_mode_config.async_page_flip are updated
to also set drm_mode_config.atomic_async_page_flip_not_supported. We
will gradually check and update these drivers to properly handle
drm_crtc_state.async_flip in their atomic logic.

The goal of this negative flag is the same as
fb_modifiers_not_supported: we want to eventually get rid of all
drivers missing atomic support for async flips. New drivers should not
set this flag, instead they should support atomic async flips (if
they support async flips at all). IOW, we don't want more drivers
with async flip support for legacy but not atomic.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: no changes
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c      |  1 +
 drivers/gpu/drm/i915/display/intel_display.c      |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c         |  1 +
 include/drm/drm_mode_config.h                     | 11 +++++++++++
 5 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 7acd73e5004f..258461826140 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3970,6 +3970,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 		adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 	/* indicates support for immediate flip */
 	adev_to_drm(adev)->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported = true;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 29603561d501..8afb22b1e730 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -639,6 +639,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 	dev->mode_config.max_height = dc->desc->max_height;
 	dev->mode_config.funcs = &mode_config_funcs;
 	dev->mode_config.async_page_flip = true;
+	dev->mode_config.atomic_async_page_flip_not_supported = true;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 0aae9a1eb3d5..a5c503ca9168 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -8318,6 +8318,7 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 	mode_config->helper_private = &intel_mode_config_funcs;
 
 	mode_config->async_page_flip = HAS_ASYNC_FLIPS(i915);
+	mode_config->atomic_async_page_flip_not_supported = true;
 
 	/*
 	 * Maximum framebuffer dimensions, chosen to match
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index ec3ffff487fc..f497dcd9e22f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -709,6 +709,7 @@ nouveau_display_create(struct drm_device *dev)
 		dev->mode_config.async_page_flip = false;
 	else
 		dev->mode_config.async_page_flip = true;
+	dev->mode_config.atomic_async_page_flip_not_supported = true;
 
 	drm_kms_helper_poll_init(dev);
 	drm_kms_helper_poll_disable(dev);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..47b005671e6a 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -918,6 +918,17 @@ struct drm_mode_config {
 	 */
 	bool async_page_flip;
 
+	/**
+	 * @atomic_async_page_flip_not_supported:
+	 *
+	 * If true, the driver does not support async page-flips with the
+	 * atomic uAPI. This is only used by old drivers which haven't yet
+	 * accomodated for &drm_crtc_state.async_flip in their atomic logic,
+	 * even if they have &drm_mode_config.async_page_flip set to true.
+	 * New drivers shall not set this flag.
+	 */
+	bool atomic_async_page_flip_not_supported;
+
 	/**
 	 * @fb_modifiers_not_supported:
 	 *
-- 
2.41.0


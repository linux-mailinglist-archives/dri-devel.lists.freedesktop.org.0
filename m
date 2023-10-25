Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E657D5F3E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 02:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D29310E522;
	Wed, 25 Oct 2023 00:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E510E51C;
 Wed, 25 Oct 2023 00:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xE7LTmMZjaRJ+zHlhQbtMeGR5wPTTYaFb8tvKPrpSe4=; b=MBE40FXBrYAmSfHUHELm6J+ATg
 nom51bEDsd2qUTkCyIU1QdaD/YiWjlQgZZGMoJgPQvyYtJMdjC7SIi53JR6NmZPq/Y+L+2O8xUppX
 8n5qydU4MiRM/NpHn0NfNoUpPxs1oBGFJw6um4O4vXQ1icyrSBiSXIg5D/xRpgscQ8XG+pFUeXu05
 x8jPO1oWSOsN8LKZADJgfXXblDHBmoU5Dk/t5aoZZ1icvt5GEC1eFNzXRFabQyoeq1XdrLAPO6RNW
 XJJCIupnoLjWWKJHW6+JLvrfmwWbQQNnI0sB3a8GgSLmSLcPo3j4RzYyjsgRqhM/vkz2pgLBX3TiB
 6UwZCTvQ==;
Received: from [191.193.179.125] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qvS9W-006qog-41; Wed, 25 Oct 2023 02:53:42 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/6] drm: introduce
 drm_mode_config.atomic_async_page_flip_not_supported
Date: Tue, 24 Oct 2023 21:53:15 -0300
Message-ID: <20231025005318.293690-4-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025005318.293690-1-andrealmeid@igalia.com>
References: <20231025005318.293690-1-andrealmeid@igalia.com>
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
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
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
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   |  1 +
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c        |  1 +
 drivers/gpu/drm/i915/display/intel_display_driver.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_display.c           |  1 +
 include/drm/drm_mode_config.h                       | 11 +++++++++++
 5 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 45b8fd61a044..dec6e43e7198 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4003,6 +4003,7 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
 		adev_to_drm(adev)->mode_config.prefer_shadow = 1;
 	/* indicates support for immediate flip */
 	adev_to_drm(adev)->mode_config.async_page_flip = true;
+	adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported = true;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
index 84c54e8622d1..f1d9bb1d7c34 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
@@ -639,6 +639,7 @@ static int atmel_hlcdc_dc_modeset_init(struct drm_device *dev)
 	dev->mode_config.max_height = dc->desc->max_height;
 	dev->mode_config.funcs = &mode_config_funcs;
 	dev->mode_config.async_page_flip = true;
+	dev->mode_config.atomic_async_page_flip_not_supported = true;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_display_driver.c b/drivers/gpu/drm/i915/display/intel_display_driver.c
index 44b59ac301e6..6142c83fba06 100644
--- a/drivers/gpu/drm/i915/display/intel_display_driver.c
+++ b/drivers/gpu/drm/i915/display/intel_display_driver.c
@@ -126,6 +126,7 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 	mode_config->helper_private = &intel_mode_config_funcs;
 
 	mode_config->async_page_flip = HAS_ASYNC_FLIPS(i915);
+	mode_config->atomic_async_page_flip_not_supported = true;
 
 	/*
 	 * Maximum framebuffer dimensions, chosen to match
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d8c92521226d..586aa51794e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -720,6 +720,7 @@ nouveau_display_create(struct drm_device *dev)
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
2.42.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D240358534A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jul 2022 18:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB110E059;
	Fri, 29 Jul 2022 16:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210510E0DC;
 Fri, 29 Jul 2022 16:16:22 +0000 (UTC)
Received: from sobremesa.fritz.box (unknown
 [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A39A06601B84;
 Fri, 29 Jul 2022 17:16:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1659111381;
 bh=QDBNG5GYmsfWyjGjGSj+ZS05HXR9mQQdbyqEDYo56kg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=isUT1JzEXyRkSVf58Gjr8BhDkzLhrfkZ6YPuMlWMwFy3pvp3oxnAyMd1SMMvIUelE
 G4fXEYj1JPcjiKnwm05263LOG4WMJJHqh2IUVWM1mAZhiXQGbO9JYvht4k+Bh2eYtd
 b9Zx2MfOA1w3FRp8NPDafumrmAhEqgerzf3Ygn+ro2pghyx6ajLd8sGgqe2qVvsjAF
 9EdR7PzoZeDksGaYWKtS/TD2YHKfY6eVb4DhjaIM5KobpmHsLv/11Aq+BlzZMl0Ep2
 3+YkhCkLsCMibrT0hAkDTABguHlnR6OsboCaaHMnar3SfXBZalJ4ENTHUvXQmYDMoG
 XSUSKRg9Ew4cQ==
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: daniel@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: force getparam ioctl return bool for
 HAS_CONTEXT_ISOLATION
Date: Fri, 29 Jul 2022 17:16:12 +0100
Message-Id: <20220729161612.2212512-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220729161612.2212512-1-adrian.larumbe@collabora.com>
References: <20220729161612.2212512-1-adrian.larumbe@collabora.com>
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
Cc: bob.beckett@collabora.com, adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In a previous commit, the uAPI documentation for this param was updated
to reflect the actual usage expected by Iris. Now make sure the driver
does indeed return a boolean value rather than an engine bitmask.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
 drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 46a174f8aa00..7bdee1c9d940 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -306,3 +306,17 @@ unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915)
 
 	return which;
 }
+
+bool engines_context_isolated(struct drm_i915_private *i915)
+{
+	struct intel_engine_cs *engine;
+
+	if (!DRIVER_CAPS(i915)->has_logical_contexts)
+		return false;
+
+	for_each_uabi_engine(engine, i915)
+		if (!engine->default_state)
+			return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.h b/drivers/gpu/drm/i915/gt/intel_engine_user.h
index 3dc7e8ab9fbc..760167db07d5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.h
@@ -15,6 +15,7 @@ struct intel_engine_cs *
 intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance);
 
 unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915);
+bool engines_context_isolated(struct drm_i915_private *i915);
 
 void intel_engine_add_user(struct intel_engine_cs *engine);
 void intel_engines_driver_register(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6fd15b39570c..dd31cc00c529 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -145,7 +145,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = 1;
 		break;
 	case I915_PARAM_HAS_CONTEXT_ISOLATION:
-		value = intel_engines_has_context_isolation(i915);
+		value = engines_context_isolated(i915);
 		break;
 	case I915_PARAM_SLICE_MASK:
 		/* Not supported from Xe_HP onward; use topology queries */
-- 
2.37.0


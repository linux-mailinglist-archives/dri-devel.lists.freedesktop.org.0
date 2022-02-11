Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8E84B2882
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 15:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B039510EAD4;
	Fri, 11 Feb 2022 14:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197DB10EAD4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 14:59:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id AB9271F46F3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644591538;
 bh=F3ax7XMHOIL7WCIH+v/vikfT2oS1k1h4uZqDxGOXBbA=;
 h=From:To:Cc:Subject:Date:From;
 b=NvYmTdRso1J2miZYp1LgGRAyGrnSimJXAFx6dtoqva1hd+H3d36tUMn0WFh9X0v2v
 X8fTWwivbEdHRWL2zpNchaa0uHb0pyXHi9v4VY6awUSDcraXFkKSvuPS59qh8vVKgt
 W1HnwtiYeKW+y9U+2p3/f2jZXTFn4Zt5sQ7k0s/iVjIgB0Rr7UYKSAnPROr+CZBzFr
 AUkVcOJghkWw2kp7JyWHUau+aR4BTJwCk86jTLhG0AHST74AR16hLbCncHqzNmdzGT
 v/Pbj8AEVY5ZI2fVTE2Ki/K/CJipHfbZbr9Go0l9bd6CJ1jc3nycX2kIhCfEUGTlZd
 xX3qKp8ZRob1Q==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/panfrost: Handle IDVS_GROUP_SIZE feature
Date: Fri, 11 Feb 2022 09:58:49 -0500
Message-Id: <20220211145849.3148-1-alyssa.rosenzweig@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, steven.price@arm.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

The IDVS group size feature was missing. It is used on some Bifrost and
Valhall GPUs, and is the last kernel-relevant Bifrost feature we're
missing.

This feature adds an extra IDVS group size field to the JM_CONFIG
register. In kbase, the value is configurable via the device tree; kbase
uses 0xF as a default if no value is specified. Until we find a device
demanding otherwise, let's always set the 0xF default on devices which
support this feature mimicking kbase's behaviour.

Tuning this register slightly improves performance of index-driven vertex
shading. On Mali-G52 (with Mesa), overall glmark2 score is improved from 1026 to
1037. Geometry-heavy scenes like -bshading are improved from 1068 to 1098.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 3 +++
 drivers/gpu/drm/panfrost/panfrost_gpu.c      | 3 +++
 drivers/gpu/drm/panfrost/panfrost_regs.h     | 1 +
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 34f2bae1ec8c..36fadcf9634e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -20,6 +20,7 @@ enum panfrost_hw_feature {
 	HW_FEATURE_AARCH64_MMU,
 	HW_FEATURE_TLS_HASHING,
 	HW_FEATURE_THREAD_GROUP_SPLIT,
+	HW_FEATURE_IDVS_GROUP_SIZE,
 	HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG,
 };
 
@@ -74,6 +75,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
 	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
+	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
 	BIT_ULL(HW_FEATURE_COHERENCY_REG))
 
 #define hw_features_g76 (\
@@ -87,6 +89,7 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_COHERENCY_REG) | \
 	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
 	BIT_ULL(HW_FEATURE_TLS_HASHING) | \
+	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
 	BIT_ULL(HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
 
 #define hw_features_g31 (\
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index bbe628b306ee..50c8922694d7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -145,6 +145,9 @@ static void panfrost_gpu_init_quirks(struct panfrost_device *pfdev)
 		quirks |= (COHERENCY_ACE_LITE | COHERENCY_ACE) <<
 			   JM_FORCE_COHERENCY_FEATURES_SHIFT;
 
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_IDVS_GROUP_SIZE))
+		quirks |= JM_DEFAULT_IDVS_GROUP_SIZE << JM_IDVS_GROUP_SIZE_SHIFT;
+
 	if (quirks)
 		gpu_write(pfdev, GPU_JM_CONFIG, quirks);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 6c5a11ef1ee8..16e776cc82ea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -208,6 +208,7 @@
 #define JM_MAX_JOB_THROTTLE_LIMIT	0x3F
 #define JM_FORCE_COHERENCY_FEATURES_SHIFT 2
 #define JM_IDVS_GROUP_SIZE_SHIFT	16
+#define JM_DEFAULT_IDVS_GROUP_SIZE	0xF
 #define JM_MAX_IDVS_GROUP_SIZE		0x3F
 
 
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11839488AD7
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 18:13:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450E810E826;
	Sun,  9 Jan 2022 17:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9466710E82D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jan 2022 17:13:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 3964D1F437F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641748381;
 bh=XOG3uBp6fdG6uE6EHlfZAyVNdsgaqV5sSTg7m//lXbM=;
 h=From:To:Cc:Subject:Date:From;
 b=hNUcxh0M70s7Zawj+fd6Rdd4OeP58RMfFBtNLgcXfKBtdL+iBHVkC/Z24qgBmpZnV
 fOBlBh2s5EFYQBkeS5l1v0M+pWQuMoAYXB4NRE+ZnnRAegX+eDUD+LenffZ9w8skTc
 L2IT96ATGNGNJuA4bJN+rePox16bSQOEJxa9jzAd1f6CzDLnvsiBFeDmxdQ7vv1GPz
 jlAvU264gxLJEgQkkzqj3HnQpsX+Gl6yqu8t/hGVWZiH6fkB4hNMzEMNF/hvRuBvnO
 UGSc5zgxLicp7q/zxYJuw0O6Qyr0GFJ5BPEc4qovJH3SXKNUJcHFs+IvI2uJYw7krF
 knw7sc5Uw5+Vw==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/panfrost: Handle IDVS_GROUP_SIZE feature
Date: Sun,  9 Jan 2022 12:12:54 -0500
Message-Id: <20220109171254.3183-1-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The IDVS group size feature was missing. It is used on some Bifrost and
Valhall GPUs, and is the last kernel-relevant Bifrost feature we're
missing.

This feature adds an extra IDVS group size field to the JM_CONFIG
register. In kbase, the value is configurable via the device tree; kbase
uses 0xF as a default if no value is specified. Until we find a device
demanding otherwise, let's always set the 0xF default on devices which
support this feature mimicking kbase's behaviour.

As JM_CONFIG is an undocumented register, it's not clear to me what
happens if we fail to include this handling. Index-driven vertex shading
already works on Bifrost boards with this feature without this handling.
Perhaps this has performance implications? Patch untested for the
moment, wanted to give Steven a chance to comment.

Applies on top of my feature clean up series which should go in first.
(That's pure cleaunp, this is a behaviour change RFC needing
discussion.)

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


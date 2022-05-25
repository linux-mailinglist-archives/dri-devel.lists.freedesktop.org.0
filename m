Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE105533FB0
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 16:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE2310FA8C;
	Wed, 25 May 2022 14:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7C788D3D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 14:58:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id C08BA1F450F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653490708;
 bh=yD9tXqnPqKUJrB/V6ILLlV5Xai1v3uJYnOrXEF5Bvc0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AuBIb9m4C+G5XSDYj+f4kMKfN0PrUv2457r+p8ZQwKcYe0SFvH2SG5Hudu8CcGJl5
 z6J4Dvj0fchV4z7UtZU6ULXox+Qs2ODC2PoPxTdyC8186FZ35DOBFCwsx5rNijnvj8
 ClrbJD1t1YkyooEz8j+OSZv2YCfqBXWZY9yzkeiXggjJCZVZ30I+OWgtS0S2tnM/pv
 70K7E4y1Fy5R/dAKYUNHLmDMHdrIly8ehu2mqUygBnPoUw3dZPYOsbL12pgc3QlrDf
 l+T0ZI6kOHIUvtDsLfAwX7dO9yK15ZhphX0iV3cvQMVZepLWIUeYleaTgmCxEwmZB8
 G/fuwZD7goWUQ==
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 8/9] drm/panfrost: Add Mali-G57 "Natt" support
Date: Wed, 25 May 2022 10:57:53 -0400
Message-Id: <20220525145754.25866-9-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
References: <20220525145754.25866-1-alyssa.rosenzweig@collabora.com>
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
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the features, issues, and GPU ID for Mali-G57, a first-generation
Valhall GPU. Other first- and second-generation Valhall GPUs should be
similar.

v2: Split out issue list for r0p0 from newer Natt GPUs, as TTRX_3485 was
fixed in r0p1. Unfortunately, MT8192 has a r0p0, so we do need to handle
TTRX_3485.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 12 ++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c      |  3 +++
 drivers/gpu/drm/panfrost/panfrost_issues.h   |  9 +++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_features.h b/drivers/gpu/drm/panfrost/panfrost_features.h
index 1a8bdebc86a3..7ed0cd3ea2d4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_features.h
+++ b/drivers/gpu/drm/panfrost/panfrost_features.h
@@ -106,6 +106,18 @@ enum panfrost_hw_feature {
 	BIT_ULL(HW_FEATURE_TLS_HASHING) | \
 	BIT_ULL(HW_FEATURE_3BIT_EXT_RW_L2_MMU_CONFIG))
 
+#define hw_features_g57 (\
+	BIT_ULL(HW_FEATURE_JOBCHAIN_DISAMBIGUATION) | \
+	BIT_ULL(HW_FEATURE_PWRON_DURING_PWROFF_TRANS) | \
+	BIT_ULL(HW_FEATURE_XAFFINITY) | \
+	BIT_ULL(HW_FEATURE_FLUSH_REDUCTION) | \
+	BIT_ULL(HW_FEATURE_PROTECTED_MODE) | \
+	BIT_ULL(HW_FEATURE_PROTECTED_DEBUG_MODE) | \
+	BIT_ULL(HW_FEATURE_COHERENCY_REG) | \
+	BIT_ULL(HW_FEATURE_AARCH64_MMU) | \
+	BIT_ULL(HW_FEATURE_IDVS_GROUP_SIZE) | \
+	BIT_ULL(HW_FEATURE_CLEAN_ONLY_SAFE))
+
 static inline bool panfrost_has_hw_feature(struct panfrost_device *pfdev,
 					   enum panfrost_hw_feature feat)
 {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index e1a6e763d0dc..6452e4e900dd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -201,6 +201,9 @@ static const struct panfrost_model gpu_models[] = {
 	GPU_MODEL(g52, 0x7002),
 	GPU_MODEL(g31, 0x7003,
 		GPU_REV(g31, 1, 0)),
+
+	GPU_MODEL(g57, 0x9001,
+		GPU_REV(g57, 0, 0)),
 };
 
 static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index 4d41e0a13867..c5fa9e897a35 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -258,6 +258,15 @@ enum panfrost_hw_issue {
 
 #define hw_issues_g76 0
 
+#define hw_issues_g57 (\
+	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162) | \
+	BIT_ULL(HW_ISSUE_TTRX_3076))
+
+#define hw_issues_g57_r0p0 (\
+	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162) | \
+	BIT_ULL(HW_ISSUE_TTRX_3076) | \
+	BIT_ULL(HW_ISSUE_TTRX_3485))
+
 static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
 					 enum panfrost_hw_issue issue)
 {
-- 
2.35.1


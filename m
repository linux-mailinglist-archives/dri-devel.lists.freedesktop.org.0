Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 521974B2E6C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 21:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7031F10EB8B;
	Fri, 11 Feb 2022 20:28:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DF210EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 20:27:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 963641F46DC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644611274;
 bh=5wGQlYRGMcRSzcIdgF8QxAmpDOar+wxMXkOwhoOlI+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B5AwzfYfshG4ftmxGDPhY7RBt57OD5qX2dJ1HrdMRidCQ1YoHrGZVuQ6CcTfP/GdS
 60BEuaZXUPdA9F9xTDazmxsJFORHifPJnfJNTajgHiAjOcCGaQLSieynbjdlh+rwgD
 cB8Yq7jzRyja4pZikmaNrthcfPHWfkIIohbJ/49EwXHqapgIfqu9YYqD8igmI43/P9
 6yS5wwiRozO9/pK4mEGXG0pAk6o9+T9tq8xTkNa9lgiXHubZS+nUrD//Eq9+m/nHlT
 OixWqljDdYzAS6MSpC172cvLiTPP+w8tOtbK0uYNJz+3ysIGvy4q56jdEZpN+nVxQO
 qyiS6+noPmm8Q==
From: alyssa.rosenzweig@collabora.com
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/panfrost: Add Mali-G57 "Natt" support
Date: Fri, 11 Feb 2022 15:27:27 -0500
Message-Id: <20220211202728.6146-9-alyssa.rosenzweig@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
References: <20220211202728.6146-1-alyssa.rosenzweig@collabora.com>
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

Add the features, issues, and GPU ID for Mali-G57, a first-generation
Valhall GPU. Other first- and second-generation Valhall GPUs should be
similar.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_features.h | 12 ++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c      |  2 ++
 drivers/gpu/drm/panfrost/panfrost_issues.h   |  5 +++++
 3 files changed, 19 insertions(+)

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
index 73e5774f01c1..08d657527099 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -201,6 +201,8 @@ static const struct panfrost_model gpu_models[] = {
 	GPU_MODEL(g52, 0x7002),
 	GPU_MODEL(g31, 0x7003,
 		GPU_REV(g31, 1, 0)),
+
+	GPU_MODEL(g57, 0x9001),
 };
 
 static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_issues.h b/drivers/gpu/drm/panfrost/panfrost_issues.h
index b8865fc9efce..1a0dc7f7f857 100644
--- a/drivers/gpu/drm/panfrost/panfrost_issues.h
+++ b/drivers/gpu/drm/panfrost/panfrost_issues.h
@@ -258,6 +258,11 @@ enum panfrost_hw_issue {
 
 #define hw_issues_g76 0
 
+#define hw_issues_g57 (\
+	BIT_ULL(HW_ISSUE_TTRX_2968_TTRX_3162) | \
+	BIT_ULL(HW_ISSUE_TTRX_3076) | \
+	BIT_ULL(HW_ISSUE_TTRX_3485))
+
 static inline bool panfrost_has_hw_issue(const struct panfrost_device *pfdev,
 					 enum panfrost_hw_issue issue)
 {
-- 
2.34.1


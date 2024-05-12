Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F0D8C3909
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 00:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D445410E288;
	Sun, 12 May 2024 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="qJzb3sZn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875210E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gLFg7z/qqvJAzokkPxj6e+3qyACwQ1TX11ZEpD13A/k=; b=qJzb3sZnKyYa7Sx86JsA9hjbiK
 D1kbWqv0qIqdvhPlFdnAzWA90sFfJq6HopSZ8IXiG1PPv1dHrWGDq46+LS+33H3L0XSF+QmaEomKO
 r9imovvoDTDMbrrh9J7ozpPZfRrCVYEUiWiyelkZg7m/KxBckFnvjWoXF2nen+EChJNB9xxtcBykA
 UQEibfO4gFgUBKe32yqT+Pqsn4Gkr9B44wct/O/+THxVQk1u0j8OxbNBL94AEH4YRdijwsdCEpT3k
 l2z73bHLDTfIvOjy2RoqHsFjX4gOdngy7iz54NYyc4uNVrxhUKKSuLSo7K2bMMBKXb9s2vWK/dQT1
 lMQxPzPg==;
Received: from [191.57.26.163] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s6HfI-006v7c-Ax; Mon, 13 May 2024 00:27:32 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 =?UTF-8?q?Juan=20A=20=2E=20Su=C3=A1rez?= <jasuarez@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2 5/6] drm/v3d: Use V3D_MAX_COUNTERS instead of
 V3D_PERFCNT_NUM
Date: Sun, 12 May 2024 19:23:28 -0300
Message-ID: <20240512222655.2792754-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240512222655.2792754-1-mcanal@igalia.com>
References: <20240512222655.2792754-1-mcanal@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V3D_PERFCNT_NUM represents the maximum number of performance counters
for V3D 4.2, but not for V3D 7.1. This means that, if we use
V3D_PERFCNT_NUM, we might go out-of-bounds on V3D 7.1.

Therefore, use the number of performance counters on V3D 7.1 as the
maximum number of counters. This will allow us to create arrays on the
stack with reasonable size. Note that userspace must use the value
provided by DRM_V3D_PARAM_MAX_PERF_COUNTERS.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   | 5 ++++-
 drivers/gpu/drm/v3d/v3d_sched.c | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 44cfddedebde..556cbb400ba0 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -351,8 +351,11 @@ struct v3d_timestamp_query {
 	struct drm_syncobj *syncobj;
 };
 
+/* Maximum number of performance counters supported by any version of V3D */
+#define V3D_MAX_COUNTERS ARRAY_SIZE(v3d_v71_performance_counters)
+
 /* Number of perfmons required to handle all supported performance counters */
-#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_PERFCNT_NUM, \
+#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
 				      DRM_V3D_MAX_PERF_COUNTERS)
 
 struct v3d_performance_query {
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 7cd8c335cd9b..03df37a3acf5 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -490,7 +490,7 @@ v3d_write_performance_query_result(struct v3d_cpu_job *job, void *data, u32 quer
 	struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
 	struct v3d_dev *v3d = job->base.v3d;
 	struct v3d_perfmon *perfmon;
-	u64 counter_values[V3D_PERFCNT_NUM];
+	u64 counter_values[V3D_MAX_COUNTERS];
 
 	for (int i = 0; i < performance_query->nperfmons; i++) {
 		perfmon = v3d_perfmon_find(v3d_priv,
-- 
2.44.0


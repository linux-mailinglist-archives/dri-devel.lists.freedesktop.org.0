Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C099397ECE5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 16:15:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E6510E401;
	Mon, 23 Sep 2024 14:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Qz/VJuv5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F06B10E403
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5DquF4UxjAb6/+hOXCKby1eA/sgcuFGa24RyntaU878=; b=Qz/VJuv5fzAWgJquyw4JP3OTvi
 LZAvYyncgHXKNqVSPgzdGK1+UYYPt5RKtPXarhDXDovYbWGTuAugN+3allSPbTxYYpBmSYq9P11ML
 0Mq8otRqvWOhFaeXqdDzyh1M8lx2znrqrYyqACG4/LVtqNjK0ZjWiiOB91Wplr9jvf0Kl6ffkqWn2
 BsFVJFVy5enhR0NPg79C//oBa643QmsdCnCUc8/jA6j8FUqJXnv8swXfpaPmBjWp93IuOTA46tKYO
 qB4cLKo8z7cpk7QWAmanpG5lSa+RXkwGCEJiAOYtD5s+eHJuNqlpFnKq2kN9vjm0w95Y3pq/zZIEW
 bMZEg6iA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ssjqC-00HYyM-SM; Mon, 23 Sep 2024 16:15:05 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v6 11/11] drm/v3d: Expose Super Pages capability
Date: Mon, 23 Sep 2024 10:55:15 -0300
Message-ID: <20240923141348.2422499-12-mcanal@igalia.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923141348.2422499-1-mcanal@igalia.com>
References: <20240923141348.2422499-1-mcanal@igalia.com>
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

Add a new V3D parameter to expose the support of Super Pages to
userspace. The userspace might want to know this information to
apply optimizations that are specific to kernels with Super Pages
enabled.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 3 +++
 include/uapi/drm/v3d_drm.h    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8be8c6dd9b35..fb35c5c3f1a7 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -104,6 +104,9 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 	case DRM_V3D_PARAM_MAX_PERF_COUNTERS:
 		args->value = v3d->perfmon_info.max_counters;
 		return 0;
+	case DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES:
+		args->value = !!v3d->gemfs;
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 87fc5bb0a61e..2376c73abca1 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -290,6 +290,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
 	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
+	DRM_V3D_PARAM_SUPPORTS_SUPER_PAGES,
 };
 
 struct drm_v3d_get_param {
-- 
2.46.0


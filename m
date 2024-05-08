Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199918C001B
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 315A5112DCB;
	Wed,  8 May 2024 14:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hgLiouMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F383C10F8F6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W5HnJsFpgYuDh6A0u+YTh3Vb1QCoO5IpSKW3eXR5OuA=; b=hgLiouMAORncp5CK5zJD+Q89iJ
 LNpg8uCSjnDROO6SsRf/sWgy1uT1KVdvCePMgMJfBPFv99ZIK4wOlLvfovyvJ6lCDx96046qFZaf3
 ipulwgMHocxTS9KxdkWPktTt455gBOuAr+jILTBh2bxssl0zCj2lUT6f04pK2Nx06BzEBwpznABzM
 A618QIOsWOM4CSCnr8QbcaIU5WIrju4UuX+FL5ZOW5j010BcBa+GYXboCBsJiwtZOOj6rW71ytiQP
 mQKekKk4CDSulKpG26BjyMcyYWooY5B+qRV6lBTUDmgTuoscuj4tSjeW6LUSjQoz2OO0C7gooqD25
 KCAF19qQ==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4iNu-002ogv-LJ; Wed, 08 May 2024 16:35:07 +0200
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
Subject: [PATCH 3/6] drm/v3d: Create a new V3D parameter for the maximum
 number of perfcnt
Date: Wed,  8 May 2024 11:30:45 -0300
Message-ID: <20240508143306.2435304-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508143306.2435304-2-mcanal@igalia.com>
References: <20240508143306.2435304-2-mcanal@igalia.com>
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

The maximum number of performance counters can change from version to
version and it's important for userspace to know this value, as it needs
to use the counters for performance queries. Therefore, expose the
maximum number of performance counters to userspace as a parameter.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 3 +++
 include/uapi/drm/v3d_drm.h    | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 6b9dd26df9fe..d2c1d5053132 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -94,6 +94,9 @@ static int v3d_get_param_ioctl(struct drm_device *dev, void *data,
 	case DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE:
 		args->value = 1;
 		return 0;
+	case DRM_V3D_PARAM_MAX_PERF_COUNTERS:
+		args->value = v3d->max_counters;
+		return 0;
 	default:
 		DRM_DEBUG("Unknown parameter %d\n", args->param);
 		return -EINVAL;
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index dce1835eced4..215b01bb69c3 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -286,6 +286,7 @@ enum drm_v3d_param {
 	DRM_V3D_PARAM_SUPPORTS_PERFMON,
 	DRM_V3D_PARAM_SUPPORTS_MULTISYNC_EXT,
 	DRM_V3D_PARAM_SUPPORTS_CPU_QUEUE,
+	DRM_V3D_PARAM_MAX_PERF_COUNTERS,
 };
 
 struct drm_v3d_get_param {
-- 
2.44.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D28C001F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 16:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7B112E46;
	Wed,  8 May 2024 14:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hSr8qoGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BBB112E48
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 14:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zqeVV2YpGKGzqYrV1s1QEd5XdfGr1pHaOiUFqpi0Y/M=; b=hSr8qoGBcy+hI7cMWEGliTJYKo
 SqgK2q/791IFQp+/J/eItwst5lBzNWBxBXyJ2Zsxj8CYl7wqNbZ4OOi5SsvRiuOPzW4eDfJq5P1dy
 hzSuKpizGJhLKsmVUzY/OS01exHeXTnqKcHldiXe+W1VRkYZ0YcgnVPTy/zjHdv94MY79EEw4PHkG
 qsX71zrvi1BDLPi8tPD/XR5hWXxrFkMMBBuJgpEikkW+JyGyPcK/A14UGmFECERMzGBYplh3T+o+2
 iQhcLeKIGJ1rqgrsKB153otgDAAdyze7I43fBENuOLtoEaGwSuljOwoGLjmmlVxP1riLHRBvu2IjB
 ptq4UiKw==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s4iO7-002ogv-P3; Wed, 08 May 2024 16:35:20 +0200
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
Subject: [PATCH 6/6] drm/v3d: Deprecate the use of the Performance Counters
 enum
Date: Wed,  8 May 2024 11:30:48 -0300
Message-ID: <20240508143306.2435304-8-mcanal@igalia.com>
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

The Performance Counters enum used to identify the index of each
performance counter and provide the total number of performance
counters (V3D_PERFCNT_NUM). But, this enum is only valid for V3D 4.2,
not for V3D 7.1.

As we implemented a new flexible structure to retrieve performance
counters information, we can deprecate this enum.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 include/uapi/drm/v3d_drm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 0860ddb3d0b6..706b4dea1c45 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -603,6 +603,12 @@ struct drm_v3d_submit_cpu {
 	__u64 extensions;
 };
 
+/* The performance counters index represented by this enum are deprecated and
+ * must no longer be used. These counters are only valid for V3D 4.2.
+ *
+ * In order to check for performance counter information,
+ * use DRM_IOCTL_V3D_PERFMON_GET_COUNTER.
+ */
 enum {
 	V3D_PERFCNT_FEP_VALID_PRIMTS_NO_PIXELS,
 	V3D_PERFCNT_FEP_VALID_PRIMS,
-- 
2.44.0


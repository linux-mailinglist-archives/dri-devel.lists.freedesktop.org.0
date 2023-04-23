Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2383B6EBFE7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Apr 2023 16:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9449310E331;
	Sun, 23 Apr 2023 14:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7025110E331;
 Sun, 23 Apr 2023 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=61KSS5+ykrC2EpBhN11Qk1hbuXSnyOrLMv+gxM8XJiM=; b=EBlbem39+WObZkXT6cpRxHLypm
 sJSX69u+V+8TBPnkSJlNRH2ttHSacdtg9acvMnz/55ocsu8Koe3dKdyxugqLT+mOC+NnTEXXt1dKz
 RQs6n6CDGQW0lJ4r5DOh133lEtV+qPnPSEb2hr3uCJwGA7ijCsDz4soKbSIEA5RuAU4DiUkw5i0dT
 O/9CYFrOesSGjOPUk+BYFj7ICUN1USFkiHw3SF4VfEQd0TcILVY+Z/HCIPUWv9oiqI9adixNsMslC
 98FsXi0h9xA9AnU7MEcxaBA7ThvHTt0mcpwcSl7oVDiU0IQdpNRCRkou3+Tb8FUuwPUOoU8eSQauZ
 HTuMR28Q==;
Received: from nat-wifi.fi.muni.cz ([147.251.43.9] helo=killbill.fi.muni.cz)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pqaRh-00ANVs-QW; Sun, 23 Apr 2023 16:12:05 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH 04/40] drm/drm_mode_object: increase max objects to
 accommodate new color props
Date: Sun, 23 Apr 2023 13:10:16 -0100
Message-Id: <20230423141051.702990-5-mwen@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230423141051.702990-1-mwen@igalia.com>
References: <20230423141051.702990-1-mwen@igalia.com>
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the next patches we are adding 17 new properties for color
correction:
- CRTC: 3D LUT+size, shaper LUT+size, regamma TF (5)
- Plane: Degamma LUT+size+TF, HDR multiplier, shaper LUT+size+TF, 3D LUT+size, blend
  LUT+size+TF (12)
We still need to detach driver-private counter from DRM/KMS-generic, by
now, increase max objs to 41.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 912f1e415685..7e4fb7536c6a 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 47
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
-- 
2.39.2


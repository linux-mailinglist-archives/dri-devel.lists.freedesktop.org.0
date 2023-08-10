Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0608E777D35
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 18:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AA210E56D;
	Thu, 10 Aug 2023 16:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFE210E567;
 Thu, 10 Aug 2023 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rfx4tvW7R2KBhwKSd3k5sJd6oheAeA5m3drlsyYWwvQ=; b=EklayQgnqv4aZqRf4oQ7Pvgf7D
 9kDaI4BASQVTS4wGbfscgvm1ABNqft43eOB0y37NamOM/NdCfkRq+K2Vuo/TaZGLdSVfK7FRPa/aq
 oyL2GdnTYCn5g5dePjq6HK052v+EXwe35Ba8LN2/YUpcYUujURd9VvTJtO35pb6a6QmJXFQowqw5x
 R6KDSGVXsHMmf+PzYeAq5rOugvwqqJ5iAusHAXk/TtaKsMfRSW7R+2AKNNdVrZe/8WuJeQe7ZMJhw
 ZnVnO9H7aFK7+BKqwrGmH+ptq7WJ4fJDHgnN2rGInqzQKqsG7PufiKV+/06mnI+F3OvNZ38nSaEp0
 4GG+4/2w==;
Received: from [38.44.68.151] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qU88A-00GjYD-2a; Thu, 10 Aug 2023 18:03:22 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 02/34] drm/drm_mode_object: increase max objects to
 accommodate new color props
Date: Thu, 10 Aug 2023 15:02:42 -0100
Message-Id: <20230810160314.48225-3-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230810160314.48225-1-mwen@igalia.com>
References: <20230810160314.48225-1-mwen@igalia.com>
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM_OBJECT_MAX_PROPERTY limits the number of properties to be attached
and we are increasing that value all time we add a new property (generic
or driver-specific).

In this series, we are adding 13 new KMS driver-specific properties for
AMD color manage:
- CRTC Gamma enumerated Transfer Function
- Plane: Degamma LUT+size+TF, HDR multiplier, shaper LUT+size+TF, 3D
  LUT+size, blend LUT+size+TF (12)

Therefore, just increase DRM_OBJECT_MAX_PROPERTY to a number (64) that
accomodates these new properties and gives some room for others,
avoiding change this number everytime we add a new KMS property.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 include/drm/drm_mode_object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index 912f1e415685..08d7a7f0188f 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 24
+#define DRM_OBJECT_MAX_PROPERTY 64
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
-- 
2.40.1


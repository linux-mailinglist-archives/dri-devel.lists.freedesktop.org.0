Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3E57BA76F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209CF10E431;
	Thu,  5 Oct 2023 17:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC4D10E429;
 Thu,  5 Oct 2023 17:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rfx4tvW7R2KBhwKSd3k5sJd6oheAeA5m3drlsyYWwvQ=; b=pDZQRwRRAFxo49trqI8WPtuZkN
 T+1svDE940Dvi4WuPdyK8Vr6tRcCHSPqGawgxj2unB/oM+q5MrvgGZ7RUWfo1cy8SNegmo0jIfcOZ
 6Zu1Z6pDZxCd+Lpl1GAFhfHhh9nNajNNr7YQYfO0LIc2pzkSGHQiMI5avJDjNdyYo++3/dMTY6ZiZ
 Kd9uj+x3Q/eotVh3+iAARi5YBcRjgB1bQVYWk5WZ8PavQ7z0pGOnngFiNwlvtQHyTsQ6DBIzScx3N
 dTvVwIVAJQRzYeRMWq79YLe3qOjmRPx7GYT3eFgVxv2UV0Z2hlJwVYHtMIsAd5IBw3VvC7YGrgQcX
 dLGzDG9w==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qoRwj-00CFJN-6C; Thu, 05 Oct 2023 19:15:33 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v4 01/32] drm/drm_mode_object: increase max objects to
 accommodate new color props
Date: Thu,  5 Oct 2023 16:14:56 -0100
Message-Id: <20231005171527.203657-2-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231005171527.203657-1-mwen@igalia.com>
References: <20231005171527.203657-1-mwen@igalia.com>
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
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
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


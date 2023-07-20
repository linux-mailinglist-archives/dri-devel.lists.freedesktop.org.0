Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C975A452
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 04:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89D0310E546;
	Thu, 20 Jul 2023 02:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from knopi.disroot.org (knopi.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC1B10E542;
 Thu, 20 Jul 2023 02:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 11D4544536;
 Thu, 20 Jul 2023 04:22:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from knopi.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lq6bAi6Ltqb3; Thu, 20 Jul 2023 04:22:43 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1689819763; bh=tbIuZbuKopIN9rP05CY58VoWpUlSsMuL5vfdFRjoxpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=mHH+dStO1bZ7Rtqa0i74APuZW/rygRwwdBzP44pkvDKLipFFPps9X+x4iZlkcslh2
 hoxkyrtqh76zkJgrCXDB2mc/pf2hH9LvQKufx3a3cBiAz/ZwP+qbKrl4tRDM4MeBGR
 eDmQ0X1ot7Rj2+sXQoZ7lkHQEcx/dJvB85E/Lm/osVK7Gr86EarAX+1V7TmV0QB+XF
 blMntvab1kfcoZAx3vpgy9YF6FoX6snW8TJojyWyf5bRxu6UNg+xSwDsJu0gOpW4ne
 b6N8ejcVHqXOpoDJGIioPsUlOi63AT9+JT4YracqOXXfgGMyHqSoJZWQSmKsp1mYQj
 ejfuoKxyaQIjw==
To: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Maira Canal <mairacanal@riseup.net>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Clint Taylor <clinton.a.taylor@intel.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: [PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement for
 core helpers
Date: Wed, 19 Jul 2023 23:19:36 -0300
Message-ID: <20230720021937.27124-2-gcarlos@disroot.org>
In-Reply-To: <20230720021937.27124-1-gcarlos@disroot.org>
References: <20230720021937.27124-1-gcarlos@disroot.org>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_format_info_plane_{height,width} functions was implemented using
regular division for the plane size calculation, which cause issues [1][2]
when used on contexts where the dimensions are misaligned with relation
to the subsampling factors. So, replace the regular division by the
DIV_ROUND_UP macro.

This allows these functions to be used in more drivers, making further
work to bring more core presence on them possible.

[1] http://patchwork.freedesktop.org/patch/msgid/20170321181218.10042-3-ville.syrjala@linux.intel.com
[2] https://patchwork.freedesktop.org/patch/msgid/20211026225105.2783797-2-imre.deak@intel.com

Signed-off-by: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
---
 include/drm/drm_fourcc.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_fourcc.h b/include/drm/drm_fourcc.h
index 532ae78ca747..ccf91daa4307 100644
--- a/include/drm/drm_fourcc.h
+++ b/include/drm/drm_fourcc.h
@@ -22,6 +22,7 @@
 #ifndef __DRM_FOURCC_H__
 #define __DRM_FOURCC_H__
 
+#include <linux/math.h>
 #include <linux/types.h>
 #include <uapi/drm/drm_fourcc.h>
 
@@ -279,7 +280,7 @@ int drm_format_info_plane_width(const struct drm_format_info *info, int width,
 	if (plane == 0)
 		return width;
 
-	return width / info->hsub;
+	return DIV_ROUND_UP(width, info->hsub);
 }
 
 /**
@@ -301,7 +302,7 @@ int drm_format_info_plane_height(const struct drm_format_info *info, int height,
 	if (plane == 0)
 		return height;
 
-	return height / info->vsub;
+	return DIV_ROUND_UP(height, info->vsub);
 }
 
 const struct drm_format_info *__drm_format_info(u32 format);
-- 
2.41.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C56B57AEE5E
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B50B10E3EE;
	Tue, 26 Sep 2023 14:15:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78CB10E3EA;
 Tue, 26 Sep 2023 14:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 794B140C4D;
 Tue, 26 Sep 2023 16:15:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FvOUPklXKT65; Tue, 26 Sep 2023 16:15:26 +0200 (CEST)
From: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1695737726; bh=tbIuZbuKopIN9rP05CY58VoWpUlSsMuL5vfdFRjoxpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=a4ZM6fteovxSDa1BISnRkCPmIdf/3QyYiEHE1ZddzF9UAME/pSs+cTiv/6DKldDS7
 lZyHsBiZCW7AQrcnvhv+a3qzGJz+JwXL5Uijzs7VyZ10HkhiNKCxEpNhEOIU9tYaI5
 ouJVuiD1xwE26qUikw4Rv1f1EO76WLKpFqidnIzR4EFiPfjlFffzh2CiDuiLDi57kK
 i/5/by4HhILlGG7tXzGByTp1eSiKgZx7xB5bJiBPB584B7F+eCxbX8y1xjDAuqSXiA
 smFic3oehmOv1MqRfixDSKsCptrabssJiCkUJntMCvH/mGjNn1ecECCsqOmUeUHAdD
 OT8L4xPs2xB7w==
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement for
 core helpers
Date: Tue, 26 Sep 2023 11:15:18 -0300
Message-ID: <20230926141519.9315-2-gcarlos@disroot.org>
In-Reply-To: <20230926141519.9315-1-gcarlos@disroot.org>
References: <20230926141519.9315-1-gcarlos@disroot.org>
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
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


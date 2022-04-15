Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367A0502B8F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 16:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96AF10E228;
	Fri, 15 Apr 2022 14:14:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD0810E20F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 14:14:03 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q129so8501864oif.4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ne77m8cZZW0R7+jQl5DIOLbM38uI8W7ZFAvs8zlnbN8=;
 b=h1AEH94ksvbHDBFe3x+a7vmDgmwHtOTnxwprQwUj4X1Nmdvg1vWefYUVfwtkHjfOhv
 HDBUNoMaooGxk+7pisSLbT50fMO43493JfXXGe1JkBL4xDXrK1H5O0Xq3Z0rI1Np2Gum
 tGFZ+dFeiSq6PxqPTbRbrbbUyryHeeNaxHgPuJCF+jV80j6YnZG9lidImPuqYc4Fk1CU
 b8X7OOSzA5dXiqW6pqu7vLlfMTGvQ3i/W/m7avQlpXvChMg8bwMZR+5/+kybThxsGnTj
 HXopgsjM58efO1m+fJxy9vuEj+l0L6fRrn0ExSVCs/8UWenBQaE1wJhhUlcfW/LB9FL1
 QD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ne77m8cZZW0R7+jQl5DIOLbM38uI8W7ZFAvs8zlnbN8=;
 b=79tv1AlbOLD+4Vlk+crz8uZA4Lm8qpfylGYg84Trv2pl90e4/nd4epKWOodkBdXIJx
 Usuc8eZhdYEKZuW2/MVwoFmvGF1asEOSUaPgGJ0CcDT08+7SiewXaPvLnHeY0le5Rkma
 W8UcZxiDcLfXo6vM9wqY0nsU5oCAsikNXc6d0PnX5qqSrq02RjTGssUnA7hO80iu+n9q
 JRfG4uK41fQGwFu4Cpj63DWtbiOC5Y5iooKBGGjYrksqq+1jk7UXUcWqUPMPbKlGQ99i
 lq/arhzuMHmnAy38CeeN1J1p7+M/91lLLyr4gkzXaEsLOI+NYhJpo1E7UcODKrmU2tbu
 mWnw==
X-Gm-Message-State: AOAM533p2M2g0IAwMBXIavCPcOzzVDqCSfleuGkuVVIPaFjUekrbtlhA
 QLHEjil/xu7OLEmuYJM+mFI=
X-Google-Smtp-Source: ABdhPJzmIliimBoMo5RTzw1NZHdZ598Yqfbe2K4rgL5RQgz1CujBydm9kLuTJhT4SOwwYRnQKEfqmA==
X-Received: by 2002:a05:6808:d4c:b0:2f8:d0d2:d06c with SMTP id
 w12-20020a0568080d4c00b002f8d0d2d06cmr1672959oik.285.1650032043019; 
 Fri, 15 Apr 2022 07:14:03 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a4ae781000000b00320d5d238efsm1156189oov.3.2022.04.15.07.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 07:14:02 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrealmeid@riseup.net
Subject: [PATCH v2 2/2] drm/vkms: return early if compose_plane fails
Date: Fri, 15 Apr 2022 08:13:00 -0300
Message-Id: <20220415111300.61013-3-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415111300.61013-1-tales.aparecida@gmail.com>
References: <20220415111300.61013-1-tales.aparecida@gmail.com>
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not exit quietly from compose_plane. If any plane has an invalid
map, propagate the error value upwards. While here, add log messages
for the invalid index.

Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 30 ++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index b47ac170108c..c0a3b53cd155 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -149,16 +149,16 @@ static void blend(void *vaddr_dst, void *vaddr_src,
 	}
 }
 
-static void compose_plane(struct vkms_composer *primary_composer,
-			  struct vkms_composer *plane_composer,
-			  void *vaddr_out)
+static int compose_plane(struct vkms_composer *primary_composer,
+			 struct vkms_composer *plane_composer,
+			 void *vaddr_out)
 {
 	struct drm_framebuffer *fb = &plane_composer->fb;
 	void *vaddr;
 	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
 
 	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
-		return;
+		return -EINVAL;
 
 	vaddr = plane_composer->map[0].vaddr;
 
@@ -168,6 +168,8 @@ static void compose_plane(struct vkms_composer *primary_composer,
 		pixel_blend = &x_blend;
 
 	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
+
+	return 0;
 }
 
 static int compose_active_planes(void **vaddr_out,
@@ -177,7 +179,7 @@ static int compose_active_planes(void **vaddr_out,
 	struct drm_framebuffer *fb = &primary_composer->fb;
 	struct drm_gem_object *gem_obj = drm_gem_fb_get_obj(fb, 0);
 	const void *vaddr;
-	int i;
+	int i, ret;
 
 	if (!*vaddr_out) {
 		*vaddr_out = kzalloc(gem_obj->size, GFP_KERNEL);
@@ -187,8 +189,10 @@ static int compose_active_planes(void **vaddr_out,
 		}
 	}
 
-	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
+	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0]))) {
+		DRM_DEBUG_DRIVER("Failed to compose. Invalid map in the primary plane.");
 		return -EINVAL;
+	}
 
 	vaddr = primary_composer->map[0].vaddr;
 
@@ -198,10 +202,16 @@ static int compose_active_planes(void **vaddr_out,
 	 * planes should be in z-order and compose them associatively:
 	 * ((primary <- overlay) <- cursor)
 	 */
-	for (i = 1; i < crtc_state->num_active_planes; i++)
-		compose_plane(primary_composer,
-			      crtc_state->active_planes[i]->composer,
-			      *vaddr_out);
+	for (i = 1; i < crtc_state->num_active_planes; i++) {
+		ret = compose_plane(primary_composer,
+				    crtc_state->active_planes[i]->composer,
+				    *vaddr_out);
+		if (ret) {
+			DRM_DEBUG_DRIVER("Failed to compose. Invalid map in the active_planes[%d].",
+					 i);
+			return ret;
+		}
+	}
 
 	return 0;
 }
-- 
2.35.1


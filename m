Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D83C5F0ED7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F5710ED67;
	Fri, 30 Sep 2022 15:29:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064C10ED59
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 15:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664551789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=A55Nw0d8fVm0KHqdmDBOMg24Woe2WzURM0qQejWLfmg=;
 b=RT6uD/oFKjytJWWk7JPhJYZDyf/TRiumVI8zb681VfyWHyn5AwHOtuOycyeq1fXRWH55l8
 Bp14d0sVznVL8S3NVmEb4+pqn0yPFGe5rI1r1RMFqBWnIXeVy6zDoe8wZiBzUgBoGWrLgd
 QnEB82jen3MAG6o63YPkK1i4K02icQo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-C8blzQLUM2m39I9N4Etj5Q-1; Fri, 30 Sep 2022 11:29:48 -0400
X-MC-Unique: C8blzQLUM2m39I9N4Etj5Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 fc12-20020a05600c524c00b003b5054c70d3so2218591wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=A55Nw0d8fVm0KHqdmDBOMg24Woe2WzURM0qQejWLfmg=;
 b=eYPbc0v+QwdZWz3JKrRF9Rh/6oorneV0LziqXV20xp9UO9pAApNGR1XJOb4OyxcYi2
 9png6hABngzeZYn5BJMeRnSsgElFuevR0ZcICl0KcAYtQ7Vx+kAwMDWIdjacz0o4x14W
 +sZMipBKnfH66dpCLVs+RO4ZNB6pdPaA5JMLVTZ9xGecso9W6o4GrfYN/XXolC/jv/p/
 K4+A+cRETo8qdhVUSsJkr9j7cxmZbrFuIblmawmXCbUZbjkWnE+KwPh9RBrEYv74m0L3
 IIu90KmZP/QHha3hZrUDTCavxSauSYyTunWidhQQcpjfrwiDDVnXZRnfPqA0xyo2/R8I
 QPMg==
X-Gm-Message-State: ACrzQf1Z0zihIWrPREd79QcWNDfI5X8qexEQMo3AvTSqRfMFXmQOtbxj
 8rdReu5WrZ3lTmTOcdBfhAZRlaFpKtsJgHEULGLJBxIJ2MAUtbgWgkysEFcvXF+kX/ryBDGvH9E
 plV/lqBb/soj6nojT4Z0XqLJiUbBO
X-Received: by 2002:a05:6000:1f9d:b0:22a:fc9b:435c with SMTP id
 bw29-20020a0560001f9d00b0022afc9b435cmr6137929wrb.667.1664551787400; 
 Fri, 30 Sep 2022 08:29:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zijDovkMd1DACmjaenUTTlZq5pdpePWRbUt/YAjZBQyjsZOQ9yNCeJDt68gG5B+e4Ledw6w==
X-Received: by 2002:a05:6000:1f9d:b0:22a:fc9b:435c with SMTP id
 bw29-20020a0560001f9d00b0022afc9b435cmr6137910wrb.667.1664551787119; 
 Fri, 30 Sep 2022 08:29:47 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l18-20020a05600c2cd200b003a63a3b55c3sm7799133wmc.14.2022.09.30.08.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 08:29:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
Date: Fri, 30 Sep 2022 17:29:44 +0200
Message-Id: <20220930152944.2584356-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_atomic_helper_damage_merged() helper merges all the damage clips
into one rectangle. If there are multiple damage clips that aren't close
to each other, the resulting rectangle could be quite big.

Instead of using that function helper, iterate over all the damage clips
and update them one by one.

Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Move the dst_clip assignment inside the drm_atomic_for_each_plane_damage()
  loop (Thomas Zimmermann).
- Pass dst_clip instead of damage area as argument to ssd130x_fb_blit_rect()
  function (Thomas Zimmermann)

 drivers/gpu/drm/solomon/ssd130x.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index bc41a5ae810a..f456b233d2e7 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -578,21 +578,24 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_atomic_helper_damage_iter iter;
 	struct drm_device *drm = plane->dev;
-	struct drm_rect src_clip, dst_clip;
+	struct drm_rect dst_clip;
+	struct drm_rect damage;
 	int idx;
 
-	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &src_clip))
+	if (!drm_dev_enter(drm, &idx))
 		return;
 
-	dst_clip = plane_state->dst;
-	if (!drm_rect_intersect(&dst_clip, &src_clip))
-		return;
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		dst_clip = plane_state->dst;
 
-	if (!drm_dev_enter(drm, &idx))
-		return;
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
 
-	ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+		ssd130x_fb_blit_rect(plane_state->fb, &shadow_plane_state->data[0], &dst_clip);
+	}
 
 	drm_dev_exit(idx);
 }
-- 
2.37.3


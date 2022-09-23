Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592B15E75E1
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 10:35:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38410E546;
	Fri, 23 Sep 2022 08:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8ECD10E546
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 08:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663922104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rlVuqNZZ5WqICJ7b4y4WhBhxWjjwgqyMHyzMNeEa8ek=;
 b=FE7QyMNTuZrw1dcJ8yyB6e3PEoL1FbpKYyDfWmjx8cFZ+rWIdeopbhp9/QieDXzI6gbjUS
 BBcsa19jnZml88cPQ3yVrWZo8yi/I4bEX148EhDa/meuv5h16ivjZJwEeYPB3x1YFqORXY
 6ajXzdW4qXZmEqrY0OICWuFkuAIkXbY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-663-iJwGN9O3NjyBC_hnkhFtUA-1; Fri, 23 Sep 2022 04:35:03 -0400
X-MC-Unique: iJwGN9O3NjyBC_hnkhFtUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 e3-20020a05600c218300b003b4e4582006so1584398wme.6
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 01:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=rlVuqNZZ5WqICJ7b4y4WhBhxWjjwgqyMHyzMNeEa8ek=;
 b=EO1v9u+dYTt3IW7qmSVKsf5JGKHnuJbW0P0jXfqzdq5qYUM+aqJHgK9nr9MzJXoe1K
 QMKYu7pxOvf7fTC722RGbDAwtKXNeTBX/1FMtBDSesIHTVMkFy97y0Zn0LxphC2YyWfO
 6oI8FxU3jFCNng7rOt524z+oeIp5gdNUy5jvLojyZkAhbexkxy1Aug/NW5QFx0un5xjk
 C3tfaDNykeXB5WxCdYyAibIPyaN1BNKuI1FQ3PS9nojlBlsk4I4hMxng7iKxd319s8Ej
 RJTNN4aKNbbaTH89yB4g+mYuy49y2jGfDwrK26H/UBcfe+l6LRpxMZrU9hQHZnL0HISI
 dHjQ==
X-Gm-Message-State: ACrzQf2ATz+UQYAPV3ZwhxUiJzXBjwZPuMmIlRH4Io8n4I8VWEL8DYna
 pk/oiMs3YjNTmxY/Ztz9oGjYsa/2z0s4NoFqZEA9OdN5xX+nqYjrACaG7gRi2u01evjlulT7dhI
 ZG1LqVsl4MtT9+z0gIqmLaDilqy59
X-Received: by 2002:a05:6000:1251:b0:22a:e60f:c080 with SMTP id
 j17-20020a056000125100b0022ae60fc080mr4237263wrx.95.1663922102357; 
 Fri, 23 Sep 2022 01:35:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4qn2VHsYGBFqh6GRr7+ueBDf2FJ1K86J5WUS3SdSkpwtlpE8rfpk0x2WirT0LuFZOlmWvnVQ==
X-Received: by 2002:a05:6000:1251:b0:22a:e60f:c080 with SMTP id
 j17-20020a056000125100b0022ae60fc080mr4237248wrx.95.1663922102106; 
 Fri, 23 Sep 2022 01:35:02 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c3b0d00b003a2e92edeccsm1964922wms.46.2022.09.23.01.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 01:35:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Use drm_atomic_get_new_plane_state()
Date: Fri, 23 Sep 2022 10:34:47 +0200
Message-Id: <20220923083447.1679780-1-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct drm_plane .state shouldn't be accessed directly but instead the
drm_atomic_get_new_plane_state() helper function should be used.

This is based on a similar patch from Thomas Zimmermann for the simpledrm
driver. No functional changes.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 7fae9480aa11..a537692100d1 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -566,10 +566,10 @@ static int ssd130x_fb_blit_rect(struct drm_framebuffer *fb, const struct iosys_m
 }
 
 static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						       struct drm_atomic_state *old_state)
+						       struct drm_atomic_state *state)
 {
-	struct drm_plane_state *plane_state = plane->state;
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(old_state, plane);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_device *drm = plane->dev;
 	struct drm_rect src_clip, dst_clip;
@@ -591,7 +591,7 @@ static void ssd130x_primary_plane_helper_atomic_update(struct drm_plane *plane,
 }
 
 static void ssd130x_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							struct drm_atomic_state *old_state)
+							struct drm_atomic_state *state)
 {
 	struct drm_device *drm = plane->dev;
 	struct ssd130x_device *ssd130x = drm_to_ssd130x(drm);
-- 
2.37.3


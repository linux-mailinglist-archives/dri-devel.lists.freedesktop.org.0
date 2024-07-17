Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6B933988
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2024 11:02:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CE910EA22;
	Wed, 17 Jul 2024 09:02:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R02v2LNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD77E10EA21
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2024 09:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721206921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRuBANNGOfAVhYgcUec7uelK4S9x1EhlXp94QYTaMXE=;
 b=R02v2LNxSnvj5fRHH1VYKtaX1VtR9wQIQyiwxtcSUwPxBlIimhS0JjEdS3JEe57IXy1ruT
 WzPxBOAWHcj1ukWCsbxEb4mkiGx29QDaVgKq9tiHPvxDS0YgClHGWnQl1EO++9A6y1WtPR
 HZf8qrwacc9Y23oNMuj6KbTxtAOeA70=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-ghtTmlCHNCu3XQ6cPlgK4A-1; Wed,
 17 Jul 2024 05:01:55 -0400
X-MC-Unique: ghtTmlCHNCu3XQ6cPlgK4A-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3357A1955BFC; Wed, 17 Jul 2024 09:01:53 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.18])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id E44E81955F40; Wed, 17 Jul 2024 09:01:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/3] fbcon: Add an option to disable fbcon in panic.
Date: Wed, 17 Jul 2024 10:48:40 +0200
Message-ID: <20240717090102.968152-3-jfalempe@redhat.com>
In-Reply-To: <20240717090102.968152-1-jfalempe@redhat.com>
References: <20240717090102.968152-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

This is required to avoid conflict between DRM_PANIC, and fbcon. If
a drm device already handle panic with drm_panic, it should set
the skip_panic field in fb_info, so that fbcon will stay quiet, and
not overwrite the panic_screen.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c  | 2 ++
 drivers/video/fbdev/core/fbcon.c | 7 ++++++-
 include/linux/fb.h               | 1 +
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index e2e19f49342e..3662d664d8f9 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -40,6 +40,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_modeset_helper_vtables.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 
@@ -524,6 +525,7 @@ struct fb_info *drm_fb_helper_alloc_info(struct drm_fb_helper *fb_helper)
 	fb_helper->info = info;
 	info->skip_vt_switch = true;
 
+	info->skip_panic = drm_panic_is_enabled(fb_helper->dev);
 	return info;
 
 err_release:
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3f7333dca508..498d9c07df80 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -270,12 +270,17 @@ static int fbcon_get_rotate(struct fb_info *info)
 	return (ops) ? ops->rotate : 0;
 }
 
+static bool fbcon_skip_panic(struct fb_info *info)
+{
+	return (info->skip_panic && unlikely(atomic_read(&panic_cpu) != PANIC_CPU_INVALID));
+}
+
 static inline int fbcon_is_inactive(struct vc_data *vc, struct fb_info *info)
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 
 	return (info->state != FBINFO_STATE_RUNNING ||
-		vc->vc_mode != KD_TEXT || ops->graphics);
+		vc->vc_mode != KD_TEXT || ops->graphics || fbcon_skip_panic(info));
 }
 
 static int get_color(struct vc_data *vc, struct fb_info *info,
diff --git a/include/linux/fb.h b/include/linux/fb.h
index db7d97b10964..865dad03e73e 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -510,6 +510,7 @@ struct fb_info {
 	void *par;
 
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
+	bool skip_panic; /* Do not write to the fb after a panic */
 };
 
 /* This will go away
-- 
2.45.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DB2909720
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 10:53:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B058810E1B5;
	Sat, 15 Jun 2024 08:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZkdlQsW8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567010E1B5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 08:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718441617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4KAnLuJK5ca8N90TBc5SqAtDvhbdQGO+rCBjODh2EaA=;
 b=ZkdlQsW8aH85l04pjhenyI+NvX7VwvlMN3amId+BrMUC+pC7aE6fOGrbeoJ8P3BZAqqatA
 lmZDZR+gocjq/2+N85EITwxWB4mXTv7h3NnvdbriebDQwxZe2BYGU1+YviR3hOHvPWXOcM
 kbgpfF6e/k49kQ4JinSMihKPyDfB9tw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-ARCyEXRtPsiAeWZs44tKhA-1; Sat, 15 Jun 2024 04:53:35 -0400
X-MC-Unique: ARCyEXRtPsiAeWZs44tKhA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-52c978dbd31so2055847e87.3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 01:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718441613; x=1719046413;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4KAnLuJK5ca8N90TBc5SqAtDvhbdQGO+rCBjODh2EaA=;
 b=cRd0fF2jaISM9a+V/CThxRAKh0BfGEMQpwPwYNvMWWrEVseiHsTm3MUyWyTXceBo0k
 SsLKlraBKF8hTqtuTHAOulopHx7jWxg1JHbfqmBCYu+u5PiiS9o6EhwrydaAF3QYHt7V
 bqDefMfPUUswSJd6n5lVQRpeHVIU8JPICqlhV+HoIs1hsPuEWr/Ge1OGy5+1MLgm7UQP
 46QWmB3y0rEVhu0khoojJbBZx+kJ1It8Z4W+Gx2VC/3FUPi22eKb6lxg8IKG3HKKD9K9
 +57l6Xsq0ROORbzdqC6zBl8X746TsXFinbymhgihexuQg9669suuJWIa+6+nkAtlposR
 xJpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXkqZFilB7/XRiXWrqdj1xnxGxG4WnH0HQvYbAt0kbAXRLVE2f4TPUp1M7Ksu4w78f1tp5QsW/lzb8qIviNi9ZsowhUCYgfA0rxnne7oxD
X-Gm-Message-State: AOJu0Yz77fBICU5jKOLKTi4X6r2vuv2rb26+5xuJP4AZ8DZN0WWrfRcx
 E90ZQ2pKKdrJ63SFamC7OCsMs4FhNQY5QzO8kG2nzyXNCQ6g7d739VFBQIHDGPtocDETgKBIcfh
 V4aflLAGH6clEjET30rjjDIp2VJ8OaXifOs+FvNkER62wKZqhsfKLOviB0T3/Cbw33g==
X-Received: by 2002:ac2:5931:0:b0:52c:8a37:6cf4 with SMTP id
 2adb3069b0e04-52ca6e56394mr3070350e87.14.1718441613036; 
 Sat, 15 Jun 2024 01:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgscFiGF51kdQUAooo17serhr9s1595/yp1C5TX0wDDST4aYfIyM2irfok4qUH81+JMvDnQA==
X-Received: by 2002:ac2:5931:0:b0:52c:8a37:6cf4 with SMTP id
 2adb3069b0e04-52ca6e56394mr3070344e87.14.1718441612540; 
 Sat, 15 Jun 2024 01:53:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42285574e33sm55265715e9.1.2024.06.15.01.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jun 2024 01:53:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/tidss: Add drm_panic support
Date: Sat, 15 Jun 2024 10:53:18 +0200
Message-ID: <20240615085326.1726262-1-javierm@redhat.com>
X-Mailer: git-send-email 2.45.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the drm_panic module, which displays a pretty user
friendly message on the screen when a Linux kernel panic occurs.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---
Tested on an AM625 BeaglePlay board by triggering a panic using the
`echo c > /proc/sysrq-trigger` command.

 drivers/gpu/drm/tidss/tidss_plane.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 68fed531f6a7..a5d86822c9e3 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -8,6 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -166,6 +167,14 @@ static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
 	.atomic_disable = tidss_plane_atomic_disable,
 };
 
+static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
+	.atomic_check = tidss_plane_atomic_check,
+	.atomic_update = tidss_plane_atomic_update,
+	.atomic_enable = tidss_plane_atomic_enable,
+	.atomic_disable = tidss_plane_atomic_disable,
+	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
+};
+
 static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
@@ -211,7 +220,10 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	if (ret < 0)
 		goto err;
 
-	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
+	if (type == DRM_PLANE_TYPE_PRIMARY)
+		drm_plane_helper_add(&tplane->plane, &tidss_primary_plane_helper_funcs);
+	else
+		drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
 
 	drm_plane_create_zpos_property(&tplane->plane, tidss->num_planes, 0,
 				       num_planes - 1);
-- 
2.45.1


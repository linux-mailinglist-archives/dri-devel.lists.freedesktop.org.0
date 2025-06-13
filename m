Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DBBAD8D04
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 15:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15F010E9AC;
	Fri, 13 Jun 2025 13:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WrJ/euOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95B10E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749820857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tfsl7na8vBkAH1D5HNAgOxCb5PMcLNTUrB21akYCqLA=;
 b=WrJ/euOHDd3/zEJCOavNps/YdlK9Ykyn5VrUVPiYHrat8j75enc0CRnJ9qx25GGZCGpM8n
 oVGiLLM2Q6KMvJUBLt3iHRZhGpZrkCoXGKHNdFir6TgkZi4I1y3felrEfXVGUvVBubZ+Pv
 FcaDmD/i3NC15++W3tFOMpvUAgmilB8=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-77qMI1fNN3a0_-AUazVhxQ-1; Fri, 13 Jun 2025 09:20:55 -0400
X-MC-Unique: 77qMI1fNN3a0_-AUazVhxQ-1
X-Mimecast-MFC-AGG-ID: 77qMI1fNN3a0_-AUazVhxQ_1749820855
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-747d143117eso1872532b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 06:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749820855; x=1750425655;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tfsl7na8vBkAH1D5HNAgOxCb5PMcLNTUrB21akYCqLA=;
 b=q6QQIvcblHEzYkjdpPWvdpLPQCynxlgZ7Wezo0oYXkMm04+rJuMeWlquMWvDZaaCh6
 nx9fQnm97f97vqBXGZIy9SpM8ECD7D+Dgwf9wezJcSBHRNDHHNBOKyQpllxMTIEvVdHD
 +JOjRTgC1HHRk1EtJyxpXJXRPNquOXT/UzUmeP6OKyKVvQM1lWWYmXQn7k48ozlT4p3A
 z2cN5sCmsorjza91Q1mCdTcQmc0PxOBgUwCQxOI+Weq8pBk5IIMbvKDXgywGDn5gYy2A
 hvayyTof9GfIFi0PUFCP+k3GTc1fUQ2jrgb4b11tb763VEZc+VqRT4Rd2JVEoTOaH7M8
 HvlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEtybB6r/VkeWxwhy1pIQTqi8psHNVnqW0dwxNstllKinumdN/8OquM8rnFVgmAuXuj7H6Ws50SpM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5xpqbDzVioDtd1kcEnYjMuAE/FCeMLQ8Nrl1vwJ2kIkLztd/w
 7vmgAywPM7YUlxvuY5CgBeIgVKHHsI/1+FmDB1FzMmC7+KTTdy6FRxVJQ5w+9csU2b5KyrAWNIo
 3q3iT6B2JAAlDNTk7SyEoG0wEvsuq0yiZZrldsVglgrYhgAaCdc5aXfIKws6baJAJzG2vlg==
X-Gm-Gg: ASbGnctIYuZpZIHjiNAEBZciYPrt5xvcDak73DfE2FnPM83rqP/1fBY0M+QOJrqxx+P
 0d8vVASCWxc14sSKMgQHYZjI8hhUbZlL7JIJ6j+XFlD+hWVFQti3S31AYQ/Z7zUTUBOYNek7kEL
 ypU9ue/RPPRn47uxkmKzb0pZJtVmjFOdIFqvIopU/Ur3Hm7t/9UlJAFa2wSuOFWYizul9SXyaTs
 Mk6806eNwnI1CjLPnpHh3aHjEhkHZydvFuDxwRB6Ar1BQwObNzrMjFrrP6bfqFw+xD4Ju+vhBKF
 7JQxrM/b8/oivd6rt04=
X-Received: by 2002:a05:6a20:e196:b0:21f:775d:107e with SMTP id
 adf61e73a8af0-21facb26c8dmr3968590637.17.1749820854750; 
 Fri, 13 Jun 2025 06:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE223H+TJ8TXd6oDEioev4iMoI2/YxUX5Dfw+NXpEW25126CIcGpxhbG1+TbmG1LTliCo7ulA==
X-Received: by 2002:a05:6a20:e196:b0:21f:775d:107e with SMTP id
 adf61e73a8af0-21facb26c8dmr3968563637.17.1749820854422; 
 Fri, 13 Jun 2025 06:20:54 -0700 (PDT)
Received: from zeus.. ([2405:6580:83a0:7600:6e93:a15a:9134:ae1f])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1643e9esm1651732a12.25.2025.06.13.06.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 06:20:53 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH drm-next] drm/bochs: Add support for drm_panic
Date: Fri, 13 Jun 2025 22:20:14 +0900
Message-ID: <20250613132023.106946-1-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8miGwxTBbQaHcg94Gb4KSjIAV7Eq2KZkajYIytHA9o8_1749820855
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Add drm_panic moudle for bochs drm so that panic screen can be displayed
on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 8706763af8fb..ed42ad5c4927 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -19,6 +19,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
 	bochs_hw_setformat(bochs, fb->format);
 }
 
+static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+							  struct drm_scanout_buffer *sb)
+{
+	struct bochs_device *bochs = to_bochs_device(plane->dev);
+	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
+
+	if (plane->state && plane->state->fb) {
+		sb->format = plane->state->fb->format;
+		sb->width = plane->state->fb->width;
+		sb->height = plane->state->fb->height;
+		sb->pitch[0] = plane->state->fb->pitches[0];
+		sb->map[0] = map;
+		return 0;
+	}
+	return -ENODEV;
+}
+
 static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
 	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = bochs_primary_plane_helper_atomic_check,
 	.atomic_update = bochs_primary_plane_helper_atomic_update,
+	.get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
 };
 
 static const struct drm_plane_funcs bochs_primary_plane_funcs = {

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


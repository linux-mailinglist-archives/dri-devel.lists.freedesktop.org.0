Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E98AD15E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0178C10F6DE;
	Mon, 22 Apr 2024 15:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="agfmB3ew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE65B10F6DE
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713801503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeGa2QESaSAKwW885WTwjCXbB74N5sziUqCsVcD6+/Y=;
 b=agfmB3ewStnbS/UOxCzGfdvRzu5zbMhdigefWEXXMYshLOTbWOKYv06/L+HDT/CXySIkxU
 nXs8jl4gKRoqMZyYB335dCJZ1GKI8YqwvL25sh4guqYyomxatHpRficsDozrMVmxlZ3+8A
 yczIZTPu0FCCUUshCki+gXYIWXDFrso=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-328-GrFx7gGfORu5GwD_XaOnIQ-1; Mon, 22 Apr 2024 11:58:18 -0400
X-MC-Unique: GrFx7gGfORu5GwD_XaOnIQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D6EF81B561;
 Mon, 22 Apr 2024 15:58:18 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327C2492BC6;
 Mon, 22 Apr 2024 15:58:17 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 2/2] drm/panic: Allows to run with fbcon
Date: Mon, 22 Apr 2024 17:57:33 +0200
Message-ID: <20240422155811.83648-3-jfalempe@redhat.com>
In-Reply-To: <20240422155811.83648-1-jfalempe@redhat.com>
References: <20240422155811.83648-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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

Disable the framebuffer emulation when a panic occurs, to avoid fbcon
to overwrite the panic screen.
So it's now safe to enable DRM_PANIC and FRAMEBUFFER_CONSOLE.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/Kconfig     | 2 +-
 drivers/gpu/drm/drm_panic.c | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 959b19a041018..7a8b1ef4c6bcf 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -106,7 +106,7 @@ config DRM_KMS_HELPER
 
 config DRM_PANIC
 	bool "Display a user-friendly message when a kernel panic occurs"
-	depends on DRM && !FRAMEBUFFER_CONSOLE
+	depends on DRM
 	select DRM_KMS_HELPER
 	select FONT_SUPPORT
 	help
diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 7ece67086cecb..c46a2b878e759 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 #include <drm/drm_drv.h>
+#include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -470,6 +471,9 @@ static void draw_panic_plane(struct drm_plane *plane)
 	int ret;
 	unsigned long flags;
 
+	/* Prevent fbcon from overwriting the panic screen */
+	drm_fb_helper_emergency_disable(plane->dev->fb_helper);
+
 	if (!drm_panic_trylock(plane->dev, flags))
 		return;
 
-- 
2.44.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4C9A78A40
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 10:44:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490A610E71D;
	Wed,  2 Apr 2025 08:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WOtFWSuq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C91410E71D
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743583462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5aT4E8IjAz62HrMcPYGYOBE62zNkPJUyzC7qjAbwrQ=;
 b=WOtFWSuqegKb38hjx734udxgbQd4jAECbK5TTSghdJOt1MVWBqJ+LRo41T9WfVeDk9KV0K
 yc4+yc4LSfJBWXEvErugQJobIQ6lh43oOx1I9IR2pvFt9gTSSxkBm6Xb2gr1HaK3pgmzvB
 0O/GlqSwWBaw6AaLtw7+kPiaF1ICyuE=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-FhwKMN0PM9eUtWwicz_XPw-1; Wed, 02 Apr 2025 04:44:21 -0400
X-MC-Unique: FhwKMN0PM9eUtWwicz_XPw-1
X-Mimecast-MFC-AGG-ID: FhwKMN0PM9eUtWwicz_XPw_1743583460
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2240a96112fso204703435ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Apr 2025 01:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743583460; x=1744188260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H5aT4E8IjAz62HrMcPYGYOBE62zNkPJUyzC7qjAbwrQ=;
 b=SIPmTGbq0VXL6PdtsdhJJ3mEAltyYCUmSKWA2rlwgeMOjA/C9M6tVDt9gdLQhYJ/Oe
 mqG/r9zU/LA87xlb7AHAE+tjbD+WkGWEqlbJF7Htm1Ie0fxYJ2N8OOwvZUfwGi4r4zlk
 YKdJqRZpJP2siFwD3xHMSlaOWoXAMnkwkmpKIOqQmCZ9MIwcTdVe2joZRCEa2dimIA/A
 Xz+jzEijaMn1qyniLt8dZLP8J+MBzd1j/IdzLH/ISfvfdDxrZLBd092Lj5vdmfpgU8Aw
 Go8nDOJBH8weEZybQCA2neAZDQunz1HSrU2YKO9cWwhMcwV8hz2njI1On5NpsxIWuPop
 TyGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEjNTi5+1TFZ8XzMbNnuqGCf76yEZ3MlYkGVWwx1tqgcxrv2cQUwW+Zz2S86fLOnPJn1JwYwHFkvU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH+fkkveuNjiSItRrt2UfidHlAUv+xx1T7ugGPG6jNjy9aYduy
 1fA3r2N+tjebKFVvaJWCN5FYGMePCHM2prNZTc880nHlgYBrQuWm2HJjvThoY+lemQ+ICWjht1l
 z3YnwcCZnnRQYA/tEeZ1q85bXUvqmBdeqobri3xsTauv6pAfjjfZ2c1PYCJk2fy4P5Q==
X-Gm-Gg: ASbGncvdwa8345hXVuJHbaUbBp9rtm539BgUJcuZxNI84exhNjaBaXNoUUvLqgtssEe
 r4znNMNQtleHhW3yge12KQDYjpQMv3+L4fr24ki374XnQRcWOQQcojhsFNXozX/R1Sm93+ovtN5
 HkoCQ9rGG/IyyEYQ5v1KPWU/Tdhr2Y3ohq6llF8j+Ig9TnHfHLtRHL5+OyiF1AX9kkjN4M8E9gm
 FBomkQblcsWTv3Tr2IhQXCy1ERxf1fPuF7z7+BRNxA9Mt4fFq1p7vZEz2Pbwf80RCGg/fcik4J+
 WZW6Wfmjj9tfC6au
X-Received: by 2002:a17:902:f64f:b0:224:1ef:1e00 with SMTP id
 d9443c01a7336-2292f95d075mr263141315ad.19.1743583460400; 
 Wed, 02 Apr 2025 01:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdcCKlcH6Z7Lv0v5Z/IkIHKmjovi+4bC2OLW8bIyHLKp5/5tomDqn7sNkO1KXXa/YLokWsTA==
X-Received: by 2002:a17:902:f64f:b0:224:1ef:1e00 with SMTP id
 d9443c01a7336-2292f95d075mr263141085ad.19.1743583460084; 
 Wed, 02 Apr 2025 01:44:20 -0700 (PDT)
Received: from zeus.elecom ([240b:10:83a2:bd00:6e35:f2f5:2e21:ae3a])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1f7394sm102202645ad.225.2025.04.02.01.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 01:44:19 -0700 (PDT)
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, drawat.floss@gmail.com,
 jfalempe@redhat.com
Cc: Ryosuke Yasuoka <ryasuoka@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org
Subject: [PATCH RFC drm-next 1/1] drm/hyperv: Add support for drm_panic
Date: Wed,  2 Apr 2025 17:43:49 +0900
Message-ID: <20250402084351.1545536-2-ryasuoka@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402084351.1545536-1-ryasuoka@redhat.com>
References: <20250402084351.1545536-1-ryasuoka@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jYQbfW-DESR_5EWo0tVDO-xrl_UquY17aAEGh9hHVyk_1743583460
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

Add drm_panic module supports for hyperv drm so that panic screen can be
displayed on panic.

Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
---
 drivers/gpu/drm/drm_simple_kms_helper.c     | 26 +++++++++++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 42 +++++++++++++++++++++
 include/drm/drm_simple_kms_helper.h         | 22 +++++++++++
 3 files changed, 90 insertions(+)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 250819fbc5ce..508a5961d2b0 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -14,6 +14,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_panic.h>
 
 /**
  * DOC: overview
@@ -316,6 +317,29 @@ static bool drm_simple_kms_format_mod_supported(struct drm_plane *plane,
 	return modifier == DRM_FORMAT_MOD_LINEAR;
 }
 
+static int drm_simple_kms_plane_get_scanout_buffer(struct drm_plane *plane,
+						   struct drm_scanout_buffer *sb)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->get_scanout_buffer)
+		return -EINVAL;
+
+	return pipe->funcs->get_scanout_buffer(pipe, sb);
+}
+
+static void drm_simple_kms_plane_panic_flush(struct drm_plane *plane)
+{
+	struct drm_simple_display_pipe *pipe;
+
+	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
+	if (!pipe->funcs || !pipe->funcs->panic_flush)
+		return;
+
+	pipe->funcs->panic_flush(pipe);
+}
+
 static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.prepare_fb = drm_simple_kms_plane_prepare_fb,
 	.cleanup_fb = drm_simple_kms_plane_cleanup_fb,
@@ -323,6 +347,8 @@ static const struct drm_plane_helper_funcs drm_simple_kms_plane_helper_funcs = {
 	.end_fb_access = drm_simple_kms_plane_end_fb_access,
 	.atomic_check = drm_simple_kms_plane_atomic_check,
 	.atomic_update = drm_simple_kms_plane_atomic_update,
+	.get_scanout_buffer = drm_simple_kms_plane_get_scanout_buffer,
+	.panic_flush = drm_simple_kms_plane_panic_flush,
 };
 
 static void drm_simple_kms_plane_reset(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
index 6c6b57298797..8e8eacb0d07f 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
@@ -16,6 +16,7 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_panic.h>
 
 #include "hyperv_drm.h"
 
@@ -146,10 +147,51 @@ static void hyperv_pipe_update(struct drm_simple_display_pipe *pipe,
 	}
 }
 
+static int hyperv_pipe_get_scanout_buffer(struct drm_simple_display_pipe *pipe,
+					  struct drm_scanout_buffer *sb)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct hyperv_drm_device *hv;
+	struct drm_framebuffer *fb;
+
+	if (!state || !state->fb || !state->visible)
+		return -ENODEV;
+
+	fb = state->fb;
+	hv = to_hv(fb->dev);
+
+	iosys_map_set_vaddr_iomem(&sb->map[0], hv->vram);
+	sb->format = fb->format;
+	sb->height = fb->height;
+	sb->width = fb->width;
+	sb->pitch[0] = fb->pitches[0];
+	return 0;
+}
+
+static void hyperv_pipe_panic_flush(struct drm_simple_display_pipe *pipe)
+{
+	struct drm_plane_state *state = pipe->plane.state;
+	struct hyperv_drm_device *hv;
+	struct drm_rect rect;
+
+	if (!state || !state->fb)
+		return;
+
+	rect.x1 = 0;
+	rect.y1 = 0;
+	rect.x2 = state->fb->width;
+	rect.y2 = state->fb->height;
+
+	hv = to_hv(state->fb->dev);
+	hyperv_update_dirt(hv->hdev, &rect);
+}
+
 static const struct drm_simple_display_pipe_funcs hyperv_pipe_funcs = {
 	.enable	= hyperv_pipe_enable,
 	.check = hyperv_pipe_check,
 	.update	= hyperv_pipe_update,
+	.get_scanout_buffer = hyperv_pipe_get_scanout_buffer,
+	.panic_flush = hyperv_pipe_panic_flush,
 	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index b2486d073763..126d0d170e81 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -10,6 +10,7 @@
 #include <drm/drm_encoder.h>
 #include <drm/drm_plane.h>
 
+struct drm_scanout_buffer;
 struct drm_simple_display_pipe;
 
 /**
@@ -226,6 +227,27 @@ struct drm_simple_display_pipe_funcs {
 	 */
 	void (*destroy_plane_state)(struct drm_simple_display_pipe *pipe,
 				    struct drm_plane_state *plane_state);
+
+	/**
+	 * @get_scanout_buffer:
+	 *
+	 * Optional, called by &drm_plane_funcs.get_scanout_buffer. Please
+	 * read the documentation for the &drm_plane_funcs.get_scanout_buffer
+	 * hook for more details.
+	 *
+	 */
+	int (*get_scanout_buffer)(struct drm_simple_display_pipe *pipe,
+				  struct drm_scanout_buffer *sb);
+
+	/**
+	 * @panic_flush:
+	 *
+	 * Optional, called by &drm_plane_funcs.panic_flush. Please read the
+	 * documentation for the &drm_plane_funcs.get_scanout_buffer hook for
+	 * more details.
+	 *
+	 */
+	void (*panic_flush)(struct drm_simple_display_pipe *pipe);
 };
 
 /**
-- 
2.48.1


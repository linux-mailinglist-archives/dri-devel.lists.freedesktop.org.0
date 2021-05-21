Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE538C2C6
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 11:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701916F5E7;
	Fri, 21 May 2021 09:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2CD6F5F6
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 09:10:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso6948649wmh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 02:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ha+Y330PiG+WhADsfqhs0mPTOOIZSdzfXUOegqxr7Y0=;
 b=fHzPCgrGxBZPqdJFf4u1SPeUDoO9odZe/AfIDRZxxFCB3iLbceoaENMrq16CnThHM0
 FQGxmf5FXsyK56qxtvCu8ZD6rRkTqMLG9Bi8wDp2SQbHi05Qg969DXl3QL7pDEgMAOb6
 MBlfHPJIV4TIMJKz2QyzwTB/Wsvbtc2xecr4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ha+Y330PiG+WhADsfqhs0mPTOOIZSdzfXUOegqxr7Y0=;
 b=HMxsymxymXtE42sAYslgdHfkxgNAkulGIGKWIWRJMrd7NGGu3xczONKhZzGqvztaov
 Bl0CYtZ5Cb5Ys91HRfqu3rQHnHgy5mUDwi3p7FH+Il86Fx37udgtzHwO5EMaMc078e9v
 /HrQ8zWCGwkTaUCl/01093wN9xF3K9RtDuMLvTfOAAsaEfJ7sgZmxt7vq2JMZj95Zs1m
 oME4cWYf5LIP1VBOhBJHKmRPEKCM8UQV+ab4fp7BobuCmJh2RBb+fIsuxqNCY0/GykYC
 2qBsftOckMd5dWAlOl3O9wlWYXLMPUmMFYYhynPVnCEPcenmkr3WSmUKM+dnVEf5pSGo
 uAbg==
X-Gm-Message-State: AOAM532n2xrRm+YzzlYQrGDro25AGQfMO5Lb2bsCOOfuKo1v1Td8e9xe
 6fiM73QptT6gwtCsE0a6R1P3WbaVPCFG9g==
X-Google-Smtp-Source: ABdhPJw3vVBNKN9S+fmN5I3OqzZo3J2mH9Nw6A8Vr9auGpKPKiY6kj3t36ik9ZU+M000HAYtb2SBjQ==
X-Received: by 2002:a1c:9a4a:: with SMTP id c71mr8327991wme.136.1621588214150; 
 Fri, 21 May 2021 02:10:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y2sm13589457wmq.45.2021.05.21.02.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 02:10:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/11] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
Date: Fri, 21 May 2021 11:09:58 +0200
Message-Id: <20210521090959.1663703-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's tedious to review this all the time, and my audit showed that
arcpgu actually forgot to set this.

Make this the default and stop worrying.

Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
strange combinations of hooks: cleanup_fb without prepare_fb doesn't
make sense, and since simpler drivers are all new they better be GEM
based drivers.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_simple_kms_helper.c | 12 ++++++++++--
 include/drm/drm_simple_kms_helper.h     |  7 +++++--
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
index 0b095a313c44..1a97571d97d9 100644
--- a/drivers/gpu/drm/drm_simple_kms_helper.c
+++ b/drivers/gpu/drm/drm_simple_kms_helper.c
@@ -9,6 +9,8 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -225,8 +227,14 @@ static int drm_simple_kms_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_simple_display_pipe *pipe;
 
 	pipe = container_of(plane, struct drm_simple_display_pipe, plane);
-	if (!pipe->funcs || !pipe->funcs->prepare_fb)
-		return 0;
+	if (!pipe->funcs || !pipe->funcs->prepare_fb) {
+		if (WARN_ON_ONCE(drm_core_check_feature(plane->dev, DRIVER_GEM)))
+			return 0;
+
+		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
+
+		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
+	}
 
 	return pipe->funcs->prepare_fb(pipe, state);
 }
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index ef9944e9c5fc..363a9a8c3587 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -116,8 +116,11 @@ struct drm_simple_display_pipe_funcs {
 	 * the documentation for the &drm_plane_helper_funcs.prepare_fb hook for
 	 * more details.
 	 *
-	 * Drivers which always have their buffers pinned should use
-	 * drm_gem_simple_display_pipe_prepare_fb() for this hook.
+	 * For GEM drivers who neither have a @prepare_fb not @cleanup_fb hook
+	 * set drm_gem_simple_display_pipe_prepare_fb() is called automatically
+	 * to implement this. Other drivers which need additional plane
+	 * processing can call drm_gem_simple_display_pipe_prepare_fb() from
+	 * their @prepare_fb hook.
 	 */
 	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *plane_state);
-- 
2.31.0


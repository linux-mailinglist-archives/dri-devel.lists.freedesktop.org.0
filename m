Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E59AE3B1E97
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 18:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F3E6E935;
	Wed, 23 Jun 2021 16:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB14B6E95F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 16:25:03 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id nd37so4948518ejc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evd9uRpnK0uEjS2cLGzJbOTA3IaXIFBWw8o9hBWCnsw=;
 b=glE1Uxd0Hao5qbW/fH1Z4ZyZBgpIor+OuYYnxiZbpXsQTVVO6qEKin78RTxpzMCeSf
 +DyyS6t1k5MIrjBBOv+qpnwcIQ5IOxdT/Gm/HP7kTgoXK+OUhQPDits2HNArqthZ2BmK
 WXoTBVi+Q9Ja48+f7AO/6Y+w1FKGcPr6awfx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evd9uRpnK0uEjS2cLGzJbOTA3IaXIFBWw8o9hBWCnsw=;
 b=KdA98Z8cTcln1neisLbeU0ZGic78FucQayPDaE+ZM+vDiGvutv72OrMbyC4a+o2Iy2
 3TdGFrQdmcytqsG4B4ayU68nNCyGsdQHjX8rHMThSxop3zlnioAfgfDF1akBBdWxFWcK
 pM421rNfC4WS+vtG4FRG/YoKumLSN33QdurwwIqt/EXhXE9dtbzbLjwWo34M/F03oELD
 DihU+NrVsrPWL+8NjHCESV95QSumQKYSrbOlk0DMNPMvAUEqbYvUxat7fJDZXq5O1F4Z
 182eIpVfbSWkM2H9k0LFLSpBLq8kokSYIPhO3OqszKRARKLcugISjMxspdHq6tK3MHMb
 Ljdw==
X-Gm-Message-State: AOAM532taeQjLkWsJZHiqY/u+8VcbLbaXDdzVPKi0xJVvDWhMLXEs8sq
 A7oxd7J8+PNV9O7Q8J0CL2HptA==
X-Google-Smtp-Source: ABdhPJy15JtfO+Vgum0gt4CFdtOtR76N4UGUKK6T3O9Hm7qYaUp75WqGCJQuhtaXn+CEyNP+fXdBGg==
X-Received: by 2002:a17:906:e108:: with SMTP id
 gj8mr932050ejb.90.1624465502238; 
 Wed, 23 Jun 2021 09:25:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm308926edr.42.2021.06.23.09.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:25:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/simple-helper: drm_gem_simple_display_pipe_prepare_fb as
 default
Date: Wed, 23 Jun 2021 18:24:56 +0200
Message-Id: <20210623162456.3373469-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's tedious to review this all the time, and my audit showed that
arcpgu actually forgot to set this.

Make this the default and stop worrying.

Again I sprinkled WARN_ON_ONCE on top to make sure we don't have
strange combinations of hooks: cleanup_fb without prepare_fb doesn't
make sense, and since simpler drivers are all new they better be GEM
based drivers.

v2: Warn and bail when it's _not_ a GEM driver (Noralf)

v3: It's neither ... nor, not not (Sam)

Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Noralf Trønnes <noralf@tronnes.org>
Acked-by: Noralf Trønnes <noralf@tronnes.org>
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
index 0b095a313c44..735f4f34bcc4 100644
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
+		if (WARN_ON_ONCE(!drm_core_check_feature(plane->dev, DRIVER_GEM)))
+			return 0;
+
+		WARN_ON_ONCE(pipe->funcs && pipe->funcs->cleanup_fb);
+
+		return drm_gem_simple_display_pipe_prepare_fb(pipe, state);
+	}
 
 	return pipe->funcs->prepare_fb(pipe, state);
 }
diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple_kms_helper.h
index ef9944e9c5fc..cf07132d4ee8 100644
--- a/include/drm/drm_simple_kms_helper.h
+++ b/include/drm/drm_simple_kms_helper.h
@@ -116,8 +116,11 @@ struct drm_simple_display_pipe_funcs {
 	 * the documentation for the &drm_plane_helper_funcs.prepare_fb hook for
 	 * more details.
 	 *
-	 * Drivers which always have their buffers pinned should use
-	 * drm_gem_simple_display_pipe_prepare_fb() for this hook.
+	 * For GEM drivers who neither have a @prepare_fb nor @cleanup_fb hook
+	 * set drm_gem_simple_display_pipe_prepare_fb() is called automatically
+	 * to implement this. Other drivers which need additional plane
+	 * processing can call drm_gem_simple_display_pipe_prepare_fb() from
+	 * their @prepare_fb hook.
 	 */
 	int (*prepare_fb)(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *plane_state);
-- 
2.32.0.rc2


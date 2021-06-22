Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694B3B0AE0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 18:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA6F6E820;
	Tue, 22 Jun 2021 16:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4EA6E81C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 16:55:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1911282wmc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=alI8IW7ceIVR5GkdBwlxYMJXZdabM6O8bGMLLcoibIk=;
 b=PA89EpCVBw7LVWE3M6rD3b29Sn2YxnPF9C6xHlBXLijvg2oDkiMfGO1WfzdL7APYBd
 gDw8M0tWiC7DaBAQJoutpuiVh8k/KMLchw56h4fCpA2d7zFpfTo+3vHByQwmLPS3rJCm
 Y4B3w5D9tEEKDebHWmWocTlk5wf9W7hRDdz/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=alI8IW7ceIVR5GkdBwlxYMJXZdabM6O8bGMLLcoibIk=;
 b=M69gNECpaYTj2eUQHOiRg8+Q2NJNuoHBHfVvrxHDWzHxm8I1gRpnYVEtp5Pw5faj4F
 QOGU7G73aVZyxJzcx1nGnLut3SJTRxqHw6poEUud4D446qqfKf5v/ouuw1jxYByipvQi
 HxnHfXhS7ptRzSg0INvttotbZoRp0nZKFfXM/tSne61UlLxweMDAdZA4WBX1N+e7tOVP
 sanj8Re+hjyUgrS2bHR8ZKtv0aI2zJAsJhkPEoQQ/XCKWSxScLfjpMCZ2ZYDkGAfglD4
 dbfE6JMcF/8yciF6ItpHJv4LAxAd9EQqG5DZIy5LCGGDAv0KP4IuUWvhJcztcsO8Q3t8
 kZdA==
X-Gm-Message-State: AOAM5333DUFdVW4hrktxHys9s/7r7IsTVuqlRkKy2I916tmLAMtuvLiX
 Ug7IEAgA+O1pU5CV7IEHHsc3LUpGOFcmsg==
X-Google-Smtp-Source: ABdhPJwpqsQM2rveAkEffx++xxhvdDvefVuM8QIt9EG8oIqRofuW7SGXfSsOcvl6voitTizs3+smtg==
X-Received: by 2002:a05:600c:358b:: with SMTP id
 p11mr5330052wmq.112.1624380930488; 
 Tue, 22 Jun 2021 09:55:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l23sm3632342wmc.5.2021.06.22.09.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:55:30 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/15] drm/simple-helper:
 drm_gem_simple_display_pipe_prepare_fb as default
Date: Tue, 22 Jun 2021 18:55:08 +0200
Message-Id: <20210622165511.3169559-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0.rc2
In-Reply-To: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
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

v2: Warn and bail when it's _not_ a GEM driver (Noralf)

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
2.32.0.rc2


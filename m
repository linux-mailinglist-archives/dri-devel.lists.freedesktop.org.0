Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF393EA54C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 15:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DF96E402;
	Thu, 12 Aug 2021 13:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61D126E3F7
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 13:14:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 203-20020a1c00d40000b02902e6a4e244e4so4537180wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 06:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WxqUpVFpx2tiFToGJLko2apqstRuiXrL5jy/Fl17hvI=;
 b=PlLaXI3ND8nW43bceBMwMvlYbhBhEF1SoTtkk5pIrNpEgvHRDRbYlYRTAF3pahlszw
 0/FkP2ZKRotvKEKzaXdFvarjGHqGmx/b9+qaowMeR9TkWYbpwYSSU8aVfsc9rO/hJNt9
 s/m6/ObymMJOOiv3/w6g1fqfflZhYB9AzT7Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WxqUpVFpx2tiFToGJLko2apqstRuiXrL5jy/Fl17hvI=;
 b=GkdvVmjUiNjT8/iX2vIoJEkt4ZUnLBGlNmuTdCzTwlzKCQptgw1N/FFtMwV9S7Q6OJ
 q2ewcwhxokpnmXDlKGn3VJqXQwPNe6gtsk+siTXFUNh7wIphZCMlhMtAJLi7xhDDlp4F
 52IzguU9c7a5Pxbw4AxbsRLqyud6+Dmz3MHJMuGlo6lfd1Y7iZSsPJbcz9bNtbpSBvJN
 syNUacGiwGSNVnHxeqlKp+QfB6+UbD/hqJczkycYyV8/ZlXOOmwOPme08TtwYc2y0otj
 r1q5uTOsknVZb/z2s9JSEfaanhpLsVA3V3JEMrwuFHNNCQPhEJs4eTbwqAakyjEMLVOt
 1Dlw==
X-Gm-Message-State: AOAM532gfPPXfB8d6AcsHvSLCuFIhtnIDB5KXAvHBsZI7VX56GIERGLo
 rTM8o0kVKam7trVxevo7bK0CvlnhUkgKFA==
X-Google-Smtp-Source: ABdhPJyKABZ+o5rsWzQn2DkQs6m58wjIVDRUiiRy0So84dzGVWpV2plsPptbDJFvO+0KTeeVQh8Beg==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr15666347wmq.31.1628774060926; 
 Thu, 12 Aug 2021 06:14:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h4sm2914957wru.2.2021.08.12.06.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:14:20 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm/shmem-helpers: Allocate wc pages on x86
Date: Thu, 12 Aug 2021 15:14:11 +0200
Message-Id: <20210812131412.2487363-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210812131412.2487363-1-daniel.vetter@ffwll.ch>
References: <20210812131412.2487363-1-daniel.vetter@ffwll.ch>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

intel-gfx-ci realized that something is not quite coherent anymore on
some platforms for our i915+vgem tests, when I tried to switch vgem
over to shmem helpers.

After lots of head-scratching I realized that I've removed calls to
drm_clflush. And we need those. To make this a bit cleaner use the
same page allocation tooling as ttm, which does internally clflush
(and more, as neeeded on any platform instead of just the intel x86
cpus i915 can be combined with).

Unfortunately this doesn't exist on arm, or as a generic feature. For
that I think only the dma-api can get at wc memory reliably, so maybe
we'd need some kind of GFP_WC flag to do this properly.

v2: Add a TODO comment about what should be done to support this in
other places (Thomas)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index cc96d1c3570e..0e0986dfbe0c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -10,6 +10,10 @@
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
 
+#ifdef CONFIG_X86
+#include <asm/set_memory.h>
+#endif
+
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -162,6 +166,16 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 		return PTR_ERR(pages);
 	}
 
+	/*
+	 * TODO: Allocating WC pages which are correctly flushed is only
+	 * supported on x86. Ideal solution would be a GFP_WC flag, which also
+	 * ttm_pool.c could use.
+	 */
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
+#endif
+
 	shmem->pages = pages;
 
 	return 0;
@@ -203,6 +217,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
 	if (--shmem->pages_use_count > 0)
 		return;
 
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wb(shmem->pages, obj->size >> PAGE_SHIFT);
+#endif
+
 	drm_gem_put_pages(obj, shmem->pages,
 			  shmem->pages_mark_dirty_on_put,
 			  shmem->pages_mark_accessed_on_put);
-- 
2.32.0


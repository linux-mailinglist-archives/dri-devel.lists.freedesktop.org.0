Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13E23C783A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 22:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 539366E138;
	Tue, 13 Jul 2021 20:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6500B6E131
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 20:52:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id r11so360777wro.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/zygawp8H9nMKsUfIVJKXYmxNB6SpK8XomLFpeNl1u4=;
 b=Um4WvsYyvXOPTelxx4VO24F3eVMkiGg2UKtWxUO9nFoyEsqRq3pciJ8jCOyX3YWaDM
 l/kMw8GVLY3NWSVUgn2ZuG3SNK8oG4c3JqYbKLixxoOvyzfr8+nkenohqPiH1h3af6/B
 0MMaEU+MHpQjSR6NehmMnAEHXSA40z3z5IFL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/zygawp8H9nMKsUfIVJKXYmxNB6SpK8XomLFpeNl1u4=;
 b=e8/c+tje+5bKHdVek57N6a7lPR5FXXO9sLlglsDG//O4WGcouT/X4qTtt1YsBlnina
 m1vyESYs8QODoa9BNh3sQDq83uu5blDKwhTY1VgXziSQ3LmT3Wo8fKLpZQfGbi60VEES
 Cy2RCCTTPAlbMzFIpdV7NVi9SFhyaa0xUsGJ3sc6YFAtXgF1FqczawsOUBdMayyQ4NHU
 U67pFcbC7dWWfwu2iO9xr55YyVCqnUGy8Xn5NWLm/MR0KiY2+56eDHGmzvtZZBDTinp8
 VhO13rJB2GITlNuF34zDjnztMbwSDh9jegGVwr7aGnp68sns5BmaC5S4tkR0IO76uRxL
 wGvA==
X-Gm-Message-State: AOAM530XzpX/rpId0LMlKHJRrLAnlHgs4GNtGbQ55Y5ov1/GeWyu50G6
 58INlrd5FTOQeCWIelvaH0vcuQ==
X-Google-Smtp-Source: ABdhPJxwwDzX0YlQegvblaY7h1YZr6t3cMoRnTVGmzCsubSpg3GdP6DJrSnr7BpmY1z/6D5Qxt1CBw==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr8245727wrj.216.1626209522138; 
 Tue, 13 Jul 2021 13:52:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j10sm18642249wrt.35.2021.07.13.13.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 13:52:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/shmem-helpers: Allocate wc pages on x86
Date: Tue, 13 Jul 2021 22:51:52 +0200
Message-Id: <20210713205153.1896059-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
References: <20210713205153.1896059-1-daniel.vetter@ffwll.ch>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 296ab1b7c07f..657d2490aaa5 100644
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
@@ -162,6 +166,11 @@ static int drm_gem_shmem_get_pages_locked(struct drm_gem_shmem_object *shmem)
 		return PTR_ERR(pages);
 	}
 
+#ifdef CONFIG_X86
+	if (shmem->map_wc)
+		set_pages_array_wc(pages, obj->size >> PAGE_SHIFT);
+#endif
+
 	shmem->pages = pages;
 
 	return 0;
@@ -203,6 +212,11 @@ static void drm_gem_shmem_put_pages_locked(struct drm_gem_shmem_object *shmem)
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


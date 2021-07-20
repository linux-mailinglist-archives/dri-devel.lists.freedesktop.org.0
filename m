Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366D3D015E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD656E4D4;
	Tue, 20 Jul 2021 18:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE46E4CA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:14:14 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id o4so18667980pgs.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ReIHw+eskmExAvlnepg8gr2vNrQ8gC8vqz4lIfsdf9M=;
 b=Hz0cL33ubiHisyTzwjnlyjUxG46kLnOukqZ6f4kCsQaBFEU9mt7MUrMjpl3qlQiQrG
 HYFytFsxxewbXaYKno/TrWlhcBlcwsE7Rbk8h7x4F378nl7zsjzLHmtqqmDBn5TbsF/j
 esDi1udl3EN8K2guXz52hw5Lb+AgLuVVyYXaKDynZkDg08sfXNAftNhNZ+daQa+3qM4d
 N6hmFNFIjkt1jeoIKIb2Npk1DjLDoZaXXzHb2PliH+jjCpdq16f6QDx7vnGfgp1Oldqp
 gMMZqLfKWUW7TEbcXy7il9xxE1ObZTnzUo6IzbknUVa25d/XCr0YnQFGEzC9Y9xNwsWa
 +gTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ReIHw+eskmExAvlnepg8gr2vNrQ8gC8vqz4lIfsdf9M=;
 b=Vqe4y4PeIw6vTlvfaoVmLzq2aQz7dTzgxwNF9UmFlFviD2eTXV+Ztn856ofmMU0Ml6
 C79W+NOcoBURLTc/WDYZzMZvBqP6JfI1UzPbbbEvjvmfrZEgXqufAXUrNdBMAEEvcew+
 cPQFImzKf/is6melhk5HD8aiG58p8dCncD0STPwfjVYTVnrA+l5F8xIryJTl0nQpLvPX
 lC8QrXACdjXYkuhSb//K8vffu8HH7f8Chu8EZu6dxjWY4rUjuOarXNU/35xxWg/XpMhT
 Jv+MF8ejjR2Y8x6ZkwtUEqyfn8/oA8RCuGYZsPLaDOBBQiAKDggOtIfDjvt+NaU4B3JM
 X6Mw==
X-Gm-Message-State: AOAM530u5OFNlJ+M0T8CNOgnYTLGd9QsH2KP17GuB6mpFqX/b12rAtf2
 59HUOnleOYn0AifWN4T7bl1qKA==
X-Google-Smtp-Source: ABdhPJwZ4OwkDQv3h+FLciZIMUXZoQhY1KGMDFUV0VonL+NXfcJG1HlfU9yqK0jIv31w0uJKIBV0hQ==
X-Received: by 2002:a62:d108:0:b029:304:33e5:4dde with SMTP id
 z8-20020a62d1080000b029030433e54ddemr32926250pfg.74.1626804853725; 
 Tue, 20 Jul 2021 11:14:13 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id c2sm26436573pgh.82.2021.07.20.11.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:14:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/ttm: Initialize debugfs from ttm_global_init()
Date: Tue, 20 Jul 2021 13:13:56 -0500
Message-Id: <20210720181357.2760720-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720181357.2760720-1-jason@jlekstrand.net>
References: <20210720181357.2760720-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We create a bunch of debugfs entries as a side-effect of
ttm_global_init() and then never clean them up.  This isn't usually a
problem because we free the whole debugfs directory on module unload.
However, if the global reference count ever goes to zero and then
ttm_global_init() is called again, we'll re-create those debugfs entries
and debugfs will complain in dmesg that we're creating entries that
already exist.  This patch fixes this problem by changing the lifetime
of the whole TTM debugfs directory to match that of the TTM global
state.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ttm/ttm_device.c | 12 ++++++++++++
 drivers/gpu/drm/ttm/ttm_module.c | 16 ----------------
 2 files changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 519deea8e39b7..74e3b460132b3 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -44,6 +44,8 @@ static unsigned ttm_glob_use_count;
 struct ttm_global ttm_glob;
 EXPORT_SYMBOL(ttm_glob);
 
+struct dentry *ttm_debugfs_root;
+
 static void ttm_global_release(void)
 {
 	struct ttm_global *glob = &ttm_glob;
@@ -53,6 +55,7 @@ static void ttm_global_release(void)
 		goto out;
 
 	ttm_pool_mgr_fini();
+	debugfs_remove(ttm_debugfs_root);
 
 	__free_page(glob->dummy_read_page);
 	memset(glob, 0, sizeof(*glob));
@@ -73,6 +76,13 @@ static int ttm_global_init(void)
 
 	si_meminfo(&si);
 
+	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
+	if (IS_ERR(ttm_debugfs_root)) {
+		ret = PTR_ERR(ttm_debugfs_root);
+		ttm_debugfs_root = NULL;
+		goto out;
+	}
+
 	/* Limit the number of pages in the pool to about 50% of the total
 	 * system memory.
 	 */
@@ -100,6 +110,8 @@ static int ttm_global_init(void)
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
+	if (ret && ttm_debugfs_root)
+		debugfs_remove(ttm_debugfs_root);
 	if (ret)
 		--ttm_glob_use_count;
 	mutex_unlock(&ttm_global_mutex);
diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index 997c458f68a9a..7fcdef278c742 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -72,22 +72,6 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
 	return tmp;
 }
 
-struct dentry *ttm_debugfs_root;
-
-static int __init ttm_init(void)
-{
-	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
-	return 0;
-}
-
-static void __exit ttm_exit(void)
-{
-	debugfs_remove(ttm_debugfs_root);
-}
-
-module_init(ttm_init);
-module_exit(ttm_exit);
-
 MODULE_AUTHOR("Thomas Hellstrom, Jerome Glisse");
 MODULE_DESCRIPTION("TTM memory manager subsystem (for DRM device)");
 MODULE_LICENSE("GPL and additional rights");
-- 
2.31.1


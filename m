Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 679013F99A0
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CAE6E93F;
	Fri, 27 Aug 2021 13:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382C06E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d26so10489070wrc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yn/vaVvblRViP19offP84fG/Hd78GVNRXLUkQoP5WOw=;
 b=RqyHU4S34DHrGmacqmi9GKxNCUcxtBdL9iPhT0u6EnpyHp77mCVJ4avkKsrAKn5xXu
 svxdEOdqet1hzm8glB0bN14MpOCnij1ivThdKmuUE7bOWuvDzq0sO9UF9CfzbvrR89cW
 x+6au14fFkmk+KER/vTp0GInDpMWxuhSS8mPxRuGdxWE+s34vpOW35SjBv7hRO0iDuos
 P7cqbhfjHw6S+I/euU4ydg8HnCi5EFR6/+nLg0k9AHb7UqxN/2T6soIvQOdARea1TgR1
 awBG6OqkoPlWBQJ8icifIC+I6WJdA1Dh0SyGNEme1hW8aYv2VskOKfe3PyOK6ev6WYHx
 7YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yn/vaVvblRViP19offP84fG/Hd78GVNRXLUkQoP5WOw=;
 b=YJjYBOK6Xmsfy3J6wpbcGwNuFqW+BRFWabgdMYMTsVHB6Bgqs18IxVm7CIyLQdtaBQ
 QR0AJ0C7QNdSi64MSpI2unEH4/Z4wCXSiEO9VcvwjAU/RdBEWJfIFqzsGptGPlkKo8x4
 OiEwT0GaNrbDz1trohbcLaVNIdjMm+PaSAKcxZQ3PPrYSPtwKuRvC23yILr8OQtANPAk
 IYN7SiPBPxc1R8QMWZ94cRfDFZh0/BWz7qVPt9t5zpYembGIfdzdKoykbY/Z2nBaYEoQ
 K4iAjaPPQiBxPwxQm0UAr0TvsFpMAvxUTeQXDMHMD172Ekzyc+DReEbcKXs08/4ZVOmG
 dOXQ==
X-Gm-Message-State: AOAM531MP72eaJj5Yr2dN3uh6C7uBxksnoM6OE1+9Cz/BOsPcOgV9iqP
 BLuucEEKdluYus8fz1y2GpWcuMrcyhU=
X-Google-Smtp-Source: ABdhPJxQYnWBaZsST6BI+9+tzDBt3og23Ap6OQYyf5Rx76HpdCuqhRg/YKHr9vdeYqjzSHl/olQqDw==
X-Received: by 2002:adf:ed85:: with SMTP id c5mr9971969wro.379.1630070604782; 
 Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id t64sm5293301wma.48.2021.08.27.06.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 07/25] tegra: Make API more consistent
Date: Fri, 27 Aug 2021 15:22:47 +0200
Message-Id: <20210827132305.3572077-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Most functions in libdrm_tegra take as first parameter the object that
they operate on. Make the device and buffer object creation functions
follow the same scheme.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c           | 13 +++++++------
 tegra/tegra.h           | 10 +++++-----
 tests/tegra/openclose.c |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index 240600c3c496..0020e9301bf3 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -70,7 +70,7 @@ static int drm_tegra_wrap(struct drm_tegra **drmp, int fd, bool close)
     return 0;
 }
 
-drm_public int drm_tegra_new(struct drm_tegra **drmp, int fd)
+drm_public int drm_tegra_new(int fd, struct drm_tegra **drmp)
 {
     bool supported = false;
     drmVersionPtr version;
@@ -122,8 +122,8 @@ static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                 uint32_t flags, uint32_t size)
+drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                 struct drm_tegra_bo **bop)
 {
     struct drm_tegra_gem_create args;
     struct drm_tegra_bo *bo;
@@ -156,8 +156,8 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
 }
 
 drm_public int
-drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                  uint32_t handle, uint32_t flags, uint32_t size)
+drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                  uint32_t size, struct drm_tegra_bo **bop)
 {
     struct drm_tegra_bo *bo;
 
@@ -187,7 +187,8 @@ drm_public void drm_tegra_bo_unref(struct drm_tegra_bo *bo)
         drm_tegra_bo_free(bo);
 }
 
-drm_public int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
+drm_public int
+drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle)
 {
     if (!bo || !handle)
         return -EINVAL;
diff --git a/tegra/tegra.h b/tegra/tegra.h
index aaaf455fbc8e..2bcd596e2d61 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -31,13 +31,13 @@
 struct drm_tegra_bo;
 struct drm_tegra;
 
-int drm_tegra_new(struct drm_tegra **drmp, int fd);
+int drm_tegra_new(int fd, struct drm_tegra **drmp);
 void drm_tegra_close(struct drm_tegra *drm);
 
-int drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                     uint32_t flags, uint32_t size);
-int drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
-                      uint32_t handle, uint32_t flags, uint32_t size);
+int drm_tegra_bo_new(struct drm_tegra *drm, uint32_t flags, uint32_t size,
+                     struct drm_tegra_bo **bop);
+int drm_tegra_bo_wrap(struct drm_tegra *drm, uint32_t handle, uint32_t flags,
+                      uint32_t size, struct drm_tegra_bo **bop);
 struct drm_tegra_bo *drm_tegra_bo_ref(struct drm_tegra_bo *bo);
 void drm_tegra_bo_unref(struct drm_tegra_bo *bo);
 int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
diff --git a/tests/tegra/openclose.c b/tests/tegra/openclose.c
index 104e83806f3a..61dbc2ba4f5f 100644
--- a/tests/tegra/openclose.c
+++ b/tests/tegra/openclose.c
@@ -56,7 +56,7 @@ int main(int argc, char *argv[])
         drmFreeVersion(version);
     }
 
-    err = drm_tegra_new(&tegra, fd);
+    err = drm_tegra_new(fd, &tegra);
     if (err < 0)
         return 1;
 
-- 
2.32.0


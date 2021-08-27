Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359FF3F99A4
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C6E6E944;
	Fri, 27 Aug 2021 13:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A2A6E93F
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q14so10415485wrp.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCYo7FJcxKoQshzkwg/+mjeEX0Thq4lUy2ZqW0h0e+4=;
 b=CqLSDPoTRTt5AxGXzE4OegrS+nbPyEbSUZqXjNJMmWXb60nyV6rYTuNTSo+YwS0DeU
 VOqpsvIqjxsKodYtVyLryYG8x3RZmAwp6WetsVcN/3rHTSum8oJPWXEqrhi/nq80vbSB
 07ThCzHHBmufClWem0nxWIsw2mtD/e+2TjHoqvMwXfShAXIy1E2FlsRLftTkMYQ523bC
 NFGyi8MejlBZ03yr41o2pRSWJq+GkXJzLFGMPsZjYp54kF5+wBjNB+Wqn+DJl3eJQQf4
 beMVlSr/XNDCMa4hVGteb7l5sC9XUQA4AVnADGZgpf8s0XP0pPTtHe4mKLUHJJ+2LhYG
 RbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCYo7FJcxKoQshzkwg/+mjeEX0Thq4lUy2ZqW0h0e+4=;
 b=bkzFtnWIiTgC7gpGGaLGBJM4oWQAdlw05uCNx568qUYuJpCFwCPdDtUg40WR8+Famg
 wAc+HLN7Av4mI2r9B2eDhPgBNxGwH7mubYir7Zeu1031EnnA544UPhDpCqrS5E0Ce0Zy
 iyjWvHZJRgY/ShANtPL53GXViIdYexVfd0ne7t0CTWeZ1JUyFoAsUSZJbiG5aZ9m/odl
 YoVrxsw48qJP+WUJkO30SopGiXVSR4N9lO2bUqp9+iG7hi/dHHQO08lDRH5pGBJ1MPC4
 mZjOFE++JcGrA7zFIXnF3ERSLHjktM/dGHyXULfMKE8c1RMnb/E3gNe5Z7sKnCG5d8Vw
 6uDQ==
X-Gm-Message-State: AOAM5317N3SI8wLz0ujgD3CCLmBTjIFgyPjR/ATwdNDmcDmJ7eQTdGeB
 c+Bm6F/Rlg8+x+oFvZolAsirIPaA/m4=
X-Google-Smtp-Source: ABdhPJyiFoerR3lESbOmmSFrx2p8NZJJDXo1NdDcQgS3GHKb20MaAuzYeXA/IN8n2avW3Wjq7xIKkw==
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr10494233wrh.108.1630070601201; 
 Fri, 27 Aug 2021 06:23:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id a129sm3865486wme.14.2021.08.27.06.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 05/25] tegra: Add flink helpers
Date: Fri, 27 Aug 2021 15:22:45 +0200
Message-Id: <20210827132305.3572077-6-thierry.reding@gmail.com>
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

Add helpers to export and import buffer objects via flink names.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- add drm_public annotations
---
 tegra/tegra-symbols.txt |  2 ++
 tegra/tegra.c           | 50 +++++++++++++++++++++++++++++++++++++++++
 tegra/tegra.h           |  3 +++
 3 files changed, 55 insertions(+)

diff --git a/tegra/tegra-symbols.txt b/tegra/tegra-symbols.txt
index 9422696c1416..630e075fa5d7 100644
--- a/tegra/tegra-symbols.txt
+++ b/tegra/tegra-symbols.txt
@@ -1,6 +1,8 @@
 drm_tegra_bo_get_handle
+drm_tegra_bo_get_name
 drm_tegra_bo_map
 drm_tegra_bo_new
+drm_tegra_bo_open
 drm_tegra_bo_ref
 drm_tegra_bo_unmap
 drm_tegra_bo_unref
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 5225ad052fb3..5eb8518104ef 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -244,3 +244,53 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
     return 0;
 }
+
+drm_public int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name)
+{
+    struct drm_tegra *drm = bo->drm;
+    struct drm_gem_flink args;
+    int err;
+
+    memset(&args, 0, sizeof(args));
+    args.handle = bo->handle;
+
+    err = drmIoctl(drm->fd, DRM_IOCTL_GEM_FLINK, &args);
+    if (err < 0)
+        return err;
+
+    if (name)
+        *name = args.name;
+
+    return 0;
+}
+
+drm_public int
+drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
+                  struct drm_tegra_bo **bop)
+{
+    struct drm_gem_open args;
+    struct drm_tegra_bo *bo;
+    int err;
+
+    bo = drm_tegra_bo_alloc(drm, 0, flags, 0);
+    if (!bo)
+        return -ENOMEM;
+
+    memset(&args, 0, sizeof(args));
+    args.name = name;
+
+    err = drmIoctl(drm->fd, DRM_IOCTL_GEM_OPEN, &args);
+    if (err < 0)
+        goto free;
+
+    bo->handle = args.handle;
+    bo->size = args.size;
+
+    *bop = bo;
+
+    return 0;
+
+free:
+    free(bo);
+    return err;
+}
diff --git a/tegra/tegra.h b/tegra/tegra.h
index c6b4f984de45..333690f23118 100644
--- a/tegra/tegra.h
+++ b/tegra/tegra.h
@@ -44,5 +44,8 @@ int drm_tegra_bo_get_handle(struct drm_tegra_bo *bo, uint32_t *handle);
 int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr);
 int drm_tegra_bo_unmap(struct drm_tegra_bo *bo);
 
+int drm_tegra_bo_get_name(struct drm_tegra_bo *bo, uint32_t *name);
+int drm_tegra_bo_open(struct drm_tegra *drm, uint32_t name, uint32_t flags,
+                      struct drm_tegra_bo **bop);
 
 #endif /* __DRM_TEGRA_H__ */
-- 
2.32.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EE4BA97F
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B7310E433;
	Thu, 17 Feb 2022 19:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD64910E471
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:37 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c6so8706702edk.12
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eaLIGaAa+RQaFC/Np/JD2E7mN4OYFfTrDEb0AxNo6TY=;
 b=ECtjhYHxkvjlwXQmKE1B2uvGVHqoemnYr0dPxuKRyvDsfAFQUXo5YOBJWPw0JAoH/5
 /xKxdlewSV8ZpgNPUrNQBtSYnUuzerhgsp+BjkZiytxq98t/EUgwsz4K/5ljW7byRVgp
 iwUu3dU/QgVW5ff2u4KTE+OTk1+pjlPYhs3BTmvfIRIVXsn2gk9WG5eOgobQu9oJToTL
 Lh6nvr4pJiEUKhy31NDSa/vPXsS6tP7z4gZITUWkshxUw9PJiqivaOw4gjUmoiE8HgV7
 WnlULagG1DT4+Xom02tjBdAc5YdmV98lTHXaqUJesO4QzpInVykmxN1YDUA8gyGMOqsv
 PUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eaLIGaAa+RQaFC/Np/JD2E7mN4OYFfTrDEb0AxNo6TY=;
 b=FjzxZgR5JQNeVbKWe5/zM5Ysrnub9qWHXPgxacncmbyxC/dRgsd5uVCW9TkQmCyr4R
 EKE6UuXpsL8uIhE/pRE2HHr/MIYQDBCp41XS0ba228F2es04V8zayqZf66rDvlrXuTJC
 X7oFpncL8kZHOBetWM4U4ZIvqKTROqhj8a8SqA9XlVUr7CjMA57IYrafvVzlF03Sq8ct
 XwzYyPFM0cWxz6d6Mm/J2MN+aODmOoLHiRp9JDbafdXTrtow13u1N8mwbD3hnCDov34p
 Z3bZ94N4OH4ZKM8+tHvfowxAvTbRalvZD8DaxHlvFaTPB0ihvr6U4eBVLzPy0a+wwpJC
 Nphg==
X-Gm-Message-State: AOAM531Np/7mQtqpHugQiQowrKyNMH8RNb6H/mdwGh9JRo52RV4NMJnk
 WvMrfE6QDblYH/+Qsw/Yaow=
X-Google-Smtp-Source: ABdhPJyYcoEEqfVM4jYelKCvCk89VrXVUEtGRyOEuA1axTAW6TKe+xark4Ot3vVj3ioYexGREt0oHQ==
X-Received: by 2002:a05:6402:144b:b0:410:b990:a68a with SMTP id
 d11-20020a056402144b00b00410b990a68amr4288389edx.25.1645125396403; 
 Thu, 17 Feb 2022 11:16:36 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id r3sm1488439ejd.129.2022.02.17.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 05/25] tegra: Add flink helpers
Date: Thu, 17 Feb 2022 20:16:05 +0100
Message-Id: <20220217191625.2534521-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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
index a9087e956f94..3d645d87dd3d 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -240,3 +240,53 @@ drm_public int drm_tegra_bo_unmap(struct drm_tegra_bo *bo)
 
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
2.35.1


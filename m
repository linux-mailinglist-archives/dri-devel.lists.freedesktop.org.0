Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F381C4BA981
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8010E479;
	Thu, 17 Feb 2022 19:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915EA10E458
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:34 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id a8so9569811ejc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bnXF7r460nVXVVViXXt//RK7jf9YuHumDoAui5Tkl/s=;
 b=AkzymwpgC8GZ0SadLVA9e2aA92UBz3MXg5/zDaDmGMjxE9IsTskAZmGCJ7yoaiCkQ4
 zi4kkRc+n5xLSohUT09X7SvVS4Yh+dBvo5YC4ZYd24oKa5enU7MTVfOy3SGnoccfr8bi
 kWEVAFc0lzRdeMr33rFsy5pNi96MdS+Agek09yzfK1DLlkWKPAN3IXZ8N2q1swb+Novl
 8eXKfvanwmaUyea7Ity09OHd6+jO4mHmeXowHGTh6qpy9RISUOh0SLtE1hH56DC8jMnY
 ARRkZkrJgBbuch81iM6lS+RMWw1x588W5iRkplOrOVUOD1btKUJ1SH9xvl4M09dnv6we
 bbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bnXF7r460nVXVVViXXt//RK7jf9YuHumDoAui5Tkl/s=;
 b=WND1+56J7tTtUGJ9LDSzWqLHW8GZ03RKOmrSqHISKy44sFtjsDK4ndvneWyr4Lqebv
 LxTwKy68cIyP06jicTPewQj+qDJCfDXynuIY8vn2GxJxnygeBM1ysyfDmoyZ5cp3IYgu
 dltMouJBYtEoPkUHcUXPbMR8ha6DlvGSRgOjSrAbdRZ7+Z74ENuDxdWoJ/b00hHETrd4
 /Qic0cA24/JydVJjI7ePH06qhCaKNNYYNi4OPxI+/tWc8yNWECKLgY1VnCb9uZT49N4u
 B0JTefuUMO5IE3CTv/ZwMtqSJnJ5dW81jFOOaV98v+1mWPTk4Wgw2kTrpBMIcrm5bnHf
 nt2Q==
X-Gm-Message-State: AOAM532s+F0IlceruIfF0SNcUO9CE+6gnBeZdkOUt8vSWmd8SfB+sjFd
 zTg01F9jXwzPB0nXLEMYzXk=
X-Google-Smtp-Source: ABdhPJxdlP2cTwiHUTK6g7sNcQD8gB5F60ON3QQUKjSI6QBwSKuyOJJl8qA5mQEKGqno3jWZYcfM5w==
X-Received: by 2002:a17:906:eb0f:b0:6af:738:3380 with SMTP id
 mb15-20020a170906eb0f00b006af07383380mr3517018ejb.398.1645125393077; 
 Thu, 17 Feb 2022 11:16:33 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id n25sm3575806eds.89.2022.02.17.11.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 03/25] tegra: Extract common buffer object
 allocation code
Date: Thu, 17 Feb 2022 20:16:03 +0100
Message-Id: <20220217191625.2534521-4-thierry.reding@gmail.com>
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

All of the buffer object allocation functions use the same boilerplate
code. Move that code into a separate function that can be reused.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/tegra.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/tegra/tegra.c b/tegra/tegra.c
index 630aea45f957..74e1fd33c6e5 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -97,6 +97,26 @@ drm_public void drm_tegra_close(struct drm_tegra *drm)
     free(drm);
 }
 
+static struct drm_tegra_bo *drm_tegra_bo_alloc(struct drm_tegra *drm,
+                                               uint32_t handle,
+                                               uint32_t flags,
+                                               uint32_t size)
+{
+    struct drm_tegra_bo *bo;
+
+    bo = calloc(1, sizeof(*bo));
+    if (!bo)
+        return NULL;
+
+    atomic_set(&bo->ref, 1);
+    bo->handle = handle;
+    bo->flags = flags;
+    bo->size = size;
+    bo->drm = drm;
+
+    return bo;
+}
+
 drm_public int
 drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
                  uint32_t flags, uint32_t size)
@@ -108,15 +128,10 @@ drm_tegra_bo_new(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || size == 0 || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, 0, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     memset(&args, 0, sizeof(args));
     args.flags = flags;
     args.size = size;
@@ -145,16 +160,10 @@ drm_tegra_bo_wrap(struct drm_tegra_bo **bop, struct drm_tegra *drm,
     if (!drm || !bop)
         return -EINVAL;
 
-    bo = calloc(1, sizeof(*bo));
+    bo = drm_tegra_bo_alloc(drm, handle, flags, size);
     if (!bo)
         return -ENOMEM;
 
-    atomic_set(&bo->ref, 1);
-    bo->handle = handle;
-    bo->flags = flags;
-    bo->size = size;
-    bo->drm = drm;
-
     *bop = bo;
 
     return 0;
-- 
2.35.1


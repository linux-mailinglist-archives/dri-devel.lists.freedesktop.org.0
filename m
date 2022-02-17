Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E12AB4BA980
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E66310E471;
	Thu, 17 Feb 2022 19:16:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490D010E6AE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 19:16:36 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id b13so11549986edn.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 11:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZ1+dbVgEHbMNHKD2WHu+8n1k/4rgOGziLcagk+Gug0=;
 b=U/ayq/86gSmWoe7OjV1Qbq++ogkPATV2dXmZ5XvHe15rD1RvOu8S4lSE5mT5h4dCjk
 wTr47oDHOLr947Ybax3deSXi0hxgE1d2XdANXt9tL7HAGRXyVu85mYMZrGELlVjEr9aL
 604VFgZzI5iMNH3uXDol+MooCZRc8uYj2dxHkUgISxwvHJe0DCy5GQx9/i4Esbm+LtTR
 N+TtfvOK3JbPQtW1nNYU2pYujStOieql3ts2acP4I35yql5Opvko6SaM9uoJA8wLKrN2
 o6i4l5Bso8hk3xdFfJJHaPUmJnmt6kFm7hhuno21Q3eCx/Wg1CMJQ0zagJjUVHISqyaT
 Ow8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZ1+dbVgEHbMNHKD2WHu+8n1k/4rgOGziLcagk+Gug0=;
 b=nEdlwa1J9BC+tuTq2kPCchnor8zID6coZfuCKWU9FnFWzH3PutyU6oEX0XboQtr1W+
 EL79Ed03+7+ML1UMCym4h659aTR2up7830tjIl9wVIL+sFgsOgVID/rirvUNC7c4MvbW
 sYNVqZaDOapwCcWhHlbatBslYD5dhVsJlIeutse/hWZwfTfsjIh29AbMgDTIbvCxZlGj
 lzve/zBJfuNgnlgpb9FOexKszTHslwOtXIVsLbe0OIHO5576U8PKozuGjA+hDb8MnWpS
 VC4wU5DWWFhJeN4ZurWQClyWX23YN5kceLzyyVoXfQbFXkc+ihy1n+mTnc3oJxszfZTC
 NE1w==
X-Gm-Message-State: AOAM531w0LarLZTKtWGbSEaRebK0VV/5FXXLmAurb2Xenf8yvoo1FRe3
 EHRHn2PaShA0JptoAC+SZ/w/PWA40hQ=
X-Google-Smtp-Source: ABdhPJx1d98WlY3RDywH1WZl5cYA57Sv98zrg9q3bXXG5y4Xhgueh+tGVzGr5tx0i4725R80mP2Ihw==
X-Received: by 2002:a50:cccf:0:b0:410:ba4e:65fd with SMTP id
 b15-20020a50cccf000000b00410ba4e65fdmr4313297edj.31.1645125394781; 
 Thu, 17 Feb 2022 11:16:34 -0800 (PST)
Received: from localhost
 (p200300e41f0a6900000000000000043a.dip0.t-ipconnect.de.
 [2003:e4:1f0a:6900::43a])
 by smtp.gmail.com with ESMTPSA id m11sm3856156edc.110.2022.02.17.11.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 11:16:33 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH libdrm v2 04/25] tegra: Fix mmap() of GEM buffer objects
Date: Thu, 17 Feb 2022 20:16:04 +0100
Message-Id: <20220217191625.2534521-5-thierry.reding@gmail.com>
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

Store 64-bit offset values and use libdrm's built-in drm_mmap() function
instead of mmap() to ensure the full 64-bit offset is used.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/private.h | 2 +-
 tegra/tegra.c   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tegra/private.h b/tegra/private.h
index 215dd3309bce..d0f2944bfb3a 100644
--- a/tegra/private.h
+++ b/tegra/private.h
@@ -41,7 +41,7 @@ struct drm_tegra {
 struct drm_tegra_bo {
     struct drm_tegra *drm;
     uint32_t handle;
-    uint32_t offset;
+    uint64_t offset;
     uint32_t flags;
     uint32_t size;
     atomic_t ref;
diff --git a/tegra/tegra.c b/tegra/tegra.c
index 74e1fd33c6e5..a9087e956f94 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -211,8 +211,8 @@ drm_public int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr)
 
         bo->offset = args.offset;
 
-        bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                       drm->fd, bo->offset);
+        bo->map = drm_mmap(NULL, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+                           drm->fd, bo->offset);
         if (bo->map == MAP_FAILED) {
             bo->map = NULL;
             return -errno;
-- 
2.35.1


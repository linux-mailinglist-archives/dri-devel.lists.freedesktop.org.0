Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABCD3F999E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE536E93B;
	Fri, 27 Aug 2021 13:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B85D6E93B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 13:23:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x6so2167473wrv.13
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FBdsYqHeqx6lb5nLRyVgCyGnQTI8xvcildAZAC0FEaE=;
 b=O81AqUuTZoeZzFSsgdCr0JShVJGZWZQdXULiy2Qe6hkBFinQ3qwYQPAb+76kz70Eob
 iWplycCT7d6Jm9EduxIAGDrCzfdhL5tFbsiAuhLaHGUuhkUUd1nGAuhoRO/wgLWWWnqc
 59m+X0nybTywT1bS4aLTkt0j7YbUTyzj31+ENC+/L+3m5E8QYXCzJDaKi3wqO89XaHVf
 i3HjqBhaLOG0r4HIqLryNPH7mtQcLl++HEsJ/Vivwl0oiIUmHlko75s7tirpcNIVLtkk
 mQ83e6/osegiUn8jeLh2IQp3SGC5L9axB+iq+M7N7WJxXZQWXk26lRlIzNupOdjftbAD
 LfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FBdsYqHeqx6lb5nLRyVgCyGnQTI8xvcildAZAC0FEaE=;
 b=sKIU15RWkrygjNvA2N3HluVJD9tIcSWO3y+HUztjvacLjtwiAQ/iuX3JHyTEz/Y1wM
 iU4Ulre/x4Wfsbb7RFxHeYo4rtrWQwbbWE5noaRTiL7SMehxBOpTNiTYii90LX16qvG1
 HB5/t3uH2hEno9EqcfJDksKIwlgbjdHeWUBx0j1x6Yy7aLFfNNVEJFwhnnwpb9cSKbY5
 F2xDoUAxHGOLGMXUVCJ7Lcd15992VYG2191nNV/Wzv6JTIPvP1e0ryK3qTVuCKPMGhpG
 l1dN6mY7DpbZ4abeEptIhPFk/3exvHCh9UlwdlnhfhmTCNq3WuosONAezbHKHppY8ITJ
 Vqdg==
X-Gm-Message-State: AOAM53320SUhvzzHsM+DhajgyPDC1p1eOebyn5ZRpHo56HmsaA5Kcuyt
 i0EnCZgRbc2q3YMcY4I/sqs=
X-Google-Smtp-Source: ABdhPJzxv6Bj55wCSWTpVkwuk38XzehXa9nn2snemNLVc2gKQiRBtONNITad+Hj2lq3qCehFx/z+yg==
X-Received: by 2002:adf:9ccc:: with SMTP id h12mr10180484wre.385.1630070599204; 
 Fri, 27 Aug 2021 06:23:19 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id y24sm2425114wma.9.2021.08.27.06.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:23:18 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 04/25] tegra: Fix mmap() of GEM buffer objects
Date: Fri, 27 Aug 2021 15:22:44 +0200
Message-Id: <20210827132305.3572077-5-thierry.reding@gmail.com>
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
index bf8e5c9213ca..5225ad052fb3 100644
--- a/tegra/tegra.c
+++ b/tegra/tegra.c
@@ -215,8 +215,8 @@ drm_public int drm_tegra_bo_map(struct drm_tegra_bo *bo, void **ptr)
 
         bo->offset = args.offset;
 
-        bo->map = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
-                       drm->fd, bo->offset);
+        bo->map = drm_mmap(NULL, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+                           drm->fd, bo->offset);
         if (bo->map == MAP_FAILED) {
             bo->map = NULL;
             return -errno;
-- 
2.32.0


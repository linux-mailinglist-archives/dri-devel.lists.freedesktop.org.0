Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2A93CAF45
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951756E8C1;
	Thu, 15 Jul 2021 22:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199A86E8BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:15 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 me13-20020a17090b17cdb0290173bac8b9c9so7575032pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WciUpITvEcHMdrnkAxX4EGa72kGWHk1hAVU4U/kERfQ=;
 b=bAAD2MAvv4do4lfSoOsyQp0dNCGz2SxmzldW3v2FLw0MjnDkf+hvIzT6+rqcrAxA2o
 qPqP83F2fgffxdpYeUFW/yMyMditQ+V6pYhszovcXeOB+C1uq6qv+aRm53H6PMmkWwLG
 kJ4ZsYPhQx53jUmf9f3X5nmz8BLA4NgDszaXEzsk5kesTDFNwm2S6m793gFUJs8TYSXp
 Rrm+scyRIrggf26+w/t/y/FqtFqRojXP/zx+dXQpvbrhR2DZ0roWnYbneLXMmYMuH+eA
 /FnaPve6pwK2L8xv5wmMdb7XLliOfJlNwB1dJ68svgfk6O7e77MM0uxvLklF+mWC6rFZ
 Tsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WciUpITvEcHMdrnkAxX4EGa72kGWHk1hAVU4U/kERfQ=;
 b=gCDayokhxLkxGoGmUEq11ldGpznALswWhBcPxFh+rt4AFIgjJtqktN+JPVKtJPYmtC
 UE7xjJRKcjxVRIUzZvzYHHybqRCmK6hpobZ68d6/IV1K2moRasG+vvqnieXhIGLy32IA
 xXk4G7NSHYhDpQYnxKJ/q0EXjVecGEhSMyvLF+1zNZrmwd61VZFjERlm7c3rqvkb1eef
 7UNvy77KF5eTAkoe6aGhBPrG8PVc45OOGzOHgZEXBru6XaGzisaF3T/UnUNWsaMCWf/V
 j7p2dO5f59yCzOJaHmJuBQGtxD83aXk9dWjVwLMMl5DSd6QcgSFeuoK5v0KF/H+/mu6a
 d+ug==
X-Gm-Message-State: AOAM53187aTLgAR+QMOcGoaMJKELctnU8vDVdUaahqg2rAimFnxabVbg
 /A+B6KBgRWZxr5Sa+4n5PF+SO4MA1VAdjg==
X-Google-Smtp-Source: ABdhPJwln5alaY0SRCNgr7HQimiY6NvglQIPRqZMtXsuuUDJPZS7T/NL9JrFSbr7WddJjrbPrkk8/Q==
X-Received: by 2002:a17:90b:4b4e:: with SMTP id
 mi14mr12504357pjb.109.1626388754644; 
 Thu, 15 Jul 2021 15:39:14 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:14 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915/gem/ttm: Place new BOs in the requested region
Date: Thu, 15 Jul 2021 17:38:57 -0500
Message-Id: <20210715223900.1840576-5-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210715223900.1840576-1-jason@jlekstrand.net>
References: <20210715223900.1840576-1-jason@jlekstrand.net>
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
 Matthew Auld <matthew.auld@intel.com>, Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__i915_gem_ttm_object_init() was ignoring the placement requests coming
from the client and always placing all BOs in SMEM upon creation.
Instead, compute the requested placement set from the object and pass
that into ttm_bo_init_reserved().

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 6589411396d3f..d30f274c329c7 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -898,6 +898,8 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 {
 	static struct lock_class_key lock_class;
 	struct drm_i915_private *i915 = mem->i915;
+	struct ttm_place requested, busy[I915_TTM_MAX_PLACEMENTS];
+	struct ttm_placement placement;
 	struct ttm_operation_ctx ctx = {
 		.interruptible = true,
 		.no_wait_gpu = false,
@@ -919,6 +921,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	/* Forcing the page size is kernel internal only */
 	GEM_BUG_ON(page_size && obj->mm.n_placements);
 
+	GEM_BUG_ON(obj->mm.n_placements > I915_TTM_MAX_PLACEMENTS);
+	i915_ttm_placement_from_obj(obj, &requested, busy, &placement);
+
 	/*
 	 * If this function fails, it will call the destructor, but
 	 * our caller still owns the object. So no freeing in the
@@ -927,8 +932,7 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 * until successful initialization.
 	 */
 	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), size,
-				   bo_type, &i915_sys_placement,
-				   page_size >> PAGE_SHIFT,
+				   bo_type, &placement, page_size >> PAGE_SHIFT,
 				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
 	if (ret)
 		return i915_ttm_err_to_gem(ret);
-- 
2.31.1


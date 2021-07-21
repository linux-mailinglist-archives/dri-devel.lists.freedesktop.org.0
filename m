Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC193D17B4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 22:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12476ECD2;
	Wed, 21 Jul 2021 20:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C496ECCA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 20:13:59 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id p9so2601390pjl.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 13:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTmGrBRXJMe7CPNaTxwy1Nwy1BT+KOCQBu00fQa54Uk=;
 b=SzQf12JG8bZd7aS7Gmfa+aOgjoTxtRP7OPfRmQb9cB+tSAYOD3LiwI4cuv1ORYf302
 AdwKhm55wlfUDadUbXx/HeTrpOzAsF8tIR42HSKN9Rr7xIkacb9MvRpjGgWdYVDII+rM
 Dy+KiigAOUEBb8VlYD0b/T5lzhQw5kfsKRyguy7eByutvSR0ae3KdkMnzj9R8U6T1P8g
 MbB118nS/Z9UBnvo/N4rVffWfSxI29hJOUDBM7Gp+YJiAJkihnXsXbmMOH3hbPLLira9
 tCs3cVqRcOXDPRpvYXFjtB7gOAhvPkrD6gnsz4edS0XJJZU3+h0piLDSHJr5+UB/npfT
 0qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTmGrBRXJMe7CPNaTxwy1Nwy1BT+KOCQBu00fQa54Uk=;
 b=haYdly8K+nOJbwE290x1gWJSF3rswEL+rlM7gzNBc+RrH1J015ySoVwtHJfFkqeeQo
 nORrQiFZvOHtjkfLrFNh1qd/+Ne9Y+wPfqDQrg0wWllg1tno56J08UO5OX+q/phuvLaw
 hVbu0Cu/6lN4mNGfTuNFemt+IREpr7TeiPURr15oDogrYWk83niom5f5pJ317wEE9ybN
 5YjWDKhaecxPd3/g3xoXawHkVtlcBGL2En/yJ6e2s8nCxLd487z7sUn3GHhp8ybYDk+K
 vF5WRCxCEXQkY7DSzrMbQofQMY/60vEsePn54yUzyPYhEby17nyWky/cQK+nQtfc/l1q
 SIuw==
X-Gm-Message-State: AOAM532AKSi5bAjVs46gCn/w8C9eBf28ZImX41GKZWrubmXs7IQCjr3l
 Z16zAYze1ZI/9Adg4j+s863lCQ==
X-Google-Smtp-Source: ABdhPJw578K55cD454yYnoPEhzvZ5gnhVVkNqGBJ8ZheH7ht1dlt8MwNrna2cJcH62Cup+6mrCDyjw==
X-Received: by 2002:a63:6f8c:: with SMTP id k134mr38361964pgc.35.1626898439257; 
 Wed, 21 Jul 2021 13:13:59 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id h24sm28777439pfn.180.2021.07.21.13.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:13:57 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
Date: Wed, 21 Jul 2021 15:13:41 -0500
Message-Id: <20210721201343.2962674-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721201343.2962674-1-jason@jlekstrand.net>
References: <20210721201343.2962674-1-jason@jlekstrand.net>
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

Whenever we had a user object (n_placements > 0), we were ignoring
obj->mm.region and always putting obj->placements[0] as the requested
region.  For LMEM+SMEM objects, this was causing them to get shoved into
LMEM on every i915_ttm_get_pages() even when SMEM was requested by, say,
i915_gem_object_migrate().

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f253b11e9e367..b76bdd978a5cc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -150,8 +150,7 @@ i915_ttm_placement_from_obj(const struct drm_i915_gem_object *obj,
 	unsigned int i;
 
 	placement->num_placement = 1;
-	i915_ttm_place_from_region(num_allowed ? obj->mm.placements[0] :
-				   obj->mm.region, requested, flags);
+	i915_ttm_place_from_region(obj->mm.region, requested, flags);
 
 	/* Cache this on object? */
 	placement->num_busy_placement = num_allowed;
-- 
2.31.1


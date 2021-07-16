Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DB3CB898
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED996E9AD;
	Fri, 16 Jul 2021 14:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8456E9A9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:14:34 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id t143so11017896oie.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uJYyLhrHNY/60pPyCUIHdFgQDTsIyjquSlitH2b2X4g=;
 b=uNPPgiWdkNhmlqSoA5QOCBUeOBKa4ZDMKBKWhgypcjpHFfv+09hvaraLDgJM3HWnqY
 +5cv7pX5nyo+FVW3khtilH1KHvTwurhmE/dsufBbgBO9OdCptT94NT0J/vsa+XtPaO8D
 6lntwsRCK9zYuAG68uTLxsbIkNPOh8i4lyPFRdOac6n0+MpsfXWRLuQHnq9qQNDHrAzH
 qNJgAekMMadKmnOv1xzJpm+0r5oaM0x9MpPXIg4NUv9In6VQvxCpN8MU4SpMJh5/Jse8
 1vMwUH4BVYaocTNbBPl4C7d5M3uVNn2/USRY6Z9N7P5oHu8fLlnHTaWzCe73KAXsLuJq
 CxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uJYyLhrHNY/60pPyCUIHdFgQDTsIyjquSlitH2b2X4g=;
 b=RcK81P2jOLH5ToqUpqU3ds6Y4NeppKE8NHd6UiD6mVjynLRCIm80ID4szBQ5V5qRtP
 BaFxK9iR4WFqlVVAt/VKB3sESRp1rbdh3wYFnLPSuq0xLk0k/03JWYe0HxGwQVy6FYIx
 i0lYuIzh3KIjFew5gsH7YA2muXTryIhfuPNHJ56Jh6WiJYBVoDbPnfOPu5ajFNU/xNn9
 BTaOl26ET+LSTKpLlGpH6BHH0Ldneu3oFat/1v/jxjWAV68yL7Y+IBJuFQG6wwBW6VVY
 +le/bdIOvb2fs00P0pyOY3JPD5/L8Ehoai0hmZHWBnjOf1iXKFb7zdqTnVCNY/rSZSNU
 v+BQ==
X-Gm-Message-State: AOAM531KuJm6GaOV2Yqph0aahL3O+wyYoFEejnN4SsaWljB/7k2KgsGG
 22xgTtgHX5yaCZ2rl4aDEDQkRQ==
X-Google-Smtp-Source: ABdhPJyRS0w8dBnqCNmhjnA6w35YTKQcxxb52q7DNgU05voYfF/TrkHZ66VRvdn32tVG88Ebro4ARQ==
X-Received: by 2002:aca:6203:: with SMTP id w3mr8414305oib.64.1626444874098;
 Fri, 16 Jul 2021 07:14:34 -0700 (PDT)
Received: from omlet.lan ([68.203.99.148])
 by smtp.gmail.com with ESMTPSA id v42sm1852266ott.70.2021.07.16.07.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 07:14:33 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
Date: Fri, 16 Jul 2021 09:14:24 -0500
Message-Id: <20210716141426.1904528-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210716141426.1904528-1-jason@jlekstrand.net>
References: <20210716141426.1904528-1-jason@jlekstrand.net>
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
index 6589411396d3f..8eeb73c7c401c 100644
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


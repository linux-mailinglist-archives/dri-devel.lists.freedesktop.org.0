Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AAA3CAF44
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 00:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D906E8BE;
	Thu, 15 Jul 2021 22:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05D606E8BE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 22:39:17 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id p22so6995479pfh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 15:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8pTOymRDqWskKnKmtLphb8tat5i85/mb3yEa5IkiVBc=;
 b=MWtlj8+O5xBkZ9mHU7RLV54ZZJ7p51SLZ7x18vbvixWheF2KXR0D4dLpDphMy3P/JN
 SiDgc7yuizXGzsyuiis75qRnFL6RLj9bPVB8vDN2hKGACqDMPbgEpZp/QHzSRvmMUbBC
 dNhi2gE6jcTdIQdt4LImKt+DqaypAfBgwyotLGK7ecTHW5/bexuYyG17inNueE3JR74G
 rs4NBTZnjEffIDX5rdLLmzbUffOCUziXPPqpegDVet4JP8x5Uqojli4z/7ANean+gW83
 3GpObVRqLN4n9jX0snZvInxZ4+NfUV/E6ESshUjQFkZ1YwRhEHp+5FB31PxCEmKN34Gq
 toTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8pTOymRDqWskKnKmtLphb8tat5i85/mb3yEa5IkiVBc=;
 b=UV96oxYdAfmeV76VH108Z9CumGiwLOJkUOZ6zH7Ea4lrPjN9NoYgdxYwpfce6HHEcx
 5dHdBenPMXOgYIyB+FTRojxV3Mf3rNTJoV1tIkVhPhgXtfM5ryKYwNzRYArpHxT5GdbB
 1pboprJeS57b0+PV+sVzI1bQ0QLhkXIROFa4ntAip1O9RKc+ln9l5I03wc+cVa06ICkx
 +35fZ4OG9crBWkC5wphNcT4Q3jmjpLnxrn0cShyDCaFF7IC0Bs9kBLRE+QMWhFu6zAdJ
 +OfD4Ax6uOfQq7YZcYKmV6PBvMQfWu86kWIfduXHFkF3NhwusvhQ9MwQF6VcC78Iyrhr
 it/g==
X-Gm-Message-State: AOAM533fGntXKP4ahhtbcmVBvMHYz09gCkQ//DxeNCQKGuLXwrgWwSgs
 VX4AdNhCTylTBuIs98QXnHESaQ==
X-Google-Smtp-Source: ABdhPJyj9IH5gQGCAb5nrGiMdhg576lPjnEyY0Qh9FnZqwvuCU7aUd1ZO2OrdSqt7GiDyl0GxB1lNg==
X-Received: by 2002:aa7:8d5a:0:b029:302:e2cb:6d79 with SMTP id
 s26-20020aa78d5a0000b0290302e2cb6d79mr6845687pfe.71.1626388756586; 
 Thu, 15 Jul 2021 15:39:16 -0700 (PDT)
Received: from omlet.com ([134.134.137.87])
 by smtp.gmail.com with ESMTPSA id ft7sm9959459pjb.32.2021.07.15.15.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 15:39:16 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/i915/gem/ttm: Respect the objection region in
 placement_from_obj
Date: Thu, 15 Jul 2021 17:38:58 -0500
Message-Id: <20210715223900.1840576-6-jason@jlekstrand.net>
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
index d30f274c329c7..5985e994d56cf 100644
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


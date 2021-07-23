Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D823D3E7F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 19:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519E36FA75;
	Fri, 23 Jul 2021 17:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1235C6F934
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 17:21:53 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so9866067pja.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vnyXfJPaqObrTjcEXN3XMXwAr7gDjoT2KPwNtmx5Ul0=;
 b=tfEI32cTF7kZ7PCuha3UjHM+ffnmVfTePRNQgxgBmb3zzwl9XFOTJIIOBDYU6tc4Tn
 WDhBm8iWvkMvwLlIIpez9lT6X/okKtuH4HxJepG8Mq+veLlMe0WWhZZ0ihBOHbl8T5hl
 OHH+dzeh7vO/Y+4eRel1qlVQgfs4mtFdr2HgzZpNObO3RMnEsfePXhG4sxHD8EXYrbai
 fYEviJXyg6eUwb308PQ2SvUUSg5tujt2B728EmkhaVXkVbi7VH0Kht7nhz7NmeXwY/Dc
 nSomfIzYK7KgmtYAaWEybnWP6GtWOy7vjMrG29mTe08WIdLe2BTzDYP3Evd7+U/o71Z7
 w9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vnyXfJPaqObrTjcEXN3XMXwAr7gDjoT2KPwNtmx5Ul0=;
 b=TY+ZronNHD6w+wg46tgyy6QVEO5Bkf+79aBDobSCKGIlvYD2ZGTRrOmEJkuicBJ76E
 W0X5CMr23+oUzO84MqZPXZRgHP3O5nTupLJpROVDS5FHCgNBemDufBnjtvrBj+34BuvS
 70H2jPOIEeCu0TmM7vYk0UrRiy6/7ek8oqENMVDLnuLcqTmGVAqhSwZc1++jpJoURQuQ
 5jGSw2JxNeK91JyZYsVGYjUMh83TGVPg/e+VlWRJu+EGwcJ3UX6fLXUp1cLFd+/MOvdl
 IYuLuu9SZakc7cJSfn2LXI8xjkaWYNt0lE4ORLlp1cgiVRI3A+qx1fGfs5UcQ9TfN4uA
 KvMw==
X-Gm-Message-State: AOAM532UEz4UACu0Pi55uZZtpxsDT8D7zmcgPOcPWWhRXIHtaCzc9xOO
 RGvtJbnvSi6XNEVDqcAUMTOkmA==
X-Google-Smtp-Source: ABdhPJyx6zNH4bca/r8Cj8ZnV4iZ2FsLSS+Z3k69IujAXPjzU+7r+5iB9Up5psTk0dIbUQHS3kKaWA==
X-Received: by 2002:a17:90a:7d02:: with SMTP id
 g2mr5372871pjl.168.1627060912634; 
 Fri, 23 Jul 2021 10:21:52 -0700 (PDT)
Received: from omlet.lan ([134.134.137.86])
 by smtp.gmail.com with ESMTPSA id s36sm24288648pgl.8.2021.07.23.10.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:21:52 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 5/8] drm/i915/gem/ttm: Only call __i915_gem_object_set_pages
 if needed
Date: Fri, 23 Jul 2021 12:21:39 -0500
Message-Id: <20210723172142.3273510-6-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723172142.3273510-1-jason@jlekstrand.net>
References: <20210723172142.3273510-1-jason@jlekstrand.net>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

__i915_ttm_get_pages does two things.  First, it calls ttm_bo_validate()
to check the given placement and migrate the BO if needed.  Then, it
updates the GEM object to match, in case the object was migrated.  If
no migration occured, however, we might still have pages on the GEM
object in which case we don't need to fetch them from TTM and call
__i915_gem_object_set_pages.  This hasn't been a problem before because
the primary user of __i915_ttm_get_pages is __i915_gem_object_get_pages
which only calls it if the GEM object doesn't have pages.

However, i915_ttm_migrate also uses __i915_ttm_get_pages to do the
migration so this meant it was unsafe to call on an already populated
object.  This patch checks i915_gem_object_has_pages() before trying to
__i915_gem_object_set_pages so i915_ttm_migrate is safe to call, even on
populated objects.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f253b11e9e367..771eb2963123f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -662,13 +662,14 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
 		i915_ttm_adjust_gem_after_move(obj);
 	}
 
-	GEM_WARN_ON(obj->mm.pages);
-	/* Object either has a page vector or is an iomem object */
-	st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
-	if (IS_ERR(st))
-		return PTR_ERR(st);
+	if (!i915_gem_object_has_pages(obj)) {
+		/* Object either has a page vector or is an iomem object */
+		st = bo->ttm ? i915_ttm_tt_get_st(bo->ttm) : obj->ttm.cached_io_st;
+		if (IS_ERR(st))
+			return PTR_ERR(st);
 
-	__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
+		__i915_gem_object_set_pages(obj, st, i915_sg_dma_sizes(st->sgl));
+	}
 
 	return ret;
 }
-- 
2.31.1


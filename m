Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FAD5718D0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 13:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8922B891;
	Tue, 12 Jul 2022 11:46:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C94F2B891;
 Tue, 12 Jul 2022 11:46:08 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sz17so13808492ejc.9;
 Tue, 12 Jul 2022 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yXgt6F3apBhQ9ExwIi1N6Ag6ML0IpJudVsjkA/ZOG8=;
 b=F8UpU6+stuqa7hlN5K0YIi72RAySc4fS61qdG5MaMcqtIAwKkzAg4CKfvqrCfIzYRL
 yD0TeVbPNzypbiLG9nyqqdres6WLheDTiTdt6TGQAOxwU8ySNUqHN36rEvMpgk417k7q
 wGIU9qUZIqrgxCZzaD8gaB+bqQ/BY63eLvyzKRluUQYYAUe0uqleCtLzchWMURfpQ3RF
 HMA0u7z4R8K+rXEJYD2Wh5g/0TbgXtBuj1aKrCedyjlryJnzilJVQmnLwAhF8J/sylFV
 /rncZQihhCWSH9fAXNnWBkQv/NPTL41IBXPELRw3ODTe9buwPQ6dNr1sov+NSmZ3joQi
 L33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6yXgt6F3apBhQ9ExwIi1N6Ag6ML0IpJudVsjkA/ZOG8=;
 b=hSOhwNygx3xCAqbc9Or11qChYmYIcKygKiSDbsbuVmvG3umnZF4WSw+y+vCmxDSHWf
 9QHNs+u+BBgFKRJExhJjxQ6ztSfhBdPcKWqU4uT/uw6BN79av7uTojU9xcMXfR8Y8bYF
 Jp/poTOo/OCKXdmagBwct0KV3EoenzA3ayHEpOkXSFYK72gBoTPsRM7qj6CcPibQXuFr
 ROSLYjOw72aHBjDDM8ym4vFkcm5CPHWQgCLZ6iaprJiQjB4AE/8czu4PoqkvMizltfxj
 b3VM8iE7u0AsNYuwHA1vJ3JZdBKOZSelo6P97dGLMt7vi4l+nla8TcmLSbMNkwGcvdaY
 wwtg==
X-Gm-Message-State: AJIora/rBnVSNxlisgaq3BFi/5MlDBH3641fEzIumeLaizsdDvkv8h75
 WcOOoecAN3gBOX9KuNcLK601+FR/TZM=
X-Google-Smtp-Source: AGRyM1vg6Vv7fRReUS0cYlZg8aEPYftvKuD8B1jAJEfMGoYHQM3Y8e6d+aC4iniEq31Y/AANgb5kWw==
X-Received: by 2002:a17:907:2722:b0:72b:735a:d3b4 with SMTP id
 d2-20020a170907272200b0072b735ad3b4mr5083978ejl.363.1657626367169; 
 Tue, 12 Jul 2022 04:46:07 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906494a00b006fe9f9d0938sm3767200ejt.175.2022.07.12.04.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 04:46:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: audit bo->resource usage
Date: Tue, 12 Jul 2022 13:46:03 +0200
Message-Id: <20220712114605.52369-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure we can at least move and alloc TT objects without backing store.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 70e2ed4e99df..5449738c262f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -289,8 +289,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
-	struct ttm_resource_manager *man =
-		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	unsigned long ccs_pages = 0;
 	enum ttm_caching caching;
@@ -304,8 +302,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!i915_tt)
 		return NULL;
 
-	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
-	    man->use_tt)
+	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
+	    ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index a10716f4e717..dcb838dffd7b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -490,7 +490,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	bool clear;
 	int ret;
 
-	if (GEM_WARN_ON(!obj)) {
+	if (!bo->resource || GEM_WARN_ON(!obj)) {
 		ttm_bo_move_null(bo, dst_mem);
 		return 0;
 	}
-- 
2.25.1


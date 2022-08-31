Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947FB5A7A49
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 11:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6874910E2B4;
	Wed, 31 Aug 2022 09:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3492A10E2B4;
 Wed, 31 Aug 2022 09:34:32 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qh18so6908136ejb.7;
 Wed, 31 Aug 2022 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=j9NYpONVCYEnfzxzBKtYaOJ5hkA5r7Om/u6+8tt8uBg=;
 b=kHOSUm6rhjlfZ9F6R6gkEVdPVcHDpn6Oy2+4bu39Izd6OpDi+M937vo2bva325GTAu
 ulsW4NxCn5hqxH6XS7qf8EOR+q0nvN5G4O6Xpl/XNyvkW7KBSbKYL88Ed9TbQ+CXKtrz
 PWdxiv0kMAzJfRXst6iDAzEg63g6k1wiWMV84CXHXKfXyKB2W2+3pwl7aECERTgMXMRZ
 hp+mo2jT7W1+OjoaaLe9I/CvjN1XTCyuOnZJDYXr6OUJDMxJ8drTl7Gy76PmlP3ZvgbX
 8Uuj/rSsz2RaxnTVuZPZJgX913AkfvXiXyL94Q+tUrVXPSLRorHUs1fh1CFKqH9cyz/5
 TvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=j9NYpONVCYEnfzxzBKtYaOJ5hkA5r7Om/u6+8tt8uBg=;
 b=gPZrkLamzoumxjAThLwkOHhtL2u8XxgV5bI4iEqiS8Jiz6EHb8loneNFbNbZxL5t88
 q8mewpiIsvmKWRWL6N8v58TuEkclcIo2A9q83slrXd206JCvq/xSPSQwzceyySgYoV4k
 5t2nnui2FA4a5u3GBRLLqQ16DqNQFTiNik/p18ITDnFPbasEjoIXVB3SYM6aJy/e5BSF
 FdoH4ajBYASzHtTtemA0THzkfeoSvSHZvlwTRjvLSGaWbyxpbrJ4g5PHe6x/G1fsxrwJ
 mTxuASwjRBi2eUSscz4VzIqU+Wi03QZjRfHDBLb7Rkue4w3LXPQ0dAnkHVkvTsbDejmP
 s0JA==
X-Gm-Message-State: ACgBeo0Qn7snLgLFREabxMtmS6xE27QvzFNctjWvInfBSOKr5ygNH38w
 klOH+obO/xr0IA9/pVhdv6HV1x41A7c=
X-Google-Smtp-Source: AA6agR6/2JgtZGJIHrVX452QeSEukQ7OCE6UY7WA2bOkGrBTBpgeG3VNmdWNPe/Q8q4CfjNOLnTG1A==
X-Received: by 2002:a17:907:96a5:b0:73d:d16c:60ac with SMTP id
 hd37-20020a17090796a500b0073dd16c60acmr19312462ejc.707.1661938470758; 
 Wed, 31 Aug 2022 02:34:30 -0700 (PDT)
Received: from able.fritz.box (p4fc20ad4.dip0.t-ipconnect.de. [79.194.10.212])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056402400500b004466f5375a5sm5608983eda.53.2022.08.31.02.34.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 02:34:29 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915: audit bo->resource usage v2
Date: Wed, 31 Aug 2022 11:34:26 +0200
Message-Id: <20220831093428.1397-1-christian.koenig@amd.com>
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

v2: clear the tt object even when no resource is allocated.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
 drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index bc9c432edffe..a81063e5aa93 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 {
 	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
 						     bdev);
-	struct ttm_resource_manager *man =
-		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
 	unsigned long ccs_pages = 0;
 	enum ttm_caching caching;
@@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!i915_tt)
 		return NULL;
 
-	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
-	    man->use_tt)
+	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && (!bo->resource ||
+	    ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt))
 		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
 
 	caching = i915_ttm_select_tt_caching(obj);
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
index 9a7e50534b84..c420d1ab605b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
@@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
 	bool clear;
 	int ret;
 
-	if (GEM_WARN_ON(!obj)) {
+	if (GEM_WARN_ON(!obj) || !bo->resource) {
 		ttm_bo_move_null(bo, dst_mem);
 		return 0;
 	}
-- 
2.25.1


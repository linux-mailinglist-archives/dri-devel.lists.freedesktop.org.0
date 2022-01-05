Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBC485534
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 16:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200D910FAF6;
	Wed,  5 Jan 2022 15:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C0410FAF4;
 Wed,  5 Jan 2022 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641394814; x=1672930814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FjouCVZXNKnIEryMdcxAdnjx4vGjZikfT2KUZrNzTiY=;
 b=Y0oztG4lRh8Mpbq3a3efcA3xZN/lnsbozy90N79SfL8DdPw0vg6l8Mqa
 0+cvXt7PpDZOYva+Fo/QWmuBRgK0yhzLsRI323RQt/B8QZaA39IZ71cwi
 8/lrxwjqnXpsdnQK0py101vGZBDAZ+pEs5dIeKVA1gT2ULZ330oGtxTSM
 w2nQvkza16jJATQDbEY5/qN3L+37+KhytOniRnvdxQa0xhL2scr0XHiLb
 QrTHjtuPIKdApHwVO9IJqxv7pDNok8CEx66OVOYyvDFgZEwJXcMUVeRgb
 OmeNINzoUh7oOWsC3g+JH/Yni523l9iucCHQ5nKywM8ebfRCS8PrbeuAT Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="239999797"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="239999797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; d="scan'208";a="512979194"
Received: from unknown (HELO mwauld-desk1.intel.com) ([10.252.26.67])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:00:13 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/ttm: ensure we unmap when shrinking
Date: Wed,  5 Jan 2022 14:58:35 +0000
Message-Id: <20220105145835.142950-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220105145835.142950-1-matthew.auld@intel.com>
References: <20220105145835.142950-1-matthew.auld@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Assuming we don't purge the pages, but instead swap them out then we
need to ensure we also unmap the object.

Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index f148e7e48f86..adbbd57bb9bf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -462,6 +462,8 @@ static int i915_ttm_shrinker_release_pages(struct drm_i915_gem_object *obj,
 	if (bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED)
 		return 0;
 
+	ttm_bo_unmap_virtual(bo);
+
 	bo->ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
 	ret = ttm_bo_validate(bo, &place, &ctx);
 	if (ret) {
-- 
2.31.1


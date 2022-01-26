Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 468E649CE04
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964DE10E935;
	Wed, 26 Jan 2022 15:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD7010E91C;
 Wed, 26 Jan 2022 15:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210539; x=1674746539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JosQW5sZZo+cHTkEC1v/TLyRTmevFF4zgip28ij6imo=;
 b=lnSYlpAGtHdRYv8BmrxiFifwUuWRN+azq/63lixNcHebZUBMYTXFshRX
 5mhGkK+28RSZAareafrkxHVZ4+mz+WI4Z+VxOEZzs7QuUSOcRzSYFtKJ8
 b0XjiE5S0+sYIvHy7J75ucODvbEFOKFbqzGEh7lRB+/18NzChZo3aZwHO
 m14mc7lefEyjlRi5+f9yR/IEMTS6vJ13jz53CbnAuLHIPQkpCAhwmZmMg
 cLuQl8yn+EyRcARbKqVautz6FSzTP+sjY0v9rWOc4geyPHuD27YcH5xef
 45fk75WP4Ov1hFTg/XMTbox1IGPiUJ8ncEfoxePFN5rn8iQ1CuDLTBqJk w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885243"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885243"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386279"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/20] drm/i915/ttm: tweak priority hint selection
Date: Wed, 26 Jan 2022 15:21:46 +0000
Message-Id: <20220126152155.3070602-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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

For some reason we are selecting PRIO_HAS_PAGES when we don't have
mm.pages, and vice versa. Perhaps something else is going on here.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index e60b677ecd54..e4cd6ccf5ab1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -848,11 +848,9 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
 	} else if (obj->mm.madv != I915_MADV_WILLNEED) {
 		bo->priority = I915_TTM_PRIO_PURGE;
 	} else if (!i915_gem_object_has_pages(obj)) {
-		if (bo->priority < I915_TTM_PRIO_HAS_PAGES)
-			bo->priority = I915_TTM_PRIO_HAS_PAGES;
+		bo->priority = I915_TTM_PRIO_NO_PAGES;
 	} else {
-		if (bo->priority > I915_TTM_PRIO_NO_PAGES)
-			bo->priority = I915_TTM_PRIO_NO_PAGES;
+		bo->priority = I915_TTM_PRIO_HAS_PAGES;
 	}
 
 	ttm_bo_move_to_lru_tail(bo, bo->resource, NULL);
-- 
2.34.1


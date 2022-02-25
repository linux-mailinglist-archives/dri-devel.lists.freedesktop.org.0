Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722304C4816
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA67E10E49B;
	Fri, 25 Feb 2022 14:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32C310E378;
 Fri, 25 Feb 2022 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645800977; x=1677336977;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hioo3YnYUtDwOYo/Nu9K5yTBpF0/WollsjmzajFhbm4=;
 b=WBUM0Gbzfe+pIu5jDpeN1HAuFOoZuHuZUE1ahZJM+LdAf4GCmV9fjWbB
 enEuGCXhsnqNkX5wCWwkUiN/citNnz8wR/c0FJwMRfE/XlqCPUx3RSi6R
 Scz+7O01sjPM1lKv2Kaj8+Tp+Q0MY16rZXZaWSEa5MmX2E5rZ2TvNvAl0
 7/7kFL3/gBJhFx9VYs6ilr1nDMUoxW7qMiXGCyjkuOSbpY7rG1qWXpgje
 Wkj7g/AfYK6ylH2aLMOq3iCCsEmmSJ4BewJp/xg3YYV273lb/c7NaQPYh
 P/jxSEx0zkhY/lxw4qBpw7oB5FQx3+URtmAfwOeMwcB5o2Q0J1qCmgGTw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252237239"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252237239"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="707882140"
Received: from phelanmi-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.25.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 06:56:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [CI 5/7] drm/i915/buddy: adjust res->start
Date: Fri, 25 Feb 2022 14:55:00 +0000
Message-Id: <20220225145502.331818-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220225145502.331818-1-matthew.auld@intel.com>
References: <20220225145502.331818-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Differentiate between mappable vs non-mappable resources, also if this
is an actual range allocation ensure we set res->start as the starting
pfn. Later when we need to do non-mappable -> mappable moves then we
want TTM to see that the current placement is not compatible, which
should result in an actual move, instead of being turned into a noop.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index e47a3d46c6ff..0ac6b2463fd5 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -141,6 +141,13 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 		mutex_unlock(&bman->lock);
 	}
 
+	if (place->lpfn - place->fpfn == n_pages)
+		bman_res->base.start = place->fpfn;
+	else if (lpfn <= bman->visible_size)
+		bman_res->base.start = 0;
+	else
+		bman_res->base.start = bman->visible_size;
+
 	*res = &bman_res->base;
 	return 0;
 
-- 
2.34.1


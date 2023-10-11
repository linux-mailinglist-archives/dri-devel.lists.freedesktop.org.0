Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EB7C53FF
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 14:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91710E79B;
	Wed, 11 Oct 2023 12:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8810E79B;
 Wed, 11 Oct 2023 12:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027319; x=1728563319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+s/G1zQJT7/8qCmC5wN7UlGy4M8EwtHsEx/YO2Fapqs=;
 b=GhMhAZs9tQharEFZFDBT1jSyEi6E7t7Dm+9trEJCk2iQR7eUu07MD0e8
 STvD09uPbhnsHT310gmBCJ1kFriwQDAUC+BpLQzMh61TP+ZcYemOaI1kt
 Q7uofpcEOhJEN6x2Z/6wgd9+c0JGE085pTvJKnbtj9oADVnn4ksnZ6Gbr
 LvP+oK6sTQkms6ai/FtfJqq8z+5jldCV23VVCrrQKzJ0JPzbFk/gHJVgh
 sDy4KsoyTJTTYU0XM8XUP6JgAtT5YHiouugXL0nppczDX9Pl0vfvlV7OZ
 Ty2mOQ6sgbj2ofuERcaXKwO+A89Hxs78ei4LBDSDa2/5xIVbPAd9P3yun g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6207829"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="6207829"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="877643229"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="877643229"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:25:54 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2] drm/i915: Prevent potential null-ptr-deref in
 engine_init_common
Date: Wed, 11 Oct 2023 14:25:47 +0200
Message-ID: <20231011122547.7085-1-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If measure_breadcrumb_dw() returns an error and bce isn't created,
this commit ensures that intel_engine_destroy_pinned_context()
is not called with a NULL bce.

v2: Fix the subject s/UAF/null-ptr-deref(Jani)

Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 179d9546865b..4a11219e560e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -1491,7 +1491,8 @@ static int engine_init_common(struct intel_engine_cs *engine)
 	return 0;
 
 err_bce_context:
-	intel_engine_destroy_pinned_context(bce);
+	if (bce)
+		intel_engine_destroy_pinned_context(bce);
 err_ce_context:
 	intel_engine_destroy_pinned_context(ce);
 	return ret;
-- 
2.41.0


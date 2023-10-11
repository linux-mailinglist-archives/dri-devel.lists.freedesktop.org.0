Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 821487C5294
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 13:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E25F10E735;
	Wed, 11 Oct 2023 11:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A1B10E735;
 Wed, 11 Oct 2023 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697025304; x=1728561304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FUjbON0nHqKdjjCB26pERoZOe+DUNeh3qmcG3EqcCXo=;
 b=H+1IkC7qmSFItumRfCZGE8l8oNuOnsFZE1gk+ptE5B+BwkG5K2Fee5+M
 wuQJ8/NDM4F11n2I7gFzw/l2Gvteyt8Q6aAaxW0IGLCGZX2nieZxpcJFI
 VXPjruLyksr5mJsUjCTf8j8FGqPIsDfd9k4gCpkzvbx0yOcHgtx/0z0gc
 oSlpmOLCPxy8sqCs/akbRiQMOOgkRND9L+b1grD5t21/oqslNuBIAvrU/
 569H+Pslqg8PAGZcOjZqiO7oKywiFG8K57iUqXQ1jZidnLJBYFWsZW7Qd
 b/fdFP2lUFNZQc3Wyh03dwUdVkBqash7EmpWA45pJwh5N4z5DR23dTY5T w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="381886820"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="381886820"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:55:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="824129889"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; d="scan'208";a="824129889"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 04:55:02 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Prevent potential UAF in engine_init_common
Date: Wed, 11 Oct 2023 13:54:51 +0200
Message-ID: <20231011115451.12521-1-nirmoy.das@intel.com>
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

Fixes: b35274993680 ("drm/i915: Create a kernel context for GGTT updates")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
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


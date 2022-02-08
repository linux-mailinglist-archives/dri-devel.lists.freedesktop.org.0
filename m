Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3C4AD5B6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 11:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD72B10E748;
	Tue,  8 Feb 2022 10:45:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE7210E62A;
 Tue,  8 Feb 2022 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644317114; x=1675853114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T16OOxwdCqwL7Z3xlBj3NEYgC+0TJfc9kWo/L2s00wI=;
 b=nIVuIg9jP6/WTES9j0jTXMV6PHxFGLhdPowD1XoIO07RqgSDs6UISvLE
 iiKuk895EjxqpowULbez9XkAVloLnQuZqx477mZHv86aiNcohlyZnXLoc
 /0x3FmmgF/ynjFIdVV87UjoD6Eh0iMAm0ESlHC4WWTGOaSDHrarEsw+Z9
 j7yb5H6QHiKnUwXrakWhyKbXmXsC+gr5rQUnEijgLGOP7SKC7rhZQmx+b
 XCS/o+24tsMG8Xs74zKIjVv/tfpPWyA1ROnR3xvtLShAA3cveEJUzVKML
 xeT7RZzxd0QGRJN6KnVLsDKj7ALEJjQc0KngNx6Z3tEEy0E1PEIHXBDLU A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="246511557"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="246511557"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="700804139"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 02:45:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/18] drm/i915/guc: Replace check for golden context size
Date: Tue,  8 Feb 2022 02:45:17 -0800
Message-Id: <20220208104524.2516209-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220208104524.2516209-1-lucas.demarchi@intel.com>
References: <20220208104524.2516209-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the other places in this function, guc->ads_map is being protected
from access when it's not yet set. However the last check is actually
about guc->ads_golden_ctxt_size been set before.  These checks should
always match as the size is initialized on the first call to
guc_prep_golden_context(), but it's clearer if we have a single return
and check for guc->ads_golden_ctxt_size.

This is just a readability improvement, no change in behavior.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index 483a919328a9..63f305597214 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -461,10 +461,10 @@ static int guc_prep_golden_context(struct intel_guc *guc)
 		addr_ggtt += alloc_size;
 	}
 
-	if (iosys_map_is_null(&guc->ads_map))
-		return total_size;
+	/* Make sure current size matches what we calculated previously */
+	if (guc->ads_golden_ctxt_size)
+		GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 
-	GEM_BUG_ON(guc->ads_golden_ctxt_size != total_size);
 	return total_size;
 }
 
-- 
2.35.1


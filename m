Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A54B8F73
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C224310E8AA;
	Wed, 16 Feb 2022 17:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D784310E86F;
 Wed, 16 Feb 2022 17:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645033258; x=1676569258;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+mp2S9N8a53C+9Jc/ODAk1CYbpjGPXQeH+loGs78yD4=;
 b=EOKjzdgCqKjyPgR795og0tA6Lzvb9flvXUhLaA35f1vGku7f3AfZpsQQ
 EZu7prOyb040UEV4kDXAnB6JqJLhn7rZV+kDEP41JRzFQQ7r0xXNJCCN2
 r7yCNUeAaM78ONVVppKqrasPT5/2mYxbBkQuTbZ2gG75fhfj+MsxUHWUB
 Uiw2vHOqscGMTKdFhQEqo/lVC+wGadJ/ggDTdy1s01yHgZSQvixMsks4M
 s4pkR54Pj02qAU/CbtsY9dgwPOvqoyvJdwzBraXN4CVoTkmK/VU5/MUIH
 WNRovOWbWI5gW5kpgSNHf3YWzg6pBUdmE9OAKvVyeEs4HKb7e4MX2nUj5 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230641965"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="230641965"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="540226713"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 09:40:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/16] drm/i915/guc: Replace check for golden context size
Date: Wed, 16 Feb 2022 09:41:42 -0800
Message-Id: <20220216174147.3073235-12-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220216174147.3073235-1-lucas.demarchi@intel.com>
References: <20220216174147.3073235-1-lucas.demarchi@intel.com>
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
 Sumit Semwal <sumit.semwal@linaro.org>,
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
index 0077a63832ad..b739781bd133 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -500,10 +500,10 @@ static int guc_prep_golden_context(struct intel_guc *guc)
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


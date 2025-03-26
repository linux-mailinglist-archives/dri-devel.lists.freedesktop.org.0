Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C79A72724
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4091110E78E;
	Wed, 26 Mar 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g8TC6PUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9A010E78E;
 Wed, 26 Mar 2025 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032436; x=1774568436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2AIHpEEKnnHKbHbHSpBkIqoXJrvfxlWzMZC0AU2+S7I=;
 b=g8TC6PUJp1WVK32nrLbBjwHv0erMMq/SthkIkCp+ThxGlXjmPP83jTPo
 0csrcWsHXECNRBKpEgEkwjhgUYIZ7aajX2iutMq/Jk3GEi8kmGdWkaFrw
 LwqSIjjOkVKxpby1tpAntB13gesv87hRubrKhvhanufrLJgBwAVc80M33
 bbIY2KcZuIXKzV+k9ZSD+I3P1SgLA9FuduLlCTkiEnHzQaJXC05Y17TnO
 IycVrX/MjG+kjcAGc726JZOk1AKOTrRLSITYAXzoi2dBN4TaxhE+a/1Vr
 a3gNRmGSAtTL2m86lFuhkiXTtFFngclTJypQS4blSrweld6GZMfhQFR7a Q==;
X-CSE-ConnectionGUID: 1ZdxOO3dTbuwuceWZab/dA==
X-CSE-MsgGUID: 201Bvn06TOikaqJ1TFuJzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741396"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741396"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:36 -0700
X-CSE-ConnectionGUID: PXQ5QOKcT/yu7/YIZzmAuQ==
X-CSE-MsgGUID: /AUaDAo7S8uuORo/8wWo5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143298"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:33 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 3/6] drm/i915/gt: Remove FIRST_RENDER_COMPUTE in workaround
Date: Thu, 27 Mar 2025 00:40:02 +0100
Message-ID: <20250326234005.1574688-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andi Shyti <andi.shyti@intel.com>

All platforms supported by i915 have at least one RCS engine,
so there's no need to explicitly check for RCS or CCS presence.

Remove the redundant check and move the associated functions
to a more appropriate location in the code.

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index bedd88a15959..b8ea6505afa2 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2894,20 +2894,14 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 
 	engine_fake_wa_init(engine, wal);
 
-	/*
-	 * These are common workarounds that just need to applied
-	 * to a single RCS/CCS engine's workaround list since
-	 * they're reset as part of the general render domain reset.
-	 */
-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
+	if (engine->class == RENDER_CLASS) {
 		general_render_compute_wa_init(engine, wal);
-
-	if (engine->class == COMPUTE_CLASS)
-		ccs_engine_wa_init(engine, wal);
-	else if (engine->class == RENDER_CLASS)
 		rcs_engine_wa_init(engine, wal);
-	else
+	} else if (engine->class == COMPUTE_CLASS) {
+		ccs_engine_wa_init(engine, wal);
+	} else {
 		xcs_engine_wa_init(engine, wal);
+	}
 }
 
 void intel_engine_init_workarounds(struct intel_engine_cs *engine)
-- 
2.47.2


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F0FA72726
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9C710E794;
	Wed, 26 Mar 2025 23:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h19SNizu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728410E796;
 Wed, 26 Mar 2025 23:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032442; x=1774568442;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KGfy8w8eDrctc2a+UsExK692S5f4DDJVOJ8XaYF8b7c=;
 b=h19SNizua6v3QDN1al471ApokRCJ3qqBeUU2XoAvMrmQimwVNkqRKBLF
 la8M2j2190iFrHUzRY3y2eYJ1LNrR+0XkM9Ubm8OST1bHNagFrfEkgyim
 ytGCJBt7PexhNRozfhQrKEv1lzga+cC6XEss6pSp0h76j3jZRjWDkNs6h
 TAe1nw7k49DX59+nG9+x821qBqFIGL3Gb5YUTzbI3FVUBmDpfLqn053C+
 A6/Gn6sBeOQ9CHnRmoRjp1SAq3/dxhnjeIKnL/N//un0JMK99x8FAWIEG
 u1857EUgZdeODanq1MjRUEQ8Z5TMDJe6c7gm1tzgar9opSnc8vddqJnrV g==;
X-CSE-ConnectionGUID: GxbVZiLfS6SXVID+mFkb1g==
X-CSE-MsgGUID: rxF4YVKWTb6MYPJtm/ib+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741409"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:41 -0700
X-CSE-ConnectionGUID: JJw/AOMBRsqYs4+x/ZL1fg==
X-CSE-MsgGUID: vlXvVP/4RBKCf1i65SMlFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143319"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:39 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 4/6] drm/i915/gt: Check for the first CCS instead of
 FIRST_RENDER_COMPUTE
Date: Thu, 27 Mar 2025 00:40:03 +0100
Message-ID: <20250326234005.1574688-5-andi.shyti@linux.intel.com>
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

Enable the CCS engine when the first CCS is encountered in the
execlist setup, instead of checking for the
I915_ENGINE_FIRST_RENDER_COMPUTE flag.

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4a80ffa1b962..70ea56054a19 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2950,7 +2950,7 @@ static int execlists_resume(struct intel_engine_cs *engine)
 
 	enable_execlists(engine);
 
-	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE)
+	if (FIRST_CCS(engine))
 		xehp_enable_ccs_engines(engine);
 
 	return 0;
-- 
2.47.2


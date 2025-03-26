Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42700A72720
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C27110E78B;
	Wed, 26 Mar 2025 23:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e+pS+w+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808A10E78F;
 Wed, 26 Mar 2025 23:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032425; x=1774568425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYtTDqGZk/TIzquJnB/YyFAgaI5FpwJfM3wQVdO94DM=;
 b=e+pS+w+ZITXSVac6nmQuHmTMZLpDR6cT4DHP1WoxjcgJYZJ66Z52M4Ui
 fii/3y3lwGQSsPY7Yges7qAgmtcYpINQYx2RS3uAWCOoEbTTlvd2mk6V9
 NaVXPRr5EiIaopbUC8c7pZCCQN4fr/iEApsy81gyDUt/5c+V8bglb7Lef
 1nne/OR/AwDeR/tTxydfoCi34vkIvzwswQ+Y3hIQfiNrNGWmooj/2u7+s
 EGruy71VfikCytUE78Zf56U8pl3olE1ogaIZDchfEpCUE3fPHFf0g48rT
 zxfdaDMnEeoJQgJCsTMitCSR7YKtSEScJ4S4FvpItJ1FLt3bqnc+wn13H Q==;
X-CSE-ConnectionGUID: cFR5AlO+QciY8MCS1ZCYqQ==
X-CSE-MsgGUID: YPlw8Z8BTwCDjeq/4Rc4+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741383"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741383"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:24 -0700
X-CSE-ConnectionGUID: 7z0pEnsMRBiNUcgo8sCebw==
X-CSE-MsgGUID: gX2rGes2S76uyOOacXslYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143243"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:21 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 1/6] drm/i915: Add the FIRST_CCS() helper
Date: Thu, 27 Mar 2025 00:40:00 +0100
Message-ID: <20250326234005.1574688-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
References: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andi Shyti <andi.shyti@intel.com>

Some GPUs, like DG2, can host more than one CCS engine. Some
workarounds or enablements need to happen only once for all the
engines in the GT—for example, on the engine with the lowest
instance.

The FIRST_CCS() helper first checks if the engine is a Compute
engine, and then whether it's the one with the lowest instance.

Signed-off-by: Andi Shyti <andi.shyti@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 54538b6f85df..5cb501393c4b 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -619,6 +619,9 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define CCS_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
 
+#define FIRST_CCS(e__) \
+	(CCS_MASK(e__->gt) && (__ffs(CCS_MASK(e__->gt)) == e__->instance))
+
 #define HAS_MEDIA_RATIO_MODE(i915) (INTEL_INFO(i915)->has_media_ratio_mode)
 
 /*
-- 
2.47.2


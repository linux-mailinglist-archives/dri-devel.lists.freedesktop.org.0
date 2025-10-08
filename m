Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C88BC4A76
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:57:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA3010E7E0;
	Wed,  8 Oct 2025 11:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7mhQ2es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F38E10E7D8;
 Wed,  8 Oct 2025 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924640; x=1791460640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SvHccNgBdnQZ2CjVF/Wlfjp2ge03F4soHV0UsGLstBQ=;
 b=O7mhQ2es3BtlBFG2iDgU+azI2iARRrrqCsBVYDM0L2OXrxmiMR40LHWz
 Lqw40fPPJxo6PEKfGhlO2dGsJKaYn0RBcVNheXOxpziqVGZoSWhQ7kugf
 jtjW6GVjXKvejyZCSGPOOBVIXV4QBeclm+qUCNFhmoXAub/Ns9vIROWUU
 djTmwIsXm34eqjNV6ZEza043aKmBKpuzYbo58PvfeRaghDu/ogKG/P12n
 CBAxp55MsqORMsnsLivJ9LLcYz/2lHgV8ovN8QBP2+mDf5T6KWHDmJoCm
 FJeqbGkCkQDg3ZU+lOSLG3ZA9N1UjqjzaNyhtjiE0lzFDC5r6XTqecCOa A==;
X-CSE-ConnectionGUID: wF85PgtKR8qeJO9zGv/JZQ==
X-CSE-MsgGUID: RcWaxfnVSFKJiC0/PFwoGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49672038"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="49672038"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:20 -0700
X-CSE-ConnectionGUID: 6v2WGbpuQfyZYTpAAvwUYQ==
X-CSE-MsgGUID: dm2+09g9TmyLkx4ZEwUXjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180452901"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.147])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:16 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Simona Vetter <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v2 2/2] drm/i915: force getparam ioctl return bool for
 HAS_CONTEXT_ISOLATION
Date: Wed,  8 Oct 2025 13:56:33 +0200
Message-ID: <20251008115632.16333-4-krzysztof.niemiec@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
References: <20251008115632.16333-2-krzysztof.niemiec@intel.com>
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

From: Adrian Larumbe <adrian.larumbe@collabora.com>

In a previous commit, the uAPI documentation for this param was updated
to reflect the actual usage expected by Iris. Now make sure the driver
does indeed return a boolean value rather than an engine bitmask.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_user.c | 14 ++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine_user.h |  1 +
 drivers/gpu/drm/i915/i915_getparam.c        |  2 +-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
index 833987015b8b..1f8e2bc540a9 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
@@ -324,3 +324,17 @@ unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915)
 
 	return which;
 }
+
+bool engines_context_isolated(struct drm_i915_private *i915)
+{
+	struct intel_engine_cs *engine;
+
+	if (!DRIVER_CAPS(i915)->has_logical_contexts)
+		return false;
+
+	for_each_uabi_engine(engine, i915)
+		if (!engine->default_state)
+			return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.h b/drivers/gpu/drm/i915/gt/intel_engine_user.h
index 3dc7e8ab9fbc..760167db07d5 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_user.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_user.h
@@ -15,6 +15,7 @@ struct intel_engine_cs *
 intel_engine_lookup_user(struct drm_i915_private *i915, u8 class, u8 instance);
 
 unsigned int intel_engines_has_context_isolation(struct drm_i915_private *i915);
+bool engines_context_isolated(struct drm_i915_private *i915);
 
 void intel_engine_add_user(struct intel_engine_cs *engine);
 void intel_engines_driver_register(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6fcda6d7b5b7..34999ab51a6f 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -163,7 +163,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			value = -EINVAL;
 		break;
 	case I915_PARAM_HAS_CONTEXT_ISOLATION:
-		value = intel_engines_has_context_isolation(i915);
+		value = engines_context_isolated(i915);
 		break;
 	case I915_PARAM_SLICE_MASK:
 		/* Not supported from Xe_HP onward; use topology queries */
-- 
2.45.2


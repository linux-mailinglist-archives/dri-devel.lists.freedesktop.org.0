Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4D7BC4A70
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 13:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA4F10E11A;
	Wed,  8 Oct 2025 11:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnEoXnlW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276FB10E11A;
 Wed,  8 Oct 2025 11:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759924633; x=1791460633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ptDJvPNPj/sE3dLDhd7RJuMYXS3dB28wv7k4eSgtbFA=;
 b=dnEoXnlW0eiOueZcO6yaI3ECE+tUNrazG+l+pjDg7VhPVi6K7blEfuEp
 BkEifXTqvhp4Y3NgWpmSGLNrdP512uaD/jTzXr8v1DR9QYFgvgdAGT2+3
 9wjJYDkr0ZbzD9SCcrMptJQVjMCWkETPYDfwJFsafs1l5INtYkqruYmjO
 Iy/JhI9qIoR+cAIAC6Sd44RF1QhHNmTkGFj8R6EHta+378ERGm+gQx2qY
 c/EfpvnFP7gOmD3GKJp5eeipPZxAJ9UCto8ZAsorZwD0/KXCw+orkV/QN
 yhGRSGA40JA3Suq1nvWCjVWJe4m+qOjJV8XzFXhSWPzYHdqvnf6BnmO2C g==;
X-CSE-ConnectionGUID: PPoYDfNVQ0q6ZhWG2YSb0A==
X-CSE-MsgGUID: Pj0JBCGuSGmA65LXbnL+yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="49672023"
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="49672023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:12 -0700
X-CSE-ConnectionGUID: +ik/jqawRj6t5aU+gKUfsA==
X-CSE-MsgGUID: iLE+fIktTa2iUtAey/MEMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,323,1754982000"; d="scan'208";a="180452874"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.244.147])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 04:57:09 -0700
From: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Adrian Larumbe <adrian.larumbe@collabora.com>,
 Simona Vetter <simona@ffwll.ch>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Subject: [PATCH v2 1/2] drm/i915: Change semantics of context isolation
 reporting to UM
Date: Wed,  8 Oct 2025 13:56:32 +0200
Message-ID: <20251008115632.16333-3-krzysztof.niemiec@intel.com>
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

I915_PARAM_HAS_CONTEXT_ISOLATION was already being used as a boolean by
both Iris and Vulkan, and stood for the guarantee that, when creating a
new context, it would not contain register state from preexisting ones.

However, the actual param ioctl was returning a bitmask for the
engines in which isolation is supported, and IGT gem_ctx_isolation was
exploiting this wrong semantics when making decisions about which
engines support it.

This is a uAPI documentation change that precedes the actual change in
the getparam ioctl.

Signed-off-by: Adrian Larumbe <adrian.larumbe@collabora.com>
Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
---
 include/uapi/drm/i915_drm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 535cb68fdb5c..5aff550034fc 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -724,10 +724,6 @@ typedef struct drm_i915_irq_wait {
  * supports) that all state set by this context will not leak to any other
  * context.
  *
- * As not every engine across every gen support contexts, the returned
- * value reports the support of context isolation for individual engines by
- * returning a bitmask of each engine class set to true if that class supports
- * isolation.
  */
 #define I915_PARAM_HAS_CONTEXT_ISOLATION 50
 
-- 
2.45.2


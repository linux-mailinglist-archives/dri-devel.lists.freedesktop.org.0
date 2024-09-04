Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AF96BC8C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ED8810E79E;
	Wed,  4 Sep 2024 12:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oy4r1InG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D2510E79E;
 Wed,  4 Sep 2024 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725453521; x=1756989521;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tsX9iiu7a1iRHbQnQfzIPVe0jF08WTSnlBhwJ8VkEy4=;
 b=Oy4r1InGnS0MDTzYBVQFXCcldmu0pF4Pbd4jatWuXZ4K9njmS5+sFic5
 DqbTzcsjC5E5Kql0jvIsdGwGnIj8Oxp0cOd2mdxGlwTeZGsB86FwkPwzd
 zg8P9xcGdQ2aQ3HT7KJVqlD8ZcEvDjLAg6/Gunqt7ENi0HxiWG5hpbQpW
 HSkEcorxLotUIe9R6HtN64+MSJ6SaAmgl7ZRD0JKksLMuRXWvCXByR05q
 f+XhBnS2b6c9ahoS02hwFbvPU10IQ4Hgk+aaE+f7hjjWBCsNsA4BuXUT4
 bRNs3b4NBDHV9bltACvYa9NOmwNNStT8ZbHaU2qfcAjptB0fMBdPcJCfJ Q==;
X-CSE-ConnectionGUID: z2jUyG7kTbWoVZ1HmRu6vA==
X-CSE-MsgGUID: Mo4Ci4z6RUypdhaUO+63GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41582227"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="41582227"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:38:40 -0700
X-CSE-ConnectionGUID: WVMODgAxSvekdUCJF4tEbQ==
X-CSE-MsgGUID: xSxjIM+sTDidIIqdMgaxWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="102667797"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 05:38:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] drm: enable warnings on unused static inlines
Date: Wed,  4 Sep 2024 15:38:19 +0300
Message-Id: <20240904123819.3784906-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We enable most W=1 warnings by default subsystem wide. Also enable
warnings on unused static inlines when building with clang.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 784229d4504d..6bd2cdb08be7 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -19,6 +19,9 @@ subdir-ccflags-y += $(call cc-option, -Wformat-overflow)
 # FIXME: fix -Wformat-truncation warnings and uncomment
 #subdir-ccflags-y += $(call cc-option, -Wformat-truncation)
 subdir-ccflags-y += $(call cc-option, -Wstringop-truncation)
+
+subdir-ccflags-y += -DKBUILD_EXTRA_WARN1
+
 # The following turn off the warnings enabled by -Wextra
 ifeq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 subdir-ccflags-y += -Wno-missing-field-initializers
-- 
2.39.2


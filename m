Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2479E5942
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C32010EEC0;
	Thu,  5 Dec 2024 15:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxOwknsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE4110EEBD;
 Thu,  5 Dec 2024 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733411002; x=1764947002;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VgB16SUwB40D8pkmq2AAKF+KX6DylHdsVIYJ2Jcst9w=;
 b=HxOwknsQsoClxoHCdWbCbBzwPWLofOk8rCE5duXqqdZ92PmjgCQaawon
 PqsMHkS21dOil/zirudH1uyftoD8nOTjcpkYhRAOevR7GUUebHFkhyd3g
 QFnxDlWhHbjgzaet7KqGtLWOVeJKNLY/ci9ZZhDJYNVu4vCmLU5qYq+Cm
 6B0kI4skzTzxQmTFaRs5+QsOB0rzpD59MaJYK+q8cUM6LHxf+b5h83Tdq
 aCRxRszlS9giVJqSH9Ro5UCYNTePfqhfQJi0NxLACmAmmvpPg8k1gDT8p
 1onuAJvnmh6/IcuzfnlGDuRTgLumG4Fat59RtGV1HAIepPT3532LIyoxE w==;
X-CSE-ConnectionGUID: WjcQsUu9Tg65a1HaOs5wGg==
X-CSE-MsgGUID: lFbi7Ve2Qha6CRvlxj6INg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51142054"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51142054"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:21 -0800
X-CSE-ConnectionGUID: JpaeEYL3Tz+ZJj1vRBb2jw==
X-CSE-MsgGUID: QfWzWlMsQAuD3QtDMv8u9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93983058"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 3/3] drm: enable warnings on unused static inlines
Date: Thu,  5 Dec 2024 17:03:01 +0200
Message-Id: <4b57ede9724befc59fbe8c9b142c2cf5e30a48e5.1733410889.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733410889.git.jani.nikula@intel.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
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
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 1677c1f335fb..73b3b3dbc27e 100644
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
2.39.5


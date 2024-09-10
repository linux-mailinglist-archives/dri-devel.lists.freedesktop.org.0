Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE019730D4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2231E10E769;
	Tue, 10 Sep 2024 10:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewinmAtF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB8010E769;
 Tue, 10 Sep 2024 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962682; x=1757498682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tsX9iiu7a1iRHbQnQfzIPVe0jF08WTSnlBhwJ8VkEy4=;
 b=ewinmAtF4rDcdaMR97KeTimtTWKwtBUScQMT0Sv0XibQcJVGrF19PlE5
 eCCgQT81OfU/+NurLaM5HXGwFjoUQ6diztFX9JAgnPdQ4F7eQEy2/ePMy
 ULxUiJf1UoaoGulLY+EgWZtOMSjiLUMt8MDo0QoEK6WXYUt+gs7dfSD8d
 GV4UdSj9jxLtjkfjO1TunPb3IYZPYk561f0Vv+5u+v4rVtImFMlwSk1HQ
 p73sOYBeKEJBNIIV9nDgH/1qy502LZW7oc0p49sPB0uL/WHKRZfEuH16j
 5/KOhmUU6tsIqDNo4hjHAUBCTHWI87FoQ3Dw0UacjSKuEWxs+YvX0WErd A==;
X-CSE-ConnectionGUID: CMmfkMMsSM2SGFluWks1+g==
X-CSE-MsgGUID: ld81lLbaSdO79xDkIZ1QHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50112916"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="50112916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:42 -0700
X-CSE-ConnectionGUID: dYInDUlURXWdVW3Ugf7Nrw==
X-CSE-MsgGUID: pF6bdDlbS+6j+ixV0Cioug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71762397"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 8/8] drm: enable warnings on unused static inlines
Date: Tue, 10 Sep 2024 13:03:44 +0300
Message-Id: <5b07f7bb06467539e63f32aef56362c836aba7b5.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
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


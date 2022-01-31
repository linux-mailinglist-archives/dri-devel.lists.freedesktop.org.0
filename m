Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B515A4A4CA0
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:59:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD38910E396;
	Mon, 31 Jan 2022 16:59:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C2E10E325;
 Mon, 31 Jan 2022 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643648340; x=1675184340;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nILTEi/BichEI3d9YIMeFC9c5I17J9eenKfDoX0DlNU=;
 b=Ac5xmx9V0ufP+HTRKES1CscI4QI7g6W4kZ+7aWJ0+dB0kPfhluLX5fXj
 +gWrX6Lb2xv4K+9Wty+CRRjWjDUyZm2KxMwOzXYw+lF84yOeVaRg+d1iC
 rnfwydNstM8489cD/57Tu3MByrxSrhePZ/COBjavauwDQ+j3pImAgSzsZ
 Cmx46XN4625GuqEUaE2kcTFFD7TKdcUikDpGS+hpFWWhiqNqP35v81N5C
 TovcLJy34lODdLNGIKwxgWpmMaTY3SPScxo0/vDRBzktLBG8oMnJSkPNo
 ByPIkPVqHIt7TZ1bsU3mOsPkkwHje9Wh1iDdQIW9gu29z4LIbMnTouBAV A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247275435"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="247275435"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="496986484"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915: Fix header test for !CONFIG_X86
Date: Mon, 31 Jan 2022 08:59:25 -0800
Message-Id: <20220131165926.3230642-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131165926.3230642-1-lucas.demarchi@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
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
Cc: Siva Mullati <siva.mullati@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Architectures others than x86 have a stub implementation calling
WARN_ON_ONCE(). The appropriate headers need to be included, otherwise
the header-test target will fail with:

  HDRTEST drivers/gpu/drm/i915/i915_mm.h
In file included from <command-line>:
./drivers/gpu/drm/i915/i915_mm.h: In function ‘remap_io_mapping’:
./drivers/gpu/drm/i915/i915_mm.h:26:2: error: implicit declaration of function ‘WARN_ON_ONCE’ [-Werror=implicit-function-declaration]
   26 |  WARN_ON_ONCE(1);
      |  ^~~~~~~~~~~~

v2: Do not include <linux/printk.h> since call to pr_err() has been
removed

Fixes: 67c430bbaae1 ("drm/i915: Skip remap_io_mapping() for non-x86 platforms")
Cc: Siva Mullati <siva.mullati@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v3: No changes from previous version, just submitting to the right
mailing list

 drivers/gpu/drm/i915/i915_mm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/i915_mm.h b/drivers/gpu/drm/i915/i915_mm.h
index 76f1d53bdf34..3ad22bbe80eb 100644
--- a/drivers/gpu/drm/i915/i915_mm.h
+++ b/drivers/gpu/drm/i915/i915_mm.h
@@ -6,6 +6,7 @@
 #ifndef __I915_MM_H__
 #define __I915_MM_H__
 
+#include <linux/bug.h>
 #include <linux/types.h>
 
 struct vm_area_struct;
-- 
2.35.0


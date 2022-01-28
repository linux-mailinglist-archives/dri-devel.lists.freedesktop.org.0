Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207B4A0028
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B256410EB15;
	Fri, 28 Jan 2022 18:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A79710EAFE
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 18:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643394741; x=1674930741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f+rERBu/ZkpwJ1Der+AaWEZd4RDtVZo9KmOt92emduU=;
 b=GXIJKHZb0vEu1/r7E9C4XEjtVJyXecPJHv7KmAneMe4dBu5w8AatFV9F
 oidXjB2jT3XcAODe+7xLPGCzqVUWIjTyOBwCBTdnZfiLm/ihlPrLDSEvq
 6thGIPlzmAKTKfM+jmoMOi1dK7tvKOJr0U1dNUgYk9gi67U2YcxKLC0eO
 QEff0xTeph8abADKL/qfGdMjCDIfeIdst0EY8RLLUO5RiW9pKqemqztW/
 rezgoEha0V6hy37ZcJ5L/cVi9etBcG8uaAbzvLAiT8FE+Ih7aF4RRBnip
 PiHUjMmhab9dcFjujrNniqlhZjnO6zmezl1qkx6T7frJcE+cvjRmPF6vh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244774580"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="244774580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="480828092"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gfx-internal-devel@eclists.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915: Fix header test for !CONFIG_X86
Date: Fri, 28 Jan 2022 10:33:04 -0800
Message-Id: <20220128183305.3072999-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128183305.3072999-1-lucas.demarchi@intel.com>
References: <20220128183305.3072999-1-lucas.demarchi@intel.com>
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
Cc: Siva Mullati <siva.mullati@intel.com>
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


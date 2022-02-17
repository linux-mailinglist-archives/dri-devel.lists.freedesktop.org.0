Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CBD4BAAF2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9490C10E7EB;
	Thu, 17 Feb 2022 20:27:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C724110E7AF;
 Thu, 17 Feb 2022 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645129616; x=1676665616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5s8WwXED9j1A4hMdCFff54d6DwS++vt5oG3f5u7P8aU=;
 b=Rif2n5kp47WiG3jqbft2Jr/psdUGh99w0pYG0IMnLmBiJaCl1n06Zwb9
 HupKqyr8WMR3YJoyB0blrMsWEy5dEiSzzQdprmj9PJwoSy4wm4SWqfRgK
 YjYl/iDeWfPJJNl6+CXL0R31lZZXRowCxFsQhEhVl3IjFZaxdKbNVjp9j
 BLajgJKn72Q4uiNVUgevYjxetYPEyH8rrdPQda8pB5B1NjiS+OJT5mptG
 IqufksPvuiM5QHS487l2ufssaaQzMmhCNjBDuKdwOW2I6JCMhdd2h2dCf
 MzlsqwgZvqHJd/HuzP2A7u3nI8CSr0hBAff/Pcj/McT0jFlKGrcnZBjPn w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238370951"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="238370951"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545842107"
Received: from zlwang-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.198.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:56 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/i915/: Add drm_cache.h
Date: Thu, 17 Feb 2022 12:26:44 -0800
Message-Id: <20220217202644.122937-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217202644.122937-1-michael.cheng@intel.com>
References: <20220217202644.122937-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_cache.h to additionals files that calls wbinvd_on_all_cpus and
remove un-needed header files.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 13917231ae81..edb0ebbb089c 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -9,7 +9,7 @@
 #include <linux/dma-resv.h>
 #include <linux/module.h>
 
-#include <asm/smp.h>
+#include <drm/drm_cache.h>
 
 #include "gem/i915_gem_dmabuf.h"
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 8850d4e0f9cc..dac62e3ba142 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -7,10 +7,10 @@
 #include <linux/stop_machine.h>
 
 #include <asm/set_memory.h>
-#include <asm/smp.h>
 
 #include <drm/i915_drm.h>
 #include <drm/intel-gtt.h>
+#include <drm/drm_cache.h>
 
 #include "gem/i915_gem_lmem.h"
 
-- 
2.25.1


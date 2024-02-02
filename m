Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D6846AB8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 09:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7223110E52E;
	Fri,  2 Feb 2024 08:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INTy2A5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA3C10E52E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706862537; x=1738398537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5c7MamU/aYXwT+9AG8t8xWNewjIFHy1bhmp2ZQEk7zo=;
 b=INTy2A5bBJxC/euj8gqfpZb4cHGopEjxgLOdNFRuU/DdTyQkIc40hV18
 4a+cvYBzi1UQCQcOBaGQcXtldGHZBkBLh1eJy/N6C3vL4E39hUmmb8eJN
 /sVuEgM82dZyt4GEvro32z6DTsv2sfMPtZNJjNNR0puZmlOG5awlVs54n
 ZHbE7vjP+O58gmCQebCybxoG228hpgATy4475H1HpvHPAK+5lOUjSpyvS
 QFbhTEoYfTt++FGlMseZmgspp7zmAcWMCaO1PpFoVXGglX0HfdtGJu9nv
 cv32J3YtBnaJJJkohESkvQk9ONmRXyxVz/3hhs5LsHtljrD+wG3uD4YB6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10758878"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="10758878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 00:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="20779"
Received: from naveena-super-server.iind.intel.com ([10.145.169.170])
 by orviesa010.jf.intel.com with ESMTP; 02 Feb 2024 00:28:50 -0800
From: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
To: gfx-internal-devel@eclists.intel.com
Cc: chris.p.wilson@intel.com, ayaz.siddiqui@intel.com,
 syed.abdul.muqthyar.ahmed@intel.com,
 Sagar Chormale <sagar.chormale@intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 40/46] dma-buf: move dma-buf symbols into the DMA_BUF module
 namespace.
Date: Fri,  2 Feb 2024 14:01:47 +0530
Message-Id: <20240202083153.2635684-41-kolanupaka.naveena@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240202083153.2635684-1-kolanupaka.naveena@intel.com>
References: <20240202083153.2635684-1-kolanupaka.naveena@intel.com>
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

From: Sagar Chormale <sagar.chormale@intel.com>

In order to better track where in the kernel the dma-buf code is used,
put the symbols in the namespace DMA_BUF and modify all users of the
symbols to properly import the namespace to not break the build at the
same time.

Now the output of modinfo shows the use of these symbols, making it
easier to watch for users over time.

$ modinfo drivers/misc/fastrpc.ko | grep import
import_ns:      DMA_BUF

Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Link: https://lore.kernel.org/r/20211010124628.17691-1-gregkh@linuxfoundation.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
-------------------------------------------------------------------------------
Backports

'commit 16b0314aa746 ("dma-buf: move dma-buf symbols into the DMA_BUF
module namespace.")'

Signed-off-by: Sagar Chormale <sagar.chormale@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index d7e4ef3fa589d..6d14315dfce40 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -9,6 +9,9 @@
 #include <linux/list.h>
 #include <linux/pci-p2pdma.h>
 #include <linux/scatterlist.h>
+#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
+#include <linux/module.h>
+#endif
 #include <drm/intel_iaf_platform.h>
 
 #include "gem/i915_gem_dmabuf.h"
@@ -23,6 +26,10 @@
 #include "i915_trace.h"
 #include "intel_iaf.h"
 
+#ifdef BPM_MODULE_IMPORT_NS_SUPPORT
+MODULE_IMPORT_NS(DMA_BUF);
+#endif
+
 I915_SELFTEST_DECLARE(static bool force_different_devices;)
 
 static const struct drm_i915_gem_object_ops i915_gem_object_dmabuf_ops;

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452E553010
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 12:47:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CAB10FAC9;
	Tue, 21 Jun 2022 10:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BC0410FBDC;
 Tue, 21 Jun 2022 10:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655808410; x=1687344410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=giNohRqK8u2ya2LTyxPUSwRWob3bCSGgWs9CD02xaoc=;
 b=MjoLFG8GMBsgEZBMFL1WWh4OzEpwFgOLyuJ0w4P8j3LvviJ1HkzItWaM
 kofxjvsWGIUnmP/hXMIXHsjHeIDPECuPC2uxyUmmv8HD6gvrlJWdfOUmt
 LTr9CY0oWxPrGDPbeiSScyUPjSHdNzJe73ap3EbIZXUZ17KiUhpIDfkOP
 LFAKPfOT5uw9wWGW7N2vrD01EUEONFhh/dQztmJW4rD+72tpc1ot8xPNL
 I2PAsmixr2UPlt35ZLQYdeBXHg3XRmpr1qYLhAZwqziHlCSzQ/r3ErKnP
 85vuVb+3D8vwSsieIno8K3vGSt7xm0r6Rx5qXn836myN4ZE15DqBpzRFJ A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="263121950"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="263121950"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:50 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="562327113"
Received: from jasonmor-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.200.10])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 03:46:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 07/12] drm/i915/error: skip non-mappable pages
Date: Tue, 21 Jun 2022 11:44:29 +0100
Message-Id: <20220621104434.190962-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621104434.190962-1-matthew.auld@intel.com>
References: <20220621104434.190962-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Kenneth Graunke <kenneth@whitecape.org>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>,
 Akeem G Abodunrin <akeem.g.abodunrin@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Skip capturing any lmem pages that can't be copied using the CPU. This
in now only best effort on platforms that have small BAR.

Testcase: igt@gem-exec-capture@capture-invisible
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jordan Justen <jordan.l.justen@intel.com>
Cc: Kenneth Graunke <kenneth@whitecape.org>
Cc: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_gpu_error.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index bff8a111424a..2a1cb8b20381 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -1125,11 +1125,15 @@ i915_vma_coredump_create(const struct intel_gt *gt,
 		dma_addr_t dma;
 
 		for_each_sgt_daddr(dma, iter, vma_res->bi.pages) {
+			dma_addr_t offset = dma - mem->region.start;
 			void __iomem *s;
 
-			s = io_mapping_map_wc(&mem->iomap,
-					      dma - mem->region.start,
-					      PAGE_SIZE);
+			if (offset + PAGE_SIZE > mem->io_size) {
+				ret = -EINVAL;
+				break;
+			}
+
+			s = io_mapping_map_wc(&mem->iomap, offset, PAGE_SIZE);
 			ret = compress_page(compress,
 					    (void __force *)s, dst,
 					    true);
-- 
2.36.1


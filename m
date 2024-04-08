Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7102489CA56
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5417C1128B6;
	Mon,  8 Apr 2024 17:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HebWWAvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A761B1128B8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595918; x=1744131918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3eO7tL2W5m9dVGMWtrdKemYeriWz5mudC1tgpAq92F8=;
 b=HebWWAvRnIeApFiiyQZLzlzmApFhnyJmSWUgQehmemq0INpi4COdWe9N
 pREExBV31Kw7SWdrB1cyF/8R1DXKEMO2KVrjxx/VdLFPyU9EAyf6KEYvY
 3+JetjSAaA9WEBsxUQcW489XvnFAKogHefum4yVSFS4KTeeK0bqyDjtN6
 bRi3kIHuj8FLTB/TAjkKf6EvWQwRe1r3VLq9OmIiLgtzdaugCCZ97+9YY
 cvY4hKHf4aCYLgL4OShO6mOGxsGNsFXmnmYLnq6DQON6a+9BaWDX9KnAs
 lPHH+8E+UykGpd4YvjhzUC604StROFkGIfVnBHJVy6JIT6FQqz4F06jnX A==;
X-CSE-ConnectionGUID: G8aZbhjxRWCoO64+W0CSQQ==
X-CSE-MsgGUID: nfr4+QcQTXyzdk/W2p8y9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793455"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793455"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792338"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792338"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:05:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:05:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 14/21] drm/omap: Open code phys_to_page()
Date: Mon,  8 Apr 2024 20:04:19 +0300
Message-ID: <20240408170426.9285-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

phys_to_page() is not available on most architectures.
Just open code it like msm does. Allows COMPILE_TEST=y
builds of omapdrm on other architectures.

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 3421e8389222..c4454e7f1c94 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1022,8 +1022,8 @@ struct sg_table *omap_gem_get_sg(struct drm_gem_object *obj,
 
 	if (addr) {
 		for_each_sg(sgt->sgl, sg, count, i) {
-			sg_set_page(sg, phys_to_page(addr), len,
-				offset_in_page(addr));
+			sg_set_page(sg, pfn_to_page(__phys_to_pfn(addr)),
+				    len, offset_in_page(addr));
 			sg_dma_address(sg) = addr;
 			sg_dma_len(sg) = len;
 
-- 
2.43.2


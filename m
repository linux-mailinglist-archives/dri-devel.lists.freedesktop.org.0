Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB39509EB4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9DD10EB01;
	Thu, 21 Apr 2022 11:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CB110EAA1;
 Thu, 21 Apr 2022 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650541042; x=1682077042;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9KppufqNBcoOEqlw1a11aEo0DAHKPArEfFcrfmgFlI=;
 b=AtT1nqUtFKzsfmYHt+SKmxYkZEZ15nV/NSPXH6n9NYR48ann4q8ddtmW
 LscF2bDN9B44aqbf6KCNfb451N1hFjyN7QyNQ6whocaD2Z5rC+AXIhyxD
 ADC1fig/jNDYbW50jPkWr26fha1fZHbmZB9rSVPvJSPnRzNkNBmCW2et8
 UAL+5VGDLOqIPVrYK2qEXW38ZcjD0276HUKeCG4FkieJGL+6y8VzvYEz7
 8zqea/Y9nJtUM1DFQpTuT8fUtbljj8/9k0Z0G8ZrKL/Wdb80GlJ7ZY27R
 dZ+fwgmop42w5JhWeqpBJEgZjslI20+nFYK+ggk4H/IAkwmPJE5MXxNAJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324766819"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324766819"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="727952096"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 04:37:19 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at scatterlist
 walking
Date: Thu, 21 Apr 2022 17:08:10 +0530
Message-Id: <20220421113813.30796-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421113813.30796-1-ramalingam.c@intel.com>
References: <20220421113813.30796-1-ramalingam.c@intel.com>
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While locating the start of ccs scatterlist in smem scatterlist, that has
to be the size of lmem obj size + corresponding ccs data size. Report bug
if scatterlist terminate before that length.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index 9d552f30b627..29d761da02c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -687,6 +687,12 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
 		bytes_to_cpy -= len;
 
 		it->sg = __sg_next(it->sg);
+
+		/*
+		 * scatterlist supposed to be the size of
+		 * bytes_to_cpy + GET_CCS_BYTES(bytes_to_copy).
+		 */
+		GEM_BUG_ON(!it->sg);
 		it->dma = sg_dma_address(it->sg);
 		it->max = it->dma + sg_dma_len(it->sg);
 	} while (bytes_to_cpy);
-- 
2.20.1


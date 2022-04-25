Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C271550E590
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 18:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE4110E5C6;
	Mon, 25 Apr 2022 16:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AAF10E594;
 Mon, 25 Apr 2022 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650903816; x=1682439816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C9KppufqNBcoOEqlw1a11aEo0DAHKPArEfFcrfmgFlI=;
 b=IWDutMxKyxY/EhS4mIc9/UXrDXpMQV3WIiotLPZ2dugc17QUTS6HgrXf
 uUT+96HsEXtlmj5rAqbnVZE9wnGem+cfq6yRjMZbBdWFSldgsNuSMBSny
 3Sa4j3r47KAu8e1nusXggp3snKcWKAFJcx423DLMijDGZp07/DxCeIOH8
 2OwbB173fvmgpono+l3/Dgdr64H6BDnwlol9Nx/aExyeJOle+f77JhwhU
 3sOGx9EVvbHpFmsw4frJmhan6j2/bl4c6m71FaHy3MqBXYkFiyMUyth1y
 vvovQdOlt0rkE+IH8gn0HvIMZACbF+lNX1Fcb3IamUIpDOUPtxvXiD+KC A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10328"; a="290434352"
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="290434352"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,288,1643702400"; d="scan'208";a="677290965"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2022 09:23:33 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/4] drm/i915/gt: GEM_BUG_ON unexpected NULL at scatterlist
 walking
Date: Mon, 25 Apr 2022 21:54:27 +0530
Message-Id: <20220425162430.28844-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220425162430.28844-1-ramalingam.c@intel.com>
References: <20220425162430.28844-1-ramalingam.c@intel.com>
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


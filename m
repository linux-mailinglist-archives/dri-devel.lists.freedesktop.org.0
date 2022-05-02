Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A98F517461
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A7010F099;
	Mon,  2 May 2022 16:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3400110F05C;
 Mon,  2 May 2022 16:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509263; x=1683045263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i+oxcg0HHO8rL/sbJZhIjvzh8JH+5Omq1CpfJO52Hg4=;
 b=QGcwscdQLKlCi1mvnzFhh6hcs1/1ULSKkJaMqTswSzmlDZkvHnwV43Tg
 6/D/VpI/FHbwUEvs4Ehd/BFh70tZOcweufvnaI6mhZSKov6Uvi6wKHrhc
 z/CYvEAHu2wH7a4eO9eHVa1k8uHHavwuWcnKQCJHV3Z8OqUzns00BpDv1
 SCahTZZwexJtozLhwWlZ+j8eDCLNrGA+6VoaQvQrxQdj1jnLUj5qas30H
 RpFNOa0vQ7NZd/QDEN1cT2N9e0tD9gydb1fH7e4UFALyJg9J7f+kstFdh
 2KnpBtXiMYjRzIeFaq6I811uUdOTR9lGZdyq5gFYHOneE1GjI1j7NqVTh A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="266105007"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="266105007"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="583781857"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:34:22 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/11] drm/i915/pvc: skip all copy engines from aux table
 invalidate
Date: Mon,  2 May 2022 09:34:16 -0700
Message-Id: <20220502163417.2635462-11-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220502163417.2635462-1-matthew.d.roper@intel.com>
References: <20220502163417.2635462-1-matthew.d.roper@intel.com>
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

As we have more copy engines now, mask all of them from aux table
invalidate.

Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0de17b568b41..f262aed94ef3 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -275,7 +275,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 		if (!HAS_FLAT_CCS(rq->engine->i915) &&
 		    (rq->engine->class == VIDEO_DECODE_CLASS ||
 		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask & ~BIT(BCS0);
+			aux_inv = rq->engine->mask & ~GENMASK(BCS8, BCS0);
 			if (aux_inv)
 				cmd += 4;
 		}
-- 
2.35.1


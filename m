Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4F51CB6A
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 23:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14C110FA86;
	Thu,  5 May 2022 21:38:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED27510FA4A;
 Thu,  5 May 2022 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651786703; x=1683322703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CQ2YALazLqeqv4u4N6P6Sr2k1SUd9irisFjlWj30Hpg=;
 b=F1jV+5FSRiL0VdongoAxMrA4f2YAvMCberZY1Br5KdYKX/6qJUOxOJJ6
 Idv4eAEVEhgPphG7u4WMFcRBaNGYCtIK3BVonApc5NxcsZzRxJ6tqYS1h
 VzuSYAlBIJ9TJsdk76U2ivSrJmPjO6qhOXkixcVTlinVOKOWKHHtlNX8p
 Yg1ulN1Nix4ZM0tWnRYZ38Mi7XyPVFduKbLeFXMElaOZ9qrabkmEG1zwT
 EZMLPN7ZmvLM+5eUwfraWCNcKTazR8xBUQ1cAE8HeQOKJekdt8Rd8aKkW
 jp4POL7dAGuYKYLEAG876FV/O2CHcukZ35lzAfHqwCXtJgDrixqZ9yt4D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="265851852"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="265851852"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="549553293"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 14:38:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/i915/pvc: skip all copy engines from aux table
 invalidate
Date: Thu,  5 May 2022 14:38:11 -0700
Message-Id: <20220505213812.3979301-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505213812.3979301-1-matthew.d.roper@intel.com>
References: <20220505213812.3979301-1-matthew.d.roper@intel.com>
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

As we have more copy engines now, mask all of them from aux table
invalidate.

v2 (MattR):
 - Use I915_MAX_BCS to determine mask rather than hardcoding BCS8.
   (Prathap)

Cc: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
Reviewed-by: Prathap Kumar Valsan <prathap.kumar.valsan@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 11c72792573d..0f5ab2c99ffc 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -276,7 +276,8 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
 		if (!HAS_FLAT_CCS(rq->engine->i915) &&
 		    (rq->engine->class == VIDEO_DECODE_CLASS ||
 		     rq->engine->class == VIDEO_ENHANCEMENT_CLASS)) {
-			aux_inv = rq->engine->mask & ~BIT(BCS0);
+			aux_inv = rq->engine->mask &
+				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
 			if (aux_inv)
 				cmd += 4;
 		}
-- 
2.35.1


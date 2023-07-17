Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDA75632A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 14:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B233F10E237;
	Mon, 17 Jul 2023 12:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27ADB10E236;
 Mon, 17 Jul 2023 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689598328; x=1721134328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Azr+yZ1xPnhFlXc4Lf7xg+b7tzt+MWt2RPdQZmMxrR0=;
 b=cOxK4GmVIgR8CsH3Fsdz2wq6tVFBhaJkp6LAiyxTix1tgT4dEJTK29ac
 tff3AQoOiYqeGgJXeOatbALD4Oejp2xmFiXYl9u74ZPbHV9/ItulJ80x/
 r6A84GOno99kUXdua0IGfwFdWqJU6pOK2MFcSUd72TfQVpI57EP5rWc26
 inEp3ngYTs1p7BHhRhUkI9sb567NIfMT+CQWkIKrZJwmjqfcNk8DPEq9j
 YrjKCNLfANdM8+wwaoK+FPzTiONq4SUOiSs9hqc3tehn55B0MVIAMacW9
 FBTkRrnuC2F/oAxeZHp6UxUS00y2fKDQi5nLKUr7jTR2hSNBbuqi7gbN8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363383718"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="363383718"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="969873949"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="969873949"
Received: from jplazoni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.169])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 05:52:04 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH v3 2/5] drm/i915/gt: Ensure memory quiesced before invalidation
Date: Mon, 17 Jul 2023 14:51:31 +0200
Message-Id: <20230717125134.399115-3-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230717125134.399115-1-andi.shyti@linux.intel.com>
References: <20230717125134.399115-1-andi.shyti@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jonathan Cavitt <jonathan.cavitt@intel.com>

All memory traffic must be quiesced before requesting
an aux invalidation on platforms that use Aux CCS.

Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.8+
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 563efee055602..bee3b7dc595cf 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -202,6 +202,13 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
+	/*
+	 * Aux invalidations on Aux CCS platforms require
+	 * memory traffic is quiesced prior.
+	 */
+	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
+		mode |= EMIT_FLUSH;
+
 	if (mode & EMIT_FLUSH) {
 		u32 flags = 0;
 		int err;
-- 
2.40.1


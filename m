Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EB7593DC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 13:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8501E10E469;
	Wed, 19 Jul 2023 11:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA64C10E468;
 Wed, 19 Jul 2023 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689764884; x=1721300884;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uR+fjV1MQhWWZrLRK5GNHGldTx13ppC3IqdzfzTFsh8=;
 b=OfijN1m1nhtTfn6xPe+ETbS/LvnJNtdROJJU/hATth27P2FLuxIw83z5
 8/EkH3w0m2iLvrtDTrqE9EqwMaWiEuKBoX6nwZDgW+yfuMZQxmQMCdP1d
 OtphH9onFGt5kSpupdj1vX0oO9g5N67N6IPiJsrG1KkPxYAvFr26Y6QFS
 YG0FAONkaoF+hY1F7/k9H0YNBTvvaLYeF3BqvdUH1j2XG0RhnowR/Of8N
 sUgnQJ3D2xsLJVTeWVY6s/ZO0PUALAucopSuTzzLaAHEj4VJ2fUnZqaN5
 Io4qrwdAbQFje8LQZave3rdi4mVMKAH5reJjFcA/hzxsxLqcznNGqIepA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="366474581"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="366474581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="759141677"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; d="scan'208";a="759141677"
Received: from schoorlx-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.251.222.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2023 04:08:01 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 3/9] drm/i915/gt: Ensure memory quiesced before invalidation
Date: Wed, 19 Jul 2023 13:07:23 +0200
Message-Id: <20230719110729.618733-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230719110729.618733-1-andi.shyti@linux.intel.com>
References: <20230719110729.618733-1-andi.shyti@linux.intel.com>
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
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
index 0d4d5e0407a2d..5fbc3f630f32b 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -202,7 +202,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	if (mode & EMIT_FLUSH) {
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand
+	 */
+	if (mode & EMIT_FLUSH || HAS_AUX_CCS(engine->i915)) {
 		u32 flags = 0;
 		int err;
 		u32 *cs;
-- 
2.40.1


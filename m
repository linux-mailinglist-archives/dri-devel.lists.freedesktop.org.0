Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E5975CDF9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 18:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5023510E6CA;
	Fri, 21 Jul 2023 16:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EA210E6BF;
 Fri, 21 Jul 2023 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689956189; x=1721492189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BeVh0fq/BVRUQ2tN9OFik04ri1wMm/bj6fdQwBvOiV4=;
 b=DGfvsRAJh34tcgIji9HAGn0/Uduq0nBy7WwZEEkwjkb4kuRAnPykU+6i
 NrWW4BzSMSQ8gM1BSsn6inxazyt4UNy0oWhI0qFw6VJALVGzEm5gvb9HM
 PmUHxXkzFMDFUbRucUOSYfr1+g+Pq5oZZt1pLekBkZQ09OU7+YuAoD7Gt
 BbqVqwB1NWXcmw5hg+eKtcyCM/KqX2hLngA3iL8SjducWXJS4iWRiai20
 q4+dSKg8OkZWHLwKHVyTnpEYq6YigmHq4Ynwj65JzjettBrn8oIdai9CL
 AcHS5ICMOAdzT9mFsAYpjltIQ8lkf7q8lDf70vgskQ2A9CGxbqUgbR+Jk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="433291954"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="433291954"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="675095403"
X-IronPort-AV: E=Sophos;i="6.01,222,1684825200"; d="scan'208";a="675095403"
Received: from hbockhor-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.54.104])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 09:15:44 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v8 3/9] drm/i915/gt: Ensure memory quiesced before invalidation
Date: Fri, 21 Jul 2023 18:15:08 +0200
Message-Id: <20230721161514.818895-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230721161514.818895-1-andi.shyti@linux.intel.com>
References: <20230721161514.818895-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-stable <stable@vger.kernel.org>,
 dri-evel <dri-devel@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>
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
index 460c9225a50fc..6210b38a2d382 100644
--- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
@@ -214,7 +214,11 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
 {
 	struct intel_engine_cs *engine = rq->engine;
 
-	if (mode & EMIT_FLUSH) {
+	/*
+	 * On Aux CCS platforms the invalidation of the Aux
+	 * table requires quiescing memory traffic beforehand
+	 */
+	if (mode & EMIT_FLUSH || gen12_needs_ccs_aux_inv(engine)) {
 		u32 flags = 0;
 		int err;
 		u32 *cs;
-- 
2.40.1


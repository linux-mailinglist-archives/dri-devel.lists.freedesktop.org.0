Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D109959C25
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6210E8E3;
	Wed, 21 Aug 2024 12:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ip3am3Uy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D08610E8E3;
 Wed, 21 Aug 2024 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244261; x=1755780261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBTBmpL924eHLaGaJlxfMEUf+QEa13q0knxeUnC7CKw=;
 b=ip3am3UyLOF8Bc+U59i2NZ3Po93pzRfgB56OkLMo7j2je8MVKlCsXvPu
 N2wkKKp6ehXpp4ADi33yCUnssju807J0471YKRHBQyLbDzrpj/lyqo8et
 4+Cil6p5WPothqb6//6NjFElTPtLuNlwOW8KXtagH0abT/iaPlJToE35B
 IM+7nnfC9m8BkCzoH+Nh//+ls9XByfDCP5IhAVyLom6gJqJ4J9yo5gTBk
 Lzi3N/Vwqs+G+JE9T4SOfv4t0NoDkNpNHb8IJ6tmyOmM+cXNHkRHz2vLI
 m8eybXonmG6GA/w52+6JTZegQRVdIPIbBEshnwdyj52zunCnnUP6YlRrH w==;
X-CSE-ConnectionGUID: hiVxoH59QPyh9o3jWDkvMg==
X-CSE-MsgGUID: 405AoY1MQw2pq1uGDw5e0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33754095"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33754095"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:21 -0700
X-CSE-ConnectionGUID: ygyWBnM9RNaQYWZIj2LzRQ==
X-CSE-MsgGUID: tIuPv35nRGuwjBKIvWvGqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="98554596"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:18 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 01/14] drm/i915/gt: Avoid using masked workaround for
 CCS_MODE setting
Date: Wed, 21 Aug 2024 14:43:36 +0200
Message-ID: <20240821124349.295259-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821124349.295259-1-andi.shyti@linux.intel.com>
References: <20240821124349.295259-1-andi.shyti@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When setting the CCS mode, we mistakenly used wa_masked_en() to
apply the workaround, which reads from the register and masks the
existing value with the new one.

Our intention was to write the value directly, without masking
it.

So far, this hasn't caused issues because we've been using a
register value that only enables a single CCS engine, typically
with an ID of '0'.

However, in upcoming patches, we will be utilizing multiple
engines, and it's crucial that we write the new value directly
without any masking.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index bfe6d8fc820f..f3082fad3f45 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2745,7 +2745,7 @@ static void ccs_engine_wa_mode(struct intel_engine_cs *engine, struct i915_wa_li
 	 * assign all slices to a single CCS. We will call it CCS mode 1
 	 */
 	mode = intel_gt_apply_ccs_mode(gt);
-	wa_masked_en(wal, XEHP_CCS_MODE, mode);
+	wa_add(wal, XEHP_CCS_MODE, 0, mode, mode, false);
 }
 
 /*
-- 
2.45.2


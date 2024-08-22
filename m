Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE2595BD29
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 19:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94F510EB84;
	Thu, 22 Aug 2024 17:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G5D0xXKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23DB10EB87;
 Thu, 22 Aug 2024 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724347732; x=1755883732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xBTBmpL924eHLaGaJlxfMEUf+QEa13q0knxeUnC7CKw=;
 b=G5D0xXKe3ojXJOKfC/BTRdraljmWXf9NKC5JxfiKS94EbmfDEJRztpGR
 ABevk1pUWIMzHUIhjkFR+2x923fWx+zT8zIfklHJc7I2d9siViHp0W+ZV
 yhCQR7oOfgE9uIvh9COkWhQqYdymhrio3j922Z9DHlzYh919EkxYN2AnL
 29GNQoPz5hvOX2+Nmnd15T1X9A8w2JhStGCATwryeHCmVuVa2CBzSqYO1
 5duQtWZn5BzNY5XlV/7mPv/bfCPuRMN49yE9iPSUTS5CSmZXcutCTibAv
 l1YjYqMu4RZ24vZCI/hTJ1tzrg1Q6RI77x7l+mXWSxqQ+qPVTD7X+mJlA A==;
X-CSE-ConnectionGUID: Ifsp+r9TQzaJCxWUvLkLew==
X-CSE-MsgGUID: asBqNQUFQWexTPDo0b7vpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33448234"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="33448234"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:28:51 -0700
X-CSE-ConnectionGUID: GitN2khwRdOI6eZuL2dABw==
X-CSE-MsgGUID: rgbEW/lESve1aucOheldPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="61501024"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.104])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:28:50 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v2 01/15] drm/i915/gt: Avoid using masked workaround for
 CCS_MODE setting
Date: Thu, 22 Aug 2024 19:28:18 +0200
Message-ID: <20240822172832.494994-2-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822172832.494994-1-andi.shyti@linux.intel.com>
References: <20240822172832.494994-1-andi.shyti@linux.intel.com>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE2B4F3B01
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE33610E91B;
	Tue,  5 Apr 2022 15:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517B510E8F7;
 Tue,  5 Apr 2022 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649171281; x=1680707281;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=UE2vxJt6gyQ89iSeWVNxs91pR4a1kC/8Q0bopc3qPtc=;
 b=T+V6U5kIIJIT5kCG+rgWtqdOHUlXbSltFCpdEZZ8zpEFTtBltmi4mKyA
 ZWA79ZLCz12S7f/bhEvLPlo4DazNbqgBJe9YgB+12xjiHFM7NkvzDOPw5
 jmezhmEqwUkTxkCpGSdOJ58rVdRDEdQeKvtxtPTiBD/bk8ZpuCQLgfSVY
 la4h6a4Ijo+oFVxq1umfqLcojJXZvnyPKOrepg4oWzzTmqBfAIOoGYxpd
 wmV9TaX0AlUNidiseBsSSakD8YHWz9zNkMY9spulb0xHfUNAtucNoFcfZ
 q1NePtHyzf9FPxz4MpgHvC+mXtiW/PPeuQooJ+pKdaJZ/IHT6w2PeeJCX g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="240706473"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="240706473"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:08:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="641644330"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 08:08:00 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v9 4/9] drm/i915/gt: Pass the -EINVAL when emit_pte doesn't
 update any PTE
Date: Tue,  5 Apr 2022 20:38:35 +0530
Message-Id: <20220405150840.29351-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220405150840.29351-1-ramalingam.c@intel.com>
References: <20220405150840.29351-1-ramalingam.c@intel.com>
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

When emit_pte doesn't update any PTE with return value as 0, interpret
it as -EINVAL.

v2:
  Add missing goto [Thomas]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_migrate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index e0f1c727662e..6378d4450e1a 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -577,7 +577,11 @@ intel_context_migrate_copy(struct intel_context *ce,
 
 		len = emit_pte(rq, &it_src, src_cache_level, src_is_lmem,
 			       src_offset, CHUNK_SZ);
-		if (len <= 0) {
+		if (!len) {
+			err = -EINVAL;
+			goto out_rq;
+		}
+		if (len < 0) {
 			err = len;
 			goto out_rq;
 		}
-- 
2.20.1


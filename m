Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47561EE8F8
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 18:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1016F6E516;
	Thu,  4 Jun 2020 16:58:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF26E516
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jun 2020 16:58:04 +0000 (UTC)
IronPort-SDR: GP5tgjrw5Yn5pkHMUqOxnMMZlE42Dk3Qft7igB85b1Mr74jk5SfT5Dw3jwsRqBQNiQHDwP1NNs
 EelL7f2B1+JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 09:58:04 -0700
IronPort-SDR: ZpOXk6CMB+qToRoj1dTNqOSH8Prm1rTPWYt6Ef20f2MUfvXKTrLptCynpPqPvarBm5e7wvsxjx
 bJ13ckYskE3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,472,1583222400"; d="scan'208";a="378471307"
Received: from ayazahma-nuc8i7beh.iind.intel.com ([10.145.162.59])
 by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2020 09:58:02 -0700
From: Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Fix reserve start and end for lmem of remote tiles
Date: Thu,  4 Jun 2020 22:25:51 +0530
Message-Id: <20200604165551.876191-1-ayaz.siddiqui@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/intel_region_lmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index d5ffef3bf5f6..d85da31f98c9 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -217,8 +217,8 @@ static int reserve_lowmem_region(struct intel_uncore *uncore,
 
 	get_tracedebug_region(uncore, &region_start, &region_size);
 	if (region_size) {
-		reserve_start = min(reserve_start, region_start);
-		reserve_end = max(reserve_end, region_start + region_size);
+		reserve_start = 0;
+		reserve_end = region_size;
 	}
 
 	if (!reserve_end)
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76165D145D2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 18:29:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D830810E427;
	Mon, 12 Jan 2026 17:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="2V/5Tk/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAF610E422
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
 References; bh=5qJ6ivCKl/Kqdt6u8K1Xgabi4HyljP4OKKRgzU3wYws=; b=2V/5Tk/fOM/Zq+
 ZhKEm/mLUweA9SZYhrKAT683oLz/ZZcJjaT5bvOnYbDCApM3Imn4/7h/CCB5SlcMmHvDDoe6+krqY
 vMJc1H6HcHWzgDRPoxBz8bKv0EBMh/0BmlRH75+rPO2zmQBvYsV7Un+AC9eYy/8TozFooDCGcWAy7
 6TfAJSYiuudNSzhvb/8rNk2oLHxfXTx5MPBEV2NnyAs1XTwqT1u6iv+Cdm6x9Sd1CiWDX2nYjN6SR
 jHzCQNnIX4oDm087jDGo1jXrhymkuAn8ukcWRnAx+jJvmvxY12Es34s7/Cb3GQZ550d2ChGoXlsSp
 xDXNniN8u/VihE9YQSrA==;
Received: from [167.98.27.226] (helo=rainbowdash)
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1vfLjC-0032Ht-Da; Mon, 12 Jan 2026 17:29:18 +0000
Received: from ben by rainbowdash with local (Exim 4.99.1)
 (envelope-from <ben@rainbowdash>) id 1vfLjC-00000002YPy-0e0Z;
 Mon, 12 Jan 2026 17:29:18 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 matt.coster@imgtec.com, frank.binns@imgtec.com,
 Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] drm/imagination: don't include pvr_rogue_fwif_check.h under
 sparse
Date: Mon, 12 Jan 2026 17:29:16 +0000
Message-Id: <20260112172916.608949-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
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

The checks in pvr_rogue_fwif_check.h trigger issues with sparse
as it may not decide to deal with structure definitions the same
way as the kernel.

There is nothing in pvr_rogue_fwif_check.h that needs to be checked
by sparse, so skip it to reduce the number of failed asserts from
sparse:

drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h:487:1: error: static assertion failed: "struct rogue_fwif_hwrtdata is incorrect size"

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
index 172886be4c82..1e4a74705e2f 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif.h
@@ -2183,6 +2183,8 @@ struct rogue_fwif_hwrtdata {
 #define PVR_SYNC_CHECKPOINT_SIGNALED 0x519   /* Checkpoint has signaled. */
 #define PVR_SYNC_CHECKPOINT_ERRORED 0xeff    /* Checkpoint has been errored. */
 
+#ifndef __CHECKER__
 #include "pvr_rogue_fwif_check.h"
+#endif
 
 #endif /* PVR_ROGUE_FWIF_H */
-- 
2.37.2.352.g3c44437643


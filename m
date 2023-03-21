Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B15D86C27DD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 03:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2A310E4D8;
	Tue, 21 Mar 2023 02:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF30410E399
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 02:09:55 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 3D621327B1A;
 Tue, 21 Mar 2023 02:09:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1679364594; bh=i4VR2soBGg3tsbnDctpe1r+sHFtp7IEhdgX+PsmEh0k=;
 h=From:To:Cc:Subject:Date:From;
 b=WLh2X0oB9p6HClrpRE/x5S2zuRXP7FLQKZJYjfrIyPjTLUFojNWASt8os5+LNQyF2
 vDqIKTjkVmcDDKf0GIwmNPuRa5I72/PTOa3GyukAr+w0vCGvrHX2lT3mKuCaVEXhr2
 J4dV6kSnAcpKX9Tbos0BWgCI3WrhbYufOwH+qdRpJ6rsYUo7SfjSprAmjOYuyo1DJk
 ECOg9KsvaMsL2GtxGGsYx03GwMN90looFPI3Esp9YSFgv9xjgKvO6P9XBiNGurnCHa
 qd82S5Us/cCpmbzWX7C4vYEuuqBMBXrTuoBDdrYcr3ePDTU4Bbq2Ulv6871M46o35a
 Au/7KNovU3oDA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vmwgfx: Drop mksstat_init_record fn as currently
 unused
Date: Mon, 20 Mar 2023 22:09:47 -0400
Message-Id: <20230321020949.335012-1-zack@kde.org>
X-Mailer: git-send-email 2.38.1
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: kernel test robot <lkp@intel.com>, banackm@vmware.com, krastevm@vmware.com,
 mombasawalam@vmware.com, iforbes@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

This internal helper handles a type of mksstat event counter
which is currently unused. Remove the routine to avoid compile
warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index e76976a95a1e..ca1a3fe44fa5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -702,32 +702,6 @@ static inline void hypervisor_ppn_remove(PPN64 pfn)
 /* Header to the text description of mksGuestStat instance descriptor */
 #define MKSSTAT_KERNEL_DESCRIPTION "vmwgfx"
 
-/**
- * mksstat_init_record: Initializes an MKSGuestStatCounter-based record
- * for the respective mksGuestStat index.
- *
- * @stat_idx: Index of the MKSGuestStatCounter-based mksGuestStat record.
- * @pstat: Pointer to array of MKSGuestStatCounterTime.
- * @pinfo: Pointer to array of MKSGuestStatInfoEntry.
- * @pstrs: Pointer to current end of the name/description sequence.
- * Return: Pointer to the new end of the names/description sequence.
- */
-
-static inline char *mksstat_init_record(mksstat_kern_stats_t stat_idx,
-	MKSGuestStatCounterTime *pstat, MKSGuestStatInfoEntry *pinfo, char *pstrs)
-{
-	char *const pstrd = pstrs + strlen(mksstat_kern_name_desc[stat_idx][0]) + 1;
-	strcpy(pstrs, mksstat_kern_name_desc[stat_idx][0]);
-	strcpy(pstrd, mksstat_kern_name_desc[stat_idx][1]);
-
-	pinfo[stat_idx].name.s = pstrs;
-	pinfo[stat_idx].description.s = pstrd;
-	pinfo[stat_idx].flags = MKS_GUEST_STAT_FLAG_NONE;
-	pinfo[stat_idx].stat.counter = (MKSGuestStatCounter *)&pstat[stat_idx];
-
-	return pstrd + strlen(mksstat_kern_name_desc[stat_idx][1]) + 1;
-}
-
 /**
  * mksstat_init_record_time: Initializes an MKSGuestStatCounterTime-based record
  * for the respective mksGuestStat index.
-- 
2.38.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839F3A887A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 20:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C63E6E3D0;
	Tue, 15 Jun 2021 18:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EX13-EDG-OU-002.vmware.com (ex13-edg-ou-002.vmware.com
 [208.91.0.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D036E439
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 18:23:41 +0000 (UTC)
Received: from sc9-mailhost1.vmware.com (10.113.161.71) by
 EX13-EDG-OU-002.vmware.com (10.113.208.156) with Microsoft SMTP Server id
 15.0.1156.6; Tue, 15 Jun 2021 11:23:38 -0700
Received: from vertex.localdomain (unknown [10.21.244.102])
 by sc9-mailhost1.vmware.com (Postfix) with ESMTP id 0E95B20271;
 Tue, 15 Jun 2021 11:23:39 -0700 (PDT)
From: Zack Rusin <zackr@vmware.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/5] drm/vmwgfx: Fix a bad merge in otable batch takedown
Date: Tue, 15 Jun 2021 14:23:35 -0400
Message-ID: <20210615182336.995192-4-zackr@vmware.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615182336.995192-1-zackr@vmware.com>
References: <20210615182336.995192-1-zackr@vmware.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (EX13-EDG-OU-002.vmware.com: zackr@vmware.com does not
 designate permitted sender hosts)
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
Cc: krastevm@vmware.com, sroland@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change
2ef4fb92363c ("drm/vmwgfx: Make sure bo's are unpinned before putting them back")
caused a conflict in one of the drm trees and the merge commit
68a32ba14177 ("Merge tag 'drm-next-2021-04-28' of git://anongit.freedesktop.org/drm/drm")
accidently re-added code that the original change was removing.
Fixed by removing the incorrect buffer unpin - it has already been unpinned
two lines above.

Fixes: 68a32ba14177 ("Merge tag 'drm-next-2021-04-28' of git://anongit.freedesktop.org/drm/drm")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_mob.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
index 895088924ce3..c8e578f63c9c 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
@@ -354,7 +354,6 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
 	ttm_bo_unpin(bo);
 	ttm_bo_unreserve(bo);
 
-	ttm_bo_unpin(batch->otable_bo);
 	ttm_bo_put(batch->otable_bo);
 	batch->otable_bo = NULL;
 }
-- 
2.30.2


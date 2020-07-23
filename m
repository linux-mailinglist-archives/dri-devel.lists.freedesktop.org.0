Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5189D22A950
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 09:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE636E836;
	Thu, 23 Jul 2020 07:04:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04556E2AF;
 Thu, 23 Jul 2020 03:26:20 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 70B83B62C633E077C39E;
 Thu, 23 Jul 2020 11:26:14 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 23 Jul 2020
 11:26:10 +0800
From: Li Heng <liheng40@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next 2/2] drm: Remove redundant NULL check
Date: Thu, 23 Jul 2020 11:27:43 +0800
Message-ID: <1595474863-33112-2-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
References: <1595474863-33112-1-git-send-email-liheng40@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Jul 2020 07:03:15 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below warnings reported by coccicheck:
./drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c:557:2-7: WARNING: NULL check before some freeing functions is not needed.

Fixes: 4d55b0dd1cdd ("drm/amd/display: Add DCN3 CLK_MGR")
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
index d94fdc5..d8af56a 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn30/dcn30_clk_mgr.c
@@ -553,8 +553,7 @@ void dcn3_clk_mgr_construct(
 
 void dcn3_clk_mgr_destroy(struct clk_mgr_internal *clk_mgr)
 {
-	if (clk_mgr->base.bw_params)
-		kfree(clk_mgr->base.bw_params);
+	kfree(clk_mgr->base.bw_params);
 
 	if (clk_mgr->wm_range_table)
 		dm_helpers_free_gpu_mem(clk_mgr->base.ctx, DC_MEM_ALLOC_TYPE_GART,
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

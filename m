Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE9A6FA296
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 10:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE1910E18D;
	Mon,  8 May 2023 08:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8D10E18D;
 Mon,  8 May 2023 08:51:48 +0000 (UTC)
X-UUID: 448e16397a6242399bf3f0072562a30b-20230508
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:6c58c0b9-9ae8-41b1-9b55-fb6474963e22, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-INFO: VERSION:1.1.22, REQID:6c58c0b9-9ae8-41b1-9b55-fb6474963e22, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-META: VersionHash:120426c, CLOUDID:bfb91a6b-2f20-4998-991c-3b78627e4938,
 B
 ulkID:230508165141N0GP7D3I,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 448e16397a6242399bf3f0072562a30b-20230508
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 812679255; Mon, 08 May 2023 16:51:40 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915: Fix memory leaks in function live_nop_switch
Date: Mon,  8 May 2023 16:50:15 +0800
Message-Id: <20230508085016.437836-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: intel-gfx@lists.freedesktop.org, Cong Liu <liucong2@kylinos.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Be sure to properly free the allocated memory before exiting
the live_nop_switch function.

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index a81fa6a20f5a..54eddbe7f510 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -59,7 +59,8 @@ static int live_nop_switch(void *arg)
 	ctx = kcalloc(nctx, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx) {
 		err = -ENOMEM;
-		goto out_file;
+		fput(file);
+		return err;
 	}
 
 	for (n = 0; n < nctx; n++) {
@@ -175,6 +176,7 @@ static int live_nop_switch(void *arg)
 
 out_file:
 	fput(file);
+	kfree(ctx);
 	return err;
 }
 
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

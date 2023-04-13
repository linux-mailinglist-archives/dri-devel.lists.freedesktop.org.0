Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD30F6E08F3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFF510EA66;
	Thu, 13 Apr 2023 08:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D3D810EA5B;
 Thu, 13 Apr 2023 08:02:27 +0000 (UTC)
X-UUID: 523ffd16c1d74ba2bebaa48baf1044d8-20230413
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:e27458f9-b223-4a29-a75f-dc1628b0353d, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:1
X-CID-INFO: VERSION:1.1.22, REQID:e27458f9-b223-4a29-a75f-dc1628b0353d, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:1,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:1
X-CID-META: VersionHash:120426c, CLOUDID:952432a1-8fcb-430b-954a-ba3f00fa94a5,
 B
 ulkID:230413111352DVZVW4B9,BulkQuantity:2,Recheck:0,SF:24|17|19|43|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
 :0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 523ffd16c1d74ba2bebaa48baf1044d8-20230413
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1709036445; Thu, 13 Apr 2023 15:57:06 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915: Fix memory leaks in i915 selftests
Date: Thu, 13 Apr 2023 15:55:26 +0800
Message-Id: <20230413075526.221068-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <874jpkckxw.fsf@intel.com>
References: <874jpkckxw.fsf@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Apr 2023 08:33:23 +0000
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
Cc: matthew.brost@intel.com, tvrtko.ursulin@linux.intel.com, mchehab@kernel.org,
 andrzej.hajda@intel.com, intel-gfx@lists.freedesktop.org,
 jonathan.cavitt@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 rodrigo.vivi@intel.com, liucong2@kylinos.cn, matthew.auld@intel.com,
 andi.shyti@linux.intel.com, gwan-gyeong.mun@intel.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes memory leaks on error escapes in function fake_get_pages

Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 5361ce70d3f2..154801f1c468 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -69,8 +69,10 @@ static int fake_get_pages(struct drm_i915_gem_object *obj)
 
 	rem = round_up(obj->base.size, BIT(31)) >> 31;
 	/* restricted by sg_alloc_table */
-	if (overflows_type(rem, unsigned int))
+	if (overflows_type(rem, unsigned int)) {
+		kfree(pages);
 		return -E2BIG;
+	}
 
 	if (sg_alloc_table(pages, rem, GFP)) {
 		kfree(pages);
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

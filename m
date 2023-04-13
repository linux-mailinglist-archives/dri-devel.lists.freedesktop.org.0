Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0534E6E08F9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8F010EA6D;
	Thu, 13 Apr 2023 08:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Thu, 13 Apr 2023 03:19:05 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C6310EA17;
 Thu, 13 Apr 2023 03:19:05 +0000 (UTC)
X-UUID: 2af2d65a6c6840df86ab547bf360109b-20230413
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:c30541db-2ea1-4af6-9267-42766adcc549, IP:5,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:8
X-CID-INFO: VERSION:1.1.22, REQID:c30541db-2ea1-4af6-9267-42766adcc549, IP:5,
 URL
 :0,TC:0,Content:-5,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
 release,TS:8
X-CID-META: VersionHash:120426c, CLOUDID:1255e483-cd9c-45f5-8134-710979e3df0e,
 B
 ulkID:230413111352DVZVW4B9,BulkQuantity:0,Recheck:0,SF:19|44|38|24|16|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 2af2d65a6c6840df86ab547bf360109b-20230413
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 30789537; Thu, 13 Apr 2023 11:13:51 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Fix memory leaks in i915 selftests
Date: Thu, 13 Apr 2023 11:13:49 +0800
Message-Id: <20230413031349.9026-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: Cong Liu <liucong2@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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

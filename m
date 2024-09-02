Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B43C96889F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 15:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C844810E091;
	Mon,  2 Sep 2024 13:22:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1227 seconds by postgrey-1.36 at gabe;
 Mon, 02 Sep 2024 13:22:13 UTC
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C57210E091;
 Mon,  2 Sep 2024 13:22:13 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.44])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Wy82114g7z1HHyy;
 Mon,  2 Sep 2024 20:58:17 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id 86B571400D4;
 Mon,  2 Sep 2024 21:01:42 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 21:01:42 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <jani.nikula@linux.intel.com>, <joonas.lahtinen@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <tursulin@ursulin.net>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
CC: <lihongbo22@huawei.com>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/i915/gt: Make use of __assign_bit() API
Date: Mon, 2 Sep 2024 21:10:08 +0800
Message-ID: <20240902131008.2982156-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500022.china.huawei.com (7.185.36.66)
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

We have for some time the __assign_bit() API to replace
open coded
    if (foo)
        __set_bit(n, bar);
    else
        __clear_bit(n, bar);

Use this API to simplify the code. No functional change
intended.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
index 0ffba50981e3..4380e6f9d0ab 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c
@@ -827,10 +827,7 @@ i915_gem_object_save_bit_17_swizzle(struct drm_i915_gem_object *obj,
 	i = 0;
 
 	for_each_sgt_page(page, sgt_iter, pages) {
-		if (page_to_phys(page) & (1 << 17))
-			__set_bit(i, obj->bit_17);
-		else
-			__clear_bit(i, obj->bit_17);
+		__assign_bit(i, obj->bit_17, page_to_phys(page) & (1 << 17));
 		i++;
 	}
 }
-- 
2.34.1


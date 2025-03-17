Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066DA63C48
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 03:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593DA10E075;
	Mon, 17 Mar 2025 02:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.216.63.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345C110E075
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 02:58:03 +0000 (UTC)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4ZGKQv5KDCz8R042;
 Mon, 17 Mar 2025 10:57:59 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
 by mse-fl1.zte.com.cn with SMTP id 52H2vif5071879;
 Mon, 17 Mar 2025 10:57:44 +0800 (+08)
 (envelope-from feng.wei8@zte.com.cn)
Received: from mapi (xaxapp04[null]) by mapi (Zmail) with MAPI id mid32;
 Mon, 17 Mar 2025 10:57:45 +0800 (CST)
Date: Mon, 17 Mar 2025 10:57:45 +0800 (CST)
X-Zmail-TransId: 2afb67d78fa9634-63c34
X-Mailer: Zmail v1.0
Message-ID: <20250317105745891-NnPPMd8T0guyJikMgM6p@zte.com.cn>
Mime-Version: 1.0
From: <feng.wei8@zte.com.cn>
To: <alexander.deucher@amd.com>
Cc: <christian.koenig@amd.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBkcm0vcmFkZW9uL3V2ZDogUmVwbGFjZSBuZXN0ZWQgbWF4KCkgd2l0aCBzaW5nbGUgbWF4Mygp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52H2vif5071879
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67D78FB7.000/4ZGKQv5KDCz8R042
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

From: FengWei <feng.wei8@zte.com.cn>

Use max3() macro instead of nesting max() to simplify the return
statement.

Signed-off-by: FengWei <feng.wei8@zte.com.cn>
---
 drivers/gpu/drm/radeon/radeon_uvd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 058a1c8451b2..ded5747a58d1 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -961,7 +961,7 @@ int radeon_uvd_calc_upll_dividers(struct radeon_device *rdev,
 	unsigned optimal_score = ~0;

 	/* loop through vco from low to high */
-	vco_min = max(max(vco_min, vclk), dclk);
+	vco_min = max3(vco_min, vclk, dclk);
 	for (vco_freq = vco_min; vco_freq <= vco_max; vco_freq += 100) {

 		uint64_t fb_div = (uint64_t)vco_freq * fb_factor;
-- 
2.25.1

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B76968366
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCF510E053;
	Mon,  2 Sep 2024 09:35:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C608310E053
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 09:35:44 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wy3Tq0jpqzgYfn;
 Mon,  2 Sep 2024 17:33:35 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
 by mail.maildlp.com (Postfix) with ESMTPS id 55A051800A0;
 Mon,  2 Sep 2024 17:35:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Sep
 2024 17:35:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <boris.brezillon@collabora.com>, <steven.price@arm.com>,
 <liviu.dudau@arm.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2] drm/panthor: Use the BITS_PER_LONG macro
Date: Mon, 2 Sep 2024 17:44:04 +0800
Message-ID: <20240902094404.1943710-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemh500013.china.huawei.com (7.202.181.146)
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

sizeof(unsigned long) * 8 is the number of bits in an unsigned long
variable, replace it with BITS_PER_LONG macro to make them simpler.

And fix the warning:
	WARNING: Comparisons should place the constant on the right side of the test
	#23: FILE: drivers/gpu/drm/panthor/panthor_mmu.c:2696:
	+       if (BITS_PER_LONG < va_bits) {

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Also fix for below mmu_features.
- Remoove -next.
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fa0a002b1016..7b1c345669b7 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2693,9 +2693,9 @@ int panthor_mmu_init(struct panthor_device *ptdev)
 	 * which passes iova as an unsigned long. Patch the mmu_features to reflect this
 	 * limitation.
 	 */
-	if (sizeof(unsigned long) * 8 < va_bits) {
+	if (va_bits > BITS_PER_LONG) {
 		ptdev->gpu_info.mmu_features &= ~GENMASK(7, 0);
-		ptdev->gpu_info.mmu_features |= sizeof(unsigned long) * 8;
+		ptdev->gpu_info.mmu_features |= BITS_PER_LONG;
 	}
 
 	return drmm_add_action_or_reset(&ptdev->base, panthor_mmu_release_wq, mmu->vm.wq);
-- 
2.34.1


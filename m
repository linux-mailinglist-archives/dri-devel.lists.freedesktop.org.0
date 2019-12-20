Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A236F1292B4
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0A66E1F6;
	Mon, 23 Dec 2019 08:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 906 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 02:10:44 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ED16EBB9;
 Fri, 20 Dec 2019 02:10:43 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0C1F689C28CBC3381A9E;
 Fri, 20 Dec 2019 09:55:35 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 09:55:25 +0800
From: chenmaodong <chenmaodong@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH ] drm/radeon: Fix potential buffer overflow in
 ci_set_mc_special_registers()
Date: Fri, 20 Dec 2019 09:55:05 +0800
Message-ID: <1576806905-4590-1-git-send-email-chenmaodong@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: chenmaodong@huawei.com, hushiyuan@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 zhangpan26@huawei.com, wuxu.wu@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The length of table->mc_reg_address is SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE.

In ci_set_mc_special_registers(), the boundary checking

here("if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)") allows 'j' equal to

SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE which can easily cause the 

table->mc_reg_address to read out of bounds. 

To solve this problem, we change ">" to ">=" and check this boundary 

of table->mc_reg_address after "pi->mem_gddr5" is false.

Signed-off-by: chenmaodong <chenmaodong@huawei.com>
---
 drivers/gpu/drm/radeon/ci_dpm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
index a97294a..42ef745a 100644
--- a/drivers/gpu/drm/radeon/ci_dpm.c
+++ b/drivers/gpu/drm/radeon/ci_dpm.c
@@ -4364,10 +4364,10 @@ static int ci_set_mc_special_registers(struct radeon_device *rdev,
 					table->mc_reg_table_entry[k].mc_data[j] |= 0x100;
 			}
 			j++;
-			if (j > SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
-				return -EINVAL;
 
 			if (!pi->mem_gddr5) {
+				if (j >= SMU7_DISCRETE_MC_REGISTER_ARRAY_SIZE)
+					return -EINVAL;
 				table->mc_reg_address[j].s1 = MC_PMG_AUTO_CMD >> 2;
 				table->mc_reg_address[j].s0 = MC_PMG_AUTO_CMD >> 2;
 				for (k = 0; k < table->num_entries; k++) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

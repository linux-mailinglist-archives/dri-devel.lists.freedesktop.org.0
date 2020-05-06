Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A21C8310
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA2E6E92E;
	Thu,  7 May 2020 07:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6908989A;
 Wed,  6 May 2020 14:26:31 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 04F18B72BC3D72B57A71;
 Wed,  6 May 2020 22:26:27 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 22:26:19 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/14] drm/radeon: remove comparison to bool in ni_dpm.c
Date: Wed, 6 May 2020 22:33:15 +0800
Message-ID: <20200506143326.66467-4-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20200506143326.66467-1-zhengbin13@huawei.com>
References: <20200506143326.66467-1-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 07 May 2020 07:05:09 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/radeon/ni_dpm.c:807:5-26: WARNING: Comparison to bool
drivers/gpu/drm/radeon/ni_dpm.c:2466:5-36: WARNING: Comparison to boo
drivers/gpu/drm/radeon/ni_dpm.c:3146:5-22: WARNING: Comparison to bool

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/radeon/ni_dpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/ni_dpm.c b/drivers/gpu/drm/radeon/ni_dpm.c
index b57c37ddd164..66c48ce107a5 100644
--- a/drivers/gpu/drm/radeon/ni_dpm.c
+++ b/drivers/gpu/drm/radeon/ni_dpm.c
@@ -804,7 +804,7 @@ static void ni_apply_state_adjust_rules(struct radeon_device *rdev,
 	else
 		max_limits = &rdev->pm.dpm.dyn_state.max_clock_voltage_on_dc;

-	if (rdev->pm.dpm.ac_power == false) {
+	if (!rdev->pm.dpm.ac_power) {
 		for (i = 0; i < ps->performance_level_count; i++) {
 			if (ps->performance_levels[i].mclk > max_limits->mclk)
 				ps->performance_levels[i].mclk = max_limits->mclk;
@@ -2463,7 +2463,7 @@ static int ni_populate_power_containment_values(struct radeon_device *rdev,
 	u32 power_boost_limit;
 	u8 max_ps_percent;

-	if (ni_pi->enable_power_containment == false)
+	if (!ni_pi->enable_power_containment)
 		return 0;

 	if (state->performance_level_count == 0)
@@ -3143,7 +3143,7 @@ static int ni_initialize_smc_cac_tables(struct radeon_device *rdev)
 	int i, ret;
 	u32 reg;

-	if (ni_pi->enable_cac == false)
+	if (!ni_pi->enable_cac)
 		return 0;

 	cac_tables = kzalloc(sizeof(PP_NIslands_CACTABLES), GFP_KERNEL);
--
2.26.0.106.g9fadedd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

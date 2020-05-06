Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE41C8318
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 09:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F686E93C;
	Thu,  7 May 2020 07:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2970898A8;
 Wed,  6 May 2020 14:26:35 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1174A37C044E693F88CE;
 Wed,  6 May 2020 22:26:32 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 22:26:23 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/14] drm/radeon: remove comparison to bool in si_dpm.c
Date: Wed, 6 May 2020 22:33:26 +0800
Message-ID: <20200506143326.66467-15-zhengbin13@huawei.com>
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

drivers/gpu/drm/radeon/si_dpm.c:1885:7-44: WARNING: Comparison to bool
drivers/gpu/drm/radeon/si_dpm.c:2463:5-22: WARNING: Comparison to bool
drivers/gpu/drm/radeon/si_dpm.c:3015:5-26: WARNING: Comparison to bool

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/radeon/si_dpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/radeon/si_dpm.c b/drivers/gpu/drm/radeon/si_dpm.c
index a167e1c36d24..98e288e5d8c9 100644
--- a/drivers/gpu/drm/radeon/si_dpm.c
+++ b/drivers/gpu/drm/radeon/si_dpm.c
@@ -1882,7 +1882,7 @@ static void si_initialize_powertune_defaults(struct radeon_device *rdev)
 			update_dte_from_pl2 = true;
 			break;
 		default:
-			if (si_pi->dte_data.enable_dte_by_default == true)
+			if (si_pi->dte_data.enable_dte_by_default)
 				DRM_ERROR("DTE is not enabled!\n");
 			break;
 		}
@@ -2460,7 +2460,7 @@ static int si_initialize_smc_dte_tables(struct radeon_device *rdev)
 	if (dte_data == NULL)
 		si_pi->enable_dte = false;

-	if (si_pi->enable_dte == false)
+	if (!si_pi->enable_dte)
 		return 0;

 	if (dte_data->k <= 0)
@@ -3012,7 +3012,7 @@ static void si_apply_state_adjust_rules(struct radeon_device *rdev,
 		if (ps->performance_levels[i].vddc > ps->performance_levels[i+1].vddc)
 			ps->performance_levels[i].vddc = ps->performance_levels[i+1].vddc;
 	}
-	if (rdev->pm.dpm.ac_power == false) {
+	if (!rdev->pm.dpm.ac_power) {
 		for (i = 0; i < ps->performance_level_count; i++) {
 			if (ps->performance_levels[i].mclk > max_limits->mclk)
 				ps->performance_levels[i].mclk = max_limits->mclk;
--
2.26.0.106.g9fadedd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

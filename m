Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AD412A237
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2019 15:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B1D6E7DB;
	Tue, 24 Dec 2019 14:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DA56E08A;
 Tue, 24 Dec 2019 03:20:33 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 5EC36E79F2ED3EA6C7C0;
 Tue, 24 Dec 2019 11:20:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 24 Dec 2019
 11:20:24 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/8] drm/amd/display: use true,
 false for bool variable in display_mode_vba_21.c
Date: Tue, 24 Dec 2019 11:27:39 +0800
Message-ID: <1577158063-76188-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
References: <1577158063-76188-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 24 Dec 2019 14:29:55 +0000
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

drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:4124:3-28: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:4128:5-30: WARNING: Assignment of 0/1 to bool variable
drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c:5207:3-37: WARNING: Assignment of 0/1 to bool variable

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
index 945291d..b6d3466 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_mode_vba_21.c
@@ -4121,11 +4121,11 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 	}
 	for (i = 0; i <= mode_lib->vba.soc.num_states; i++) {
 		for (k = 0; k <= mode_lib->vba.NumberOfActivePlanes - 1; k++) {
-			locals->RequiresDSC[i][k] = 0;
+			locals->RequiresDSC[i][k] = false;
 			locals->RequiresFEC[i][k] = 0;
 			if (mode_lib->vba.BlendingAndTiming[k] == k) {
 				if (mode_lib->vba.Output[k] == dm_hdmi) {
-					locals->RequiresDSC[i][k] = 0;
+					locals->RequiresDSC[i][k] = false;
 					locals->RequiresFEC[i][k] = 0;
 					locals->OutputBppPerState[i][k] = TruncToValidBPP(
 							dml_min(600.0, mode_lib->vba.PHYCLKPerState[i]) / mode_lib->vba.PixelClockBackEnd[k] * 24,
@@ -5204,7 +5204,7 @@ void dml21_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_l
 			mode_lib->vba.ODMCombineEnabled[k] =
 					locals->ODMCombineEnablePerState[mode_lib->vba.VoltageLevel][k];
 		} else {
-			mode_lib->vba.ODMCombineEnabled[k] = 0;
+			mode_lib->vba.ODMCombineEnabled[k] = false;
 		}
 		mode_lib->vba.DSCEnabled[k] =
 				locals->RequiresDSC[mode_lib->vba.VoltageLevel][k];
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

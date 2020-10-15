Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A0428ED64
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 09:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757CD6E06B;
	Thu, 15 Oct 2020 07:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17613.qiye.163.com (mail-m17613.qiye.163.com
 [59.111.176.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3006EC13
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 02:42:53 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17613.qiye.163.com (Hmail) with ESMTPA id 6E7D648299B;
 Thu, 15 Oct 2020 10:42:46 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, Qiu Wenbo <qiuwenbo@phytium.com.cn>,
 YueHaibing <yuehaibing@huawei.com>, Chen Wandun <chenwandun@huawei.com>,
 yu kuai <yukuai3@huawei.com>, Bernard Zhao <bernard@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove unnecessary conversion from bool value to bool
Date: Wed, 14 Oct 2020 19:42:30 -0700
Message-Id: <20201015024237.25998-1-bernard@vivo.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUxCT0pDSk9OTB5OVkpNS0lMSUJMTU1MT0NVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS09ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6My46Ezo6DD8eDT5LTS0RMA1J
 EykwCzhVSlVKTUtJTElCTE1MSkxDVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSEpDSzcG
X-HM-Tid: 0a752a236f1e93bakuws6e7d648299b
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:08:24 +0000
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In functions vegam_is_dpm_running & vegam_populate_avfs_parameters,
maybe there is no need to conver bool condition to bool variable
or bool return value.
This change is to make the code a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
index 0ecc18b55ffb..32ca472f58a6 100644
--- a/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/powerplay/smumgr/vegam_smumgr.c
@@ -296,8 +296,9 @@ static int vegam_process_firmware_header(struct pp_hwmgr *hwmgr)
 static bool vegam_is_dpm_running(struct pp_hwmgr *hwmgr)
 {
 	return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
-			CGS_IND_REG__SMC, FEATURE_STATUS, VOLTAGE_CONTROLLER_ON))
-			? true : false;
+					     CGS_IND_REG__SMC,
+					     FEATURE_STATUS,
+					     VOLTAGE_CONTROLLER_ON));
 }
 
 static uint32_t vegam_get_mac_definition(uint32_t value)
@@ -1661,7 +1662,7 @@ static int vegam_populate_avfs_parameters(struct pp_hwmgr *hwmgr)
 				(avfs_params.ucEnableGB_FUSE_TABLE_CKSON << AVFSGB0_Vdroop_Enable_SHIFT) |
 				(avfs_params.ucEnableGB_FUSE_TABLE_CKSOFF << AVFSGB1_Vdroop_Enable_SHIFT);
 		data->apply_avfs_cks_off_voltage =
-				(avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1) ? true : false;
+				(avfs_params.ucEnableApplyAVFS_CKS_OFF_Voltage == 1);
 	}
 	return result;
 }
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

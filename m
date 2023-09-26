Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C35F7AE556
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 07:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CB710E34E;
	Tue, 26 Sep 2023 05:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A826710E350;
 Tue, 26 Sep 2023 05:57:38 +0000 (UTC)
X-UUID: 3c5ed56bf6c94e699b45d29275fdf15f-20230926
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:62cae887-a010-406f-b0cb-62e849e7dd42, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:15
X-CID-INFO: VERSION:1.1.31, REQID:62cae887-a010-406f-b0cb-62e849e7dd42, IP:5,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:15
X-CID-META: VersionHash:0ad78a4, CLOUDID:ed0b47bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:230926135702CTO4OX2J,BulkQuantity:0,Recheck:0,SF:24|17|19|44|38|102,
 TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
 OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 3c5ed56bf6c94e699b45d29275fdf15f-20230926
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 1803900476; Tue, 26 Sep 2023 13:57:02 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/amd/pm: Fix warn: missing error code in
 smu_v13_0_0_check_ecc_table_support()
Date: Tue, 26 Sep 2023 13:56:59 +0800
Message-Id: <20230926055700.119576-1-liucong2@kylinos.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Cong Liu <liucong2@kylinos.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fixes a smatch warning:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_0_ppt.c:2868
smu_v13_0_0_check_ecc_table_support() warn: missing error code? 'ret'

This warning is caused by the fact that this function returns the value of
the variable ret. However, the value of ret is not explicitly set in the
function. This patch fixes the warning by explicitly setting the value of
ret to 0 if the device is supported

Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index 9ac2be5627d9..cf832cef2b0a 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -2863,11 +2863,11 @@ static int smu_v13_0_0_check_ecc_table_support(struct smu_context *smu)
 	if (ret)
 		return -EOPNOTSUPP;
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 10)) &&
-		(smu_version >= SUPPORT_ECCTABLE_SMU_13_0_10_VERSION))
-		return ret;
-	else
+	if ((adev->ip_versions[MP1_HWIP][0] != IP_VERSION(13, 0, 10)) &&
+		(smu_version < SUPPORT_ECCTABLE_SMU_13_0_10_VERSION))
 		return -EOPNOTSUPP;
+
+	return 0;
 }
 
 static ssize_t smu_v13_0_0_get_ecc_info(struct smu_context *smu,
-- 
2.34.1


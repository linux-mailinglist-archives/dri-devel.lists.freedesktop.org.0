Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F37AE553
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 07:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4804810E34C;
	Tue, 26 Sep 2023 05:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF62A10E34C;
 Tue, 26 Sep 2023 05:56:40 +0000 (UTC)
X-UUID: 48b130231b3f480fa2b389aa17cc4c13-20230926
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31, REQID:274d52f7-406d-450b-9626-9226bea3d323, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-10
X-CID-INFO: VERSION:1.1.31, REQID:274d52f7-406d-450b-9626-9226bea3d323, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-10
X-CID-META: VersionHash:0ad78a4, CLOUDID:710a47bf-14cc-44ca-b657-2d2783296e72,
 B
 ulkID:23092613562995M22TSX,BulkQuantity:0,Recheck:0,SF:19|44|38|24|17|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 48b130231b3f480fa2b389aa17cc4c13-20230926
X-User: liucong2@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <liucong2@kylinos.cn>) (Generic MTA)
 with ESMTP id 827163063; Tue, 26 Sep 2023 13:56:29 +0800
From: Cong Liu <liucong2@kylinos.cn>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Fix null pointer dereference in error
 message
Date: Tue, 26 Sep 2023 13:56:17 +0800
Message-Id: <20230926055618.119195-1-liucong2@kylinos.cn>
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

This patch fixes a null pointer dereference in the error message that is
printed when the Display Core (DC) fails to initialize. The original
message includes the DC version number, which is undefined if the DC is
not initialized.

Fixes: 9788d087caff ("drm/amd/display: improve the message printed when loading DC")
Signed-off-by: Cong Liu <liucong2@kylinos.cn>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8e98dda1e084..bf52a909f558 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1703,8 +1703,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 		DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
 			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
 	} else {
-		DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
-			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
+		DRM_INFO("Display Core failed to initialize with v%s!\n", DC_VER);
 		goto error;
 	}
 
-- 
2.34.1


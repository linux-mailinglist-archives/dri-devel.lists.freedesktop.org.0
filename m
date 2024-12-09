Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD6E9E8E09
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F110610E683;
	Mon,  9 Dec 2024 08:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 323 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2024 05:44:17 UTC
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B045410E027;
 Mon,  9 Dec 2024 05:44:17 +0000 (UTC)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B95WOwX032192;
 Sun, 8 Dec 2024 21:43:51 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com
 [147.11.82.252])
 by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1s0vg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sun, 08 Dec 2024 21:43:51 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 8 Dec 2024 21:43:50 -0800
Received: from pek-lpg-core1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 8 Dec 2024 21:43:45 -0800
From: <jianqi.ren.cn@windriver.com>
To: <wayne.lin@amd.com>, <gregkh@linuxfoundation.org>
CC: <stable@vger.kernel.org>, <harry.wentland@amd.com>, <sunpeng.li@amd.com>, 
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <Jerry.Zuo@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <sashal@kernel.org>, <alex.hung@amd.com>, <mario.limonciello@amd.com>,
 <chiahsuan.chung@amd.com>, <hersenxs.wu@amd.com>,
 <n.zhandarovich@fintech.ru>, <shenshih@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <hanghong.ma@amd.com>
Subject: [PATCH 6.1.y] drm/amd/display: fix NULL checks for adev->dm.dc in
 amdgpu_dm_fini()
Date: Mon, 9 Dec 2024 14:41:37 +0800
Message-ID: <20241209064137.3427197-1-jianqi.ren.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: I0v3URgaKEKwIv5CaXji--rd3ww9F4fW
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=67568397 cx=c_pps
 a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17
 a=RZcAm9yDv7YA:10 a=DFC7gQDcAAAA:8 a=HH5vDtPzAAAA:8 a=zd2uoN0lAAAA:8
 a=t7CeM3EgAAAA:8 a=TusaAkCut-tyimdG5pgA:9
 a=6mkBMmtgJpxIRZlSFNLW:22 a=QM_-zKB-Ew0MsOlNKMB5:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: I0v3URgaKEKwIv5CaXji--rd3ww9F4fW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-09_02,2024-12-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412090045
X-Mailman-Approved-At: Mon, 09 Dec 2024 08:56:02 +0000
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

From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

[ Upstream commit 2a3cfb9a24a28da9cc13d2c525a76548865e182c ]

Since 'adev->dm.dc' in amdgpu_dm_fini() might turn out to be NULL
before the call to dc_enable_dmub_notifications(), check
beforehand to ensure there will not be a possible NULL-ptr-deref
there.

Also, since commit 1e88eb1b2c25 ("drm/amd/display: Drop
CONFIG_DRM_AMD_DC_HDCP") there are two separate checks for NULL in
'adev->dm.dc' before dc_deinit_callbacks() and dc_dmub_srv_destroy().
Clean up by combining them all under one 'if'.

Found by Linux Verification Center (linuxtesting.org) with static
analysis tool SVACE.

Fixes: 81927e2808be ("drm/amd/display: Support for DMUB AUX")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Jianqi Ren <jianqi.ren.cn@windriver.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 8dc0f70df24f..7b4d44dcb343 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1882,14 +1882,14 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		dc_deinit_callbacks(adev->dm.dc);
 #endif
 
-	if (adev->dm.dc)
+	if (adev->dm.dc) {
 		dc_dmub_srv_destroy(&adev->dm.dc->ctx->dmub_srv);
-
-	if (dc_enable_dmub_notifications(adev->dm.dc)) {
-		kfree(adev->dm.dmub_notify);
-		adev->dm.dmub_notify = NULL;
-		destroy_workqueue(adev->dm.delayed_hpd_wq);
-		adev->dm.delayed_hpd_wq = NULL;
+		if (dc_enable_dmub_notifications(adev->dm.dc)) {
+			kfree(adev->dm.dmub_notify);
+			adev->dm.dmub_notify = NULL;
+			destroy_workqueue(adev->dm.delayed_hpd_wq);
+			adev->dm.delayed_hpd_wq = NULL;
+		}
 	}
 
 	if (adev->dm.dmub_bo)
-- 
2.25.1


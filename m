Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8569B404C
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 03:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2B510E58B;
	Tue, 29 Oct 2024 02:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5571D10E58B;
 Tue, 29 Oct 2024 02:17:49 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.234])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xcv4w0FmBz1jw4v;
 Tue, 29 Oct 2024 10:16:16 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
 by mail.maildlp.com (Postfix) with ESMTPS id 35F62140391;
 Tue, 29 Oct 2024 10:17:46 +0800 (CST)
Received: from lihuafei.huawei.com (10.90.53.74) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 10:17:45 +0800
From: Li Huafei <lihuafei1@huawei.com>
To: <alexander.deucher@amd.com>, <lijo.lazar@amd.com>
CC: <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Hawking.Zhang@amd.com>, <yifan1.zhang@amd.com>,
 <Likun.Gao@amd.com>, <Tim.Huang@amd.com>, <pratap.nirujogi@amd.com>,
 <victorchengchi.lu@amd.com>, <Jun.Ma2@amd.com>, <le.ma@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <lihuafei1@huawei.com>
Subject: [PATCH v2] drm/amdgpu: Fix possible NULL pointer dereference
Date: Tue, 29 Oct 2024 18:18:39 +0800
Message-ID: <20241029101839.2605713-1-lihuafei1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.74]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500004.china.huawei.com (7.202.181.242)
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

Fix the potential NULL pointer dereference on mem_ranges in
amdgpu_discovery_get_nps_info(). Additionally, assign the output
parameters nps_type and range_cnt after the kvzalloc() call to prevent
modifying the output parameters in case of an error return.

Fixes: b194d21b9bcc ("drm/amdgpu: Use NPS ranges from discovery table")
Signed-off-by: Li Huafei <lihuafei1@huawei.com>
---
Changes in v2:
 - kvzalloc() call uses 'nps_info->v1.count' instead of '*range_cnt'
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
index 4bd61c169ca8..9a0b1b208a9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
@@ -1757,11 +1757,13 @@ int amdgpu_discovery_get_nps_info(struct amdgpu_device *adev,
 
 	switch (le16_to_cpu(nps_info->v1.header.version_major)) {
 	case 1:
-		*nps_type = nps_info->v1.nps_type;
-		*range_cnt = nps_info->v1.count;
 		mem_ranges = kvzalloc(
-			*range_cnt * sizeof(struct amdgpu_gmc_memrange),
+			nps_info->v1.count * sizeof(struct amdgpu_gmc_memrange),
 			GFP_KERNEL);
+		if (!mem_ranges)
+			return -ENOMEM;
+		*nps_type = nps_info->v1.nps_type;
+		*range_cnt = nps_info->v1.count;
 		for (i = 0; i < *range_cnt; i++) {
 			mem_ranges[i].base_address =
 				nps_info->v1.instance_info[i].base_address;
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E2670B68C
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E375610E25B;
	Mon, 22 May 2023 07:30:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5327610E25B;
 Mon, 22 May 2023 07:30:29 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34M00ooI011286; Mon, 22 May 2023 07:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=A5ZncwB04NjzcMemMMWye/LhgkT9LJyEStC1Nr1FzwI=;
 b=ceRFdvS6XD5HqLo3PdevQNl4QthpRYj6UIaBLjGU3PhxQqXGh2hOIzYSPOY8VdgtQGb4
 ipGli3qfNhAviNlAWCNrhED4qFtu0OoIs3H6S6sZzlen1ke2MdSiZJNJz9XWKGWfrrLo
 TZH3C5+AkB5hFU3K6WvdkyxrlwUsYBcHQnZtRFf1ehveAkccWWjz45nTMuZC/wqnyK9a
 zc4hVsKRPj2sYGUSBsCjAGjUFu7d04GLS5ZgSGMBX3Qpzvfoo5yW+uNEWGL86zBNLbRH
 u/ndrNQHVieq/VEkYlvNGFULnm36k0g/MVZ7OB0WPG/M96NZsCZNByuVWrIPLPQVUuPG UA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qpp3mj1u3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 07:30:24 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 34M6M7oP023566; Mon, 22 May 2023 07:30:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3qqk8skeds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 May 2023 07:30:22 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34M7OKLu026055;
 Mon, 22 May 2023 07:30:22 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3qqk8skeat-1; Mon, 22 May 2023 07:30:21 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Le Ma <le.ma@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Mukul Joshi <mukul.joshi@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>,
 Graham Sider <Graham.Sider@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH next] drm/amdgpu: Fix unsigned comparison with zero in
 gmc_v9_0_process_interrupt()
Date: Mon, 22 May 2023 00:30:15 -0700
Message-Id: <20230522073017.1782984-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-22_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305220063
X-Proofpoint-ORIG-GUID: xoDToq4BCRbl3iSJI_dyjEWrldxaTQAv
X-Proofpoint-GUID: xoDToq4BCRbl3iSJI_dyjEWrldxaTQAv
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
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, harshit.m.mogalapalli@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch warns:
	drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:579:
	unsigned 'xcc_id' is never less than zero.

gfx_v9_4_3_ih_to_xcc_inst() returns negative numbers as well.
Fix this by changing type of xcc_id to int.

Fixes: faf96b9b602d ("drm/amdgpu: correct the vmhub index when page fault occurs")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is from static analysis, only compile tested.
---
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index f70e666cecf2..1e8b2aaa48c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -557,8 +557,8 @@ static int gmc_v9_0_process_interrupt(struct amdgpu_device *adev,
 	const char *hub_name;
 	u64 addr;
 	uint32_t cam_index = 0;
-	int ret;
-	uint32_t node_id, xcc_id = 0;
+	int ret, xcc_id = 0;
+	uint32_t node_id;
 
 	node_id = entry->node_id;
 
-- 
2.38.1


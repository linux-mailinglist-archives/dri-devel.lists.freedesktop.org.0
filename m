Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0DC895669
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 16:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE7710F698;
	Tue,  2 Apr 2024 14:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="oUlVIx+q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C310F698
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 14:14:31 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327hwbi017554; Tue, 2 Apr 2024 14:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=v2HrcQGRJwF/38229zNuOSoT5iFCenUIZiGrEgT0eU8=;
 b=oUlVIx+qlCiBJdnmKtT34Xi8a+CJpF61LBYobKA+t+cvcrtLXNFGzeIyuA91anau/QKX
 nOF7EN4C+GTTsbb5tlP0Qu7+cjoUd5KvdyFfg8RBlZpJiFu6vfgKbMwcPnQsQDU4rzwI
 WSSEADXh4MJn3NTU+p74v+0glVeHHLE2CGbYmInJQrBlDZ2PfdH7RpyPdJsmxFT3PJPv
 J64/uREZ0gfDk0blU9bdkIPEQ3AKdjfbfvXu4e5rUnGbg59WzJAtN8tb7CSqg0AwULW9
 wMwvKLTMsmj5Xn5q/ZnIouBgq8ODIZjlXHSS5/VVzVPM03csUY/Bg1mDkUgY0GFE1p6C 0g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x695emr7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 14:14:20 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432DmWEH007409; Tue, 2 Apr 2024 14:14:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3x69672dmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 14:14:19 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 432EEIEU012872;
 Tue, 2 Apr 2024 14:14:18 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3x69672dkg-1; Tue, 02 Apr 2024 14:14:18 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH v3] drm/panthor: Fix couple of NULL vs IS_ERR() bugs
Date: Tue,  2 Apr 2024 07:14:11 -0700
Message-ID: <20240402141412.1707949-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_07,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020105
X-Proofpoint-GUID: Uwahn3WFgWDUokDpheBqzWErFRvBGWw_
X-Proofpoint-ORIG-GUID: Uwahn3WFgWDUokDpheBqzWErFRvBGWw_
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

Currently panthor_vm_get_heap_pool() returns both ERR_PTR() and
NULL(when create is false and if there is no poool attached to the
VM)
	- Change the function to return error pointers, when pool is
	  NULL return -ENOENT
	- Also handle the callers to check for IS_ERR() on failure.

Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is spotted by smatch and the patch is only compile tested

v1->v2: Fix the function panthor_vm_get_heap_pool() to only return error
pointers and handle the caller sites [Suggested by Boris Brezillon]
        - Also merge these IS_ERR() vs NULL bugs into same patch

v2->v3: pull out error checking for devm_drm_dev_alloc() failure.
---
 drivers/gpu/drm/panthor/panthor_drv.c   | 4 ++--
 drivers/gpu/drm/panthor/panthor_mmu.c   | 2 ++
 drivers/gpu/drm/panthor/panthor_sched.c | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 11b3ccd58f85..050b905b0453 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1090,8 +1090,8 @@ static int panthor_ioctl_tiler_heap_destroy(struct drm_device *ddev, void *data,
 		return -EINVAL;
 
 	pool = panthor_vm_get_heap_pool(vm, false);
-	if (!pool) {
-		ret = -EINVAL;
+	if (IS_ERR(pool)) {
+		ret = PTR_ERR(pool);
 		goto out_put_vm;
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index fdd35249169f..e1285cdb09ff 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1893,6 +1893,8 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 			vm->heaps.pool = panthor_heap_pool_get(pool);
 	} else {
 		pool = panthor_heap_pool_get(vm->heaps.pool);
+		if (!pool)
+			pool = ERR_PTR(-ENOENT);
 	}
 	mutex_unlock(&vm->heaps.lock);
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5f7803b6fc48..617df2b980d0 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1343,7 +1343,7 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 	if (unlikely(csg_id < 0))
 		return 0;
 
-	if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
+	if (IS_ERR(heaps) || frag_end > vt_end || vt_end >= vt_start) {
 		ret = -EINVAL;
 	} else {
 		/* We do the allocation without holding the scheduler lock to avoid
-- 
2.39.3


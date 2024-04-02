Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 128228951A1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 13:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F093B10FC7A;
	Tue,  2 Apr 2024 11:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="I0imACyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4C10FC7A
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 11:17:55 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327hsVV021280; Tue, 2 Apr 2024 11:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=x4uFkHBfZr5gLzCiwxnD9ABQcDyNK3J+4CO6ymkzwmk=;
 b=I0imACyH07tBnNSWHApVFNcWSCa5FlTjuNaP6Jel9macdAtJorLsNMH44gfqRY35dVWl
 KDG7wWoqJmPAeGg43yKTHU/H3l9aD6RcwhpP7SM4m1rMjxF66XhDMdVfbyAKs0VYulgU
 67MJnA5bMttghCGrli4t750Z3/D7XWLuWFYn4jhoji4rl+EuVBIZZMpKSwfnN7TjncyX
 xVCI1G4F9rmr4ZN5f6vpgwvQf818qQkukmzXiwe9BgN4JQ32fM0fROxQJrWgFafVdD2Y
 zjexxtuae8NIE8fut3fK4GNqsLbjMVMKvE5xI4wQcorPd3MiZWmuskqwmYYbAoSQhxUT Mg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x6abucbyt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 11:17:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432B2aZ6006608; Tue, 2 Apr 2024 11:17:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3x6966wbc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 11:17:44 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 432BHi91004477;
 Tue, 2 Apr 2024 11:17:44 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3x6966wbb2-1; Tue, 02 Apr 2024 11:17:44 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] drm/panthor: Fix IS_ERR() vs NULL bug in
 group_process_tiler_oom()
Date: Tue,  2 Apr 2024 04:17:39 -0700
Message-ID: <20240402111740.1700310-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020081
X-Proofpoint-ORIG-GUID: fJ6_IRjHkqbCPM448T_3oltVdsYI62xz
X-Proofpoint-GUID: fJ6_IRjHkqbCPM448T_3oltVdsYI62xz
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

panthor_vm_get_heap_pool() returns ERR_PTR on failure, update the check
accordingly.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis with smatch, only compile tested.
---
 drivers/gpu/drm/panthor/panthor_sched.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5f7803b6fc48..d34f213795a3 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1343,7 +1343,10 @@ static int group_process_tiler_oom(struct panthor_group *group, u32 cs_id)
 	if (unlikely(csg_id < 0))
 		return 0;
 
-	if (!heaps || frag_end > vt_end || vt_end >= vt_start) {
+	if (IS_ERR(heaps))
+		return PTR_ERR(heaps);
+
+	if (frag_end > vt_end || vt_end >= vt_start) {
 		ret = -EINVAL;
 	} else {
 		/* We do the allocation without holding the scheduler lock to avoid
-- 
2.39.3


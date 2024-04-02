Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D1189507C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F13CB10FC36;
	Tue,  2 Apr 2024 10:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="XO4n/LgT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C528510FC36
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:41:04 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 4327hnp8021239; Tue, 2 Apr 2024 10:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=KneB49LPzOM38AMQBvSH5d/jF8EAr0Yt5QSa5AJ9wZQ=;
 b=XO4n/LgTzRsCDZWM27SVeuGn5x/8MtGyUc23GGjU6fzDwRF4qnTDQnqdK80MYNggTJ7p
 4DcL66b6b8Yf1Lw+N5e9vmqlSaNEafsF/vkwwg7fElDRUS/NmQXoNvW2ka4/ue7J6uvj
 V3YS0TyymAtQ/R63dGRwatrF2f1NnFc0sTEDQeHugQr1yWM0geziheU8Ss6KG0wnvUH4
 eF3kTwAqBmN7/ocAyk9ry9l/ebtiyEKBcxMA26vnTuXMEPLSCf7lU1nFgD/vk6xQFyLA
 xqLrchDwZwz56gDkGNHFWundyC7W2i95tiSR3zZ78qgDKZYLPWZe06GhOtT8LqV0TL5U zQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3x6abuc9uq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 10:40:54 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 432AREFs040407; Tue, 2 Apr 2024 10:40:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3x6966sr8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Apr 2024 10:40:53 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 432Aeqei023453;
 Tue, 2 Apr 2024 10:40:52 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3x6966sr8h-1; Tue, 02 Apr 2024 10:40:52 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
 error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH] drm/panthor: Fix NULL vs IS_ERR() bug in panthor_probe()
Date: Tue,  2 Apr 2024 03:40:40 -0700
Message-ID: <20240402104041.1689951-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_04,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2404020077
X-Proofpoint-ORIG-GUID: bRNmNBiqVfRSvrPgK0gLxKD1AqCyVTOC
X-Proofpoint-GUID: bRNmNBiqVfRSvrPgK0gLxKD1AqCyVTOC
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

The devm_drm_dev_alloc() function returns error pointers.
Update the error handling to check for error pointers instead of NULL.

Fixes: 4bdca1150792 ("drm/panthor: Add the driver frontend block")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is spotted by smatch and the patch is only compile tested
---
 drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 11b3ccd58f85..1b588b37db98 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1385,7 +1385,7 @@ static int panthor_probe(struct platform_device *pdev)
 
 	ptdev = devm_drm_dev_alloc(&pdev->dev, &panthor_drm_driver,
 				   struct panthor_device, base);
-	if (!ptdev)
+	if (IS_ERR(ptdev))
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, ptdev);
-- 
2.39.3


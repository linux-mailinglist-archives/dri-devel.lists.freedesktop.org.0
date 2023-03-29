Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427A46CF0E1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 19:19:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C4210EBC5;
	Wed, 29 Mar 2023 17:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7953010EBC5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 17:19:04 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TDbAhF005664; Wed, 29 Mar 2023 17:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2022-7-12; bh=t/0QbHu+15DDjdJ84oDWMlTeOUNp+zL4KU3YLoJgJ9g=;
 b=R92p0SoOO1+F4Z+bKD7ad7VhsrOldSqpEGJjXnNQrMkmo9VcRNVt7eKf4NUpy3nzr2te
 RMtLrhxAzAlv0eKPUn+oIUangaUjsi/nOSL/VsdbYHBCZT+fkmaT97XKtOu930W60arJ
 INd9NYTv5lt//2HJCXG97JwiMBgRVytZHZXwdE/JuURp/B1nPHr/l4MzBKxSj0pa3G07
 gkTEOBjbA1wID99ZBzF/ln2rWrVElGqcfGpn+lSmmh/gfwKzFUImzN3KsOpSw7FUa5JB
 lkAP8nd8jTPw6wwKGv62Fn62Hzcc9Am/6I7tNmUGFfQ0y38G/PsHpmFfIhqRhmzr+c3f 7w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmpc90r5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 17:18:58 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32TFuqGg010803; Wed, 29 Mar 2023 17:18:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqdenf5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 17:18:57 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32THG3co015574;
 Wed, 29 Mar 2023 17:18:56 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3phqdenes7-1; Wed, 29 Mar 2023 17:18:55 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: emma@anholt.net, eric@anholt.net, tom.cooksey@arm.com
Subject: [PATCH] drm/pl111: Fix missing unwind goto in pl111_amba_probe()
Date: Wed, 29 Mar 2023 10:18:24 -0700
Message-Id: <20230329171824.1159104-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_10,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290136
X-Proofpoint-GUID: Esn5KF0L_UECQiRYu3PaMGNfcep5gPIH
X-Proofpoint-ORIG-GUID: Esn5KF0L_UECQiRYu3PaMGNfcep5gPIH
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
Cc: error27@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch reports:
	drivers/gpu/drm/pl111/pl111_drv.c:300
	pl111_amba_probe() warn: missing unwind goto?

When devm_request_irq() returns non-zero value, we need to drop the
reference for drm device and also release reserved memory which is
done in "dev_put" label. So instead of directly returning, goto dev_put
to fix this bug.

Fixes: bed41005e617 ("drm/pl111: Initial drm/kms driver for pl111")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is based on static analysis, Only Compile tested.
---
 drivers/gpu/drm/pl111/pl111_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 4b2a9e9753f6..72c5d3681b47 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -297,7 +297,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 			       variant->name, priv);
 	if (ret != 0) {
 		dev_err(dev, "%s failed irq %d\n", __func__, ret);
-		return ret;
+		goto dev_put;
 	}
 
 	ret = pl111_modeset_init(drm);
-- 
2.38.1


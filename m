Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497E43022F6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 09:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B40F6E03A;
	Mon, 25 Jan 2021 08:45:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510936E027
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 08:45:57 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8hvsT031967;
 Mon, 25 Jan 2021 08:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=omPB5cSHDaqTS0tg3O8UyPI6Xe/XjQUIvTLOyt1/nyQ=;
 b=ZZv18roNvCaa0a6yFVq6zSTFcYeE3g1E5q/ERYppcNMciiiVZeIBbxBnvZwyRmhjIEoG
 A9pA5KX0f9qoO/eKs/ba0mUFmvGZg/Veqb9yoCMd9CIzK/ZZTN3E8OHpIcy1evZQ9ocJ
 +2pM/jh5UTEZUQtiFYPC5S9dhqvzwzPak9mczkd5uSWkQHJcuSL9wbrgAxe9R51dsGOX
 3IqXU3Ue5T0yKJa2nRVUC/QyeoayGGVlPhbM5OyDDcilLnOWh0kLj2HtsWZaIrJfHd/O
 YLKb8scRnryPHUb/E2dSSRSxxyqJPd+SLXpcTIxOrmV4q6PfRzfExSUhbjlqnyiFQIxT ew== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 368b7qm5be-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 08:45:50 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10P8aPc7081023;
 Mon, 25 Jan 2021 08:45:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 368wpw9p1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Jan 2021 08:45:47 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10P8jjVl007426;
 Mon, 25 Jan 2021 08:45:45 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 25 Jan 2021 00:45:44 -0800
Date: Mon, 25 Jan 2021 11:45:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>
Subject: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in
 vmw_setup_pci_resources()
Message-ID: <YA6FMboLhnE3uSvb@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250051
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9874
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101250052
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Krastev <krastevm@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_memremap() function never returns NULL, it returns error
pointers so the test needs to be fixed.  Also we need to call
pci_release_regions() to avoid a memory leak.

Fixes: be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index eb997f4678de..3f603a6b5f90 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -668,9 +668,10 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 				      fifo_size,
 				      MEMREMAP_WB);
 
-	if (unlikely(dev->fifo_mem == NULL)) {
+	if (IS_ERR(dev->fifo_mem)) {
 		DRM_ERROR("Failed mapping FIFO memory.\n");
-		return -ENOMEM;
+		pci_release_regions(pdev);
+		return PTR_ERR(dev->fifo_mem);
 	}
 
 	/*
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5D1264358
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9FD6E8FD;
	Thu, 10 Sep 2020 10:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AF56E8FD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 10:10:41 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08A9xRZN115204;
 Thu, 10 Sep 2020 10:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=g37SUWXNvau9Rx808CmTrAwTrd4joDVnEfZqnUQu9/A=;
 b=msofuDRlCUpv3DJnBwkdTHyW2Tw5Wax58knzjfefB3xX02eZcq7eiLQ4PtM/R9T5fosP
 fWytiCt8lkJ4Z/QIT2NhryK0bd8yNb1N2HMkAoeGBOOn3H+LVgj0ia7VcZPXQIKZS16S
 gSjmR7X4WWYN4lWdnuyacQK5jHeqDYDv1umVfrr9XgiFjQztUyU/uvHy1mOPV8mxd0pa
 Fkq/5AF7Jw2+OgK6ihM1r1JuWfGGrYRlf4Rnd3gCCC9RFZ+ygDLUUx+7I8JhwmEz3Zq8
 4/IiVEfyfdHTgCd6sH0eT8ZNnYUQxAKiypi4hB9FuDvMwNN8VJolyihqxZmcnS6M9nf4 fQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 33c23r76fc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Sep 2020 10:08:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08AA5VEM174120;
 Thu, 10 Sep 2020 10:08:34 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 33cmeum8r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Sep 2020 10:08:34 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08AA8WcW003816;
 Thu, 10 Sep 2020 10:08:33 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Sep 2020 03:08:32 -0700
Date: Thu, 10 Sep 2020 13:08:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Eric Anholt <eric@anholt.duckdns.org>
Subject: [PATCH] drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in
 vc5_hdmi_init_resources()
Message-ID: <20200910100825.GC79916@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009100094
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9739
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009100093
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_ioremap() function never returns error pointers, it returns
NULL.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d0792915436c..03825596a308 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1545,64 +1545,64 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 
 	vc4_hdmi->hdmicore_regs = devm_ioremap(dev, res->start,
 					       resource_size(res));
-	if (IS_ERR(vc4_hdmi->hdmicore_regs))
-		return PTR_ERR(vc4_hdmi->hdmicore_regs);
+	if (!vc4_hdmi->hdmicore_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->hd_regs))
-		return PTR_ERR(vc4_hdmi->hd_regs);
+	if (!vc4_hdmi->hd_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cec");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->cec_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->cec_regs))
-		return PTR_ERR(vc4_hdmi->cec_regs);
+	if (!vc4_hdmi->cec_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "csc");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->csc_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->csc_regs))
-		return PTR_ERR(vc4_hdmi->csc_regs);
+	if (!vc4_hdmi->csc_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvp");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->dvp_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->dvp_regs))
-		return PTR_ERR(vc4_hdmi->dvp_regs);
+	if (!vc4_hdmi->dvp_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->phy_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->phy_regs))
-		return PTR_ERR(vc4_hdmi->phy_regs);
+	if (!vc4_hdmi->phy_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "packet");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->ram_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->ram_regs))
-		return PTR_ERR(vc4_hdmi->ram_regs);
+	if (!vc4_hdmi->ram_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rm");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->rm_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->rm_regs))
-		return PTR_ERR(vc4_hdmi->rm_regs);
+	if (!vc4_hdmi->rm_regs)
+		return -ENOMEM;
 
 	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

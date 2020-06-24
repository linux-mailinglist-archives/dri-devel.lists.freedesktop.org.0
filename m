Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59907207B0A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 19:58:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6426E2E1;
	Wed, 24 Jun 2020 17:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253C56E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 17:58:17 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OHgTOo008402;
 Wed, 24 Jun 2020 17:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Ql5JvIytyz0KFGb7FOEjICxcs22heL33rDXyWZ7YKfw=;
 b=n/3/gTpWneOe2+vAV7HCcdL7BqrZ+4AGhGuv+RIawOCW74uZ4+MdBBU55eg53sh190IH
 l5wZRaN/z6gZcoX63GxyKoZ91K7pXrDTon5Q8POz5/ChtLPThfIk+0CjRlyy+TYACBVI
 jTFpCbyQ/t+uYVu3VLB9ZC+yCREdCtoOGcZFYJrrJ5frINu7HPiKNVEF78+tkP2FWWtM
 tNptRogrU4YMJEQhbVmkA+kuER9VD9GLyqlop4c1naP6hh0ek47gIZIyq/uwsxVcb9o1
 4x+Xrhi2DpDbnwYoJzBi8FFkwz69OhTji726Vs+2QtBL54v8oX/scjKtulCWpmycWBmW zw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 31uustmbfp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 24 Jun 2020 17:58:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 05OHhYSR006925;
 Wed, 24 Jun 2020 17:58:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 31uurr6m84-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 17:58:13 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 05OHwBnu014045;
 Wed, 24 Jun 2020 17:58:12 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 24 Jun 2020 17:58:11 +0000
Date: Wed, 24 Jun 2020 20:58:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: boris.brezillon@collabora.com
Subject: [bug report] drm/vc4: dsi: Fix bridge chain handling
Message-ID: <20200624175806.GA7351@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=3 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9662
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 cotscore=-2147483648 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=3 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240120
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Boris Brezillon,

The patch 033bfe7538a1: "drm/vc4: dsi: Fix bridge chain handling"
from Dec 27, 2019, leads to the following static checker warning:

	drivers/gpu/drm/vc4/vc4_dsi.c:758 vc4_dsi_encoder_disable()
	warn: iterator used outside loop: 'iter'

drivers/gpu/drm/vc4/vc4_dsi.c
   743  static void vc4_dsi_encoder_disable(struct drm_encoder *encoder)
   744  {
   745          struct vc4_dsi_encoder *vc4_encoder = to_vc4_dsi_encoder(encoder);
   746          struct vc4_dsi *dsi = vc4_encoder->dsi;
   747          struct device *dev = &dsi->pdev->dev;
   748          struct drm_bridge *iter;
   749  
   750          list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
   751                  if (iter->funcs->disable)
   752                          iter->funcs->disable(iter);
   753          }

This loops backwards until iter is parked on the list head.

   754  
   755          vc4_dsi_ulps(dsi, true);
   756  
   757          list_for_each_entry_from(iter, &dsi->bridge_chain, chain_node) {

But then this "continues" until the iter is parked on the list head.
Since we ended with the iterator already on the list head then we never
enter this loop and it is a no-op.

Am I missing something?

   758                  if (iter->funcs->post_disable)
   759                          iter->funcs->post_disable(iter);
   760          }
   761  
   762          clk_disable_unprepare(dsi->pll_phy_clock);
   763          clk_disable_unprepare(dsi->escape_clock);
   764          clk_disable_unprepare(dsi->pixel_clock);
   765  
   766          pm_runtime_put(dev);
   767  }

regards,
dan carpenter
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

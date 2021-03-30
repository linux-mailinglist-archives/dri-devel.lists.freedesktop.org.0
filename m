Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC5F34E478
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFF3896A3;
	Tue, 30 Mar 2021 09:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4D0896A3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 09:32:38 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U9P4US039750;
 Tue, 30 Mar 2021 09:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=TDzD339C56AHZiyJWUKFr5El3afRZqtMVI9Adnr4nr4=;
 b=jZkkr52Z36UfEYWvyGmSsvrRt5rmqs5qp3yf2WiuUuzdLbU6T32wAfIYQNR1EVSLbv/2
 Z4ogJWRNKo8aProN0HGAvxH1baqOv8S5Swr6OljzPZZhDA+z+yvTJZ9BtLtXnE1o+XLi
 vFubwU+rNTCoJPNdsGp18FU6/FWD8WcAmf33eODAT0yR9KDBdI03kh+A4COK7MrgJGLn
 8xZwg4PZ9rEOB+do8q3ghQu3mcTNef9qIo27PDGr4JcnFyu+NdbKVBuDM93qCk4onsrB
 U1uPwrRNMSmnK/YdigsnWneZ1Wzp0dJTPZEquG+Thd33oQzdpw01Wv1QAd7Ps8OwbGBI aQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 37hv4r6ft7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 09:32:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12U9Omuj182967;
 Tue, 30 Mar 2021 09:32:23 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 37jekyakwd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 09:32:23 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 12U9WEg0024085;
 Tue, 30 Mar 2021 09:32:14 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 30 Mar 2021 02:32:13 -0700
Date: Tue, 30 Mar 2021 12:31:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hyun Kwon <hyun.kwon@xilinx.com>
Subject: [PATCH] drm: xlnx: zynqmp: fix a memset in zynqmp_dp_train()
Message-ID: <YGLwCBMotnrKZu6P@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300066
X-Proofpoint-ORIG-GUID: Ygtur3zAVSgOkfx3TG4zPL78zXtoTfGC
X-Proofpoint-GUID: Ygtur3zAVSgOkfx3TG4zPL78zXtoTfGC
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9938
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300066
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The dp->train_set[] for this driver is only two characters, not four so
this memsets too much.  Fortunately, this ends up corrupting a struct
hole and not anything important.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 99158ee67d02..59d1fb017da0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -866,7 +866,7 @@ static int zynqmp_dp_train(struct zynqmp_dp *dp)
 		return ret;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_SCRAMBLING_DISABLE, 1);
-	memset(dp->train_set, 0, 4);
+	memset(dp->train_set, 0, sizeof(dp->train_set));
 	ret = zynqmp_dp_link_train_cr(dp);
 	if (ret)
 		return ret;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

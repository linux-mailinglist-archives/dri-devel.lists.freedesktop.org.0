Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31323381758
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 11:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347246E22B;
	Sat, 15 May 2021 09:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5313F6E22B
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 09:51:12 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14F9mbsT025279; Sat, 15 May 2021 09:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=KfuS4wvCARA6NWgLIsSOng+VhaRUv1UyvcW0jNRiutM=;
 b=EWBPk98of9idHOVBBZhCI2sAEn/13BbVGiYWYgqkDQiHBcEF9HzDziMmVieGpX7lOvLs
 eQP4MMANqm5vhqF7fBCnCFBOrFHjsKCwMC0OJWMjRV2gjaxMoJ96UITpyw1w3nkEx7Ju
 0EhVqSQBYrO+9+aB+c5qxLX2x1St7FFfj5k0cFrV9taMC6HNjSgCJ0q7gOorvIm0XejQ
 tZJvClAMv3ntoFiM368F9qWDUZP8xAVjPAtFHlWUpPpesjh3zfao+3bhVfpznCP4wj5Z
 k1WKkASoYHKAEcXJJTivbcHcvJ+lxPAa5H54A6C4MPvneuPo+8qkb4L1drEcR2+QFSBc ng== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 38j5ws02k4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:51:07 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14F9p6fX105208;
 Sat, 15 May 2021 09:51:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 38j641ffsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:51:06 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 14F9p6Z0105183;
 Sat, 15 May 2021 09:51:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 38j641ffsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 15 May 2021 09:51:06 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 14F9p56L017583;
 Sat, 15 May 2021 09:51:05 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Sat, 15 May 2021 02:51:05 -0700
Date: Sat, 15 May 2021 12:50:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Phong LE <ple@baylibre.com>
Subject: [PATCH 2/2] drm: bridge: it66121: fix a resource leak in probe
Message-ID: <YJ+ZgXTFa6voZuJG@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJ+ZX3BdKPAN0pUZ@mwanda>
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: igl3bXYpPeRR3XFJ7ImVPFm5KLQ9gtVt
X-Proofpoint-GUID: igl3bXYpPeRR3XFJ7ImVPFm5KLQ9gtVt
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the original code if the "ctx = devm_kzalloc()" allocation failed
then we should have called of_node_put(ep); before returning.  It's
actually a bit easier to do the allocation first before assigning
ep = of_graph_get_endpoint_by_regs().

Fixes: 988156dc2fc9 ("drm: bridge: add it66121 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 6980c9801d0d..7149ed40af83 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -898,14 +898,14 @@ static int it66121_probe(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
-	if (!ep)
-		return -EINVAL;
-
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
+	if (!ep)
+		return -EINVAL;
+
 	ctx->dev = dev;
 	ctx->client = client;
 
-- 
2.30.2


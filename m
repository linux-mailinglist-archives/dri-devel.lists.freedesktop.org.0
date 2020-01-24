Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7125F147E8C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 11:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979916E2F2;
	Fri, 24 Jan 2020 10:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE1A6E2F2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 10:14:19 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OAE3dI055653;
 Fri, 24 Jan 2020 10:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=GvzYLeUyuVQWpzt7gg0XJtSGKYxLaeZVtpQtQuR3R94=;
 b=MT8AynOCMi5+ggL3XII/s7bkC3XHxZeQLZ0JAjeCEy5zFQmjSJwhobgrXRbKXI597u+J
 CMh2JvA/6ZY7oKOeKeZ0rgt5P4YZlVRsIiOEni0vjIJnazEhNbkjvvymvhFNxDVrcFPz
 vwxEhYOT1YoZ8+oumveQOmd/QdmOMSPlPhCmnjtxvlSrw/u05sVyyQcJbQD/zX5agyCi
 GZrPcR8tO3baGm6kVth3oY+35Ck+b8V+WiYPeqZkPFnKyUdnM33AiXTzmCx2RXF3FDsF
 b0Vs9+NlSjGtqMFE5GfkoKkg7gNGMxjt7Qd7cW10sQpjDarewIL8L2rPlv7rB78aZ5/e pA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2xktnrqy8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 10:14:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00OAE2vD065231;
 Fri, 24 Jan 2020 10:14:09 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2xqmwe5kww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jan 2020 10:14:09 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00OADLDS028027;
 Fri, 24 Jan 2020 10:13:21 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 24 Jan 2020 02:13:20 -0800
Date: Fri, 24 Jan 2020 13:13:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sumit Semwal <sumit.semwal@linaro.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH] dma-buf: fix locking in sync_print_obj()
Message-ID: <20200124101311.drryaegcdc7d4x7e@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001240084
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9509
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001240084
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Sean Paul <seanpaul@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is always called with IRQs disabled and we don't actually want to
enable IRQs at the end.

Fixes: a6aa8fca4d79 ("dma-buf/sw-sync: Reduce irqsave/irqrestore from known context")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/dma-buf/sync_debug.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
index 101394f16930..952331344b1c 100644
--- a/drivers/dma-buf/sync_debug.c
+++ b/drivers/dma-buf/sync_debug.c
@@ -107,15 +107,16 @@ static void sync_print_fence(struct seq_file *s,
 static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
 {
 	struct list_head *pos;
+	unsigned long flags;
 
 	seq_printf(s, "%s: %d\n", obj->name, obj->value);
 
-	spin_lock_irq(&obj->lock);
+	spin_lock_irqsave(&obj->lock, flags);
 	list_for_each(pos, &obj->pt_list) {
 		struct sync_pt *pt = container_of(pos, struct sync_pt, link);
 		sync_print_fence(s, &pt->base, false);
 	}
-	spin_unlock_irq(&obj->lock);
+	spin_unlock_irqrestore(&obj->lock, flags);
 }
 
 static void sync_print_sync_file(struct seq_file *s,
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

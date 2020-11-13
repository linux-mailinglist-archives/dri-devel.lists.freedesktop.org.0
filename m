Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562D72B18E3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 11:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A1F6E49D;
	Fri, 13 Nov 2020 10:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243836E49D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 10:17:27 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAALTB020506;
 Fri, 13 Nov 2020 10:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=inc1zjdMjBlZg9MiLcacClnp+wUmqZ7Ux97na0z9F6E=;
 b=ebO49LzKp3IfCpmqtsTgDQoSIBx9YbeXGW77t8pGCPojR4mz6muafLp0OY08ZS0nDmE5
 YfE3un87tG49EHUQ3DhsNe6x3Jmm8YrZIMJ3lNE9jruc163WPflEM9ca2yw8rs9S0icH
 HngiT6qS7bF8wlR+wdCsRZ+GFlFulwSPPdHavKtb3XwtA3qHWU0q90TcQllL4tnKCoyv
 QvbqeASOdY8j/6lUdgKLlL2oxEoekJiZaCMb89qZHNDKnFNmDfMvGNFzC5xxXOZ3tmca
 uqipLuRZo8ELGpSrCbY3BNRpSSvb2PmHLN1Z7+kbyhJgMXUbofYSnNZrKEwoEiO3kx95 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 34nh3ba1gk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Nov 2020 10:17:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ADAAIqm179205;
 Fri, 13 Nov 2020 10:15:19 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34rtktbun6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 10:15:19 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0ADAFAx1003790;
 Fri, 13 Nov 2020 10:15:11 GMT
Received: from mwanda (/10.175.206.108)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 13 Nov 2020 02:15:10 -0800
Date: Fri, 13 Nov 2020 13:15:02 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/udl: Fix missing error code in udl_handle_damage()
Message-ID: <20201113101502.GD168908@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011130061
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
 dri-devel@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>,
 Sean Paul <sean@poorly.run>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If udl_get_urb() fails then this should return a negative error code
but currently it returns success.

Fixes: 798ce3fe1c3a ("drm/udl: Begin/end access to imported buffers in damage-handler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/udl/udl_modeset.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 42eeba1dfdbf..9d34ec9d03f6 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -305,8 +305,10 @@ static int udl_handle_damage(struct drm_framebuffer *fb, int x, int y,
 	vaddr = map.vaddr; /* TODO: Use mapping abstraction properly */
 
 	urb = udl_get_urb(dev);
-	if (!urb)
+	if (!urb) {
+		ret = -ENOMEM;
 		goto out_drm_gem_shmem_vunmap;
+	}
 	cmd = urb->transfer_buffer;
 
 	for (i = clip.y1; i < clip.y2; i++) {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

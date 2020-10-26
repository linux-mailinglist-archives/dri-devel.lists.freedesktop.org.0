Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EA22989BC
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 10:49:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E74686E9F5;
	Mon, 26 Oct 2020 09:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA3B6E9F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 09:49:22 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q9n9Su011265;
 Mon, 26 Oct 2020 09:49:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2020-01-29; bh=idCrYVaof56C5NOLfxcsP5wOGjSDiBC1Go1Tn0WcFLw=;
 b=cYh3whNEXdthmPNMeKsVtJdfm2JyvQsnP+lWOKSfYfUnpcCa3l+mEPJwuFs+NnOWcL+s
 9e3wHgu7xYAot03/fCpS0zMseMkC64dlRXu/d/s9wdKFLFF2fP4oA60PV/KQ/ox7WvrU
 arg7dKkvTDkSIVndQgD9H0/6e4YKRWQ2s/tm9eUSEE3QLzA8ky3VWmpJ1Fh4mwAqz5rZ
 w+nn7WI75JyKHAdv4d0YTQ3U3D8Hf43JGlnDrDVnOfH+MKXhW4lusRwkZMcb23HKt0JS
 lnC/ivJklBeOOAUEUt2aIBHv5JU+RnkXXtG8XDksl/XXfcR2FOcAKaAdk3WJKwwy1tT/ xQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 34c9sakxrb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 26 Oct 2020 09:49:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09Q9kCmZ047397;
 Mon, 26 Oct 2020 09:49:14 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 34cx1pc9fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 26 Oct 2020 09:49:14 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09Q9nDUB028947;
 Mon, 26 Oct 2020 09:49:13 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 26 Oct 2020 02:49:12 -0700
Date: Mon, 26 Oct 2020 12:49:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Eric Anholt <eric@anholt.duckdns.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH resend] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-ID: <20201026094905.GA1634423@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024205306.GA14416@mwanda>
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 suspectscore=2 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010260069
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9785
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 impostorscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 suspectscore=2
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010260069
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
Cc: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.duckdns.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Originally this error path used to leak "bin" but then we accidentally
applied two separate commits to fix it and ended up with a double free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resending a year later because it was confusing at the time who should
apply this and it fell through the cracks.  For some reason the kbuild
bot flagged it as a new warning so it showed up on my radar again.

 drivers/gpu/drm/v3d/v3d_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 549dde83408b..37515e47b47e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
 				   v3d_job_free, args->in_sync_bcl);
 		if (ret) {
-			kfree(bin);
 			v3d_job_put(&render->base);
 			kfree(bin);
 			return ret;
-- 
2.20.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C15629591A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C66B6F3E3;
	Thu, 22 Oct 2020 07:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFCA6EEBD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:59:06 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LNsmm4104771;
 Wed, 21 Oct 2020 23:59:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2020-01-29; bh=ia1bvcLIGRlULe3HUUv1lS8YCwcY+Jyv65hKmvu1yYo=;
 b=T+mPkrULepGxEyQ+/ozMIxARHfBx1kgMxaNvSMGMmxaAPv19uO3pCsUhIFHIdaPQlJua
 Dz+efSUQ3HiZ2ExKj7c9rRko9VWVnYFu/UFUwqN23SoVSIFwyjCzciO5Qhql8VHhzFEU
 ol9ZFqhXQkokyJQ2D716Vbq6G+1u6bJmtHLDrWru8wBpL/ZYM1kIQR+eIN5SykFiP8//
 k1qNNQM9FY5hvRjy0Y8jZAozeRV7my956gX9Lei4ENt/zsPh5bxSqycZlMr51CIdHsPL
 jBrwZ0K2dgPYwqIW1ICC30GImMIO1EraDqQmBZga87GkOnmQpFrsFY0i5R0HYphniJKm hA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34ak16kky0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 23:58:59 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09LNtheh114258;
 Wed, 21 Oct 2020 23:58:59 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3020.oracle.com with ESMTP id 348ah086yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 21 Oct 2020 23:58:59 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09LNwwIj119041;
 Wed, 21 Oct 2020 23:58:58 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.147.25.63])
 by aserp3020.oracle.com with ESMTP id 348ah086yg-1;
 Wed, 21 Oct 2020 23:58:58 +0000
From: saeed.mirzamohammadi@oracle.com
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
Date: Wed, 21 Oct 2020 16:57:58 -0700
Message-Id: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010210166
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>

This patch fixes the issue due to:

[   89.572883] divide_error: 0000 [#1] SMP KASAN PTI
[   89.572897] CPU: 3 PID: 16083 Comm: repro Not tainted 5.9.0-rc7.20200930.rc1.allarch-19-g3e32d0d.syzk #5
[   89.572902] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 0.5.1 01/01/2011
[   89.572934] RIP: 0010:cirrusfb_check_var+0x84/0x1260

The error happens when the pixels value is calculated before performing the sanity checks on bits_per_pixel.
A bits_per_pixel set to zero causes divide by zero error.

This patch moves the calculation after the sanity check.

Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Tested-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
---
 drivers/video/fbdev/cirrusfb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 15a9ee7cd734..a7749101b094 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -531,7 +531,7 @@ static int cirrusfb_check_var(struct fb_var_screeninfo *var,
 {
 	int yres;
 	/* memory size in pixels */
-	unsigned pixels = info->screen_size * 8 / var->bits_per_pixel;
+	unsigned int pixels;
 	struct cirrusfb_info *cinfo = info->par;
 
 	switch (var->bits_per_pixel) {
@@ -573,6 +573,7 @@ static int cirrusfb_check_var(struct fb_var_screeninfo *var,
 		return -EINVAL;
 	}
 
+	pixels = info->screen_size * 8 / var->bits_per_pixel;
 	if (var->xres_virtual < var->xres)
 		var->xres_virtual = var->xres;
 	/* use highest possible virtual resolution */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772001B3815
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1F26E980;
	Wed, 22 Apr 2020 06:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m176115.mail.qiye.163.com (m176115.mail.qiye.163.com
 [59.111.176.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0C26E19B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 02:12:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.122])
 by m176115.mail.qiye.163.com (Hmail) with ESMTPA id A6E676652E0;
 Wed, 22 Apr 2020 10:10:53 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/arm: cleanup coding style in arm a bit
Date: Tue, 21 Apr 2020 19:10:46 -0700
Message-Id: <20200422021046.4375-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZTlVOTEhCQkJDQ0pMT09IQ1lXWShZQU
 hPN1dZLVlBSVdZCQ4XHghZQVk1NCk2OjckKS43PlkG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PzY6Dhw4Dzg5SwIDFhQTCkwC
 TB9PC01VSlVKTkNMTklKT05IQ0JJVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSUlZV1kIAVlBSkJPTTcG
X-HM-Tid: 0a719fa6fef29373kuwsa6e676652e0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the code logic, an alarm is thrown after failure, but the
code continues to run and returns successfully, so to the caller
the if check and return branch will never run.
The change is to make the code a bit more readable.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index af67fefed38d..32bda13250f5 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -160,9 +160,7 @@ static void hdlcd_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	hdlcd_write(hdlcd, HDLCD_REG_H_SYNC, vm.hsync_len - 1);
 	hdlcd_write(hdlcd, HDLCD_REG_POLARITIES, polarities);
 
-	err = hdlcd_set_pxl_fmt(crtc);
-	if (err)
-		return;
+	hdlcd_set_pxl_fmt(crtc);
 
 	clk_set_rate(hdlcd->clk, m->crtc_clock * 1000);
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

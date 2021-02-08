Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7D3128F9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 03:33:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B869D6E18E;
	Mon,  8 Feb 2021 02:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882246E18E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 02:33:29 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DYqmL6STlzjKyZ;
 Mon,  8 Feb 2021 10:32:02 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Feb 2021 10:33:20 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <jyri.sarha@iki.fi>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/tilcdc: replace spin_lock_irqsave by spin_lock in hard IRQ
Date: Mon, 8 Feb 2021 10:32:56 +0800
Message-ID: <1612751576-42512-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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

The code has been in a irq-disabled context since it is hard IRQ. There
is no necessity to do it again.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 3021370..b3e38e9 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -904,13 +904,12 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 	tilcdc_clear_irqstatus(dev, stat);
 
 	if (stat & LCDC_END_OF_FRAME0) {
-		unsigned long flags;
 		bool skip_event = false;
 		ktime_t now;
 
 		now = ktime_get();
 
-		spin_lock_irqsave(&tilcdc_crtc->irq_lock, flags);
+		spin_lock(&tilcdc_crtc->irq_lock);
 
 		tilcdc_crtc->last_vblank = now;
 
@@ -920,21 +919,21 @@ irqreturn_t tilcdc_crtc_irq(struct drm_crtc *crtc)
 			skip_event = true;
 		}
 
-		spin_unlock_irqrestore(&tilcdc_crtc->irq_lock, flags);
+		spin_unlock(&tilcdc_crtc->irq_lock);
 
 		drm_crtc_handle_vblank(crtc);
 
 		if (!skip_event) {
 			struct drm_pending_vblank_event *event;
 
-			spin_lock_irqsave(&dev->event_lock, flags);
+			spin_lock(&dev->event_lock);
 
 			event = tilcdc_crtc->event;
 			tilcdc_crtc->event = NULL;
 			if (event)
 				drm_crtc_send_vblank_event(crtc, event);
 
-			spin_unlock_irqrestore(&dev->event_lock, flags);
+			spin_unlock(&dev->event_lock);
 		}
 
 		if (tilcdc_crtc->frame_intact)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

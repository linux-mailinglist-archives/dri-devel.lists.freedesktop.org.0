Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE13B9555
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 19:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AED76E05F;
	Thu,  1 Jul 2021 17:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 523 seconds by postgrey-1.36 at gabe;
 Thu, 01 Jul 2021 17:16:58 UTC
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F99C6E03D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 17:16:58 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 0847B20AEE;
 Thu,  1 Jul 2021 19:08:12 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/gud: Free buffers on device removal
Date: Thu,  1 Jul 2021 19:07:47 +0200
Message-Id: <20210701170748.58009-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=fOAXI6Se c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=KKAkSRfTAAAA:8 a=SJz97ENfAAAA:8
 a=HTPZWQiB1uwTuIkOn24A:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22
 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, peter@stuge.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Free transfer and compression buffers on device removal instead of at
DRM device removal time. This ensures that the usual 2x8MB buffers are
released when the device is unplugged and not kept around should
userspace keep the DRM device fd open.

At least Ubuntu 20.04 doesn't release the DRM device on unplug.

The damage_lock mutex is not destroyed because it is used outside the
drm_dev_enter/exit block in gud_pipe_update(). AFAICT it's possible for
an open fbdev descriptor to trigger a commit after the USB device is gone.

v2: Don't destroy damage_lock

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
index e8b672dc9832..45427c73587f 100644
--- a/drivers/gpu/drm/gud/gud_drv.c
+++ b/drivers/gpu/drm/gud/gud_drv.c
@@ -394,14 +394,15 @@ static const struct drm_driver gud_drm_driver = {
 	.minor			= 0,
 };
 
-static void gud_free_buffers_and_mutex(struct drm_device *drm, void *unused)
+static void gud_free_buffers_and_mutex(void *data)
 {
-	struct gud_device *gdrm = to_gud_device(drm);
+	struct gud_device *gdrm = data;
 
 	vfree(gdrm->compress_buf);
+	gdrm->compress_buf = NULL;
 	kfree(gdrm->bulk_buf);
+	gdrm->bulk_buf = NULL;
 	mutex_destroy(&gdrm->ctrl_lock);
-	mutex_destroy(&gdrm->damage_lock);
 }
 
 static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
@@ -455,7 +456,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_WORK(&gdrm->work, gud_flush_work);
 	gud_clear_damage(gdrm);
 
-	ret = drmm_add_action_or_reset(drm, gud_free_buffers_and_mutex, NULL);
+	ret = devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
 	if (ret)
 		return ret;
 
-- 
2.23.0


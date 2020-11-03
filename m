Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356A2A4459
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109736EC68;
	Tue,  3 Nov 2020 11:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 58B436EB8B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:34:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4519AC24;
 Tue,  3 Nov 2020 11:34:58 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 1/2] drm/tiny/gm12u320: Retrieve USB device from struct
 drm_device.dev
Date: Tue,  3 Nov 2020 12:34:55 +0100
Message-Id: <20201103113456.3066-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201103113456.3066-1-tzimmermann@suse.de>
References: <20201103113456.3066-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the driver's udev field in favor of struct drm_device.dev. No
functional changes made.

v3:
	* upcast dev with gm12u320_to_usb_device()
v2:
	* upcast dev with drm_dev_get_usb_device()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/tiny/gm12u320.c | 56 ++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/gm12u320.c b/drivers/gpu/drm/tiny/gm12u320.c
index cc397671f689..9c214a0f39ed 100644
--- a/drivers/gpu/drm/tiny/gm12u320.c
+++ b/drivers/gpu/drm/tiny/gm12u320.c
@@ -45,7 +45,7 @@ MODULE_PARM_DESC(eco_mode, "Turn on Eco mode (less bright, more silent)");
 #define GM12U320_BLOCK_COUNT		20
 
 #define GM12U320_ERR(fmt, ...) \
-	DRM_DEV_ERROR(&gm12u320->udev->dev, fmt, ##__VA_ARGS__)
+	DRM_DEV_ERROR(gm12u320->dev.dev, fmt, ##__VA_ARGS__)
 
 #define MISC_RCV_EPT			1
 #define DATA_RCV_EPT			2
@@ -85,7 +85,6 @@ struct gm12u320_device {
 	struct drm_device	         dev;
 	struct drm_simple_display_pipe   pipe;
 	struct drm_connector	         conn;
-	struct usb_device               *udev;
 	unsigned char                   *cmd_buf;
 	unsigned char                   *data_buf[GM12U320_BLOCK_COUNT];
 	struct {
@@ -155,6 +154,11 @@ static const char data_block_footer[DATA_BLOCK_FOOTER_SIZE] = {
 	0x80, 0x00, 0x00, 0x4f
 };
 
+static inline struct usb_device *gm12u320_to_usb_device(struct gm12u320_device *gm12u320)
+{
+	return interface_to_usbdev(to_usb_interface(gm12u320->dev.dev));
+}
+
 static int gm12u320_usb_alloc(struct gm12u320_device *gm12u320)
 {
 	int i, block_size;
@@ -191,6 +195,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
 				 u8 req_a, u8 req_b,
 				 u8 arg_a, u8 arg_b, u8 arg_c, u8 arg_d)
 {
+	struct usb_device *udev = gm12u320_to_usb_device(gm12u320);
 	int ret, len;
 
 	memcpy(gm12u320->cmd_buf, &cmd_misc, CMD_SIZE);
@@ -202,8 +207,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
 	gm12u320->cmd_buf[25] = arg_d;
 
 	/* Send request */
-	ret = usb_bulk_msg(gm12u320->udev,
-			   usb_sndbulkpipe(gm12u320->udev, MISC_SND_EPT),
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, MISC_SND_EPT),
 			   gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
 	if (ret || len != CMD_SIZE) {
 		GM12U320_ERR("Misc. req. error %d\n", ret);
@@ -211,8 +215,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
 	}
 
 	/* Read value */
-	ret = usb_bulk_msg(gm12u320->udev,
-			   usb_rcvbulkpipe(gm12u320->udev, MISC_RCV_EPT),
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, MISC_RCV_EPT),
 			   gm12u320->cmd_buf, MISC_VALUE_SIZE, &len,
 			   DATA_TIMEOUT);
 	if (ret || len != MISC_VALUE_SIZE) {
@@ -222,8 +225,7 @@ static int gm12u320_misc_request(struct gm12u320_device *gm12u320,
 	/* cmd_buf[0] now contains the read value, which we don't use */
 
 	/* Read status */
-	ret = usb_bulk_msg(gm12u320->udev,
-			   usb_rcvbulkpipe(gm12u320->udev, MISC_RCV_EPT),
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, MISC_RCV_EPT),
 			   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
 			   CMD_TIMEOUT);
 	if (ret || len != READ_STATUS_SIZE) {
@@ -331,6 +333,7 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 	struct gm12u320_device *gm12u320 =
 		container_of(to_delayed_work(work), struct gm12u320_device,
 			     fb_update.work);
+	struct usb_device *udev = gm12u320_to_usb_device(gm12u320);
 	int block, block_size, len;
 	int ret = 0;
 
@@ -350,43 +353,41 @@ static void gm12u320_fb_update_work(struct work_struct *work)
 		gm12u320->cmd_buf[21] =
 			block | (gm12u320->fb_update.frame << 7);
 
-		ret = usb_bulk_msg(gm12u320->udev,
-			usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
-			gm12u320->cmd_buf, CMD_SIZE, &len,
-			CMD_TIMEOUT);
+		ret = usb_bulk_msg(udev,
+				   usb_sndbulkpipe(udev, DATA_SND_EPT),
+				   gm12u320->cmd_buf, CMD_SIZE, &len,
+				   CMD_TIMEOUT);
 		if (ret || len != CMD_SIZE)
 			goto err;
 
 		/* Send data block to device */
-		ret = usb_bulk_msg(gm12u320->udev,
-			usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
-			gm12u320->data_buf[block], block_size,
-			&len, DATA_TIMEOUT);
+		ret = usb_bulk_msg(udev,
+				   usb_sndbulkpipe(udev, DATA_SND_EPT),
+				   gm12u320->data_buf[block], block_size,
+				   &len, DATA_TIMEOUT);
 		if (ret || len != block_size)
 			goto err;
 
 		/* Read status */
-		ret = usb_bulk_msg(gm12u320->udev,
-			usb_rcvbulkpipe(gm12u320->udev, DATA_RCV_EPT),
-			gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
-			CMD_TIMEOUT);
+		ret = usb_bulk_msg(udev,
+				   usb_rcvbulkpipe(udev, DATA_RCV_EPT),
+				   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
+				   CMD_TIMEOUT);
 		if (ret || len != READ_STATUS_SIZE)
 			goto err;
 	}
 
 	/* Send draw command to device */
 	memcpy(gm12u320->cmd_buf, cmd_draw, CMD_SIZE);
-	ret = usb_bulk_msg(gm12u320->udev,
-		usb_sndbulkpipe(gm12u320->udev, DATA_SND_EPT),
-		gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
+	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, DATA_SND_EPT),
+			   gm12u320->cmd_buf, CMD_SIZE, &len, CMD_TIMEOUT);
 	if (ret || len != CMD_SIZE)
 		goto err;
 
 	/* Read status */
-	ret = usb_bulk_msg(gm12u320->udev,
-		usb_rcvbulkpipe(gm12u320->udev, DATA_RCV_EPT),
-		gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
-		gm12u320->fb_update.draw_status_timeout);
+	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, DATA_RCV_EPT),
+			   gm12u320->cmd_buf, READ_STATUS_SIZE, &len,
+			   gm12u320->fb_update.draw_status_timeout);
 	if (ret || len != READ_STATUS_SIZE)
 		goto err;
 
@@ -638,7 +639,6 @@ static int gm12u320_usb_probe(struct usb_interface *interface,
 	if (IS_ERR(gm12u320))
 		return PTR_ERR(gm12u320);
 
-	gm12u320->udev = interface_to_usbdev(interface);
 	INIT_DELAYED_WORK(&gm12u320->fb_update.work, gm12u320_fb_update_work);
 	mutex_init(&gm12u320->fb_update.lock);
 
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

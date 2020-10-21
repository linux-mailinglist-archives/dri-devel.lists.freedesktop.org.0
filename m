Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D1F294D32
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 15:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9184A6EB0D;
	Wed, 21 Oct 2020 13:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C546E133
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 13:07:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 997ADAFF7;
 Wed, 21 Oct 2020 13:07:34 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 3/3] drm/udl: Store USB device in struct drm_device.udev
Date: Wed, 21 Oct 2020 15:07:32 +0200
Message-Id: <20201021130732.4048-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021130732.4048-1-tzimmermann@suse.de>
References: <20201021130732.4048-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the driver's udev field in favor of the one in struct drm_device. No
functional changes made.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_connector.c |  8 ++++----
 drivers/gpu/drm/udl/udl_drv.c       |  2 +-
 drivers/gpu/drm/udl/udl_drv.h       |  1 -
 drivers/gpu/drm/udl/udl_main.c      | 15 ++++++++-------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index cdc1c42e1669..b86e75d76c5a 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -20,6 +20,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 	int ret, i;
 	u8 *read_buff;
 	struct udl_device *udl = data;
+	struct usb_device *udev = udl->drm.udev;
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
@@ -27,10 +28,9 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
-		ret = usb_control_msg(udl->udev,
-				      usb_rcvctrlpipe(udl->udev, 0),
-					  (0x02), (0x80 | (0x02 << 5)), bval,
-					  0xA1, read_buff, 2, HZ);
+		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+				      0x02, (0x80 | (0x02 << 5)), bval,
+				      0xA1, read_buff, 2, HZ);
 		if (ret < 1) {
 			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
 			kfree(read_buff);
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 96d4317a2c1b..0aca9a3221ab 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -62,7 +62,7 @@ static struct udl_device *udl_driver_create(struct usb_interface *interface)
 	if (IS_ERR(udl))
 		return udl;
 
-	udl->udev = udev;
+	udl->drm.udev = udev;
 
 	r = udl_init(udl);
 	if (r)
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index b1461f30780b..889bfa21deb0 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -50,7 +50,6 @@ struct urb_list {
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
-	struct usb_device *udev;
 
 	struct drm_simple_display_pipe display_pipe;
 
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index f5d27f2a5654..f2ef5b169523 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -98,19 +98,19 @@ static int udl_parse_vendor_descriptor(struct drm_device *dev,
  */
 static int udl_select_std_channel(struct udl_device *udl)
 {
-	int ret;
 	static const u8 set_def_chn[] = {0x57, 0xCD, 0xDC, 0xA7,
 					 0x1C, 0x88, 0x5E, 0x15,
 					 0x60, 0xFE, 0xC6, 0x97,
 					 0x16, 0x3D, 0x47, 0xF2};
+	struct usb_device *udev = udl->drm.udev;
 	void *sendbuf;
+	int ret;
 
 	sendbuf = kmemdup(set_def_chn, sizeof(set_def_chn), GFP_KERNEL);
 	if (!sendbuf)
 		return -ENOMEM;
 
-	ret = usb_control_msg(udl->udev,
-			      usb_sndctrlpipe(udl->udev, 0),
+	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			      NR_USB_REQUEST_CHANNEL,
 			      (USB_DIR_OUT | USB_TYPE_VENDOR), 0, 0,
 			      sendbuf, sizeof(set_def_chn),
@@ -198,6 +198,7 @@ static void udl_free_urb_list(struct drm_device *dev)
 static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 {
 	struct udl_device *udl = to_udl(dev);
+	struct usb_device *udev = udl->drm.udev;
 	struct urb *urb;
 	struct urb_node *unode;
 	char *buf;
@@ -229,7 +230,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 		}
 		unode->urb = urb;
 
-		buf = usb_alloc_coherent(udl->udev, size, GFP_KERNEL,
+		buf = usb_alloc_coherent(udev, size, GFP_KERNEL,
 					 &urb->transfer_dma);
 		if (!buf) {
 			kfree(unode);
@@ -243,8 +244,8 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 		}
 
 		/* urb->transfer_buffer_length set to actual before submit */
-		usb_fill_bulk_urb(urb, udl->udev, usb_sndbulkpipe(udl->udev, 1),
-			buf, size, udl_urb_completion, unode);
+		usb_fill_bulk_urb(urb, udev, usb_sndbulkpipe(udev, 1),
+				  buf, size, udl_urb_completion, unode);
 		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
 		list_add_tail(&unode->entry, &udl->urbs.list);
@@ -316,7 +317,7 @@ int udl_init(struct udl_device *udl)
 
 	mutex_init(&udl->gem_lock);
 
-	if (!udl_parse_vendor_descriptor(dev, udl->udev)) {
+	if (!udl_parse_vendor_descriptor(dev, dev->udev)) {
 		ret = -ENODEV;
 		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
 		goto err;
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

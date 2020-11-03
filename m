Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE82A445A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 12:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07016EC6F;
	Tue,  3 Nov 2020 11:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95B7B6EC6A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 11:35:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E45FAAC23;
 Tue,  3 Nov 2020 11:34:59 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sean@poorly.run,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 2/2] drm/udl: Retrieve USB device from struct drm_device.dev
Date: Tue,  3 Nov 2020 12:34:56 +0100
Message-Id: <20201103113456.3066-3-tzimmermann@suse.de>
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
	* upcast dev with udl_to_usb_device()
v2:
	* upcast dev with drm_dev_get_usb_device()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/udl/udl_connector.c |  8 ++++----
 drivers/gpu/drm/udl/udl_drv.c       |  3 ---
 drivers/gpu/drm/udl/udl_drv.h       |  6 +++++-
 drivers/gpu/drm/udl/udl_main.c      | 23 ++++++++++++-----------
 4 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index cdc1c42e1669..3750fd216131 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -20,6 +20,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
 	int ret, i;
 	u8 *read_buff;
 	struct udl_device *udl = data;
+	struct usb_device *udev = udl_to_usb_device(udl);
 
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
index 96d4317a2c1b..993469d152da 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -53,7 +53,6 @@ static struct drm_driver driver = {
 
 static struct udl_device *udl_driver_create(struct usb_interface *interface)
 {
-	struct usb_device *udev = interface_to_usbdev(interface);
 	struct udl_device *udl;
 	int r;
 
@@ -62,8 +61,6 @@ static struct udl_device *udl_driver_create(struct usb_interface *interface)
 	if (IS_ERR(udl))
 		return udl;
 
-	udl->udev = udev;
-
 	r = udl_init(udl);
 	if (r)
 		return ERR_PTR(r);
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index b1461f30780b..875e73551ae9 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -50,7 +50,6 @@ struct urb_list {
 struct udl_device {
 	struct drm_device drm;
 	struct device *dev;
-	struct usb_device *udev;
 
 	struct drm_simple_display_pipe display_pipe;
 
@@ -66,6 +65,11 @@ struct udl_device {
 
 #define to_udl(x) container_of(x, struct udl_device, drm)
 
+static inline struct usb_device *udl_to_usb_device(struct udl_device *udl)
+{
+	return interface_to_usbdev(to_usb_interface(udl->drm.dev));
+}
+
 /* modeset */
 int udl_modeset_init(struct drm_device *dev);
 struct drm_connector *udl_connector_init(struct drm_device *dev);
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index f5d27f2a5654..0e2a376cb075 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -26,10 +26,9 @@
 #define GET_URB_TIMEOUT	HZ
 #define FREE_URB_TIMEOUT (HZ*2)
 
-static int udl_parse_vendor_descriptor(struct drm_device *dev,
-				       struct usb_device *usbdev)
+static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
-	struct udl_device *udl = to_udl(dev);
+	struct usb_device *udev = udl_to_usb_device(udl);
 	char *desc;
 	char *buf;
 	char *desc_end;
@@ -41,7 +40,7 @@ static int udl_parse_vendor_descriptor(struct drm_device *dev,
 		return false;
 	desc = buf;
 
-	total_len = usb_get_descriptor(usbdev, 0x5f, /* vendor specific */
+	total_len = usb_get_descriptor(udev, 0x5f, /* vendor specific */
 				    0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
 	if (total_len > 5) {
 		DRM_INFO("vendor descriptor length:%x data:%11ph\n",
@@ -98,19 +97,20 @@ static int udl_parse_vendor_descriptor(struct drm_device *dev,
  */
 static int udl_select_std_channel(struct udl_device *udl)
 {
-	int ret;
 	static const u8 set_def_chn[] = {0x57, 0xCD, 0xDC, 0xA7,
 					 0x1C, 0x88, 0x5E, 0x15,
 					 0x60, 0xFE, 0xC6, 0x97,
 					 0x16, 0x3D, 0x47, 0xF2};
+
 	void *sendbuf;
+	int ret;
+	struct usb_device *udev = udl_to_usb_device(udl);
 
 	sendbuf = kmemdup(set_def_chn, sizeof(set_def_chn), GFP_KERNEL);
 	if (!sendbuf)
 		return -ENOMEM;
 
-	ret = usb_control_msg(udl->udev,
-			      usb_sndctrlpipe(udl->udev, 0),
+	ret = usb_control_msg(udev, usb_sndctrlpipe(udev, 0),
 			      NR_USB_REQUEST_CHANNEL,
 			      (USB_DIR_OUT | USB_TYPE_VENDOR), 0, 0,
 			      sendbuf, sizeof(set_def_chn),
@@ -202,6 +202,7 @@ static int udl_alloc_urb_list(struct drm_device *dev, int count, size_t size)
 	struct urb_node *unode;
 	char *buf;
 	size_t wanted_size = count * size;
+	struct usb_device *udev = udl_to_usb_device(udl);
 
 	spin_lock_init(&udl->urbs.lock);
 
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
+	if (!udl_parse_vendor_descriptor(udl)) {
 		ret = -ENODEV;
 		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
 		goto err;
-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

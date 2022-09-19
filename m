Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6B5BCC78
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 15:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A075A10E203;
	Mon, 19 Sep 2022 13:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F0DA10E203
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 13:04:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A05741F8F6;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663592652; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMiHWjnL5AxNNQnyh7kqrA/u3p5yXouZVyUN2gFTCI=;
 b=gpf0Lva9zqAIzk2Z6b44OddXm5Hod2HCA+OVcwUb+6jBC0mjKaFXkkLwB2dalSSLJRS1Rc
 IBXj818HxGYho9boD3i8Xdyj/TvfNvRz0vwIPwhjsWAPyVzn+tFvWFboXPhahWmap5iNHr
 gitcIFkvHRA7mxN513gmn651Wb+MRBc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663592652;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMiHWjnL5AxNNQnyh7kqrA/u3p5yXouZVyUN2gFTCI=;
 b=kZadPC4iNZRaBwX8MVkvRJh8kERztgdW28lkIE70BqVRo2smzuciaCM3JnaSgNP4Jzlqnv
 WNB5NO3e1ChyiiDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76AF313A96;
 Mon, 19 Sep 2022 13:04:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QMbOG8xoKGMzOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Sep 2022 13:04:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	daniel@ffwll.ch
Subject: [PATCH 04/16] drm/udl: Various improvements to the connector
Date: Mon, 19 Sep 2022 15:03:56 +0200
Message-Id: <20220919130408.21486-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220919130408.21486-1-tzimmermann@suse.de>
References: <20220919130408.21486-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add style fixes, better error handling and reporting, and minor
clean-up changes to the connector code before moving the code to
the rest of the modesetting pipeline.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_connector.c | 64 ++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
index cb3d6820eaf9..538b47ffa67f 100644
--- a/drivers/gpu/drm/udl/udl_connector.c
+++ b/drivers/gpu/drm/udl/udl_connector.c
@@ -15,56 +15,64 @@
 #include "udl_connector.h"
 #include "udl_drv.h"
 
-static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
-			       size_t len)
+static int udl_get_edid_block(void *data, u8 *buf, unsigned int block, size_t len)
 {
-	int ret, i;
-	u8 *read_buff;
 	struct udl_device *udl = data;
+	struct drm_device *dev = &udl->drm;
 	struct usb_device *udev = udl_to_usb_device(udl);
+	u8 *read_buff;
+	int ret;
+	size_t i;
 
 	read_buff = kmalloc(2, GFP_KERNEL);
 	if (!read_buff)
-		return -1;
+		return -ENOMEM;
 
 	for (i = 0; i < len; i++) {
 		int bval = (i + block * EDID_LENGTH) << 8;
+
 		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
 				      0x02, (0x80 | (0x02 << 5)), bval,
 				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);
-		if (ret < 1) {
-			DRM_ERROR("Read EDID byte %d failed err %x\n", i, ret);
-			kfree(read_buff);
-			return -1;
+		if (ret < 0) {
+			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
+			goto err_kfree;
+		} else if (ret < 1) {
+			ret = -EIO;
+			drm_err(dev, "Read EDID byte %zu failed\n", i);
+			goto err_kfree;
 		}
+
 		buf[i] = read_buff[1];
 	}
 
 	kfree(read_buff);
+
 	return 0;
+
+err_kfree:
+	kfree(read_buff);
+	return ret;
 }
 
-static int udl_get_modes(struct drm_connector *connector)
+static int udl_connector_helper_get_modes(struct drm_connector *connector)
 {
 	struct udl_connector *udl_connector = to_udl_connector(connector);
 
 	drm_connector_update_edid_property(connector, udl_connector->edid);
 	if (udl_connector->edid)
 		return drm_add_edid_modes(connector, udl_connector->edid);
+
 	return 0;
 }
 
-static enum drm_connector_status
-udl_detect(struct drm_connector *connector, bool force)
+static enum drm_connector_status udl_connector_detect(struct drm_connector *connector, bool force)
 {
 	struct udl_device *udl = to_udl(connector->dev);
 	struct udl_connector *udl_connector = to_udl_connector(connector);
 
-	/* cleanup previous edid */
-	if (udl_connector->edid != NULL) {
-		kfree(udl_connector->edid);
-		udl_connector->edid = NULL;
-	}
+	/* cleanup previous EDID */
+	kfree(udl_connector->edid);
 
 	udl_connector->edid = drm_do_get_edid(connector, udl_get_edid_block, udl);
 	if (!udl_connector->edid)
@@ -79,38 +87,46 @@ static void udl_connector_destroy(struct drm_connector *connector)
 
 	drm_connector_cleanup(connector);
 	kfree(udl_connector->edid);
-	kfree(connector);
+	kfree(udl_connector);
 }
 
 static const struct drm_connector_helper_funcs udl_connector_helper_funcs = {
-	.get_modes = udl_get_modes,
+	.get_modes = udl_connector_helper_get_modes,
 };
 
 static const struct drm_connector_funcs udl_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
-	.detect = udl_detect,
+	.detect = udl_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = udl_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
 struct drm_connector *udl_connector_init(struct drm_device *dev)
 {
 	struct udl_connector *udl_connector;
 	struct drm_connector *connector;
+	int ret;
 
 	udl_connector = kzalloc(sizeof(*udl_connector), GFP_KERNEL);
 	if (!udl_connector)
 		return ERR_PTR(-ENOMEM);
 
 	connector = &udl_connector->connector;
-	drm_connector_init(dev, connector, &udl_connector_funcs,
-			   DRM_MODE_CONNECTOR_VGA);
+	ret = drm_connector_init(dev, connector, &udl_connector_funcs, DRM_MODE_CONNECTOR_VGA);
+	if (ret)
+		goto err_kfree;
+
 	drm_connector_helper_add(connector, &udl_connector_helper_funcs);
 
 	connector->polled = DRM_CONNECTOR_POLL_HPD |
-		DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
+			    DRM_CONNECTOR_POLL_CONNECT |
+			    DRM_CONNECTOR_POLL_DISCONNECT;
 
 	return connector;
+
+err_kfree:
+	kfree(udl_connector);
+	return ERR_PTR(ret);
 }
-- 
2.37.3


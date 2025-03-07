Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1BAA5624F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 09:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFE810E112;
	Fri,  7 Mar 2025 08:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xjSRa0XA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PGtHltnX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fiRAg2QW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mIxJzbj4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2716710E273
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 08:12:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1345211CD;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV0hWV0luiK4uqVfKd8neC74ZhWAxj/gPCkGP7GcI8Q=;
 b=xjSRa0XAgD9JVBs69sOOVNbzDBGyIstMfsr9G0ogW6R+rMra9xz9odcCiOM5yPu6norhFg
 A8g4vZ4mSTzARPr1rNF0t/Y8jXeGHYLl2VmnZrT25bAQ2j9i8RSy9NYYLQW/1DXY1VeDam
 dBdFwzZeOWIWXbfSh4AU1jtlAobJHK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335125;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV0hWV0luiK4uqVfKd8neC74ZhWAxj/gPCkGP7GcI8Q=;
 b=PGtHltnXv4uTCRzSSr/46TcnsSzaGHsV377JbJbaOu9YE75/Hrfql1z0AjKnHaNsL9kfQ3
 b+A5FcIokaAwWkBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fiRAg2QW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mIxJzbj4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1741335124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV0hWV0luiK4uqVfKd8neC74ZhWAxj/gPCkGP7GcI8Q=;
 b=fiRAg2QWokxmUnM6wAkJGqmurWYfdOQF4VFFjsT0Jo5Nay2lnMF+NnR4HpYmCjzja9y0zE
 EDNotdKpoPMrO9XhkScrqd6adM/uvCU6jzVXvjHs6LSZFhYdxBDXXSBZRUqKo98UMRrNJj
 gumT70yL1lxMez8pcozmqM2RsetlrLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1741335124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vV0hWV0luiK4uqVfKd8neC74ZhWAxj/gPCkGP7GcI8Q=;
 b=mIxJzbj42BGFOVc0n+6AkBVQ0riW82cA8w+4rdcY1/avwvwgg2VtOGBt8uOgY+ZkdBWMvs
 zbCh8f12YsAnHgAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F3DF13A22;
 Fri,  7 Mar 2025 08:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eATFHVSqymftLgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Mar 2025 08:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run, sumit.semwal@linaro.org,
 christian.koenig@amd.com, admin@kodeit.net, gargaditya08@live.com,
 jani.nikula@intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/5] drm/appletbdrm: Set struct drm_device.dma_dev
Date: Fri,  7 Mar 2025 09:04:00 +0100
Message-ID: <20250307080836.42848-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307080836.42848-1-tzimmermann@suse.de>
References: <20250307080836.42848-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E1345211CD
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[15];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[ffwll.ch,redhat.com,gmail.com,linux.intel.com,kernel.org,poorly.run,linaro.org,amd.com,kodeit.net,live.com,intel.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RLau4tukfh38qp3nirdnk14qe9)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Flag: NO
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the dma_dev field provided by the DRM device. Required for PRIME
dma-buf import. Remove the driver's implementation.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/appletbdrm.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tiny/appletbdrm.c b/drivers/gpu/drm/tiny/appletbdrm.c
index 394c8f9bd41a..703b9a41a086 100644
--- a/drivers/gpu/drm/tiny/appletbdrm.c
+++ b/drivers/gpu/drm/tiny/appletbdrm.c
@@ -45,7 +45,7 @@
 #define APPLETBDRM_BULK_MSG_TIMEOUT	1000
 
 #define drm_to_adev(_drm)		container_of(_drm, struct appletbdrm_device, drm)
-#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface(adev->dmadev))
+#define adev_to_udev(adev)		interface_to_usbdev(to_usb_interface((adev)->drm.dev))
 
 struct appletbdrm_msg_request_header {
 	__le16 unk_00;
@@ -123,8 +123,6 @@ struct appletbdrm_fb_request_response {
 } __packed;
 
 struct appletbdrm_device {
-	struct device *dmadev;
-
 	unsigned int in_ep;
 	unsigned int out_ep;
 
@@ -612,22 +610,10 @@ static const struct drm_encoder_funcs appletbdrm_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
-static struct drm_gem_object *appletbdrm_driver_gem_prime_import(struct drm_device *dev,
-								 struct dma_buf *dma_buf)
-{
-	struct appletbdrm_device *adev = drm_to_adev(dev);
-
-	if (!adev->dmadev)
-		return ERR_PTR(-ENODEV);
-
-	return drm_gem_prime_import_dev(dev, dma_buf, adev->dmadev);
-}
-
 DEFINE_DRM_GEM_FOPS(appletbdrm_drm_fops);
 
 static const struct drm_driver appletbdrm_drm_driver = {
 	DRM_GEM_SHMEM_DRIVER_OPS,
-	.gem_prime_import	= appletbdrm_driver_gem_prime_import,
 	.name			= "appletbdrm",
 	.desc			= "Apple Touch Bar DRM Driver",
 	.major			= 1,
@@ -747,6 +733,7 @@ static int appletbdrm_probe(struct usb_interface *intf,
 	struct device *dev = &intf->dev;
 	struct appletbdrm_device *adev;
 	struct drm_device *drm = NULL;
+	struct device *dma_dev;
 	int ret;
 
 	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
@@ -761,12 +748,19 @@ static int appletbdrm_probe(struct usb_interface *intf,
 
 	adev->in_ep = bulk_in->bEndpointAddress;
 	adev->out_ep = bulk_out->bEndpointAddress;
-	adev->dmadev = dev;
 
 	drm = &adev->drm;
 
 	usb_set_intfdata(intf, adev);
 
+	dma_dev = usb_intf_get_dma_device(intf);
+	if (dma_dev) {
+		drm_dev_set_dma_dev(drm, dma_dev);
+		put_device(dma_dev);
+	} else {
+		drm_warn(drm, "buffer sharing not supported"); /* not an error */
+	}
+
 	ret = appletbdrm_get_information(adev);
 	if (ret) {
 		drm_err(drm, "Failed to get display information\n");
@@ -805,7 +799,6 @@ static void appletbdrm_disconnect(struct usb_interface *intf)
 	struct appletbdrm_device *adev = usb_get_intfdata(intf);
 	struct drm_device *drm = &adev->drm;
 
-	put_device(adev->dmadev);
 	drm_dev_unplug(drm);
 	drm_atomic_helper_shutdown(drm);
 }
-- 
2.48.1


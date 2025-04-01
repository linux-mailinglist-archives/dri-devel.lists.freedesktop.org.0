Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64683A78024
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CFD10E60E;
	Tue,  1 Apr 2025 16:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0CF10E60E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2A6691F445;
 Tue,  1 Apr 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 017CE13A43;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id YMTIOuoS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 9/9] drm/udl: Support adapters without firmware descriptor
Date: Tue,  1 Apr 2025 18:12:19 +0200
Message-ID: <20250401161929.283244-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161929.283244-1-tzimmermann@suse.de>
References: <20250401161929.283244-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 2A6691F445
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Set default limit on the number of pixels for adapters without
vendor firmware descriptor. The devices work as expected, they
just don't provide any description.

If parsing the vendor firmware descriptor fails, the device falls
back to the given default limits. Failing to allocate memory is
still an error.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 37 +++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index b5a6b254a2028..2685608af8cec 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -76,6 +76,7 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
 	struct drm_device *dev = &udl->drm;
 	struct usb_device *udev = udl_to_usb_device(udl);
+	bool detected = false;
 	void *buf;
 	int ret;
 	unsigned int len;
@@ -84,16 +85,16 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 
 	buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
 	if (!buf)
-		return false;
+		return -ENOMEM;
 
 	ret = usb_get_descriptor(udev, 0x5f, /* vendor specific */
 				 0, buf, MAX_VENDOR_DESCRIPTOR_SIZE);
 	if (ret < 0)
-		goto unrecognized;
+		goto out;
 	len = ret;
 
 	if (len < 5)
-		goto unrecognized;
+		goto out;
 
 	desc = buf;
 	desc_end = desc + len;
@@ -103,21 +104,20 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	    (desc[2] != 0x01) ||   /* version (2 bytes) */
 	    (desc[3] != 0x00) ||
 	    (desc[4] != len - 2))  /* length after type */
-		goto unrecognized;
+		goto out;
 	desc += 5;
 
+	detected = true;
+
 	while (desc < desc_end)
 		desc = udl_parse_key_value_pair(udl, desc, desc_end);
 
-	goto success;
-
-unrecognized:
-	/* allow udlfb to load for now even if firmware unrecognized */
-	drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
-
-success:
+out:
+	if (!detected)
+		drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
 	kfree(buf);
-	return true;
+
+	return 0;
 }
 
 /*
@@ -345,11 +345,16 @@ int udl_init(struct udl_device *udl)
 		drm_warn(dev, "buffer sharing not supported"); /* not an error */
 	}
 
-	if (!udl_parse_vendor_descriptor(udl)) {
-		ret = -ENODEV;
-		DRM_ERROR("firmware not recognized. Assume incompatible device\n");
+	/*
+	 * Not all devices provide vendor descriptors with device
+	 * information. Initialize to default values from real-world
+	 * devices. It is just enough memory for FullHD.
+	 */
+	udl->sku_pixel_limit = USL_SKU_PIXEL_LIMIT_DEFAULT;
+
+	ret = udl_parse_vendor_descriptor(udl);
+	if (ret)
 		goto err;
-	}
 
 	if (udl_select_std_channel(udl))
 		DRM_ERROR("Selecting channel failed\n");
-- 
2.49.0


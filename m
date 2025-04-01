Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F11A78034
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DA110E616;
	Tue,  1 Apr 2025 16:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E6910E616
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F1DE821190;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5DD9138A5;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ANv6LuoS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 8/9] drm/udl: Validate length in vendor-descriptor parser
Date: Tue,  1 Apr 2025 18:12:18 +0200
Message-ID: <20250401161929.283244-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161929.283244-1-tzimmermann@suse.de>
References: <20250401161929.283244-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 TAGGED_RCPT(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: F1DE821190
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
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

Rewrite the parser for the vendor firmware descriptor with the
following improvements.

- Validate the key-value length given in a vendor descriptor
against the length of the descriptor. The current code fails
to do this and might read more bytes than available. This can
lead to out-of-bounds reads of the allocated buffer.

- Read raw data with helpers for unaligned data. This allows
the code to run on platforms that do now support unaligned memory
access by default.

- Validate the pixel limit against a default value. The default
comes from real-world devices. If the reported number of pixels
is significantly above the limit, it is likely invalid.

- Drop the obsolete print macros. There is still a warning about
invalid firmware descriptors. The rest of the output is bogus.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 77 ++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index d3a04bcb65d25..b5a6b254a2028 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -8,6 +8,8 @@
  * Copyright (C) 2009 Bernie Thompson <bernie@plugable.com>
  */
 
+#include <linux/unaligned.h>
+
 #include <drm/drm.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -23,10 +25,56 @@
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
 
+#define UDL_SKU_PIXEL_LIMIT_DEFAULT	2080000
+
 static struct urb *udl_get_urb_locked(struct udl_device *udl, long timeout);
 
+/*
+ * Try to make sense of whatever we parse. Therefore return @end on
+ * errors, but don't fail hard.
+ */
+static const u8 *udl_parse_key_value_pair(struct udl_device *udl, const u8 *pos, const u8 *end)
+{
+	u16 key;
+	u8 len;
+
+	/* read key */
+	if (pos >= end - 2)
+		return end;
+	key = get_unaligned_le16(pos);
+	pos += 2;
+
+	/* read value length */
+	if (pos >= end - 1)
+		return end;
+	len = *pos++;
+
+	/* read value */
+	if (pos >= end - len)
+		return end;
+	switch (key) {
+	case 0x0200: { /* maximum number of pixels */
+		unsigned int sku_pixel_limit;
+
+		if (len < sizeof(__le32))
+			break;
+		sku_pixel_limit = get_unaligned_le32(pos);
+		if (sku_pixel_limit >= 16 * UDL_SKU_PIXEL_LIMIT_DEFAULT)
+			break; /* almost 100 MiB, so probably bogus */
+		udl->sku_pixel_limit = sku_pixel_limit;
+		break;
+	}
+	default:
+		break;
+	}
+	pos += len;
+
+	return pos;
+}
+
 static int udl_parse_vendor_descriptor(struct udl_device *udl)
 {
+	struct drm_device *dev = &udl->drm;
 	struct usb_device *udev = udl_to_usb_device(udl);
 	void *buf;
 	int ret;
@@ -50,8 +98,6 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	desc = buf;
 	desc_end = desc + len;
 
-	DRM_INFO("vendor descriptor length: %u data:%11ph\n", len, desc);
-
 	if ((desc[0] != len) ||    /* descriptor length */
 	    (desc[1] != 0x5f) ||   /* vendor descriptor type */
 	    (desc[2] != 0x01) ||   /* version (2 bytes) */
@@ -60,35 +106,14 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 		goto unrecognized;
 	desc += 5;
 
-	while (desc < desc_end) {
-		u8 length;
-		u16 key;
-
-		key = le16_to_cpu(*((u16 *)desc));
-		desc += sizeof(u16);
-		length = *desc;
-		desc++;
-
-		switch (key) {
-		case 0x0200: { /* max_area */
-			u32 max_area = le32_to_cpu(*((u32 *)desc));
-
-			DRM_DEBUG("DL chip limited to %d pixel modes\n",
-				  max_area);
-			udl->sku_pixel_limit = max_area;
-			break;
-		}
-		default:
-			break;
-		}
-		desc += length;
-	}
+	while (desc < desc_end)
+		desc = udl_parse_key_value_pair(udl, desc, desc_end);
 
 	goto success;
 
 unrecognized:
 	/* allow udlfb to load for now even if firmware unrecognized */
-	DRM_ERROR("Unrecognized vendor firmware descriptor\n");
+	drm_warn(dev, "Unrecognized vendor firmware descriptor\n");
 
 success:
 	kfree(buf);
-- 
2.49.0


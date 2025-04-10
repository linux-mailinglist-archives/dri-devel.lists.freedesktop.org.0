Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3869A84161
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F8A10E957;
	Thu, 10 Apr 2025 11:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="pqwgjmH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gcxmelHN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pqwgjmH5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gcxmelHN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E0010E957
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:03:22 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B6A821160;
 Thu, 10 Apr 2025 11:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFCxNF9C/vCg5/ONt8h1jav1aoFpfzKkgJRScuabnV0=;
 b=pqwgjmH5wFfPqtpsEVeCOnEpM2+qLSaa5ireCeHeDPyzo/ogcbqitGyFjHdV3z5omxcEF3
 CFDxk+mBvwHShOzGaz0qk+KkmgaJiW0lsApagT36vcIB0HTn9cm0VEsyNelKQwelIXeQ7d
 rTvl9gTLcHjAzx/5DHogNCJ200qWibo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFCxNF9C/vCg5/ONt8h1jav1aoFpfzKkgJRScuabnV0=;
 b=gcxmelHNhyW0UGwqSTCGswzRuBaO8bdZhIfC/mhNjDXgnu0rcr7JsGCeiiRsuBxGMr2m4b
 eN7ChlIPaNleyTAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFCxNF9C/vCg5/ONt8h1jav1aoFpfzKkgJRScuabnV0=;
 b=pqwgjmH5wFfPqtpsEVeCOnEpM2+qLSaa5ireCeHeDPyzo/ogcbqitGyFjHdV3z5omxcEF3
 CFDxk+mBvwHShOzGaz0qk+KkmgaJiW0lsApagT36vcIB0HTn9cm0VEsyNelKQwelIXeQ7d
 rTvl9gTLcHjAzx/5DHogNCJ200qWibo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xFCxNF9C/vCg5/ONt8h1jav1aoFpfzKkgJRScuabnV0=;
 b=gcxmelHNhyW0UGwqSTCGswzRuBaO8bdZhIfC/mhNjDXgnu0rcr7JsGCeiiRsuBxGMr2m4b
 eN7ChlIPaNleyTAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B080013886;
 Thu, 10 Apr 2025 11:03:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aDtQIGWl92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:03:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 8/9] drm/udl: Validate length in vendor-descriptor parser
Date: Thu, 10 Apr 2025 12:59:05 +0200
Message-ID: <20250410105948.25463-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410105948.25463-1-tzimmermann@suse.de>
References: <20250410105948.25463-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
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
Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
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


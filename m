Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9121FA83D46
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5A710E7C1;
	Thu, 10 Apr 2025 08:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="qvD4uwwT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dsv4Oihx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="qvD4uwwT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Dsv4Oihx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6B110E7C1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:41:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DDA1B21168;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDAk+DrFcVGqSNAqpVWMvoOaCxLr8R9cfE+n6875Nq0=;
 b=qvD4uwwTGDIoaEIK75ZAWHmjkLuTYDa49rp99chuiJcKBaWFgllLrBTKZHBE87bq6OY6KI
 frhpayGcUmF4HzgyLm1lS0JvR5e9/cHVk6aoT2ClnvowpLh8BfRphcflrTGNTCPyMrbkw6
 hnvFy7dIK1rG7JuLoWoyq58694Rcj4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDAk+DrFcVGqSNAqpVWMvoOaCxLr8R9cfE+n6875Nq0=;
 b=Dsv4Oihxq1X3g27unDiZLjDlY5MOQeLf6QU6xyeirvAAE+wbWg5kBkCLnnq90oW6U+BEXm
 Fi14Px4Vct0Pr1Bw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=qvD4uwwT;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Dsv4Oihx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDAk+DrFcVGqSNAqpVWMvoOaCxLr8R9cfE+n6875Nq0=;
 b=qvD4uwwTGDIoaEIK75ZAWHmjkLuTYDa49rp99chuiJcKBaWFgllLrBTKZHBE87bq6OY6KI
 frhpayGcUmF4HzgyLm1lS0JvR5e9/cHVk6aoT2ClnvowpLh8BfRphcflrTGNTCPyMrbkw6
 hnvFy7dIK1rG7JuLoWoyq58694Rcj4c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DDAk+DrFcVGqSNAqpVWMvoOaCxLr8R9cfE+n6875Nq0=;
 b=Dsv4Oihxq1X3g27unDiZLjDlY5MOQeLf6QU6xyeirvAAE+wbWg5kBkCLnnq90oW6U+BEXm
 Fi14Px4Vct0Pr1Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B226B13A84;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id mMiTKUKE92enDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 08:41:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] drm/sysfb: Share helpers for integer validation
Date: Thu, 10 Apr 2025 10:37:24 +0200
Message-ID: <20250410083834.10810-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410083834.10810-1-tzimmermann@suse.de>
References: <20250410083834.10810-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DDA1B21168
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

Provide sysfb helpers for validating framebuffer integer values
against limits. Update drivers. If a driver did not specify a limit
for a certain value, use INT_MAX.

v2:
- declare module information near EOF (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb.c        | 27 ++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  9 ++++++++
 drivers/gpu/drm/sysfb/efidrm.c           | 29 ++++--------------------
 drivers/gpu/drm/sysfb/ofdrm.c            | 12 ++--------
 drivers/gpu/drm/sysfb/simpledrm.c        | 14 ++----------
 drivers/gpu/drm/sysfb/vesadrm.c          | 29 ++++--------------------
 6 files changed, 48 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb.c b/drivers/gpu/drm/sysfb/drm_sysfb.c
index c083d21fd9cab..308f82153b158 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb.c
@@ -1,8 +1,35 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/export.h>
+#include <linux/limits.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 
+#include <drm/drm_print.h>
+
 #include "drm_sysfb_helper.h"
 
+int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
+				u64 value, u32 max)
+{
+	if (value > min(max, INT_MAX)) {
+		drm_warn(dev, "%s of %llu exceeds maximum of %u\n", name, value, max);
+		return -EINVAL;
+	}
+	return value;
+}
+EXPORT_SYMBOL(drm_sysfb_get_validated_int);
+
+int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
+				 u64 value, u32 max)
+{
+	if (!value) {
+		drm_warn(dev, "%s of 0 not allowed\n", name);
+		return -EINVAL;
+	}
+	return drm_sysfb_get_validated_int(dev, name, value, max);
+}
+EXPORT_SYMBOL(drm_sysfb_get_validated_int0);
+
 MODULE_DESCRIPTION("Helpers for DRM sysfb drivers");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index ee94d6199b601..1697cf7ace973 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -13,6 +13,15 @@
 struct drm_format_info;
 struct drm_scanout_buffer;
 
+/*
+ * Input parsing
+ */
+
+int drm_sysfb_get_validated_int(struct drm_device *dev, const char *name,
+				u64 value, u32 max);
+int drm_sysfb_get_validated_int0(struct drm_device *dev, const char *name,
+				 u64 value, u32 max);
+
 /*
  * Display modes
  */
diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
index af90064a4c04f..a77ea5285cc1d 100644
--- a/drivers/gpu/drm/sysfb/efidrm.c
+++ b/drivers/gpu/drm/sysfb/efidrm.c
@@ -33,28 +33,6 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
-static int efidrm_get_validated_int(struct drm_device *dev, const char *name,
-				    u64 value, u32 max)
-{
-	if (max > INT_MAX)
-		max = INT_MAX;
-	if (value > max) {
-		drm_err(dev, "%s of %llu exceeds maximum of %u\n", name, value, max);
-		return -EINVAL;
-	}
-	return value;
-}
-
-static int efidrm_get_validated_int0(struct drm_device *dev, const char *name,
-				     u64 value, u32 max)
-{
-	if (!value) {
-		drm_err(dev, "%s of 0 not allowed\n", name);
-		return -EINVAL;
-	}
-	return efidrm_get_validated_int(dev, name, value, max);
-}
-
 static s64 efidrm_get_validated_size0(struct drm_device *dev, const char *name,
 				      u64 value, u64 max)
 {
@@ -70,12 +48,12 @@ static s64 efidrm_get_validated_size0(struct drm_device *dev, const char *name,
 
 static int efidrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
 {
-	return efidrm_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
+	return drm_sysfb_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
 }
 
 static int efidrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
 {
-	return efidrm_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
+	return drm_sysfb_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
 }
 
 static struct resource *efidrm_get_memory_si(struct drm_device *dev,
@@ -102,7 +80,8 @@ static int efidrm_get_stride_si(struct drm_device *dev, const struct screen_info
 	if (!lfb_linelength)
 		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
 
-	return efidrm_get_validated_int0(dev, "stride", lfb_linelength, div64_u64(size, height));
+	return drm_sysfb_get_validated_int0(dev, "stride", lfb_linelength,
+					    div64_u64(size, height));
 }
 
 static u64 efidrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 86c1a0c80ceb3..fddfe8bea9f7f 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -78,20 +78,12 @@ enum ofdrm_model {
 
 static int display_get_validated_int(struct drm_device *dev, const char *name, uint32_t value)
 {
-	if (value > INT_MAX) {
-		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
-		return -EINVAL;
-	}
-	return (int)value;
+	return drm_sysfb_get_validated_int(dev, name, value, INT_MAX);
 }
 
 static int display_get_validated_int0(struct drm_device *dev, const char *name, uint32_t value)
 {
-	if (!value) {
-		drm_err(dev, "invalid framebuffer %s of %u\n", name, value);
-		return -EINVAL;
-	}
-	return display_get_validated_int(dev, name, value);
+	return drm_sysfb_get_validated_int0(dev, name, value, INT_MAX);
 }
 
 static const struct drm_format_info *display_get_validated_format(struct drm_device *dev,
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index f37b1994de71f..a1c3119330def 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -42,24 +42,14 @@ static int
 simplefb_get_validated_int(struct drm_device *dev, const char *name,
 			   uint32_t value)
 {
-	if (value > INT_MAX) {
-		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
-			name, value);
-		return -EINVAL;
-	}
-	return (int)value;
+	return drm_sysfb_get_validated_int(dev, name, value, INT_MAX);
 }
 
 static int
 simplefb_get_validated_int0(struct drm_device *dev, const char *name,
 			    uint32_t value)
 {
-	if (!value) {
-		drm_err(dev, "simplefb: invalid framebuffer %s of %u\n",
-			name, value);
-		return -EINVAL;
-	}
-	return simplefb_get_validated_int(dev, name, value);
+	return drm_sysfb_get_validated_int0(dev, name, value, INT_MAX);
 }
 
 static const struct drm_format_info *
diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index 9cc50e3072ead..d87ff77be20de 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -36,28 +36,6 @@
 
 #define VESADRM_GAMMA_LUT_SIZE 256
 
-static int vesadrm_get_validated_int(struct drm_device *dev, const char *name,
-				     u64 value, u32 max)
-{
-	if (max > INT_MAX)
-		max = INT_MAX;
-	if (value > max) {
-		drm_err(dev, "%s of %llu exceeds maximum of %u\n", name, value, max);
-		return -EINVAL;
-	}
-	return value;
-}
-
-static int vesadrm_get_validated_int0(struct drm_device *dev, const char *name,
-				      u64 value, u32 max)
-{
-	if (!value) {
-		drm_err(dev, "%s of 0 not allowed\n", name);
-		return -EINVAL;
-	}
-	return vesadrm_get_validated_int(dev, name, value, max);
-}
-
 static s64 vesadrm_get_validated_size0(struct drm_device *dev, const char *name,
 				       u64 value, u64 max)
 {
@@ -73,12 +51,12 @@ static s64 vesadrm_get_validated_size0(struct drm_device *dev, const char *name,
 
 static int vesadrm_get_width_si(struct drm_device *dev, const struct screen_info *si)
 {
-	return vesadrm_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
+	return drm_sysfb_get_validated_int0(dev, "width", si->lfb_width, U16_MAX);
 }
 
 static int vesadrm_get_height_si(struct drm_device *dev, const struct screen_info *si)
 {
-	return vesadrm_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
+	return drm_sysfb_get_validated_int0(dev, "height", si->lfb_height, U16_MAX);
 }
 
 static struct resource *vesadrm_get_memory_si(struct drm_device *dev,
@@ -105,7 +83,8 @@ static int vesadrm_get_stride_si(struct drm_device *dev, const struct screen_inf
 	if (!lfb_linelength)
 		lfb_linelength = drm_format_info_min_pitch(format, 0, width);
 
-	return vesadrm_get_validated_int0(dev, "stride", lfb_linelength, div64_u64(size, height));
+	return drm_sysfb_get_validated_int0(dev, "stride", lfb_linelength,
+					    div64_u64(size, height));
 }
 
 static u64 vesadrm_get_visible_size_si(struct drm_device *dev, const struct screen_info *si,
-- 
2.49.0


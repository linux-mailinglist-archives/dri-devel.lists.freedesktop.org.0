Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B9C595F3A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 17:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C76410F673;
	Tue, 16 Aug 2022 15:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 6097 seconds by postgrey-1.36 at gabe;
 Tue, 16 Aug 2022 15:37:02 UTC
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64B090B98
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 15:37:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 646371FE90;
 Tue, 16 Aug 2022 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660664221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eS3+J1xXqrlEflC4+69MJ2yPUC0hDCX6aposgxx7isU=;
 b=Y6iRCAtE63g2ELrm9EeNCxQNwW9kgwU95WSieYsd2/23Ji3kmd8kpJIeuijYmmWGSsH4HR
 OJD7aflGFR6ttyVZ2gvrRQMW+rRTirhgtmZdNDTJV+xdZvwoe1nNhxO++kXLHrTZruc+8C
 MnuVlHTddQ4GqZOV4Xg9i+AzYPr1uEw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660664221;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eS3+J1xXqrlEflC4+69MJ2yPUC0hDCX6aposgxx7isU=;
 b=cGzskk8o/xdi0N+lVV+borXjwtXabYB8KR7RtLKqhoTEwfSlqZLBnw3pd5JILW5M+jhwXm
 ZXW/0zF4JfYTH3Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 00D23139B7;
 Tue, 16 Aug 2022 15:37:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +IvwOpy5+2LKJAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 16 Aug 2022 15:37:00 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/12] drm/udl: Add reset_resume
Date: Tue, 16 Aug 2022 17:36:45 +0200
Message-Id: <20220816153655.27526-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220816153655.27526-1-tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thomas Zimmermann <tzimmermann@suse.de>

Implement the reset_resume callback of struct usb_driver. Set the
standard channel when called.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_drv.c  | 11 +++++++++++
 drivers/gpu/drm/udl/udl_drv.h  |  1 +
 drivers/gpu/drm/udl/udl_main.c |  2 +-
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 5703277c6f52..0ba88e5472a9 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -32,6 +32,16 @@ static int udl_usb_resume(struct usb_interface *interface)
 	return drm_mode_config_helper_resume(dev);
 }
 
+static int udl_usb_reset_resume(struct usb_interface *interface)
+{
+	struct drm_device *dev = usb_get_intfdata(interface);
+	struct udl_device *udl = to_udl(dev);
+
+	udl_select_std_channel(udl);
+
+	return drm_mode_config_helper_resume(dev);
+}
+
 /*
  * FIXME: Dma-buf sharing requires DMA support by the importing device.
  *        This function is a workaround to make USB devices work as well.
@@ -140,6 +150,7 @@ static struct usb_driver udl_driver = {
 	.disconnect = udl_usb_disconnect,
 	.suspend = udl_usb_suspend,
 	.resume = udl_usb_resume,
+	.reset_resume = udl_usb_reset_resume,
 	.id_table = id_table,
 };
 module_usb_driver(udl_driver);
diff --git a/drivers/gpu/drm/udl/udl_drv.h b/drivers/gpu/drm/udl/udl_drv.h
index 28aaf75d71cf..37c14b0ff1fc 100644
--- a/drivers/gpu/drm/udl/udl_drv.h
+++ b/drivers/gpu/drm/udl/udl_drv.h
@@ -95,6 +95,7 @@ int udl_render_hline(struct drm_device *dev, int log_bpp, struct urb **urb_ptr,
 		     u32 byte_offset, u32 device_byte_offset, u32 byte_width);
 
 int udl_drop_usb(struct drm_device *dev);
+int udl_select_std_channel(struct udl_device *udl);
 
 #define CMD_WRITE_RAW8   "\xAF\x60" /**< 8 bit raw write command. */
 #define CMD_WRITE_RL8    "\xAF\x61" /**< 8 bit run length command. */
diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index fdafbf8f3c3c..7d1e6bbc165c 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -92,7 +92,7 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 /*
  * Need to ensure a channel is selected before submitting URBs
  */
-static int udl_select_std_channel(struct udl_device *udl)
+int udl_select_std_channel(struct udl_device *udl)
 {
 	static const u8 set_def_chn[] = {0x57, 0xCD, 0xDC, 0xA7,
 					 0x1C, 0x88, 0x5E, 0x15,
-- 
2.35.3


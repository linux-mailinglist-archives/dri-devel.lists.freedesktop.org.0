Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCAA5AE14F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CEF10E5A7;
	Tue,  6 Sep 2022 07:40:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501D010E59F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:39:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C1E4E3375A;
 Tue,  6 Sep 2022 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662449994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eS3+J1xXqrlEflC4+69MJ2yPUC0hDCX6aposgxx7isU=;
 b=Yx1STeYUddnCrG7wMg1F1b+Yf73pNNRMpuYBknnP+GDsPWB8VKhLhgbyx+l4ua5C7seP+m
 fs4MrTWz+yYrG4C9EHi0xJA/WT3XcEIAe7zJrWKJfQakyOsUEANXmQqpvyXJMefr5EAP9X
 tdgrNNR6vTkJW9UpJGh6sP4nDt6VqFc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662449994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eS3+J1xXqrlEflC4+69MJ2yPUC0hDCX6aposgxx7isU=;
 b=S6dAmmctM41KE05AZc5z0xmpNGUCWTjBUJaR35cg2132H5l0lAu39z7k0Sn3QMWzrTnzEk
 hTeWhzI5EZ21B7DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9982213A7A;
 Tue,  6 Sep 2022 07:39:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QO3iIUr5FmPeOgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 07:39:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 02/11] drm/udl: Add reset_resume
Date: Tue,  6 Sep 2022 09:39:42 +0200
Message-Id: <20220906073951.2085-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220906073951.2085-1-tiwai@suse.de>
References: <20220906073951.2085-1-tiwai@suse.de>
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


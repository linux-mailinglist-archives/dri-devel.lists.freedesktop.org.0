Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A57587070E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5489112315;
	Mon,  4 Mar 2024 16:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6077112315
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:32:26 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 479CF337CD;
 Mon,  4 Mar 2024 16:32:25 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id E44DE13A92;
 Mon,  4 Mar 2024 16:32:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id UKh2Npj35WVLAQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Mar 2024 16:32:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, andy@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com, deller@gmx.de, robin@protonic.nl, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>
Subject: [PATCH v3 03/10] hid/hid-picolcd: Fix initialization order
Date: Mon,  4 Mar 2024 17:29:48 +0100
Message-ID: <20240304163220.19144-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304163220.19144-1-tzimmermann@suse.de>
References: <20240304163220.19144-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 479CF337CD
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

For drivers that support backlight, LCD and fbdev devices, fbdev has
to be initialized last. See documentation for struct fbinfo.bl_dev.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/hid/hid-picolcd_core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-picolcd_core.c b/drivers/hid/hid-picolcd_core.c
index bbda231a7ce30..5ddebe25eb91f 100644
--- a/drivers/hid/hid-picolcd_core.c
+++ b/drivers/hid/hid-picolcd_core.c
@@ -474,11 +474,6 @@ static int picolcd_probe_lcd(struct hid_device *hdev, struct picolcd_data *data)
 	if (error)
 		goto err;
 
-	/* Set up the framebuffer device */
-	error = picolcd_init_framebuffer(data);
-	if (error)
-		goto err;
-
 	/* Setup lcd class device */
 	error = picolcd_init_lcd(data, picolcd_out_report(REPORT_CONTRAST, hdev));
 	if (error)
@@ -489,6 +484,11 @@ static int picolcd_probe_lcd(struct hid_device *hdev, struct picolcd_data *data)
 	if (error)
 		goto err;
 
+	/* Set up the framebuffer device */
+	error = picolcd_init_framebuffer(data);
+	if (error)
+		goto err;
+
 	/* Setup the LED class devices */
 	error = picolcd_init_leds(data, picolcd_out_report(REPORT_LED_STATE, hdev));
 	if (error)
@@ -502,9 +502,9 @@ static int picolcd_probe_lcd(struct hid_device *hdev, struct picolcd_data *data)
 	return 0;
 err:
 	picolcd_exit_leds(data);
+	picolcd_exit_framebuffer(data);
 	picolcd_exit_backlight(data);
 	picolcd_exit_lcd(data);
-	picolcd_exit_framebuffer(data);
 	picolcd_exit_cir(data);
 	picolcd_exit_keys(data);
 	return error;
@@ -623,9 +623,9 @@ static void picolcd_remove(struct hid_device *hdev)
 	/* Cleanup LED */
 	picolcd_exit_leds(data);
 	/* Clean up the framebuffer */
+	picolcd_exit_framebuffer(data);
 	picolcd_exit_backlight(data);
 	picolcd_exit_lcd(data);
-	picolcd_exit_framebuffer(data);
 	/* Cleanup input */
 	picolcd_exit_cir(data);
 	picolcd_exit_keys(data);
-- 
2.44.0


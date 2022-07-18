Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC02577C7B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EFBAB7BA;
	Mon, 18 Jul 2022 07:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A3AB7BA
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:23:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3E32020BCF;
 Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658129006; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42h/UIObJ9Ayu66FbgApYndLPjIuMAorzolTv7m88Mk=;
 b=i5oiUoHrc1btfczNi4xxPJTF59a8kcGHmLanNxK1cfVwW9uxg5BIgth/415MgagZn7Jz3K
 AvSS62kQSR0OI62r1nPJjwHNEBTFiRVJjhLkIiTZvr4KN4cpjeymm0laooe75OfibPL9cj
 w+xgvNxX2mfDr2WwacBGdh1JYri7vSk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658129006;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=42h/UIObJ9Ayu66FbgApYndLPjIuMAorzolTv7m88Mk=;
 b=gtRt8qUI0msuFgWaqMB6FDij2aNb+9oBv2+ts/VBoPO+PL2uKec5iOSjdK5BazUJkpWT1Q
 FWe1L3I+jOCWWZBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1382513AB6;
 Mon, 18 Jul 2022 07:23:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sJvsA24K1WKjcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 07:23:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH v2 09/11] video/aperture: Remove conflicting VGA devices,
 if any
Date: Mon, 18 Jul 2022 09:23:20 +0200
Message-Id: <20220718072322.8927-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718072322.8927-1-tzimmermann@suse.de>
References: <20220718072322.8927-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On the primary graphics adapter, a driver might conflict with a VGA
driver that controls the VGA framebuffer I/O range. Remove the VGA
driver from the aperture helpers. Until now, this case has been
hendled by fbdev, but it should work even with fbdev disabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/aperture.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/video/aperture.c b/drivers/video/aperture.c
index 101e13c2cf41..abc691284a77 100644
--- a/drivers/video/aperture.c
+++ b/drivers/video/aperture.c
@@ -12,6 +12,8 @@
 #include <linux/types.h>
 #include <linux/vgaarb.h>
 
+#include <video/vga.h>
+
 /**
  * DOC: overview
  *
@@ -300,6 +302,16 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 	 */
 	sysfb_disable();
 
+	aperture_detach_devices(base, size);
+
+	/*
+	 * If this is the primary adapter, there could be a VGA device
+	 * that consumes the VGA framebuffer I/O range. Remove this device
+	 * as well.
+	 */
+	if (primary)
+		aperture_detach_devices(VGA_FB_PHYS_BASE, VGA_FB_PHYS_SIZE);
+
 #if IS_REACHABLE(CONFIG_FB)
 	a = alloc_apertures(1);
 	if (!a)
@@ -315,8 +327,6 @@ int aperture_remove_conflicting_devices(resource_size_t base, resource_size_t si
 		return ret;
 #endif
 
-	aperture_detach_devices(base, size);
-
 	return 0;
 }
 EXPORT_SYMBOL(aperture_remove_conflicting_devices);
-- 
2.36.1


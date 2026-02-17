Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIDTITmQlGk9FgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:58:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB6114DC4C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 16:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE6810E4EF;
	Tue, 17 Feb 2026 15:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="io63cU5g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6JEO41Ly";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="io63cU5g";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="6JEO41Ly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E29710E4EF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 15:58:43 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4380B5BCDE;
 Tue, 17 Feb 2026 15:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=io63cU5gavOP4EsmrC30BblrFhLcGx8dwHaWUjgJx9oJr8jW04nuV8cHvnSGegRTWcmG4H
 C9NmPLOHZduCjVMNOo7QzimP5n16XjLYBh2Chx27u8j7Dxr+HyE5WrgRUk3PeMZJs5t7yH
 N9OBQD5aInd8gvTYug2HYoP1F/k5WXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=6JEO41LyzJLcSXLCVtndmodagGfCI8sJJgGt3DsJy5OhWIvdcrUSUjNrsGCTbcYJcJ5sgi
 W2nl/Kf6aIygAFAQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=io63cU5g;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=6JEO41Ly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1771343922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=io63cU5gavOP4EsmrC30BblrFhLcGx8dwHaWUjgJx9oJr8jW04nuV8cHvnSGegRTWcmG4H
 C9NmPLOHZduCjVMNOo7QzimP5n16XjLYBh2Chx27u8j7Dxr+HyE5WrgRUk3PeMZJs5t7yH
 N9OBQD5aInd8gvTYug2HYoP1F/k5WXk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1771343922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=6JEO41LyzJLcSXLCVtndmodagGfCI8sJJgGt3DsJy5OhWIvdcrUSUjNrsGCTbcYJcJ5sgi
 W2nl/Kf6aIygAFAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAFCB3EA65;
 Tue, 17 Feb 2026 15:58:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oIw/NDGQlGk9PgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Feb 2026 15:58:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 03/12] firmware: google: framebuffer: Init memory resource
 with helper macro
Date: Tue, 17 Feb 2026 16:56:13 +0100
Message-ID: <20260217155836.96267-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260217155836.96267-1-tzimmermann@suse.de>
References: <20260217155836.96267-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.01
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,suse.de:email,res.name:url]
X-Rspamd-Queue-Id: DCB6114DC4C
X-Rspamd-Action: no action

Initialize framebuffer memory resource with DEFINE_RES_MEM() instead
of open-coding the setup.

While at it, drop the resource name to make the kernel use the device
name of the simple-framebuffer device for the resource. The latter
includes a device number. While the meaning of the resource name is
somewhat fuzzy and varies across entries in /proc/iomem, showing the
device name seems more helpful than showing a fixed name.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
---
 drivers/firmware/google/framebuffer-coreboot.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/google/framebuffer-coreboot.c b/drivers/firmware/google/framebuffer-coreboot.c
index f44183476ed7..767515a30a52 100644
--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -26,7 +26,6 @@ static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 static int framebuffer_probe(struct coreboot_device *dev)
 {
 	int i;
-	u32 length;
 	struct lb_framebuffer *fb = &dev->framebuffer;
 	struct platform_device *pdev;
 	struct resource res;
@@ -53,6 +52,11 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (!fb->physical_address)
 		return -ENODEV;
 
+	res = DEFINE_RES_MEM(fb->physical_address,
+			     PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line));
+	if (res.end <= res.start)
+		return -EINVAL;
+
 	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
 		if (fb->bits_per_pixel     == formats[i].bits_per_pixel &&
 		    fb->red_mask_pos       == formats[i].red.offset &&
@@ -66,15 +70,6 @@ static int framebuffer_probe(struct coreboot_device *dev)
 	if (!pdata.format)
 		return -ENODEV;
 
-	memset(&res, 0, sizeof(res));
-	res.flags = IORESOURCE_MEM;
-	res.name = "Coreboot Framebuffer";
-	res.start = fb->physical_address;
-	length = PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line);
-	res.end = res.start + length - 1;
-	if (res.end <= res.start)
-		return -EINVAL;
-
 	pdev = platform_device_register_resndata(&dev->dev,
 						 "simple-framebuffer", 0,
 						 &res, 1, &pdata,
-- 
2.52.0


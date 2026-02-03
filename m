Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNgiEFn+gWmYNgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE03DA39B
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 14:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0610E66A;
	Tue,  3 Feb 2026 13:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="jEp/ifCr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PRKh7GBo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="jEp/ifCr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PRKh7GBo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 303A010E66A
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 13:55:33 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BE1895BCC9;
 Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=jEp/ifCr13E1JuyjLo8z43EPEraBoBLQ2LZOLqZjOVduSAFTQBIdZSsxAkTR5757SiEgjV
 7eDpV+7LuiWKf/0ANwFxMtNEnbu0QY2u/+pnU2+BfTQDTsjkMTiyYIiXUfNG2MEjMuKJlV
 m3UrZ4evURgCOF8aeWNkoA9nqhXwqvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=PRKh7GBomvurknelJIuLFxNNuGGPGj5YpDiTHl7Rd/lWd1IlCr+dXDLfo+NUQs5RCjsz2M
 C1GWArI/4qO3aFCg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="jEp/ifCr";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PRKh7GBo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1770126927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=jEp/ifCr13E1JuyjLo8z43EPEraBoBLQ2LZOLqZjOVduSAFTQBIdZSsxAkTR5757SiEgjV
 7eDpV+7LuiWKf/0ANwFxMtNEnbu0QY2u/+pnU2+BfTQDTsjkMTiyYIiXUfNG2MEjMuKJlV
 m3UrZ4evURgCOF8aeWNkoA9nqhXwqvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1770126927;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Qvs0nOjZ1c/Jmjdj8IonkP4UlSuNMWdUzdxjvdxVQA=;
 b=PRKh7GBomvurknelJIuLFxNNuGGPGj5YpDiTHl7Rd/lWd1IlCr+dXDLfo+NUQs5RCjsz2M
 C1GWArI/4qO3aFCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6528B3EA64;
 Tue,  3 Feb 2026 13:55:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id eAOBF0/+gWlGDwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Feb 2026 13:55:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tzungbi@kernel.org, briannorris@chromium.org, jwerner@chromium.org,
 javierm@redhat.com, samuel@sholland.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 03/12] firmware: google: framebuffer: Init memory resource
 with helper macro
Date: Tue,  3 Feb 2026 14:52:22 +0100
Message-ID: <20260203135519.417931-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203135519.417931-1-tzimmermann@suse.de>
References: <20260203135519.417931-1-tzimmermann@suse.de>
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
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:tzungbi@kernel.org,m:briannorris@chromium.org,m:jwerner@chromium.org,m:javierm@redhat.com,m:samuel@sholland.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:chrome-platform@lists.linux.dev,m:tzimmermann@suse.de,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,chromium.org,redhat.com,sholland.org,linux.intel.com,gmail.com,ffwll.ch];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[tzimmermann@suse.de,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,suse.de:email,suse.de:dkim,suse.de:mid,res.name:url]
X-Rspamd-Queue-Id: BDE03DA39B
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


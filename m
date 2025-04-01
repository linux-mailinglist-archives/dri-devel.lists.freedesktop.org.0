Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95FA7802D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90AF10E613;
	Tue,  1 Apr 2025 16:23:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="t268xbWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUzluKsF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="t268xbWR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HUzluKsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B29310E613
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:32 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F19921179;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+M7B3Pox3ENsI98NBP0CwykKTvgAlZ88iVnSAVIwOk=;
 b=t268xbWR0N7cTymMaT3zVJfalWK3V0XSlQHfr5DMFLRZJF8NEykhpWiib2/BUPrlXkUtId
 KKK4ewzpWjtxaYsc5tNFomIkdG571mtSlAFhtjwFKKFIhtlQuPerp8zeW1rUzmEdLJSUXo
 raCNWUpyuyqUrf6920fPw5ZtlW7qQxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+M7B3Pox3ENsI98NBP0CwykKTvgAlZ88iVnSAVIwOk=;
 b=HUzluKsFXHs+P0KVBhHpbCAtkcOlygYJScquXOEiBfstbbtyZTGslZ583DrLzZleSNpDAW
 RsxStKuYdxS11ZDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524586; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+M7B3Pox3ENsI98NBP0CwykKTvgAlZ88iVnSAVIwOk=;
 b=t268xbWR0N7cTymMaT3zVJfalWK3V0XSlQHfr5DMFLRZJF8NEykhpWiib2/BUPrlXkUtId
 KKK4ewzpWjtxaYsc5tNFomIkdG571mtSlAFhtjwFKKFIhtlQuPerp8zeW1rUzmEdLJSUXo
 raCNWUpyuyqUrf6920fPw5ZtlW7qQxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524586;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d+M7B3Pox3ENsI98NBP0CwykKTvgAlZ88iVnSAVIwOk=;
 b=HUzluKsFXHs+P0KVBhHpbCAtkcOlygYJScquXOEiBfstbbtyZTGslZ583DrLzZleSNpDAW
 RsxStKuYdxS11ZDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3835713A43;
 Tue,  1 Apr 2025 16:23:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QMiBDOoS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] drm/udl: Handle errors from usb_get_descriptor()
Date: Tue,  1 Apr 2025 18:12:15 +0200
Message-ID: <20250401161929.283244-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161929.283244-1-tzimmermann@suse.de>
References: <20250401161929.283244-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -5.30
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Reading the vendor descriptor from the udl device can fail with
an error, which the current code fails to capture. Store the return
value in an integer and test for the error. Abort parsing on errors
or treat the value as length on success.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/udl/udl_main.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 47fb6c34bfde3..4291ddb7158c4 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -31,28 +31,32 @@ static int udl_parse_vendor_descriptor(struct udl_device *udl)
 	char *desc;
 	char *buf;
 	char *desc_end;
-
-	u8 total_len = 0;
+	int ret;
+	unsigned int len;
 
 	buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
 	if (!buf)
 		return false;
 	desc = buf;
 
-	total_len = usb_get_descriptor(udev, 0x5f, /* vendor specific */
-				    0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
-	if (total_len > 5) {
-		DRM_INFO("vendor descriptor length:%x data:%11ph\n",
-			total_len, desc);
+	ret = usb_get_descriptor(udev, 0x5f, /* vendor specific */
+				 0, desc, MAX_VENDOR_DESCRIPTOR_SIZE);
+	if (ret < 0)
+		goto unrecognized;
+	len = ret;
+
+	if (len > 5) {
+		DRM_INFO("vendor descriptor length: %u data:%11ph\n",
+			 len, desc);
 
-		if ((desc[0] != total_len) || /* descriptor length */
+		if ((desc[0] != len) ||    /* descriptor length */
 		    (desc[1] != 0x5f) ||   /* vendor descriptor type */
 		    (desc[2] != 0x01) ||   /* version (2 bytes) */
 		    (desc[3] != 0x00) ||
-		    (desc[4] != total_len - 2)) /* length after type */
+		    (desc[4] != len - 2))  /* length after type */
 			goto unrecognized;
 
-		desc_end = desc + total_len;
+		desc_end = desc + len;
 		desc += 5; /* the fixed header we've already parsed */
 
 		while (desc < desc_end) {
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A173EB05A16
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F0810E5AF;
	Tue, 15 Jul 2025 12:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Nha4ze27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2989Y8pp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nha4ze27";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2989Y8pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F810E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:30:20 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 594EF1F7A2;
 Tue, 15 Jul 2025 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752582600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCm2YElLOxyPZdvbgI5q6uWBdMdbl3YtVkvPWEDIyC0=;
 b=Nha4ze27LI+bdIYg40brUMc30qF9FU46B5Cl6ojGsJNmLhQI8QPUpUSPEQr5u2t08KnIK1
 CwxtlOi1GEFVZ115iUyaac7qUylzI2FfVnEH3F0HlA2kqPUQjqhNxjbKczNMYQlGWQRiVg
 MYsw59BEcQlDK/6ODGMKdkjsMZNXryk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752582600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCm2YElLOxyPZdvbgI5q6uWBdMdbl3YtVkvPWEDIyC0=;
 b=2989Y8ppuJeEHTx98x6Hb7CbJRqHzU23+3OHZ9EpauliN7HqE2Xn+gs9KkIkvmrB8bDFTQ
 SBKS7wlo6UC+wRBQ==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Nha4ze27;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=2989Y8pp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752582600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCm2YElLOxyPZdvbgI5q6uWBdMdbl3YtVkvPWEDIyC0=;
 b=Nha4ze27LI+bdIYg40brUMc30qF9FU46B5Cl6ojGsJNmLhQI8QPUpUSPEQr5u2t08KnIK1
 CwxtlOi1GEFVZ115iUyaac7qUylzI2FfVnEH3F0HlA2kqPUQjqhNxjbKczNMYQlGWQRiVg
 MYsw59BEcQlDK/6ODGMKdkjsMZNXryk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752582600;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lCm2YElLOxyPZdvbgI5q6uWBdMdbl3YtVkvPWEDIyC0=;
 b=2989Y8ppuJeEHTx98x6Hb7CbJRqHzU23+3OHZ9EpauliN7HqE2Xn+gs9KkIkvmrB8bDFTQ
 SBKS7wlo6UC+wRBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA0ED13A6C;
 Tue, 15 Jul 2025 12:29:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WAgiKMdJdmgaIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, deller@gmx.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, support.opensource@diasemi.com, duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/15] backlight: da9052_bl: Include
 <linux/mod_devicetable.h>
Date: Tue, 15 Jul 2025 14:24:46 +0200
Message-ID: <20250715122643.137027-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 594EF1F7A2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[25]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 TAGGED_RCPT(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 R_RATELIMIT(0.00)[to_ip_from(RL95szse9eqfwu74ziohs8j73e)];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Score: -1.51
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

Include <linux/mod_devicetable.h> to declare struct platform_device_id.
Avoids dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/da9052_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/da9052_bl.c b/drivers/video/backlight/da9052_bl.c
index f41523d78121..2493138febfa 100644
--- a/drivers/video/backlight/da9052_bl.c
+++ b/drivers/video/backlight/da9052_bl.c
@@ -9,6 +9,7 @@
 
 #include <linux/backlight.h>
 #include <linux/delay.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-- 
2.50.0


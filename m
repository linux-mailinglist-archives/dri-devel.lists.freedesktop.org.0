Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D0DA23ECB
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 15:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AADED10E204;
	Fri, 31 Jan 2025 14:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rYHz3/yE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="MZ7wsW/w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xnkQUMb9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="62zdGyFv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAC710E216
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 14:01:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF8451F391;
 Fri, 31 Jan 2025 14:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvRSJWIwjkY9HUuT9CfqtdZ/aKrF9jIoKcT/BFIvl3s=;
 b=rYHz3/yE84p9hIKcrkizqrAyOhHtE5tFT2Ldwm8I6jk/yIoZFnCZjrq7CMhi6QxC5VArOv
 /ZWBoaZHJUxTlq6lW5A6vYv/y9K37+sCuNj1bVe3rsAEGAL2JdTmifSC4KiBELPavz1mvt
 28wj8/R2C+IMNQituiXFxWZoCI01pmU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332069;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvRSJWIwjkY9HUuT9CfqtdZ/aKrF9jIoKcT/BFIvl3s=;
 b=MZ7wsW/wZQ6hxgiZwDTcxtDIlHvvxjQuGMzkSjSgFHRU2SIgRAttiO1tiGbh7yynQdCBY8
 ZQMYUdW1uqitjmCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvRSJWIwjkY9HUuT9CfqtdZ/aKrF9jIoKcT/BFIvl3s=;
 b=xnkQUMb9+6r5EVaGCV01MqC8omLUhlGzDzYka6i2CJe8wjbFoDsiP+udOkl5s/jTdCE/ZI
 kikJNeiQGMyVIPaC76C1Yz/eBnp8T0V3Dtg2qM9pAPGmDpKRyKtMF6kU7xpXaLDM6jRf60
 //jgnNNLbBQ16rkMaiuk1R6yxIV9GBQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YvRSJWIwjkY9HUuT9CfqtdZ/aKrF9jIoKcT/BFIvl3s=;
 b=62zdGyFv5FNr1P6cVm+B/hiwJB/rHGSmKhyo7iUSPF08yYCH+FUSLqaJ/soqUZlRW/mwsX
 Ew/w/uKRJgaPurAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9505A13AA0;
 Fri, 31 Jan 2025 14:01:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +AcZI6TXnGfbcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 14:01:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 michael.hennerich@analog.com, support.opensource@diasemi.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/16] backlight: adp8860_bl: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 14:58:34 +0100
Message-ID: <20250131140103.278158-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131140103.278158-1-tzimmermann@suse.de>
References: <20250131140103.278158-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,analog.com,diasemi.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

This driver does not require <linux/fb.h>. Remove the include
statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/adp8860_bl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
index f51ada4795e8e..d4bbd7a7406b0 100644
--- a/drivers/video/backlight/adp8860_bl.c
+++ b/drivers/video/backlight/adp8860_bl.c
@@ -11,7 +11,6 @@
 #include <linux/pm.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/slab.h>
-- 
2.48.1


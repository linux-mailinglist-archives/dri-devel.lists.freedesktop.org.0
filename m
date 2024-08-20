Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AEE958262
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA80B10E5A4;
	Tue, 20 Aug 2024 09:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="aRywnqQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFBJknGR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aRywnqQq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TFBJknGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C655210E58C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:35:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A861225B6;
 Tue, 20 Aug 2024 09:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
 b=aRywnqQqB1mofpGwIGjIZMuNYZMIfLlNsFSrPaHjPyWZIjOStnMAhcCcOCw39DgfJromJr
 X2SKj9AuWroHZ6at3hykRfd6f0BsvPfAY3S8ADWeaEqADk97v9UE75VBI4Wt+Wkk++RFrJ
 IlKxgV5hfJWSZh4E2K+eha4JC7rGopQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
 b=TFBJknGRTk5K1DABWSmpaDZu9AryCZtMvBDccAH4tHoXae/ndh9Vj4HW5A7Q5IsuMvS0oW
 NNY7mxQUsdz/9WAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1724146511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
 b=aRywnqQqB1mofpGwIGjIZMuNYZMIfLlNsFSrPaHjPyWZIjOStnMAhcCcOCw39DgfJromJr
 X2SKj9AuWroHZ6at3hykRfd6f0BsvPfAY3S8ADWeaEqADk97v9UE75VBI4Wt+Wkk++RFrJ
 IlKxgV5hfJWSZh4E2K+eha4JC7rGopQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1724146511;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17S1lOwBlZ4ZwI5HR27QexSgcKc55keHcjdB1iyt98c=;
 b=TFBJknGRTk5K1DABWSmpaDZu9AryCZtMvBDccAH4tHoXae/ndh9Vj4HW5A7Q5IsuMvS0oW
 NNY7mxQUsdz/9WAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0202C13770;
 Tue, 20 Aug 2024 09:35:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cCvoOk5jxGa3RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Aug 2024 09:35:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 28/28] backlight: lcd: Do not include <linux/fb.h> in lcd
 header
Date: Tue, 20 Aug 2024 11:23:06 +0200
Message-ID: <20240820093452.68270-29-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820093452.68270-1-tzimmermann@suse.de>
References: <20240820093452.68270-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,gmx.de,linux-vserver.org,mail.ru,pengutronix.de];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 R_RATELIMIT(0.00)[to(RLr3u6jgwj9sedc854c38mga),to_ip_from(RL7eb4yoy35resap1sns3bbybe)];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de,mail.ru]
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

With the excpetion of fb_notifier_callback(), none of the lcd code
uses fbdev; especially the lcd drivers. Remove the include statement
for <linux/fb.h> from the public lcd header.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/lcd.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/lcd.h b/include/linux/lcd.h
index 59a80b396a71..c3ccdff4519a 100644
--- a/include/linux/lcd.h
+++ b/include/linux/lcd.h
@@ -12,7 +12,6 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/notifier.h>
-#include <linux/fb.h>
 
 #define LCD_POWER_ON			(0)
 #define LCD_POWER_REDUCED		(1) // deprecated; don't use in new code
-- 
2.46.0


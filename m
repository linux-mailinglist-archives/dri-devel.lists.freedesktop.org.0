Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1353A23EC5
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 15:01:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850D210E1D6;
	Fri, 31 Jan 2025 14:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="wbJu8QXJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W5OILC6u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="wbJu8QXJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="W5OILC6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794CE10E1D2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 14:01:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3F3412115D;
 Fri, 31 Jan 2025 14:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjdec7UXRBZyBEnQEzOH/LDCn+Wd5CNY0Cs7zZNamt4=;
 b=wbJu8QXJpxAUqWKEwYpNQPy6LIoQbOFimPg6dEoioe480wEHHuwASQX0gpqyNZm/pTi2BP
 hbsDTlF4bts6qr/Tocqgw+yZZQb7Kd3eWQxcwAwnobYAiB4Pfka0rpQGm3XO5owyhqYTNS
 nHHNrq2OEtRHARiEeHsJUkmtjzpgAZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332069;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjdec7UXRBZyBEnQEzOH/LDCn+Wd5CNY0Cs7zZNamt4=;
 b=W5OILC6ue4DVMFNAWfzeM/SJq6jz6ZXIE0CADneoQq0KetYU7CUBBjSD+MeKR0eu28Etuy
 hTDjzkGlmZ98I6Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjdec7UXRBZyBEnQEzOH/LDCn+Wd5CNY0Cs7zZNamt4=;
 b=wbJu8QXJpxAUqWKEwYpNQPy6LIoQbOFimPg6dEoioe480wEHHuwASQX0gpqyNZm/pTi2BP
 hbsDTlF4bts6qr/Tocqgw+yZZQb7Kd3eWQxcwAwnobYAiB4Pfka0rpQGm3XO5owyhqYTNS
 nHHNrq2OEtRHARiEeHsJUkmtjzpgAZg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332069;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pjdec7UXRBZyBEnQEzOH/LDCn+Wd5CNY0Cs7zZNamt4=;
 b=W5OILC6ue4DVMFNAWfzeM/SJq6jz6ZXIE0CADneoQq0KetYU7CUBBjSD+MeKR0eu28Etuy
 hTDjzkGlmZ98I6Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E0D3A13AF1;
 Fri, 31 Jan 2025 14:01:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2G2JNaTXnGfbcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 14:01:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 michael.hennerich@analog.com, support.opensource@diasemi.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/16] backlight: adp8870_bl: Do not include <linux/fb.h>
Date: Fri, 31 Jan 2025 14:58:35 +0100
Message-ID: <20250131140103.278158-5-tzimmermann@suse.de>
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
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
 drivers/video/backlight/adp8870_bl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index ad4bd4c8f441d..e09e20492e7c1 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -11,7 +11,6 @@
 #include <linux/pm.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
-#include <linux/fb.h>
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/workqueue.h>
-- 
2.48.1


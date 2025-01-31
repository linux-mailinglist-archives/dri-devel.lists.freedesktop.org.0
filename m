Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C5AA23EC7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 15:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848AF10E1D2;
	Fri, 31 Jan 2025 14:01:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1RM0vbBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ft5f1Gkh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UzVqjCxm";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z8g/EMRS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF4510E204
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 14:01:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E85121F38D;
 Fri, 31 Jan 2025 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=runrax6cSqbhEFuH2V1wlWl1yoojzhyr4qemGuoIJS8=;
 b=1RM0vbBc+LYgRX+eywvQzS1TLSph2j36nn6hvmLcC8XKcInq2MjQcp2dhHD0roLakUdiwa
 0l1rpyi429NRlBKYy6r4Ame3IA3OG4IoTZfnUyOQG4sbrcDqva3anvWNGtcec5WqW8wFEO
 skoPYx31ODE09TY9AxQkxymoB3W6C3w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332069;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=runrax6cSqbhEFuH2V1wlWl1yoojzhyr4qemGuoIJS8=;
 b=ft5f1GkhNWuu7+8UOcE0m2GwQHNOyLwoiHIaSQSp7ma867k1P9rBbaKe2ULjmzzPx6LIa1
 qG0v2R2Cog0rUFDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1738332067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=runrax6cSqbhEFuH2V1wlWl1yoojzhyr4qemGuoIJS8=;
 b=UzVqjCxmGGFRwIbHToL1srCcv3Doc70DqpfXH0psN2Gbt/vMxfOyAUN0/haStbCsyNTR5I
 3Zyl0GO8cHvpDecYqVhoouifqUU+1e9CUsm9+Hk170h10GZH5z4zd9Bc4ts3Fm4TbWxbRs
 57ofGcW58+tPJmMhUAm2GrDdNohGOR0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1738332067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=runrax6cSqbhEFuH2V1wlWl1yoojzhyr4qemGuoIJS8=;
 b=Z8g/EMRST6yPbzWi02JHCr+KBxqF3VNxk/zVvb2nsIYCnGe/1eTClKIcg1St4I7OJBLhNU
 8ps8wyS/cxCHAGCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AAE7A133A6;
 Fri, 31 Jan 2025 14:01:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id NEQ0KKPXnGfbcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 31 Jan 2025 14:01:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 michael.hennerich@analog.com, support.opensource@diasemi.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/16] backlight: Do not include <linux/fb.h> in drivers
Date: Fri, 31 Jan 2025 14:58:31 +0100
Message-ID: <20250131140103.278158-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.998];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,analog.com,diasemi.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
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

A number of backlight drivers include <linux/fb.h>. None of them
requires anything from the header file, so remove the include
statements.

Thomas Zimmermann (16):
  backlight: 88pm860x_bl: Do not include <linux/fb.h>
  backlight: adp5520_bl: Do not include <linux/fb.h>
  backlight: adp8860_bl: Do not include <linux/fb.h>
  backlight: adp8870_bl: Do not include <linux/fb.h>
  backlight: as3711_bl: Do not include <linux/fb.h>
  backlight: bd6107_bl: Do not include <linux/fb.h>
  backlight: da903x_bl: Do not include <linux/fb.h>
  backlight: da9052_bl: Do not include <linux/fb.h>
  backlight: ep93xx_bl: Do not include <linux/fb.h>
  backlight: hp680_bl: Do not include <linux/fb.h>
  backlight: locomolcd: Do not include <linux/fb.h>
  backlight: lv5207lp: Do not include <linux/fb.h>
  backlight: max8925_bl: Do not include <linux/fb.h>
  backlight: tps65217_bl: Do not include <linux/fb.h>
  backlight: vgg2432a4: Do not include <linux/fb.h>
  backlight: wm831x_bl: Do not include <linux/fb.h>

 drivers/video/backlight/88pm860x_bl.c | 1 -
 drivers/video/backlight/adp5520_bl.c  | 1 -
 drivers/video/backlight/adp8860_bl.c  | 1 -
 drivers/video/backlight/adp8870_bl.c  | 1 -
 drivers/video/backlight/as3711_bl.c   | 1 -
 drivers/video/backlight/bd6107.c      | 1 -
 drivers/video/backlight/da903x_bl.c   | 1 -
 drivers/video/backlight/da9052_bl.c   | 1 -
 drivers/video/backlight/ep93xx_bl.c   | 1 -
 drivers/video/backlight/hp680_bl.c    | 1 -
 drivers/video/backlight/locomolcd.c   | 1 -
 drivers/video/backlight/lv5207lp.c    | 1 -
 drivers/video/backlight/max8925_bl.c  | 1 -
 drivers/video/backlight/tps65217_bl.c | 1 -
 drivers/video/backlight/vgg2432a4.c   | 1 -
 drivers/video/backlight/wm831x_bl.c   | 1 -
 16 files changed, 16 deletions(-)

-- 
2.48.1


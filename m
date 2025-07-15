Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC05B05A10
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 14:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EB810E5B2;
	Tue, 15 Jul 2025 12:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d3Ur0ggF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0yvktK2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d3Ur0ggF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z0yvktK2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D791D10E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 12:30:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05C0E21245;
 Tue, 15 Jul 2025 12:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752582603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfMA5jpuUju64NgKFNvWoBRdK8wrazN//HzlWpdAV1U=;
 b=d3Ur0ggFJ0Dxe4iE0Ze9MUQHdF4X48OmpY2al5Uo3i8B2YJpX0pXVECbjm4HY8kp6/2+Fk
 UmNsKx62f/yKSW542oU5LO5HEGrXyESdu+k6VSKkxpj2M9Ley1nUsbrg64nHHtSzcHJMp3
 oLuF5e/9gbKlwXdO+e2wdDtrS9lOELA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752582603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfMA5jpuUju64NgKFNvWoBRdK8wrazN//HzlWpdAV1U=;
 b=z0yvktK2iC2I/l3rMsrHLSq7BC+vipxyMu0m+RUAT9PWUYUddoIoRn7cN3joPvrA6ik3Fq
 dshIgUTkJm39FZDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752582603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfMA5jpuUju64NgKFNvWoBRdK8wrazN//HzlWpdAV1U=;
 b=d3Ur0ggFJ0Dxe4iE0Ze9MUQHdF4X48OmpY2al5Uo3i8B2YJpX0pXVECbjm4HY8kp6/2+Fk
 UmNsKx62f/yKSW542oU5LO5HEGrXyESdu+k6VSKkxpj2M9Ley1nUsbrg64nHHtSzcHJMp3
 oLuF5e/9gbKlwXdO+e2wdDtrS9lOELA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752582603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfMA5jpuUju64NgKFNvWoBRdK8wrazN//HzlWpdAV1U=;
 b=z0yvktK2iC2I/l3rMsrHLSq7BC+vipxyMu0m+RUAT9PWUYUddoIoRn7cN3joPvrA6ik3Fq
 dshIgUTkJm39FZDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6A17E13306;
 Tue, 15 Jul 2025 12:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kL2FGMpJdmgaIwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:30:02 +0000
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
Subject: [PATCH v2 13/15] backlight: rave-sp: Include <linux/of.h> and
 <linux/mod_devicetable.h>
Date: Tue, 15 Jul 2025 14:24:50 +0200
Message-ID: <20250715122643.137027-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCPT_COUNT_TWELVE(0.00)[25]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 R_RATELIMIT(0.00)[to(RLpx6hatunazuh7ud675imbh78),to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

Include <linux/of.h> to declare struct device_node and include
<linux/mod_devicetable.h> to declare struct of_device_id. Avoids
dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/rave-sp-backlight.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/backlight/rave-sp-backlight.c b/drivers/video/backlight/rave-sp-backlight.c
index e708a060a6e4..bfe01b9b9174 100644
--- a/drivers/video/backlight/rave-sp-backlight.c
+++ b/drivers/video/backlight/rave-sp-backlight.c
@@ -9,8 +9,10 @@
 
 #include <linux/backlight.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/mfd/rave-sp.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #define	RAVE_SP_BACKLIGHT_LCD_EN	BIT(7)
-- 
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13873B22070
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3CF10E5BA;
	Tue, 12 Aug 2025 08:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rCUCM2z/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pOOF+I0u";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="weI3+q6B";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TJxptvzd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552C510E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:14:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2C201F452;
 Tue, 12 Aug 2025 08:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754986456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W2XmFwYdPAtj1tBx54DN3z4R3RLESbQV2558yDmC+Wg=;
 b=rCUCM2z/TGBlWgSPY1nPNEsdb2dDLnRjFyjAyNLDrLsZHCeXg8y5wEvoz6Qwwf8tP8uShD
 V5qBGiIWrB6EN1HMPdNZHUqyTL6o9M9CT+k5kEFZCrccOentixFQY+mMwgWmczAGTflGS+
 OwHvctj0Zu7DMyjywhQvEjbjVU5aBFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754986456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W2XmFwYdPAtj1tBx54DN3z4R3RLESbQV2558yDmC+Wg=;
 b=pOOF+I0u/edXppD9CK7vJDbI9AEKOuMUO2i07e1eCjIdiAKhM/fcgmdKb+O8w21ta3Napp
 ZUzzb6ewu6I0VXAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=weI3+q6B;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TJxptvzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754986455; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W2XmFwYdPAtj1tBx54DN3z4R3RLESbQV2558yDmC+Wg=;
 b=weI3+q6B1/Ws8DR6YnwCZTpqpP3+kFsA4wi03r6UJgJMa8cn7T5NVCQeE30oNuL/qdul1t
 uoLece096JXxsHPxhhnvC/ebitrD+IORKqgKxZIcHZuqMk4THL5eZsaLXvDYTNxf5q8144
 MrSrIw8hrSdl/7t7AjNO0NINxRt+Kzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754986455;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W2XmFwYdPAtj1tBx54DN3z4R3RLESbQV2558yDmC+Wg=;
 b=TJxptvzd6+D3WwZTEFfnjTVNgPBGEYVfk9EQPD9zHZt4BBvVD3x3+So1c1Fgib05Q5cDTI
 xAzjxqVo6geLsSDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B2CE11351A;
 Tue, 12 Aug 2025 08:14:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8nI3Ktf3mmgSYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 08:14:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: fnkl.kernel@gmail.com, j@jannau.net, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/panel: panel-summit: Include <linux/property.h> and
 <linux/mod_devicetable.h>
Date: Tue, 12 Aug 2025 10:10:32 +0200
Message-ID: <20250812081118.221103-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmail.com,jannau.net,linaro.org,oss.qualcomm.com,kernel.org];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
 ARC_NA(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; TAGGED_RCPT(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: F2C201F452
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

Include <linux/property.h> to declare device_property_read_u32() and
<linux/mod_devicetable.h> to declare struct of_device_id. Avoids the
dependency on the backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
Based on an earlier patch reviewed at [1].

[1] https://patchwork.freedesktop.org/patch/664115/?series=150454&rev=3
---
 drivers/gpu/drm/panel/panel-summit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
index 4854437e2899..6d40b9ddfe02 100644
--- a/drivers/gpu/drm/panel/panel-summit.c
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/backlight.h>
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
 #include <drm/drm_device.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_mode.h>
-- 
2.50.1


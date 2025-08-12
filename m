Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8DFB220CD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D280110E0F5;
	Tue, 12 Aug 2025 08:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="M0Rz5yfZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QAbmnvcD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="M0Rz5yfZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QAbmnvcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDF110E0F5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 08:28:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01B5621CE2;
 Tue, 12 Aug 2025 08:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754987284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sO1V+49Pq0Rp5UnpJl49reGM5xjEAqSCPnLkFjCt0Yk=;
 b=M0Rz5yfZPPDTUcUeUZThHN3KIoVoMnV4S34B95IGqt1hKHbzsXBk1S3fiviqVOjWLOh8p4
 FS1GMsiiQpolua8G4AFrwIAFcqa3NAvErSF23xR77dF6FjAuH6v7hru+5EfNYLk7ZQHhWr
 gp1dGeK3o0B8qwarRfk79gcVGTxah84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754987284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sO1V+49Pq0Rp5UnpJl49reGM5xjEAqSCPnLkFjCt0Yk=;
 b=QAbmnvcDnegjDsu6sDIS7nFFMUWDglC0h0O9d0ylIuDEghyAwNrVuURaiPzYUFk+yiteVU
 ANJkOEBvvTKXEyAw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=M0Rz5yfZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=QAbmnvcD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1754987284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sO1V+49Pq0Rp5UnpJl49reGM5xjEAqSCPnLkFjCt0Yk=;
 b=M0Rz5yfZPPDTUcUeUZThHN3KIoVoMnV4S34B95IGqt1hKHbzsXBk1S3fiviqVOjWLOh8p4
 FS1GMsiiQpolua8G4AFrwIAFcqa3NAvErSF23xR77dF6FjAuH6v7hru+5EfNYLk7ZQHhWr
 gp1dGeK3o0B8qwarRfk79gcVGTxah84=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1754987284;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sO1V+49Pq0Rp5UnpJl49reGM5xjEAqSCPnLkFjCt0Yk=;
 b=QAbmnvcDnegjDsu6sDIS7nFFMUWDglC0h0O9d0ylIuDEghyAwNrVuURaiPzYUFk+yiteVU
 ANJkOEBvvTKXEyAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C47DE1351A;
 Tue, 12 Aug 2025 08:28:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id w72FLhP7mmiXZQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 12 Aug 2025 08:28:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/panel: panel-samsung-s6e88a0-ams427ap24: Fix includes
Date: Tue, 12 Aug 2025 10:25:09 +0200
Message-ID: <20250812082509.227879-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 01B5621CE2
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_THREE(0.00)[4];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:mid, suse.de:email,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.01
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

Include <linux/property.h> to declare device_property_read_bool() and
<linux/mod_devicetable.h> to declare struct of_device_id. Avoids the
dependency on the backlight header to include both.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
index e91f50662997..7e2f4e043d62 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -7,7 +7,9 @@
 #include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 
 #include <video/mipi_display.h>
-- 
2.50.1


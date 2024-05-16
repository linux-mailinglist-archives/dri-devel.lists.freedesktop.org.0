Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5F08C76B3
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 14:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92ED10ECD6;
	Thu, 16 May 2024 12:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lfFd290Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7w/3v7pY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lfFd290Q";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7w/3v7pY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E69710ECD5;
 Thu, 16 May 2024 12:43:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4E4FC5C399;
 Thu, 16 May 2024 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715863401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ekZcd8pJFpXVNDlEU83NveCWqM2djxgv35HO1YJlkyA=;
 b=lfFd290QtjS+lowshx7oGM3UbFZcSJIap0DHzkn1mqsE9pCC9lTxenQlCUgZj24E1JzKPV
 8j7JH6jMRDqdW80/1yFh9p45d/ufgvLsFlR8ZyeOngXPmxY/lzEOvc1ARJ5XnqWBj8W1/Q
 B8ia9Kd7HjM+SQSFejnPj2xumgyNCuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715863401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ekZcd8pJFpXVNDlEU83NveCWqM2djxgv35HO1YJlkyA=;
 b=7w/3v7pYZrCZGViKO0nJgFV5VuX7WseN6i/uv1Lay2Tdd+s+NVBIMn6Di7L0JQnARtKjIn
 KvXe69XxMZnL0gBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lfFd290Q;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="7w/3v7pY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715863401; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ekZcd8pJFpXVNDlEU83NveCWqM2djxgv35HO1YJlkyA=;
 b=lfFd290QtjS+lowshx7oGM3UbFZcSJIap0DHzkn1mqsE9pCC9lTxenQlCUgZj24E1JzKPV
 8j7JH6jMRDqdW80/1yFh9p45d/ufgvLsFlR8ZyeOngXPmxY/lzEOvc1ARJ5XnqWBj8W1/Q
 B8ia9Kd7HjM+SQSFejnPj2xumgyNCuI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715863401;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ekZcd8pJFpXVNDlEU83NveCWqM2djxgv35HO1YJlkyA=;
 b=7w/3v7pYZrCZGViKO0nJgFV5VuX7WseN6i/uv1Lay2Tdd+s+NVBIMn6Di7L0JQnARtKjIn
 KvXe69XxMZnL0gBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EE1FF137C3;
 Thu, 16 May 2024 12:43:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id qYnLOGj/RWavCwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 16 May 2024 12:43:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: rafael@kernel.org, lenb@kernel.org, arnd@arndb.de,
 chaitanya.kumar.borah@intel.com, suresh.kumar.kurmi@intel.com,
 jani.saarinen@intel.com
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] ACPI: video: Fix name collision with architecture's video.o
Date: Thu, 16 May 2024 14:43:15 +0200
Message-ID: <20240516124317.710-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -5.01
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4E4FC5C399
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[13];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, suse.de:email,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns, intel.com:email]
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

Commit 2fd001cd3600 ("arch: Rename fbdev header and source files")
renames the video source files under arch/ such that they does not
refer to fbdev any longer. The new files named video.o conflict with
ACPI's video.ko module. Modprobing the ACPI module can then fail with
warnings about missing symbols, as shown below.

  (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_unregister (err -2)
  (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_register_backlight (err -2)
  (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol __acpi_video_get_backlight_type (err -2)
  (i915_selftest:1107) igt_kmod-WARNING: i915: Unknown symbol acpi_video_register (err -2)

Fix this problem by renaming ACPI's video.ko to acpi_video.ko. Also
rename a related source file and clean up the Makefile.

Reported-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Closes: https://lore.kernel.org/intel-gfx/9dcac6e9-a3bf-4ace-bbdc-f697f767f9e0@suse.de/T/#t
Tested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 2fd001cd3600 ("arch: Rename fbdev header and source files")
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/acpi/Makefile                            | 5 +++--
 drivers/acpi/{acpi_video.c => acpi_video_core.c} | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename drivers/acpi/{acpi_video.c => acpi_video_core.c} (99%)

diff --git a/drivers/acpi/Makefile b/drivers/acpi/Makefile
index 8cc8c0d9c8732..fc9e11f7afbf7 100644
--- a/drivers/acpi/Makefile
+++ b/drivers/acpi/Makefile
@@ -84,7 +84,9 @@ obj-$(CONFIG_ACPI_FAN)		+= fan.o
 fan-objs			:= fan_core.o
 fan-objs			+= fan_attr.o
 
-obj-$(CONFIG_ACPI_VIDEO)	+= video.o
+obj-$(CONFIG_ACPI_VIDEO)	+= acpi_video.o
+acpi_video-objs			+= acpi_video_core.o video_detect.o
+
 obj-$(CONFIG_ACPI_TAD)		+= acpi_tad.o
 obj-$(CONFIG_ACPI_PCI_SLOT)	+= pci_slot.o
 obj-$(CONFIG_ACPI_PROCESSOR)	+= processor.o
@@ -124,7 +126,6 @@ obj-$(CONFIG_ACPI_CONFIGFS)	+= acpi_configfs.o
 
 obj-y				+= pmic/
 
-video-objs			+= acpi_video.o video_detect.o
 obj-y				+= dptf/
 
 obj-$(CONFIG_ARM64)		+= arm64/
diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video_core.c
similarity index 99%
rename from drivers/acpi/acpi_video.c
rename to drivers/acpi/acpi_video_core.c
index 1fda303882973..32bf81c5773a4 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video_core.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  video.c - ACPI Video Driver
+ *  acpi_video_core.c - ACPI Video Driver
  *
  *  Copyright (C) 2004 Luming Yu <luming.yu@intel.com>
  *  Copyright (C) 2004 Bruno Ducrot <ducrot@poupinou.org>
-- 
2.45.0


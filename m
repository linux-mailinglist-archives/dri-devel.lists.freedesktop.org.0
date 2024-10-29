Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF669B4C47
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 15:39:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D3510E294;
	Tue, 29 Oct 2024 14:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="tQIxGhXw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AwH2Lf7j";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tQIxGhXw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AwH2Lf7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7182A10E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 14:39:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1B90B21DDB;
 Tue, 29 Oct 2024 14:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730212776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSKbhgth91NRXcWkfjmNyr0PKQIfXJamt7p3UcfKghc=;
 b=tQIxGhXwB8B5gqj6tUFbasqCMA+zrVby/FbzNb+0aK/tRAYlBeB4e9sPqlhqtphGDczuA+
 VhtRxUp1sLAwHFJQyatwJvoRWCPgbd/CP0XcZTIM/6zL2qdU5s/FZawwkgUmDdkZuXyOTN
 8mW665yhAjChdS/ZMOvnupl9vd7WeJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730212776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSKbhgth91NRXcWkfjmNyr0PKQIfXJamt7p3UcfKghc=;
 b=AwH2Lf7jC+gTn6POhunQrIp5JjF/sVb55P65X4NaQ4+AuIPLiIV1U7jdA0o0bWG1nTiR7K
 PxCgVVgWvky9waDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730212776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSKbhgth91NRXcWkfjmNyr0PKQIfXJamt7p3UcfKghc=;
 b=tQIxGhXwB8B5gqj6tUFbasqCMA+zrVby/FbzNb+0aK/tRAYlBeB4e9sPqlhqtphGDczuA+
 VhtRxUp1sLAwHFJQyatwJvoRWCPgbd/CP0XcZTIM/6zL2qdU5s/FZawwkgUmDdkZuXyOTN
 8mW665yhAjChdS/ZMOvnupl9vd7WeJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730212776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSKbhgth91NRXcWkfjmNyr0PKQIfXJamt7p3UcfKghc=;
 b=AwH2Lf7jC+gTn6POhunQrIp5JjF/sVb55P65X4NaQ4+AuIPLiIV1U7jdA0o0bWG1nTiR7K
 PxCgVVgWvky9waDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E1487136A5;
 Tue, 29 Oct 2024 14:39:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6PG4NafzIGd/AwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 29 Oct 2024 14:39:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm/cirrus: Rename to cirrus-qemu
Date: Tue, 29 Oct 2024 15:34:24 +0100
Message-ID: <20241029143928.208349-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241029143928.208349-1-tzimmermann@suse.de>
References: <20241029143928.208349-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_FIVE(0.00)[5];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]
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

This driver is only for Qemu's emulated Cirrus hardware. Name it
accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 MAINTAINERS                                      | 2 +-
 drivers/gpu/drm/tiny/Makefile                    | 2 +-
 drivers/gpu/drm/tiny/{cirrus.c => cirrus-qemu.c} | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename drivers/gpu/drm/tiny/{cirrus.c => cirrus-qemu.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccf87fa14cf7..33ba56fe322c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7312,7 +7312,7 @@ L:	virtualization@lists.linux.dev
 S:	Obsolete
 W:	https://www.kraxel.org/blog/2014/10/qemu-using-cirrus-considered-harmful/
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-F:	drivers/gpu/drm/tiny/cirrus.c
+F:	drivers/gpu/drm/tiny/cirrus-qemu.c
 
 DRM DRIVER FOR QXL VIRTUAL GPU
 M:	Dave Airlie <airlied@redhat.com>
diff --git a/drivers/gpu/drm/tiny/Makefile b/drivers/gpu/drm/tiny/Makefile
index 4aaf56f8707d..60816d2eb4ff 100644
--- a/drivers/gpu/drm/tiny/Makefile
+++ b/drivers/gpu/drm/tiny/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_DRM_ARCPGU)		+= arcpgu.o
 obj-$(CONFIG_DRM_BOCHS)			+= bochs.o
-obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus.o
+obj-$(CONFIG_DRM_CIRRUS_QEMU)		+= cirrus-qemu.o
 obj-$(CONFIG_DRM_GM12U320)		+= gm12u320.o
 obj-$(CONFIG_DRM_OFDRM)			+= ofdrm.o
 obj-$(CONFIG_DRM_PANEL_MIPI_DBI)	+= panel-mipi-dbi.o
diff --git a/drivers/gpu/drm/tiny/cirrus.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
similarity index 99%
rename from drivers/gpu/drm/tiny/cirrus.c
rename to drivers/gpu/drm/tiny/cirrus-qemu.c
index 0231bdf94b8a..eaae559dc431 100644
--- a/drivers/gpu/drm/tiny/cirrus.c
+++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
@@ -46,7 +46,7 @@
 #include <drm/drm_module.h>
 #include <drm/drm_probe_helper.h>
 
-#define DRIVER_NAME "cirrus"
+#define DRIVER_NAME "cirrus-qemu"
 #define DRIVER_DESC "qemu cirrus vga"
 #define DRIVER_DATE "2019"
 #define DRIVER_MAJOR 2
-- 
2.46.0


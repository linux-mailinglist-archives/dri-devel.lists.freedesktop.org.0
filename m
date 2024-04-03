Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C97E896A9B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE49112928;
	Wed,  3 Apr 2024 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uUntHAhH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="OJLBMzMz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAB3112930
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 09:31:21 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8A1A5CAA1;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712136679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRFC3/Yd8YVbc5CFFvK9AA8T75BQGvHsl8ihkPnzSIw=;
 b=uUntHAhHhnMxKfJM5vsen9e4/HztHYfsz4WvKND7Lq0yMrdwIMO8pFcEURmjMPGnrVc2r3
 iIdpH8bGuu16jWpd2o1FgN3nVtxI9iRyO14xe3NCZXBSEBBvWJzuGOEnLggmYXtZd0SJzK
 d22Il4sy99Z9rvaLC+tzs22SldHA/P0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712136679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRFC3/Yd8YVbc5CFFvK9AA8T75BQGvHsl8ihkPnzSIw=;
 b=OJLBMzMzqXpJavmoS8Z3D2flVwtj0MgSSpnDBnA6WKu0eRAr7GP2E1RZ5QYaWpDlJeTXpa
 7w75cwqT8C9dIOBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 6AE6A13A8B;
 Wed,  3 Apr 2024 09:31:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IHjgGOchDWYteQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Apr 2024 09:31:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/11] drm/mgag200: Rename mgag200_i2c.c to mgag200_ddc.c
Date: Wed,  3 Apr 2024 11:24:44 +0200
Message-ID: <20240403093114.22163-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403093114.22163-1-tzimmermann@suse.de>
References: <20240403093114.22163-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: 5.38
X-Spam-Flag: NO
X-Spamd-Bar: +++++
X-Spamd-Result: default: False [5.38 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 MX_GOOD(-0.01)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 RCPT_COUNT_SEVEN(0.00)[9];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 FROM_EQ_ENVFROM(0.00)[]; R_DKIM_NA(2.20)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-0.01)[49.95%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-0.999];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Spam-Level: *****
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: A8A1A5CAA1
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

Rename the source file according to its content. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/Makefile                         | 2 +-
 drivers/gpu/drm/mgag200/{mgag200_i2c.c => mgag200_ddc.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/gpu/drm/mgag200/{mgag200_i2c.c => mgag200_ddc.c} (100%)

diff --git a/drivers/gpu/drm/mgag200/Makefile b/drivers/gpu/drm/mgag200/Makefile
index 182e224c460dd..0b919352046eb 100644
--- a/drivers/gpu/drm/mgag200/Makefile
+++ b/drivers/gpu/drm/mgag200/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 mgag200-y := \
 	mgag200_bmc.o \
+	mgag200_ddc.o \
 	mgag200_drv.o \
 	mgag200_g200.o \
 	mgag200_g200eh.o \
@@ -10,7 +11,6 @@ mgag200-y := \
 	mgag200_g200ew3.o \
 	mgag200_g200se.o \
 	mgag200_g200wb.o \
-	mgag200_i2c.o \
 	mgag200_mode.o
 
 obj-$(CONFIG_DRM_MGAG200) += mgag200.o
diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_ddc.c
similarity index 100%
rename from drivers/gpu/drm/mgag200/mgag200_i2c.c
rename to drivers/gpu/drm/mgag200/mgag200_ddc.c
-- 
2.44.0


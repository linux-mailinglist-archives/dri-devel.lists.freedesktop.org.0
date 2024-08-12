Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A29594E890
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 10:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714ED10E08A;
	Mon, 12 Aug 2024 08:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="os1lpwWW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0AbqOE6";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="os1lpwWW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="K0AbqOE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6913110E09E;
 Mon, 12 Aug 2024 08:30:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0E066224D6;
 Mon, 12 Aug 2024 08:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dj52857EH4jhKBKxdCq/oW6LTdYhB00nsx3FYD603H0=;
 b=os1lpwWWLOpElrhs2USKUfA1lPiBFgGEL7u4IRT6cyvt0m75zbQh4hn7ogFtAR+2PjO45/
 N7s0CZ6LIWD7PRtEsZ3r0AJbXoAmLxxSb5LfR/j1tNlfSYquO6koLqrPHfVoQNoarFaAcM
 uMdW+S9o/7AodUGxhjxV+pk8j49BeU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dj52857EH4jhKBKxdCq/oW6LTdYhB00nsx3FYD603H0=;
 b=K0AbqOE6J/00ovYbkPRt+NQkBQsFnqGlTRxd+nrvc6Jk4Ey50cWufes2CkvkI5zJpSSuuy
 1D3/ebwaVmTaGHCg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=os1lpwWW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=K0AbqOE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723451406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dj52857EH4jhKBKxdCq/oW6LTdYhB00nsx3FYD603H0=;
 b=os1lpwWWLOpElrhs2USKUfA1lPiBFgGEL7u4IRT6cyvt0m75zbQh4hn7ogFtAR+2PjO45/
 N7s0CZ6LIWD7PRtEsZ3r0AJbXoAmLxxSb5LfR/j1tNlfSYquO6koLqrPHfVoQNoarFaAcM
 uMdW+S9o/7AodUGxhjxV+pk8j49BeU8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723451406;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dj52857EH4jhKBKxdCq/oW6LTdYhB00nsx3FYD603H0=;
 b=K0AbqOE6J/00ovYbkPRt+NQkBQsFnqGlTRxd+nrvc6Jk4Ey50cWufes2CkvkI5zJpSSuuy
 1D3/ebwaVmTaGHCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADC5813A3D;
 Mon, 12 Aug 2024 08:30:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MA0/KQ3IuWZpHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Aug 2024 08:30:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kherbst@redhat.com, lyude@redhat.com, dakr@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/9] drm: Do delayed switcheroo in drm_lastclose()
Date: Mon, 12 Aug 2024 10:28:22 +0200
Message-ID: <20240812083000.337744-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240812083000.337744-1-tzimmermann@suse.de>
References: <20240812083000.337744-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.01 / 50.00]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_TWELVE(0.00)[14];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,redhat.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 0E066224D6
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -0.01
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

Amdgpu and nouveau call vga_switcheroo_process_delayed_switch() from
their lastclose callbacks. Call it from drm_lastclose(), so that the
driver functions can finally be removed. Only PCI devices with enabled
switcheroo do the delayed switching. The call has no effect on other
hardware.

v2:
- move change to drm_lastclose() (Sima)
- update docs for vga_switcheroo_process_delayed_switch()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_file.c       | 4 ++++
 drivers/gpu/vga/vga_switcheroo.c | 3 +--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 714e42b05108..513bef816ae9 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -38,6 +38,7 @@
 #include <linux/pci.h>
 #include <linux/poll.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_client.h>
 #include <drm/drm_drv.h>
@@ -404,6 +405,9 @@ void drm_lastclose(struct drm_device * dev)
 	drm_dbg_core(dev, "driver lastclose completed\n");
 
 	drm_client_dev_restore(dev);
+
+	if (dev_is_pci(dev->dev))
+		vga_switcheroo_process_delayed_switch();
 }
 
 /**
diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 365e6ddbe90f..18f2c92beff8 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -926,8 +926,7 @@ static void vga_switcheroo_debugfs_init(struct vgasr_priv *priv)
 /**
  * vga_switcheroo_process_delayed_switch() - helper for delayed switching
  *
- * Process a delayed switch if one is pending. DRM drivers should call this
- * from their ->lastclose callback.
+ * Process a delayed switch if one is pending.
  *
  * Return: 0 on success. -EINVAL if no delayed switch is pending, if the client
  * has unregistered in the meantime or if there are other clients blocking the
-- 
2.46.0


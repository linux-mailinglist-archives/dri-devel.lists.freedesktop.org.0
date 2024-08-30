Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8C965BDC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D3610E9F9;
	Fri, 30 Aug 2024 08:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="fTQXB+4r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nK5Aqxco";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fTQXB+4r";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="nK5Aqxco";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A7C10E902;
 Fri, 30 Aug 2024 08:45:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 00EAD1F7B9;
 Fri, 30 Aug 2024 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRvb2qcwUCV8y/iNLbhNT9pX6tksYg/OjiBTZLUol7c=;
 b=fTQXB+4rjRliZjaXEcRerI1pH4bkw+LOO/fDN9gZabE08LUviw2saIcX2YD1d7ATgih7Ol
 it9zwMCpVAEihAyzLsb+ji/Tt4iFK7CIv4kLSx7SCp7Uld73Yy2GkaUjiZ7RHD3Yp36MEB
 txBEkNseAIu6UR5pcudRfW71bqfCYSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRvb2qcwUCV8y/iNLbhNT9pX6tksYg/OjiBTZLUol7c=;
 b=nK5AqxcokS1RYBsqpQBYKlb16HmWxvAY5mxKoT0+ucu6L5nM805eQ2lCjzynS3vAtTSZLa
 CBDUXi60/0QNTLCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725007516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRvb2qcwUCV8y/iNLbhNT9pX6tksYg/OjiBTZLUol7c=;
 b=fTQXB+4rjRliZjaXEcRerI1pH4bkw+LOO/fDN9gZabE08LUviw2saIcX2YD1d7ATgih7Ol
 it9zwMCpVAEihAyzLsb+ji/Tt4iFK7CIv4kLSx7SCp7Uld73Yy2GkaUjiZ7RHD3Yp36MEB
 txBEkNseAIu6UR5pcudRfW71bqfCYSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725007516;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qRvb2qcwUCV8y/iNLbhNT9pX6tksYg/OjiBTZLUol7c=;
 b=nK5AqxcokS1RYBsqpQBYKlb16HmWxvAY5mxKoT0+ucu6L5nM805eQ2lCjzynS3vAtTSZLa
 CBDUXi60/0QNTLCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9D2A513ADE;
 Fri, 30 Aug 2024 08:45:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SGsdJZuG0WbyegAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Aug 2024 08:45:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v3 48/81] drm/xlnx: Run DRM default client setup
Date: Fri, 30 Aug 2024 10:40:32 +0200
Message-ID: <20240830084456.77630-49-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240830084456.77630-1-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[14];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[renesas];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -5.30
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

Call drm_client_setup_with_fourcc() to run the kernel's default client
setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

v2:
- use drm_client_setup_with_fourcc()

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Michal Simek <michal.simek@amd.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index bd1368df7870..2452c2f09161 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -14,6 +14,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
@@ -402,6 +403,7 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 					  DRIVER_ATOMIC,
 
 	DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_create),
+	DRM_FBDEV_DMA_DRIVER_OPS,
 
 	.fops				= &zynqmp_dpsub_drm_fops,
 
@@ -523,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 		goto err_poll_fini;
 
 	/* Initialize fbdev generic emulation. */
-	drm_fbdev_dma_setup(drm, 24);
+	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
 
 	return 0;
 
-- 
2.46.0


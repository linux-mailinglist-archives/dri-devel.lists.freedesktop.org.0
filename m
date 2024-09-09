Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 672A097180A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 13:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123F210E4A3;
	Mon,  9 Sep 2024 11:37:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1528IHBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y2sasB4A";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1528IHBd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y2sasB4A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB8E10E465;
 Mon,  9 Sep 2024 11:37:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86F5921BF1;
 Mon,  9 Sep 2024 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3neZUwl8wVuenFWs7y06IvsXmLR5oo1OfLVU8eHpZ8=;
 b=1528IHBdPrv1wUlasME3I/Nj3ChpnBzRSiXoBFZNVP09rbUv+/q1Alp42h4XwdkKI/rGnf
 O1flVNPV2wsXnLbI2v5o23ppZJ5ld1xQmJhjOj19+ubywAtD2WRtujDqjoJ+A3xKXiq7OG
 yfpxK/6vxNBVVVavDIeeGGO5Z2md2Gc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3neZUwl8wVuenFWs7y06IvsXmLR5oo1OfLVU8eHpZ8=;
 b=Y2sasB4A5EXUOvI+OizNUQ5UH+EWQgnuIhG10K6QuNmtgp1SsxDB8QWIJSorI7mKkk2Y9S
 jGKXqXD6d/t0/0Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725881823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3neZUwl8wVuenFWs7y06IvsXmLR5oo1OfLVU8eHpZ8=;
 b=1528IHBdPrv1wUlasME3I/Nj3ChpnBzRSiXoBFZNVP09rbUv+/q1Alp42h4XwdkKI/rGnf
 O1flVNPV2wsXnLbI2v5o23ppZJ5ld1xQmJhjOj19+ubywAtD2WRtujDqjoJ+A3xKXiq7OG
 yfpxK/6vxNBVVVavDIeeGGO5Z2md2Gc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725881823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t3neZUwl8wVuenFWs7y06IvsXmLR5oo1OfLVU8eHpZ8=;
 b=Y2sasB4A5EXUOvI+OizNUQ5UH+EWQgnuIhG10K6QuNmtgp1SsxDB8QWIJSorI7mKkk2Y9S
 jGKXqXD6d/t0/0Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 343B113312;
 Mon,  9 Sep 2024 11:37:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yPVZC9/d3malNAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 09 Sep 2024 11:37:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 68/80] drm/nouveau: Run DRM default client setup
Date: Mon,  9 Sep 2024 13:31:14 +0200
Message-ID: <20240909113633.595465-69-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909113633.595465-1-tzimmermann@suse.de>
References: <20240909113633.595465-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_DN_SOME(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to(RLbwen1niosrcqbxsafh1),to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
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

Call drm_client_setup() to run the kernel's default client setup
for DRM. Set fbdev_probe in struct drm_driver, so that the client
setup can start the common fbdev client.

The nouveau driver specifies a preferred color mode depending on
the available video memory, with a default of 32. Adapt this for
the new client interface.

v2:
- style changes

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4a9a9b9c3935..628c47a60de5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -31,6 +31,7 @@
 #include <linux/dynamic_debug.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fbdev_ttm.h>
 #include <drm/drm_gem_ttm_helper.h>
@@ -836,6 +837,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 {
 	struct nvkm_device *device;
 	struct nouveau_drm *drm;
+	const struct drm_format_info *format;
 	int ret;
 
 	if (vga_switcheroo_client_probe_defer(pdev))
@@ -873,9 +875,11 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 		goto fail_pci;
 
 	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
-		drm_fbdev_ttm_setup(drm->dev, 8);
+		format = drm_format_info(DRM_FORMAT_C8);
 	else
-		drm_fbdev_ttm_setup(drm->dev, 32);
+		format = NULL;
+
+	drm_client_setup(drm->dev, format);
 
 	quirk_broken_nv_runpm(pdev);
 	return 0;
@@ -1317,6 +1321,8 @@ driver_stub = {
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
 
+	DRM_FBDEV_TTM_DRIVER_OPS,
+
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 #ifdef GIT_REVISION
-- 
2.46.0


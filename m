Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB11A650A9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C713C10E3FD;
	Mon, 17 Mar 2025 13:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="VtomlPTt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ReL884NA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1yn23whT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="S5/6u861";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADCC10E11B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:22:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B6A61F78A;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGlVF8lzAxLSvOaxv1kUeWIxW39MT2tfuytiR9jT3v4=;
 b=VtomlPTtvG8T0rWUf39dI96EErbisd/vYp+vunhkyFIV6QoqaSS9qGS2OIKijJWbh6sy1L
 ljfMys4zNyytdkE8Ub4NDVgTdofxaJGChhCOH990pj+pV20rh7LiSm4g9Z7NYr5h/P2KgF
 htAKRBbDYnYKtuAHvao2CDfem/wm2mY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGlVF8lzAxLSvOaxv1kUeWIxW39MT2tfuytiR9jT3v4=;
 b=ReL884NANO31tRhoVh9AT9+5ZDrtxgittrqi8yzdiZOBOnoalNeC2tv/z4S89UbGgU2x6Y
 eFHhzXgOjp+B+iBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGlVF8lzAxLSvOaxv1kUeWIxW39MT2tfuytiR9jT3v4=;
 b=1yn23whTm4nBvynF1CnGBCmahaquhp4UMc7by2PgsmSN/AB3tWwWbaNZUqM1QTQ7KGrpb3
 gUOnrSwsR+1Ox2Kj1hsjQxgyNu/NYzZIU/dY/LReCPf6Om7VvkYMAHG0u2A+DUt13t9c72
 BYVHqKQPUaMpshD8o0lYRzpMh9FItlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGlVF8lzAxLSvOaxv1kUeWIxW39MT2tfuytiR9jT3v4=;
 b=S5/6u861k0bTsGHCxF9/BTofkiwNrvfR7KkyDEakPaHaoLv1r5YKGSBGICZanB1WPKwQBG
 /teoWdfFiMQWnyBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C4DA813A2C;
 Mon, 17 Mar 2025 13:22:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wNKOLh4i2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH 01/15] drm/armada: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:39 +0100
Message-ID: <20250317131923.238374-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,armlinux.org.uk:email];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.80
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Russell King <linux@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_fb.c  | 2 +-
 drivers/gpu/drm/armada/armada_gem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_fb.c b/drivers/gpu/drm/armada/armada_fb.c
index cf2e88218dc0..67af4bd8797f 100644
--- a/drivers/gpu/drm/armada/armada_fb.c
+++ b/drivers/gpu/drm/armada/armada_fb.c
@@ -110,7 +110,7 @@ struct drm_framebuffer *armada_fb_create(struct drm_device *dev,
 		goto err;
 	}
 
-	if (obj->obj.import_attach && !obj->sgt) {
+	if (drm_gem_is_imported(&obj->obj) && !obj->sgt) {
 		ret = armada_gem_map_import(obj);
 		if (ret)
 			goto err_unref;
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 1a1680d71486..bd4209b6a893 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -63,7 +63,7 @@ void armada_gem_free_object(struct drm_gem_object *obj)
 			iounmap(dobj->addr);
 	}
 
-	if (dobj->obj.import_attach) {
+	if (drm_gem_is_imported(&dobj->obj)) {
 		/* We only ever display imported data */
 		if (dobj->sgt)
 			dma_buf_unmap_attachment_unlocked(dobj->obj.import_attach,
-- 
2.48.1


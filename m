Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62881A650B4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540FE10E407;
	Mon, 17 Mar 2025 13:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="avgxixne";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jS+qfNGr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="avgxixne";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jS+qfNGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C30110E404
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:23:02 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B620D20015;
 Mon, 17 Mar 2025 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45rxmBi31rJwW41cRR+XiVw3FyT3tb5iqeN2qIbx5OE=;
 b=avgxixnefuED+eZvGhz1+wLId+UoRqsItFw1sOZT8048bFpaw13APVINgmfHAISEXEEHkK
 pKJV9fK9bcb1s89gaWKpqa+UZQYza5TQvPsqiXMZ/qxPPhiQZiAWyApi7gLKbDSO6mAyC+
 H2CJ3RvPuKNvjHHS3/wgyv2L0wkkFUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45rxmBi31rJwW41cRR+XiVw3FyT3tb5iqeN2qIbx5OE=;
 b=jS+qfNGr5FUjWiTftROQ8roEVL0KKUwHDkLV1ecQ+diwEPu7FyeHais9I/kDsBIcTOgDDL
 sltXk3DcRRHhdqDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45rxmBi31rJwW41cRR+XiVw3FyT3tb5iqeN2qIbx5OE=;
 b=avgxixnefuED+eZvGhz1+wLId+UoRqsItFw1sOZT8048bFpaw13APVINgmfHAISEXEEHkK
 pKJV9fK9bcb1s89gaWKpqa+UZQYza5TQvPsqiXMZ/qxPPhiQZiAWyApi7gLKbDSO6mAyC+
 H2CJ3RvPuKNvjHHS3/wgyv2L0wkkFUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=45rxmBi31rJwW41cRR+XiVw3FyT3tb5iqeN2qIbx5OE=;
 b=jS+qfNGr5FUjWiTftROQ8roEVL0KKUwHDkLV1ecQ+diwEPu7FyeHais9I/kDsBIcTOgDDL
 sltXk3DcRRHhdqDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8182E13A2C;
 Mon, 17 Mar 2025 13:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kL1hHiAi2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 07/15] drm/omapdrm: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:45 +0100
Message-ID: <20250317131923.238374-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The helper tests the dma_buf
itself while import_attach is just an artifact of the import. Prepares
to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index b9c67e4ca360..d50bc91437fa 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -1222,7 +1222,7 @@ static void omap_gem_free_object(struct drm_gem_object *obj)
 			    omap_obj->dma_addr);
 	} else if (omap_obj->vaddr) {
 		vunmap(omap_obj->vaddr);
-	} else if (obj->import_attach) {
+	} else if (drm_gem_is_imported(obj)) {
 		drm_prime_gem_destroy(obj, omap_obj->sgt);
 	}
 
-- 
2.48.1


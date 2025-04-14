Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3726A8832E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 15:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F382C10E5EF;
	Mon, 14 Apr 2025 13:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="C+e/3RT5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VKcVO4mR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C+e/3RT5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VKcVO4mR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C136310E5EA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 13:51:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 032681F7D4;
 Mon, 14 Apr 2025 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zWh2T9jIVfkXkHoBil9msLEoD3VbKgv8Y73t83X42VQ=;
 b=C+e/3RT5vxwtFECu+pZH9f8OOpKcJlgmP6KGiMBjKtfGLDoEtTwHNT4rDKvmFjRTKZyPqS
 8YSVZUM3iKpMRHTXMlFrrHTDUMsgyrPP9Qzk/bpfqsxZ9OooyZcO3EHyv6iAOzxc2XhD9S
 1bRGqm4us30jdX88qTTEz9DHciqh6KQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zWh2T9jIVfkXkHoBil9msLEoD3VbKgv8Y73t83X42VQ=;
 b=VKcVO4mRyp8Q17dA2HJ13eJdcLR+uPR4lKEjjuLkl9oxe/1QykNRVN9kS4hlhgzpy1tsTK
 Jh7JzKYp/DJRQCAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744638688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zWh2T9jIVfkXkHoBil9msLEoD3VbKgv8Y73t83X42VQ=;
 b=C+e/3RT5vxwtFECu+pZH9f8OOpKcJlgmP6KGiMBjKtfGLDoEtTwHNT4rDKvmFjRTKZyPqS
 8YSVZUM3iKpMRHTXMlFrrHTDUMsgyrPP9Qzk/bpfqsxZ9OooyZcO3EHyv6iAOzxc2XhD9S
 1bRGqm4us30jdX88qTTEz9DHciqh6KQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744638688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zWh2T9jIVfkXkHoBil9msLEoD3VbKgv8Y73t83X42VQ=;
 b=VKcVO4mRyp8Q17dA2HJ13eJdcLR+uPR4lKEjjuLkl9oxe/1QykNRVN9kS4hlhgzpy1tsTK
 Jh7JzKYp/DJRQCAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B9BD613A87;
 Mon, 14 Apr 2025 13:51:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AKjWK98S/We6BQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Apr 2025 13:51:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Subject: [PATCH 06/11] drm/vc4: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 14 Apr 2025 15:48:13 +0200
Message-ID: <20250414134821.568225-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo, suse.de:mid,
 suse.de:email]
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
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c  | 2 +-
 drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 7125773889f1..b503fd0488b0 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -556,7 +556,7 @@ static void vc4_free_object(struct drm_gem_object *gem_bo)
 	mutex_lock(&vc4->bo_lock);
 	/* If the object references someone else's memory, we can't cache it.
 	 */
-	if (gem_bo->import_attach) {
+	if (drm_gem_is_imported(gem_bo)) {
 		vc4_bo_destroy(bo);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 8125f87edc60..3e79ad69250a 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1249,7 +1249,7 @@ int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
 	/* Not sure it's safe to purge imported BOs. Let's just assume it's
 	 * not until proven otherwise.
 	 */
-	if (gem_obj->import_attach) {
+	if (drm_gem_is_imported(gem_obj)) {
 		DRM_DEBUG("madvise not supported on imported BOs\n");
 		ret = -EINVAL;
 		goto out_put_gem;
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EFB0185A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77DB10EA06;
	Fri, 11 Jul 2025 09:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="rgatOvOD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="92fwqp2B";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rgatOvOD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="92fwqp2B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320D310EA11
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 09:41:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D0911F795;
 Fri, 11 Jul 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfRO2uKxAwKeYhyO5cooTycRKCPHTm+Wa5F9EX1ON3Y=;
 b=rgatOvODV0wdocxWsbKg3wCQsjq7DbQ4NnWATwHGivq/9SbWo+Tl9bqMbk7i97vCLcn0P8
 b11nLC0S+IElVZ7Oqz06Gd8A2qZLtXI8+Y4BwEC1xUJHq7KrsJ/Di/dmkOlfHhV5aLedqd
 lPrVt8O3CRf7dimhvYshDy2Haaz8AVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfRO2uKxAwKeYhyO5cooTycRKCPHTm+Wa5F9EX1ON3Y=;
 b=92fwqp2BVbNQuejesWc4KKh8lAb9HfRCkgaWCw07D1TnKY6DwyTm3d+qB/xFEmJPCqUvNg
 3dMLvnZI6JcFllBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752226858; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfRO2uKxAwKeYhyO5cooTycRKCPHTm+Wa5F9EX1ON3Y=;
 b=rgatOvODV0wdocxWsbKg3wCQsjq7DbQ4NnWATwHGivq/9SbWo+Tl9bqMbk7i97vCLcn0P8
 b11nLC0S+IElVZ7Oqz06Gd8A2qZLtXI8+Y4BwEC1xUJHq7KrsJ/Di/dmkOlfHhV5aLedqd
 lPrVt8O3CRf7dimhvYshDy2Haaz8AVA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752226858;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VfRO2uKxAwKeYhyO5cooTycRKCPHTm+Wa5F9EX1ON3Y=;
 b=92fwqp2BVbNQuejesWc4KKh8lAb9HfRCkgaWCw07D1TnKY6DwyTm3d+qB/xFEmJPCqUvNg
 3dMLvnZI6JcFllBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1A5013918;
 Fri, 11 Jul 2025 09:40:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UBu6OSnccGjbcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 11 Jul 2025 09:40:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, christian.koenig@amd.com,
 torvalds@linux-foundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 kraxel@redhat.com, christian.gmeiner@gmail.com,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, zack.rusin@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, virtualization@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/9] Revert "drm/etnaviv: Use dma_buf from GEM object instance"
Date: Fri, 11 Jul 2025 11:35:20 +0200
Message-ID: <20250711093744.120962-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711093744.120962-1-tzimmermann@suse.de>
References: <20250711093744.120962-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.30 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; SUSPICIOUS_RECIPS(1.50)[];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCPT_COUNT_TWELVE(0.00)[20];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[];
 RCVD_TLS_ALL(0.00)[]; TAGGED_RCPT(0.00)[etnaviv];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,amd.com,linux-foundation.org,linux.intel.com,kernel.org,pengutronix.de,armlinux.org.uk,redhat.com,collabora.com,chromium.org,broadcom.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 R_RATELIMIT(0.00)[to_ip_from(RLk1j8fm6pferx3phn9ndszqb3)];
 FROM_EQ_ENVFROM(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -5.30
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

This reverts commit e91eb3ae415472b28211d7fed07fa283845b311e.

Reverting because the fix-up commits are suspected to cause regressions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 917ad527c961..40a50c60dfff 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -65,7 +65,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
 
 	if (etnaviv_obj->vaddr)
-		dma_buf_vunmap_unlocked(etnaviv_obj->base.dma_buf, &map);
+		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
 
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
@@ -82,7 +82,7 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 
 	lockdep_assert_held(&etnaviv_obj->lock);
 
-	ret = dma_buf_vmap(etnaviv_obj->base.dma_buf, &map);
+	ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
 	if (ret)
 		return NULL;
 	return map.vaddr;
-- 
2.50.0


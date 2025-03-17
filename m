Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A8DA650AD
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:22:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB13910E401;
	Mon, 17 Mar 2025 13:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="reAacItC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="k24EqizP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F6iPrpBI";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CfY1tryD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BE688867
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:22:53 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9EFAB1F853;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7jmQPEJlhO24EgaFYs4VjMvS4LMtagYRUgu8oUVzpk=;
 b=reAacItC4OQ/yW56FfPgNiiU+/tnJgmBfcAWEKKpFEaSdOB0e+Lcnl9pagl8B1xciik3Yn
 AGPDsP8vOcknWuqQ9u+CRLWdDFHmD1SR1d6JbThc2t/miabooH+FKFaZPSzcKyb0cWqvmE
 x4cmC41spgRBE7YHBz9beaqKcqEY6ko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7jmQPEJlhO24EgaFYs4VjMvS4LMtagYRUgu8oUVzpk=;
 b=k24EqizPNy8YWOggZMElt3Q3bV8rMCsMec+nbpxvcX7WX18Y0MPbtbLOybQSJOU0x46hWq
 uVWxGw4XDjdiVNCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7jmQPEJlhO24EgaFYs4VjMvS4LMtagYRUgu8oUVzpk=;
 b=F6iPrpBInU/gErFKU/khuL52cWdsmlKoRu8ZzgdZEcStolR7Ain4hhLOHhW9nI6JKNAn1j
 liqrI1CU9+tneqP49MvFsXifLRyW48NOXVfkvw5A98j6jlJ1yw3mQRXm9k7BE9hGskYkOP
 7gVvZ9t2Gj6aWVjx3WY/Mr4oSsLnVkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J7jmQPEJlhO24EgaFYs4VjMvS4LMtagYRUgu8oUVzpk=;
 b=CfY1tryDG3He3QJJJdjmue4yPWhpDbnOjery1xvrm9VcE/R3S+OkUPAWygWxSDMqduAUUx
 A+ui6vQCFo6rg+CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5771313A5A;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CLEKFB8i2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org
Subject: [PATCH 03/15] drm/etnaviv: Use dma_buf from GEM object instance
Date: Mon, 17 Mar 2025 14:06:41 +0100
Message-ID: <20250317131923.238374-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,imap1.dmz-prg2.suse.org:helo,pengutronix.de:email,lists.freedesktop.org:email,suse.de:mid,suse.de:email];
 RCVD_TLS_ALL(0.00)[];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,pengutronix.de,armlinux.org.uk,gmail.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 TAGGED_RCPT(0.00)[etnaviv]; FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[10];
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

Avoid dereferencing struct drm_gem_object.import_attach for the
imported dma-buf. The dma_buf field in the GEM object instance refers
to the same buffer. Prepares to make import_attach optional.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 40a50c60dfff..917ad527c961 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -65,7 +65,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 	struct iosys_map map = IOSYS_MAP_INIT_VADDR(etnaviv_obj->vaddr);
 
 	if (etnaviv_obj->vaddr)
-		dma_buf_vunmap_unlocked(etnaviv_obj->base.import_attach->dmabuf, &map);
+		dma_buf_vunmap_unlocked(etnaviv_obj->base.dma_buf, &map);
 
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
@@ -82,7 +82,7 @@ static void *etnaviv_gem_prime_vmap_impl(struct etnaviv_gem_object *etnaviv_obj)
 
 	lockdep_assert_held(&etnaviv_obj->lock);
 
-	ret = dma_buf_vmap(etnaviv_obj->base.import_attach->dmabuf, &map);
+	ret = dma_buf_vmap(etnaviv_obj->base.dma_buf, &map);
 	if (ret)
 		return NULL;
 	return map.vaddr;
-- 
2.48.1


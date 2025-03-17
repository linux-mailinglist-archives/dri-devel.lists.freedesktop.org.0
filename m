Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1454CA650B0
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:23:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2510E402;
	Mon, 17 Mar 2025 13:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kq2ac5AH";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sOiY8BhF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NbQP2D9J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lvlVEOP/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A41710E405
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:22:58 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53682218F4;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217760; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/8i27dzdK7uTFbN/5nKIBS7Hzd/elMNmpf7xWLqFAw=;
 b=kq2ac5AH3EUie7f1cY7+MM7bzgUwuFLHMwTojSNwWfvrb2CvIiiuui4y21M1xfFlBhNyJV
 UyFXC5b+vQuqvu7frDuMh/f2UcyvuOkIMgcnjHLPn13vvJf8BcyqXz86MYPsT/n7EFN0cs
 QXkCz5muXvJrd+m6fn0FBoqyafI+5Ns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217760;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/8i27dzdK7uTFbN/5nKIBS7Hzd/elMNmpf7xWLqFAw=;
 b=sOiY8BhFB9D0G3NTMeVdCQJk6qjYNbuE4moTrYJdcakBcraadOzG6CzsMT8IalWAfJFqgN
 GtZqxSDBCkvyN1AQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NbQP2D9J;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lvlVEOP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/8i27dzdK7uTFbN/5nKIBS7Hzd/elMNmpf7xWLqFAw=;
 b=NbQP2D9JAXhnp5CnFtPmxKrxyl5tLnU63uVAxDhsat56Xgbw5jQJa/pmEYKE376fiHfsmG
 ZvMVACWNI3aVUHQyhKVlEukaypEywCXWYo5KHJoGawOhigEr9Lk/W5+ysZuI1YesaVRJbK
 Zix4S5DVGG4PkuOPhlzsA9Wi3l4v1Rg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/8i27dzdK7uTFbN/5nKIBS7Hzd/elMNmpf7xWLqFAw=;
 b=lvlVEOP/gX2vD+rpQXy7D2V/+ulfgLqSaBviWvijX1UEnudA1w3HGcxgoqOgidBrnoK2tK
 v316Q9pP7Xx0XnCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0CD0113A31;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id MKvrAR8i2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 etnaviv@lists.freedesktop.org
Subject: [PATCH 02/15] drm/etnaviv: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:40 +0100
Message-ID: <20250317131923.238374-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 53682218F4
X-Spam-Level: 
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 MIME_TRACE(0.00)[0:+]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.freedesktop.org,suse.de,pengutronix.de,armlinux.org.uk,gmail.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,armlinux.org.uk:email,lists.freedesktop.org:email,suse.de:email,suse.de:dkim,suse.de:mid];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[10]; TAGGED_RCPT(0.00)[etnaviv];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51
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
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: etnaviv@lists.freedesktop.org
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 42e57d142554..40a50c60dfff 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -39,7 +39,7 @@ int etnaviv_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 
 int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach) {
+	if (!drm_gem_is_imported(obj)) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
 		mutex_lock(&etnaviv_obj->lock);
@@ -51,7 +51,7 @@ int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 
 void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
 {
-	if (!obj->import_attach) {
+	if (!drm_gem_is_imported(obj)) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
 
 		mutex_lock(&etnaviv_obj->lock);
-- 
2.48.1


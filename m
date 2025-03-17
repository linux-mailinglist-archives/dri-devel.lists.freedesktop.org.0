Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092E8A650B6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 14:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442F210E3FE;
	Mon, 17 Mar 2025 13:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XGLwkaDq";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9dwsZsci";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="s8CLMqm8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="CbCj2B12";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28CD010E150
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 13:23:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E509D1FB7D;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOa2nsh9Q+4jaCUeTIMNfFBkp/zV622LAHAZ3/rew0A=;
 b=XGLwkaDqIBiiKd7fe4qBpjEyio4NMoFZW19QlOYldHdqtvWst3UE1Pb+0/ElmzXksqctGD
 4RATbetBewIK0w9EeqrIYS7GNzr+dX+WIAYT1XhfFupFuzpcKRPr+l41PeUM9AQmGVQp5U
 Vqmkdsdh73wrXa/pO9f8SCgFTtJSmRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOa2nsh9Q+4jaCUeTIMNfFBkp/zV622LAHAZ3/rew0A=;
 b=9dwsZsci/xnnzfc+lDvCcK0G37Ixj1CsjzBcumeb5cTDGdaTx4Vii7fXevsgBt65BWiqwz
 XYLi/WeATfcCUcCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742217759; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOa2nsh9Q+4jaCUeTIMNfFBkp/zV622LAHAZ3/rew0A=;
 b=s8CLMqm8qebBlNDg4fYZh5Z2LplnVueTWHwpo9SO5EDBKsrFUPRRymwNixMfanb5IAF6F1
 yl3vYdBZJT7sDi5i45LuKjBWDxNvqOvVfAVCeHtQ/77CcC2vLWHTjast7xVOC21zMndVCB
 Yup51g+FKiFflR6/4fBkKglJEkdRQLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742217759;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HOa2nsh9Q+4jaCUeTIMNfFBkp/zV622LAHAZ3/rew0A=;
 b=CbCj2B125Epxs4+NHPcAwDxAJkD2NsFYQxp2zKC1pgBePKMjGMEtJLoVXgnmFBnTTIj8E+
 7N1VubHjyKDCFXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A0BB813A5D;
 Mon, 17 Mar 2025 13:22:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8McDJh8i2GdFWQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Mar 2025 13:22:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH 04/15] drm/exynos: Test for imported buffers with
 drm_gem_is_imported()
Date: Mon, 17 Mar 2025 14:06:42 +0100
Message-ID: <20250317131923.238374-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250317131923.238374-1-tzimmermann@suse.de>
References: <20250317131923.238374-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,samsung.com:email];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9]; FUZZY_BLOCKED(0.00)[rspamd.com];
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
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 4787fee4696f..c549ba5cda5e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -121,7 +121,7 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem *exynos_gem)
 	 * the region will be released by exporter
 	 * once dmabuf's refcount becomes 0.
 	 */
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		drm_prime_gem_destroy(obj, exynos_gem->sgt);
 	else
 		exynos_drm_free_buf(exynos_gem);
@@ -365,7 +365,7 @@ static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct
 	struct exynos_drm_gem *exynos_gem = to_exynos_gem(obj);
 	int ret;
 
-	if (obj->import_attach)
+	if (drm_gem_is_imported(obj))
 		return dma_buf_mmap(obj->dma_buf, vma, 0);
 
 	vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
-- 
2.48.1


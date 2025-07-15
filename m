Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B577B0554F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 10:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0272910E57C;
	Tue, 15 Jul 2025 08:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="gfo+JJ+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LZrJBSZV";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gfo+JJ+G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="LZrJBSZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B33110E579
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 08:49:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A80192119E;
 Tue, 15 Jul 2025 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752569339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DU1fq79ubCUoN2d9zoeCqM45/92JQya01H+jbUSlGvs=;
 b=gfo+JJ+GxCkegzscCJsMjzLhjVRdnz47pPDILtEV7FWS4Sf97asqP/2S8wEdFvTNzLFEdR
 oyIj3nYJz1ZMXS0Fqr47NVaqannMbVLM7Q50Sj01skqLuGC1G7qwUYI1rEWGFCHMjoZ6Cw
 kZpdPsdNBllBbJ1nSKaUUr58k6okfT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752569339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DU1fq79ubCUoN2d9zoeCqM45/92JQya01H+jbUSlGvs=;
 b=LZrJBSZVjqYBL4CEklT94DwIYYjb0+ITlWVE9HMBaL4EQ5wrKbS/JihzNWMzOWb2pqN1Km
 Vaj/fLVw4kl0NTCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752569339; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DU1fq79ubCUoN2d9zoeCqM45/92JQya01H+jbUSlGvs=;
 b=gfo+JJ+GxCkegzscCJsMjzLhjVRdnz47pPDILtEV7FWS4Sf97asqP/2S8wEdFvTNzLFEdR
 oyIj3nYJz1ZMXS0Fqr47NVaqannMbVLM7Q50Sj01skqLuGC1G7qwUYI1rEWGFCHMjoZ6Cw
 kZpdPsdNBllBbJ1nSKaUUr58k6okfT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752569339;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DU1fq79ubCUoN2d9zoeCqM45/92JQya01H+jbUSlGvs=;
 b=LZrJBSZVjqYBL4CEklT94DwIYYjb0+ITlWVE9HMBaL4EQ5wrKbS/JihzNWMzOWb2pqN1Km
 Vaj/fLVw4kl0NTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 671DE13306;
 Tue, 15 Jul 2025 08:48:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id IKNZF/sVdmgCWwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 08:48:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: thierry.reding@gmail.com, mperttunen@nvidia.com, airlied@gmail.com,
 simona@ffwll.ch, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] Revert "drm/tegra: Use dma_buf from GEM object instance"
Date: Tue, 15 Jul 2025 10:45:39 +0200
Message-ID: <20250715084549.41473-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch];
 RCPT_COUNT_SEVEN(0.00)[8];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

This reverts commit 482c7e296edc0f594e8869a789a40be53c49bd6a.

The dma_buf field in struct drm_gem_object is not stable over the
object instance's lifetime. The field becomes NULL when user space
releases the final GEM handle on the buffer object. This resulted
in a NULL-pointer deref.

Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
Acquire internal references on GEM handles") only solved the problem
partially. They especially don't work for buffer objects without a DRM
framebuffer associated.

Hence, this revert to going back to using .import_attach->dmabuf.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 41a285ec889f..8ede07fb7a21 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -526,7 +526,7 @@ void tegra_bo_free_object(struct drm_gem_object *gem)
 		if (drm_gem_is_imported(gem)) {
 			dma_buf_unmap_attachment_unlocked(gem->import_attach, bo->sgt,
 							  DMA_TO_DEVICE);
-			dma_buf_detach(gem->dma_buf, gem->import_attach);
+			dma_buf_detach(gem->import_attach->dmabuf, gem->import_attach);
 		}
 	}
 
-- 
2.50.0


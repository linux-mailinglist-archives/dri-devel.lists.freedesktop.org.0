Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75003A8B178
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A9D10E84A;
	Wed, 16 Apr 2025 07:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="KIxUn9dB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2RkUhwYp";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KIxUn9dB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2RkUhwYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B4910E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 07:01:18 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F30AC211A0;
 Wed, 16 Apr 2025 07:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744786877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xkk37Y1omom0hijBcC8bwgDPJGoFpt0Tk5+OHcg+jYI=;
 b=KIxUn9dBwJ1TAtQsPWCICS6B34udeTEdxaa5gS7p4nerWaIo3cNbTtmopKsYtx+6gf7jH1
 l9ybdynS2Z0qVpnmdP1beZB6b+QyujRRdFGD80YaDew/onaFl/hz0ueFEwebqebTLvSJ+R
 ehxBWGr6r+o5fX5L+g0o6Rb84AROf2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744786877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xkk37Y1omom0hijBcC8bwgDPJGoFpt0Tk5+OHcg+jYI=;
 b=2RkUhwYpdx81uwR3ByHKOeJvHFjEinFXtEhfoRAJULMWiwvS7PZMLXfVi4t9o1G5Yf1n7A
 8U5fYprjA24ob7AA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744786877; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xkk37Y1omom0hijBcC8bwgDPJGoFpt0Tk5+OHcg+jYI=;
 b=KIxUn9dBwJ1TAtQsPWCICS6B34udeTEdxaa5gS7p4nerWaIo3cNbTtmopKsYtx+6gf7jH1
 l9ybdynS2Z0qVpnmdP1beZB6b+QyujRRdFGD80YaDew/onaFl/hz0ueFEwebqebTLvSJ+R
 ehxBWGr6r+o5fX5L+g0o6Rb84AROf2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744786877;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Xkk37Y1omom0hijBcC8bwgDPJGoFpt0Tk5+OHcg+jYI=;
 b=2RkUhwYpdx81uwR3ByHKOeJvHFjEinFXtEhfoRAJULMWiwvS7PZMLXfVi4t9o1G5Yf1n7A
 8U5fYprjA24ob7AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 972D613976;
 Wed, 16 Apr 2025 07:01:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id ElSUI7xV/2d2RAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Apr 2025 07:01:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch, airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 christian.koenig@amd.com, boris.brezillon@collabora.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3] drm/gem: Internally test import_attach for imported objects
Date: Wed, 16 Apr 2025 08:57:45 +0200
Message-ID: <20250416065820.26076-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,redhat.com,163.com,amd.com,collabora.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[13];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[163.com,gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email, intel.com:email, suse.de:mid,
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

Test struct drm_gem_object.import_attach to detect imported objects.

During object clenanup, the dma_buf field might be NULL. Testing it in
an object's free callback then incorrectly does a cleanup as for native
objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

v3:
- only test for import_attach (Boris)
v2:
- use import_attach.dmabuf instead of dma_buf (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
---
 include/drm/drm_gem.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8..a3133a08267c 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -588,8 +588,7 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.49.0


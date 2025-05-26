Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB6CAC4072
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CD910E2FB;
	Mon, 26 May 2025 13:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Jk/epQzp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YYTjiQ/R";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jk/epQzp";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YYTjiQ/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9482810E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:30:05 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27A3F21F7C;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqTu0rqFzDAdHVZc5ySYclPJjUJ/sen3+eEeAQmGzWw=;
 b=Jk/epQzpx2+bCOmLar09DshhlPOMo+Pk8s7VGwz1T0+x0OLbm1ASMm9gNimlcaeqFhUCGm
 DmwsTl1TgocqvH7RFApAMCGVQDeSJh/9SCJtCRXuZNunfg/+4/v1rumuyo8arR2nXGSO+5
 pxsmzuZe6g0aSmVF07VGTHEQqhj/MpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqTu0rqFzDAdHVZc5ySYclPJjUJ/sen3+eEeAQmGzWw=;
 b=YYTjiQ/RuHo3NtzchTZOUHbGYUJSY6pMsxvL/ow+qHoeR+6+nYgf01jyYFxVjHRAgmPN0P
 OIMUXZw1BFWqWTBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="Jk/epQzp";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="YYTjiQ/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqTu0rqFzDAdHVZc5ySYclPJjUJ/sen3+eEeAQmGzWw=;
 b=Jk/epQzpx2+bCOmLar09DshhlPOMo+Pk8s7VGwz1T0+x0OLbm1ASMm9gNimlcaeqFhUCGm
 DmwsTl1TgocqvH7RFApAMCGVQDeSJh/9SCJtCRXuZNunfg/+4/v1rumuyo8arR2nXGSO+5
 pxsmzuZe6g0aSmVF07VGTHEQqhj/MpU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqTu0rqFzDAdHVZc5ySYclPJjUJ/sen3+eEeAQmGzWw=;
 b=YYTjiQ/RuHo3NtzchTZOUHbGYUJSY6pMsxvL/ow+qHoeR+6+nYgf01jyYFxVjHRAgmPN0P
 OIMUXZw1BFWqWTBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DAD401397F;
 Mon, 26 May 2025 13:30:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id f/rXM9tsNGgTOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:30:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] drm: Restrict GEM's pin/unpin to PRIME
Date: Mon, 26 May 2025 15:25:16 +0200
Message-ID: <20250526132634.531789-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 27A3F21F7C
X-Spam-Level: 
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

The pin and unpin callbacks in struct drm_gem_object_funcs are
for PRIME exported dma-bufs. Remove the pin calls in the client
code, drop the unnecessary pin callbacks from gem-vram and inline
drm_gem_pin() into the only remaining caller. Do the equivalent
for drm_gem_unpin().

AFAICT the long-term plan is to switch to dynamic dma-buf imports
and remove pin/unpin from GEM object functions.

v2:
- fix coding style and comments (Dmitry)

Thomas Zimmermann (4):
  drm/client: Do not pin in drm_client_buffer_vmap()
  drm/gem-vram: Do not set pin and unpin callbacks
  drm/gem-vram: Un-export pin helpers
  drm/gem: Inline drm_gem_pin() into PRIME helpers

 drivers/gpu/drm/drm_client.c          | 35 ++----------
 drivers/gpu/drm/drm_gem.c             | 32 -----------
 drivers/gpu/drm/drm_gem_vram_helper.c | 79 +--------------------------
 drivers/gpu/drm/drm_internal.h        |  4 --
 drivers/gpu/drm/drm_prime.c           | 22 +++++++-
 include/drm/drm_gem.h                 |  3 +-
 include/drm/drm_gem_vram_helper.h     |  2 -
 7 files changed, 30 insertions(+), 147 deletions(-)


base-commit: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
-- 
2.49.0


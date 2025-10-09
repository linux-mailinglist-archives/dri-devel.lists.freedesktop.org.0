Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16351BC8EE3
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BFE10E9FA;
	Thu,  9 Oct 2025 12:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B/rXXZl4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KjEJKJ2b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B/rXXZl4";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KjEJKJ2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 017EC10E9F5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:00:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 616011F78B;
 Thu,  9 Oct 2025 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760011206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=i6G5/1TwbrzWJRHdTvVUGqp0US8zz6kdIVACWYC9/Hg=;
 b=B/rXXZl4qASgyWJeyQbylRnmZCDlcolH/uTkCGQh/tE3tUAs+iOLgKd75HwWpmm6KvjfiY
 znqm8e3l6hMUX0aWtwLKaAh6OBAOq/018caC5QB6tZa8qkPGJJTRolIkY1q8vFnAohOKq6
 B0P/2k3v1W6t9NOi/OgaMU7hmebXgEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760011206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=i6G5/1TwbrzWJRHdTvVUGqp0US8zz6kdIVACWYC9/Hg=;
 b=KjEJKJ2bKGpnhDHd8aOXtOXfJbrSAEEiKJy7qtDOYoP4PNi/uNB2/stQaPgDdE8C0C1GFJ
 oYxiNeK91A9wGKDw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="B/rXXZl4";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KjEJKJ2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760011206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=i6G5/1TwbrzWJRHdTvVUGqp0US8zz6kdIVACWYC9/Hg=;
 b=B/rXXZl4qASgyWJeyQbylRnmZCDlcolH/uTkCGQh/tE3tUAs+iOLgKd75HwWpmm6KvjfiY
 znqm8e3l6hMUX0aWtwLKaAh6OBAOq/018caC5QB6tZa8qkPGJJTRolIkY1q8vFnAohOKq6
 B0P/2k3v1W6t9NOi/OgaMU7hmebXgEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760011206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=i6G5/1TwbrzWJRHdTvVUGqp0US8zz6kdIVACWYC9/Hg=;
 b=KjEJKJ2bKGpnhDHd8aOXtOXfJbrSAEEiKJy7qtDOYoP4PNi/uNB2/stQaPgDdE8C0C1GFJ
 oYxiNeK91A9wGKDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E827F13A61;
 Thu,  9 Oct 2025 12:00:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 7cAzN8Wj52iUXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 12:00:05 +0000
Date: Thu, 9 Oct 2025 14:00:04 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <20251009120004.GA17570@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 616011F78B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_TWELVE(0.00)[16]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.51
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

Hi Dave, Sima,

this is the weekly PR from drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-10-09:
Short summary of fixes pull:

nouveau:
- Return errno code from TTM move helper

vmwgfx:
- Fix null-ptr access in cursor code
- Fix UAF in validation
- Use correct iterator in validation
The following changes since commit 7d9c3442b02ab7dd3c44e20095a178fd57d2eccb:

  drm/panthor: Defer scheduler entitiy destruction to queue release (2025-09-25 09:52:03 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-10-09

for you to fetch changes up to e4bea919584ff292c9156cf7d641a2ab3cbe27b0:

  drm/nouveau: fix bad ret code in nouveau_bo_move_prep (2025-10-07 22:15:25 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

nouveau:
- Return errno code from TTM move helper

vmwgfx:
- Fix null-ptr access in cursor code
- Fix UAF in validation
- Use correct iterator in validation

----------------------------------------------------------------
Ian Forbes (2):
      drm/vmwgfx: Fix Use-after-free in validation
      drm/vmwgfx: Fix copy-paste typo in validation

Shuhao Fu (1):
      drm/nouveau: fix bad ret code in nouveau_bo_move_prep

Zack Rusin (1):
      drm/vmwgfx: Fix a null-ptr access in the cursor snooper

 drivers/gpu/drm/nouveau/nouveau_bo.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 17 ++++++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c |  6 ++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

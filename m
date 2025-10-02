Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F1FBB3DFD
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 14:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BD210E7D3;
	Thu,  2 Oct 2025 12:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Zoe0aB2l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9maRoxsC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zoe0aB2l";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9maRoxsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0F310E7D3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 12:23:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 69FE31F853;
 Thu,  2 Oct 2025 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759407785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=BWeyfp4bTdeFej180yLRqcwV3Jmdyhj5CVAwU6y3GRE=;
 b=Zoe0aB2lYgjaMm7KRLoXiqo8w5PwYJAUJBqaU77forlJxWHSTRAm3UUQhhtSOjGRsl9iF3
 KUx0NFMmlSS8vwjSqMv+UfXX7dQh9AhbvzBE8DD0BH6Kd07AtPZT1rMgUWn3Fc2EjHX7K8
 nemJEs57XPhbylYEj/woRx+SmpH59A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759407785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=BWeyfp4bTdeFej180yLRqcwV3Jmdyhj5CVAwU6y3GRE=;
 b=9maRoxsC2NkgPZ+aw6geJ3q/Z0uQ9rkTUugjMaXhMkp4Bi6/o4Gv6rUKFEOtQ5x0bCvyRN
 25HMWmPt18T/WkBw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zoe0aB2l;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=9maRoxsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1759407785; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=BWeyfp4bTdeFej180yLRqcwV3Jmdyhj5CVAwU6y3GRE=;
 b=Zoe0aB2lYgjaMm7KRLoXiqo8w5PwYJAUJBqaU77forlJxWHSTRAm3UUQhhtSOjGRsl9iF3
 KUx0NFMmlSS8vwjSqMv+UfXX7dQh9AhbvzBE8DD0BH6Kd07AtPZT1rMgUWn3Fc2EjHX7K8
 nemJEs57XPhbylYEj/woRx+SmpH59A8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1759407785;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=BWeyfp4bTdeFej180yLRqcwV3Jmdyhj5CVAwU6y3GRE=;
 b=9maRoxsC2NkgPZ+aw6geJ3q/Z0uQ9rkTUugjMaXhMkp4Bi6/o4Gv6rUKFEOtQ5x0bCvyRN
 25HMWmPt18T/WkBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 012DC13990;
 Thu,  2 Oct 2025 12:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UJxLOqhu3mg6JgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Oct 2025 12:23:04 +0000
Date: Thu, 2 Oct 2025 14:23:03 +0200
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
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20251002122303.GA21323@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 69FE31F853
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
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

here's the PR for drm-misc-next-fixes. All further fixes for upstream
will now go through drm-misc-fixes again.

Best regards
Thomas

drm-misc-next-fixes-2025-10-02:
Short summary of fixes pull:

v3d:
- Fix fence locking
The following changes since commit 0c4932f6ddf815618fa34f7403df682aed7862b5:

  drm/tiny: pixpaper: Fix missing dependency on DRM_GEM_SHMEM_HELPER (2025-09-23 14:07:04 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-10-02

for you to fetch changes up to adefb2ccea1e96b452cbbc39150bc0ccf1688b99:

  drm/v3d: create a dedicated lock for dma fence (2025-09-30 14:28:14 -0100)

----------------------------------------------------------------
Short summary of fixes pull:

v3d:
- Fix fence locking

----------------------------------------------------------------
Melissa Wen (1):
      drm/v3d: create a dedicated lock for dma fence

 drivers/gpu/drm/v3d/v3d_drv.h   | 2 ++
 drivers/gpu/drm/v3d/v3d_fence.c | 2 +-
 drivers/gpu/drm/v3d/v3d_gem.c   | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

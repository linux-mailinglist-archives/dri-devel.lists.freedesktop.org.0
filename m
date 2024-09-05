Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323F496D753
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 13:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C32710E86C;
	Thu,  5 Sep 2024 11:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="XQFrb70N";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Z4EV43I7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Sa0SdGUG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KO3WyBSX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 800F110E866;
 Thu,  5 Sep 2024 11:38:41 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF78B1F812;
 Thu,  5 Sep 2024 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725536320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oaf7kyQZFxYpgKREUVjDLLAkI3r1Ck3Rw40jnyLlqpw=;
 b=XQFrb70NvHKNXkLjeTUrc2ANRsSlM7w73kqEBVgv/xcxA5KlLycu2swuWJIO+geJcxoyiP
 T2Tf293LdtMTffoXpY0kYHM0F09gMhBGsm/UWyQEwNL6DJGzPQpxyC6uep+pQUh07EVqZt
 Bmgvy0LO53TNcVMhjN2ceOi3GkQPTUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725536320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oaf7kyQZFxYpgKREUVjDLLAkI3r1Ck3Rw40jnyLlqpw=;
 b=Z4EV43I7n4FpmhiTa2mvzJO9+Qld6LJ9WpeMvxqeR/+TeQztO81Dj7sxw+0wXWJKho9ezL
 BnmZEFxCPuXnecBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725536318; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oaf7kyQZFxYpgKREUVjDLLAkI3r1Ck3Rw40jnyLlqpw=;
 b=Sa0SdGUGQP5LojYpvKCi7xpvBQDhxK+svWDIvyrGr9enYgHSWFWdfScIXccyahdA3AENsu
 uHcZTb+o6cqbjUJcScZRT62x4n7hhqPKBamC7cnB2A7VaFSqU+rABdNX5UTgwd3nXfYmnT
 EhaWX5N/hYxUgfsZgv/IXOqSBzNkMvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725536318;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oaf7kyQZFxYpgKREUVjDLLAkI3r1Ck3Rw40jnyLlqpw=;
 b=KO3WyBSXhJr+TO2yyI4Z+3qnTvJwfVBI5/IBTezVhjCZGuqVCvEUlmhg84KvBStLGPIxlg
 yQAF9+jUP/XMovCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 54C6F13419;
 Thu,  5 Sep 2024 11:38:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 1l9lEz6Y2WYcYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Sep 2024 11:38:38 +0000
Date: Thu, 5 Sep 2024 13:38:36 +0200
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
Message-ID: <20240905113836.GA292407@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:helo, linux.fritz.box:mid]
X-Spam-Score: -4.30
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

Hi Dave, Sima,

here's the drm-misc-next-fixes PR for this week. I cherry-picked
the fix from drm-misc-next, as there will be no more PRs for the
latter branch in this release cycle.

Best regards
Thomas

drm-misc-next-fixes-2024-09-05:
Short summary of fixes pull:

tegra:
- Fix uninitialized variable in EDID code
The following changes since commit e066e9aa4d9c869c92d1d03647472e4ce96c0919:

  MAINATINERS: update drm maintainer contacts (2024-09-03 20:07:57 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2024-09-05

for you to fetch changes up to ba2b9de0c1ac2abfbe663414a292c5881e64c361:

  drm/tegra: fix potential uninitialized variable use (2024-09-05 12:40:18 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

tegra:
- Fix uninitialized variable in EDID code

----------------------------------------------------------------
Jani Nikula (1):
      drm/tegra: fix potential uninitialized variable use

 drivers/gpu/drm/tegra/output.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

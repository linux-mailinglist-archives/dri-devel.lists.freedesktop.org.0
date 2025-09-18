Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8BB832F2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 08:46:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FF110E661;
	Thu, 18 Sep 2025 06:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="1mXr+7CW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aaO3FU/C";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1mXr+7CW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aaO3FU/C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96DA710E660
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 06:46:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3E619336B0;
 Thu, 18 Sep 2025 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758177960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=gI+h2IchZ4ORHzUznDKj0pHXihodVGHDFjwSkfbrTfE=;
 b=1mXr+7CWSF9rIxhC8yH9E23DGOb40KbeC7mPuhtZFqC/acEC3TEeensVVUin4PVslg98z4
 b9iSo8ZtbvJkSyKwjLJL2CmyjCu6qDMaTKFtN0kjUrPkSaPg/cQKf83F7I4ij1Sdwvb4yH
 5JoJTnUvbX+gJuy2wOXs3ZStr2Vz2R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758177960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=gI+h2IchZ4ORHzUznDKj0pHXihodVGHDFjwSkfbrTfE=;
 b=aaO3FU/CY+KIqxLh2VS1Vwbc9HTfOLguh0/EQDDnDiQ+ZAERBjrDz+B7ZKfx7OQoDcp5VA
 wKeDObWsBG5USKDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1mXr+7CW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="aaO3FU/C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1758177960; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=gI+h2IchZ4ORHzUznDKj0pHXihodVGHDFjwSkfbrTfE=;
 b=1mXr+7CWSF9rIxhC8yH9E23DGOb40KbeC7mPuhtZFqC/acEC3TEeensVVUin4PVslg98z4
 b9iSo8ZtbvJkSyKwjLJL2CmyjCu6qDMaTKFtN0kjUrPkSaPg/cQKf83F7I4ij1Sdwvb4yH
 5JoJTnUvbX+gJuy2wOXs3ZStr2Vz2R4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1758177960;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=gI+h2IchZ4ORHzUznDKj0pHXihodVGHDFjwSkfbrTfE=;
 b=aaO3FU/CY+KIqxLh2VS1Vwbc9HTfOLguh0/EQDDnDiQ+ZAERBjrDz+B7ZKfx7OQoDcp5VA
 wKeDObWsBG5USKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CECD413A39;
 Thu, 18 Sep 2025 06:45:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id spZLMaeqy2iEIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 18 Sep 2025 06:45:59 +0000
Date: Thu, 18 Sep 2025 08:45:58 +0200
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
Message-ID: <20250918064558.GA10017@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; TO_DN_SOME(0.00)[];
 MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 3E619336B0
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

getting closer to the next merge window, here's the first PR from
drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2025-09-18:
Short summary of fixes pull:

pixpaper:
- Fix mode_valid function signature
The following changes since commit 0d9f0083f7a5a31d91d501467b499bb8c4b25bdf:

  Merge tag 'v6.17-rc6' into drm-next (2025-09-15 17:51:07 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-09-18

for you to fetch changes up to 0265d0ebb409a25d3bb3a19494e0173d06d9d132:

  drm/pixpaper: Fix return type of pixpaper_mode_valid() (2025-09-15 12:29:37 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

pixpaper:
- Fix mode_valid function signature

----------------------------------------------------------------
Nathan Chancellor (1):
      drm/pixpaper: Fix return type of pixpaper_mode_valid()

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next-fixes

 drivers/gpu/drm/tiny/pixpaper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

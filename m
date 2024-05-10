Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199E48C1EE6
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 09:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8584A10E56D;
	Fri, 10 May 2024 07:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="QH7pJL/Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOFN2VKb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QH7pJL/Y";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="hOFN2VKb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED62410E125;
 Fri, 10 May 2024 07:20:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 03BB222856;
 Fri, 10 May 2024 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715325629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=nRaJnEhDEuyGs2/onfbZ3Mu5Utk1iJeoV7Xtm1V0TXQ=;
 b=QH7pJL/YX4d9IF5mZhh6MhUBcdydmy02gLuYURCRhbI8HlOJ6FRPhxzMA2o1b5AaUOObPP
 GB3HcVk1G4yx3wE89JhVXK9j2ifjtDG43dxx35C9ThfQCcC5LR21evR3IRd8zq3yWYtSK6
 jgfQ6mfnC1RtOB85rogRP5d2AVnAr4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715325629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=nRaJnEhDEuyGs2/onfbZ3Mu5Utk1iJeoV7Xtm1V0TXQ=;
 b=hOFN2VKbUc2zsdWgbdpFo6Tv7lFEqLcbO1F6CMTNWc1bZZ0EhdU9naY8A3u2WArvjO3/Zy
 +zH7SOLLmxkMbOBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="QH7pJL/Y";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=hOFN2VKb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1715325629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=nRaJnEhDEuyGs2/onfbZ3Mu5Utk1iJeoV7Xtm1V0TXQ=;
 b=QH7pJL/YX4d9IF5mZhh6MhUBcdydmy02gLuYURCRhbI8HlOJ6FRPhxzMA2o1b5AaUOObPP
 GB3HcVk1G4yx3wE89JhVXK9j2ifjtDG43dxx35C9ThfQCcC5LR21evR3IRd8zq3yWYtSK6
 jgfQ6mfnC1RtOB85rogRP5d2AVnAr4M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1715325629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=nRaJnEhDEuyGs2/onfbZ3Mu5Utk1iJeoV7Xtm1V0TXQ=;
 b=hOFN2VKbUc2zsdWgbdpFo6Tv7lFEqLcbO1F6CMTNWc1bZZ0EhdU9naY8A3u2WArvjO3/Zy
 +zH7SOLLmxkMbOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94F02139AA;
 Fri, 10 May 2024 07:20:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 4fD/IrzKPWa7DwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 10 May 2024 07:20:28 +0000
Date: Fri, 10 May 2024 09:20:27 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
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
Message-ID: <20240510072027.GA9131@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-6.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MISSING_XM_UA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 03BB222856
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -6.51
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

this is the weekly drm-misc-fixes PR. Sorry for being late.

Best regards
Thomas

drm-misc-fixes-2024-05-10:
Short summary of fixes pull:

core:
- fix connector debugging output

meson:
- dw-hdmi: power-up fixes
- dw-hdmi: add badngap setting for g12
The following changes since commit da85f0aaa9f21999753b01d45c0343f885a8f905:

  drm/panel: ili9341: Use predefined error codes (2024-05-02 09:41:27 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-05-10

for you to fetch changes up to 6897204ea3df808d342c8e4613135728bc538bcd:

  drm/connector: Add \n to message about demoting connector force-probes (2024-05-07 09:17:07 -0700)

----------------------------------------------------------------
Short summary of fixes pull:

core:
- fix connector debugging output

meson:
- dw-hdmi: power-up fixes
- dw-hdmi: add badngap setting for g12

----------------------------------------------------------------
Douglas Anderson (1):
      drm/connector: Add \n to message about demoting connector force-probes

Jerome Brunet (2):
      drm/meson: dw-hdmi: power up phy on device init
      drm/meson: dw-hdmi: add bandgap setting for g12

 drivers/gpu/drm/drm_connector.c       |  2 +-
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 70 ++++++++++++++++-------------------
 2 files changed, 32 insertions(+), 40 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF57A7B7FF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 08:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF93010EA53;
	Fri,  4 Apr 2025 06:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="boYZmGZy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Bpv8bro";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="boYZmGZy";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8Bpv8bro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0809210E311
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 06:51:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 949F1211C4;
 Fri,  4 Apr 2025 06:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743749467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=SjpAnnOxN0Q1H004weBg/wRQGuQae06E5nKdJp7hhjI=;
 b=boYZmGZyifW3xCiPqqYo5S5EmFpeUqs2UZPrAx53H2xWh8Rk4eftK51K/1u3viMeTJ9//L
 3A8+1hg/mSxx35xVi1jB6eMNey+3jSbj/UFSqtwkEqDrJCDyloEH1rf2gdsLD5ATSy1+YC
 kYdV8ZO/1iEcHGzp1BwO5wKI57W7mNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743749467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=SjpAnnOxN0Q1H004weBg/wRQGuQae06E5nKdJp7hhjI=;
 b=8Bpv8bro85Fkmwdh5T0UIpPc90dQXIRq/G3Pjo/8tYT05jB1qN4rafZalujI3nIz6ASE24
 T8kbAH36UfL91uAg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743749467; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=SjpAnnOxN0Q1H004weBg/wRQGuQae06E5nKdJp7hhjI=;
 b=boYZmGZyifW3xCiPqqYo5S5EmFpeUqs2UZPrAx53H2xWh8Rk4eftK51K/1u3viMeTJ9//L
 3A8+1hg/mSxx35xVi1jB6eMNey+3jSbj/UFSqtwkEqDrJCDyloEH1rf2gdsLD5ATSy1+YC
 kYdV8ZO/1iEcHGzp1BwO5wKI57W7mNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743749467;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=SjpAnnOxN0Q1H004weBg/wRQGuQae06E5nKdJp7hhjI=;
 b=8Bpv8bro85Fkmwdh5T0UIpPc90dQXIRq/G3Pjo/8tYT05jB1qN4rafZalujI3nIz6ASE24
 T8kbAH36UfL91uAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30DEE13691;
 Fri,  4 Apr 2025 06:51:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id x2afCluB72cgWgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 06:51:07 +0000
Date: Fri, 4 Apr 2025 08:51:05 +0200
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
Message-ID: <20250404065105.GA27699@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.992]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCVD_VIA_SMTP_AUTH(0.00)[]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

this is the final PR for this release cycle's drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2025-04-04:
Short summary of fixes pull:

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER
The following changes since commit ee20c69c789b6cb2179a535cf440d72b98f4a134:

  drm: adp: Fix NULL vs IS_ERR() check in adp_plane_new() (2025-03-14 09:42:11 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-next-fixes-2025-04-04

for you to fetch changes up to 85a063b8b281e144ed96463936fb4e6b3d4fe9e4:

  drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER (2025-03-30 21:02:06 +0300)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- tda998x: Select CONFIG_DRM_KMS_HELPER

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER

 drivers/gpu/drm/bridge/Kconfig | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402AC8D48A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 506C410E788;
	Thu, 27 Nov 2025 08:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="2QPgxSCA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PsVGQg+G";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NixqmkDk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="gQVw1J/a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497D110E788
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:10:19 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DDE765BCC4;
 Thu, 27 Nov 2025 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764231015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TV7Gp6KSo82RM9/OAyKfpS7xLbQkZQkOyMtoG8Ejacs=;
 b=2QPgxSCAD2A+bjs4nRnhIPEev2AAOsty3sL9EtqlV2OzAbb4K4gW1e/fe5M+WmI320ft+F
 lC/hfBtCCTT2Uo+Don10T/rBow9DOYj6+WK4UOBalsDbYmWt8CvyzIkVLoZ9SeQ2qDpPRk
 eggTGxAzUCTHfdd7oC52vubgDKkzjjk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764231015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TV7Gp6KSo82RM9/OAyKfpS7xLbQkZQkOyMtoG8Ejacs=;
 b=PsVGQg+G7IqNijDHw6NCXEAzghff3IEywU1ZTLFEJxYpWnezJ91rq+PajY1LmpDj3XtiQ6
 YjXXJi0FQkuEZUAw==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NixqmkDk;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="gQVw1J/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1764231009; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TV7Gp6KSo82RM9/OAyKfpS7xLbQkZQkOyMtoG8Ejacs=;
 b=NixqmkDkcwpqDh43Zs1nFHLImFG0NxHPQpXfCCMAGeAmAuqZDIs7HoIjNmDd16Ctv9x/Qs
 wD5gA9PitTEidYNf41ql9j7EFMjVqZcZslwjw0yQFzTnAgSgAKaQltDnOnBbwFTClPNDhZ
 rBc7GYYLfAWP5LxMfkoEFkTHaonr9ZM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1764231009;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TV7Gp6KSo82RM9/OAyKfpS7xLbQkZQkOyMtoG8Ejacs=;
 b=gQVw1J/aACaP0jbtdeK/NpGPloChxpGJgtPUrPjli9LUkPerKjsfOV3ifPYtM0wuJ3zUnC
 EM+PQKdA5sbNfnDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B512B3EA63;
 Thu, 27 Nov 2025 08:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 59GCKmAHKGkHFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Nov 2025 08:10:08 +0000
Date: Thu, 27 Nov 2025 09:10:07 +0100
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
Message-ID: <20251127081007.GA13578@2a02-2454-fd5e-fd00-689d-32c0-780c-bb87.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.com:url];
 SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[suse.com:server fail];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: DDE765BCC4
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

this is the PR from drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2025-11-27:
Short summary of fixes pull:

bridge:
- sil902x: Fix HDMI detection

imagination:
- Update documentation

sti:
- Fix leaks in probe

vga_switcheroo:
- Avoid race condition during fbcon initialization
The following changes since commit cead55e24cf9e092890cf51c0548eccd7569defa:

  drm/plane: Fix create_in_format_blob() return value (2025-11-19 19:37:04 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-11-27

for you to fetch changes up to eb76d0f5553575599561010f24c277cc5b31d003:

  drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup (2025-11-25 09:08:32 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

bridge:
- sil902x: Fix HDMI detection

imagination:
- Update documentation

sti:
- Fix leaks in probe

vga_switcheroo:
- Avoid race condition during fbcon initialization

----------------------------------------------------------------
Devarsh Thakkar (1):
      drm/bridge: sii902x: Fix HDMI detection with DRM_BRIDGE_ATTACH_NO_CONNECTOR

Johan Hovold (1):
      drm: sti: fix device leaks at component probe

Matt Coster (1):
      drm/imagination: Document pvr_device.power member

Thomas Zimmermann (1):
      drm, fbcon, vga_switcheroo: Avoid race condition in fbcon setup

 drivers/gpu/drm/bridge/sii902x.c         | 20 ++++++++------------
 drivers/gpu/drm/drm_fb_helper.c          | 14 --------------
 drivers/gpu/drm/imagination/pvr_device.h |  8 ++++++++
 drivers/gpu/drm/sti/sti_vtg.c            |  7 ++++++-
 drivers/video/fbdev/core/fbcon.c         |  9 +++++++++
 5 files changed, 31 insertions(+), 27 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)

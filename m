Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1689E9C1863
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCC310E936;
	Fri,  8 Nov 2024 08:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="j9xwbzqP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1lDr3fSj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="j9xwbzqP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1lDr3fSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FF910E935;
 Fri,  8 Nov 2024 08:51:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 27BDA21D25;
 Fri,  8 Nov 2024 08:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731055860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=T4wIbT0WSkFiQJB3A0D8LfUreoJWNFCNmwNTUDVygsc=;
 b=j9xwbzqPdRLj7dnPgW9BDFtU0sj/LPuChI/cEBeOeDI7cZ9CWC/a7k1YMq+JJ9+A1areIO
 HHVsxLDu/qBQgMnD5G870ZoL8ojVy67Bfl0cCgM4N14DLku/A43BJM9JRTZw3kArj87k1d
 TCjeo72nANkhPd4ca/JUUiKaliX5oys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731055860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=T4wIbT0WSkFiQJB3A0D8LfUreoJWNFCNmwNTUDVygsc=;
 b=1lDr3fSjY5ICGTR21hY3Qp61RLL3gtpmzSHvWJQkaNphY4AUWfYjzuDugBvlmOT1FCSkif
 KpnamejlsVHBh7Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j9xwbzqP;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1lDr3fSj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1731055860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=T4wIbT0WSkFiQJB3A0D8LfUreoJWNFCNmwNTUDVygsc=;
 b=j9xwbzqPdRLj7dnPgW9BDFtU0sj/LPuChI/cEBeOeDI7cZ9CWC/a7k1YMq+JJ9+A1areIO
 HHVsxLDu/qBQgMnD5G870ZoL8ojVy67Bfl0cCgM4N14DLku/A43BJM9JRTZw3kArj87k1d
 TCjeo72nANkhPd4ca/JUUiKaliX5oys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1731055860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=T4wIbT0WSkFiQJB3A0D8LfUreoJWNFCNmwNTUDVygsc=;
 b=1lDr3fSjY5ICGTR21hY3Qp61RLL3gtpmzSHvWJQkaNphY4AUWfYjzuDugBvlmOT1FCSkif
 KpnamejlsVHBh7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B53B61394A;
 Fri,  8 Nov 2024 08:50:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0sf1KvPQLWdrFgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Nov 2024 08:50:59 +0000
Date: Fri, 8 Nov 2024 09:50:58 +0100
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
Message-ID: <20241108085058.GA37468@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: 27BDA21D25
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 MISSING_XM_UA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCPT_COUNT_TWELVE(0.00)[16]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,linux.fritz.box:mid,gitlab.freedesktop.org:url];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Hi Dave, Sima,

here's the drm-misc-fixes PR for this week. Apologies for being late.

Best regards
Thomas

drm-misc-fixes-2024-11-08:
Short summary of fixes pull:

imagination:
- Track PVR context per file
- Break ref-counting cycle

panel-orientation-quirks:
- Fix matching Lenovo Yoga Tab 3 X90F

panthor:
- Lock VM array
- Be strict about I/O mapping flags
The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-11-08

for you to fetch changes up to f432a1621f049bb207e78363d9d0e3c6fa2da5db:

  drm/panthor: Be stricter about IO mapping flags (2024-11-07 16:39:53 +0000)

----------------------------------------------------------------
Short summary of fixes pull:

imagination:
- Track PVR context per file
- Break ref-counting cycle

panel-orientation-quirks:
- Fix matching Lenovo Yoga Tab 3 X90F

panthor:
- Lock VM array
- Be strict about I/O mapping flags

----------------------------------------------------------------
Brendan King (2):
      drm/imagination: Add a per-file PVR context list
      drm/imagination: Break an object reference loop

Hans de Goede (1):
      drm: panel-orientation-quirks: Make Lenovo Yoga Tab 3 X90F DMI match less strict

Jann Horn (1):
      drm/panthor: Be stricter about IO mapping flags

Liviu Dudau (1):
      drm/panthor: Lock XArray when getting entries for the VM

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/gpu/drm/drm_panel_orientation_quirks.c |  1 -
 drivers/gpu/drm/imagination/pvr_context.c      | 33 ++++++++++++++++++++++++++
 drivers/gpu/drm/imagination/pvr_context.h      | 21 ++++++++++++++++
 drivers/gpu/drm/imagination/pvr_device.h       | 10 ++++++++
 drivers/gpu/drm/imagination/pvr_drv.c          |  3 +++
 drivers/gpu/drm/imagination/pvr_vm.c           | 22 +++++++++++++----
 drivers/gpu/drm/imagination/pvr_vm.h           |  1 +
 drivers/gpu/drm/panthor/panthor_device.c       |  4 ++++
 drivers/gpu/drm/panthor/panthor_mmu.c          |  2 ++
 9 files changed, 92 insertions(+), 5 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

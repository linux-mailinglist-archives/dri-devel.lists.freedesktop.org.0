Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0E0A97020
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 17:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519E10E5F4;
	Tue, 22 Apr 2025 15:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="uxtvGSfP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lxJgAQOU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ASIBmVs/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="43eDrcyH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9679B10E5ED
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 15:12:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD4D11F454;
 Tue, 22 Apr 2025 15:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745334733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ARFh+efzKLBEbwoAcUmtDw/ut3jfy7HQ1HfMCmi7Dts=;
 b=uxtvGSfPadlbBzSn2F1nZOi6LDMSpKrqZtucFAlFhOdpVjXiqefti6Blf/cOm1CxOeQ8Iz
 p7+05UNSsDqpuaZn4rydVMiIwngh2IRUrre0//9fZ+Ay9VlJS9u2gOb/duw4+0XOmGQX7p
 I0R85qpQdJyeNYSZ5ZDk2Bl4/q+Y/1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745334733;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ARFh+efzKLBEbwoAcUmtDw/ut3jfy7HQ1HfMCmi7Dts=;
 b=lxJgAQOUwkX2DWWERU5LoiOBgLHib6/iQc2AkZglvR6xmmEMX+kvDlW4tHdq09ATXJ/mGi
 7xw6axbwktIFkVBA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ASIBmVs/";
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=43eDrcyH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1745334732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ARFh+efzKLBEbwoAcUmtDw/ut3jfy7HQ1HfMCmi7Dts=;
 b=ASIBmVs/+IVdmuleLzzYmtiqb+ZeVjm375xUXlqE6rlc8gbwNCsZKlQd/dtch51yUeo5H2
 U0kB7beM7svhqJ7XeQADr6aDnjPjZiz+xwvQbAgE08YqmpjynGINyyIyMoNaDV47PCLeOZ
 VjFsEkvIjgNRRuz2IgJYOm1cqFfVRs8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1745334732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ARFh+efzKLBEbwoAcUmtDw/ut3jfy7HQ1HfMCmi7Dts=;
 b=43eDrcyHVP57QUR7Vuxn3Y0XWQ1/FkeYTdr5AvFIKNCg57MhxvT8CbsjE3s1gXLDiXgxiq
 iXdxPtiQ1gBdFPDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8A82E137CF;
 Tue, 22 Apr 2025 15:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kKKhIMuxB2gbWgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Apr 2025 15:12:11 +0000
Date: Tue, 22 Apr 2025 17:12:09 +0200
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
Message-ID: <20250422151209.GA24823@2a02-2454-fd5e-fd00-5cc9-93f1-8e9a-df9b.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: AD4D11F454
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim, gitlab.freedesktop.org:url,
 imap1.dmz-prg2.suse.org:rdns, imap1.dmz-prg2.suse.org:helo,
 2a02-2454-fd5e-fd00-5cc9-93f1-8e9a-df9b.dyn6.pyur.net:mid]
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

a bit earlier than usual, this is the PR for drm-misc-fixes for
this week.

Best regards
Thomas

drm-misc-fixes-2025-04-22:
Short summary of fixes pull:

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity
The following changes since commit 76c332d119f9048c6e16b52359f401510f18b2ff:

  drm/mgag200: Fix value in <VBLKSTR> register (2025-04-17 09:56:28 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-04-22

for you to fetch changes up to 095c8e61f4c71cd4630ee11a82e82cc341b38464:

  drm: panel: jd9365da: fix reset signal polarity in unprepare (2025-04-22 09:42:04 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

meson:
- Fix VCLK calculation

panel:
- jd9365a: Fix reset polarity

----------------------------------------------------------------
Christian Hewitt (1):
      Revert "drm/meson: vclk: fix calculation of 59.94 fractional rates"

Hugo Villeneuve (1):
      drm: panel: jd9365da: fix reset signal polarity in unprepare

Martin Blumenstingl (1):
      drm/meson: use unsigned long long / Hz for frequency types

 drivers/gpu/drm/meson/meson_drv.c                |   2 +-
 drivers/gpu/drm/meson/meson_drv.h                |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c       |  29 ++--
 drivers/gpu/drm/meson/meson_vclk.c               | 195 ++++++++++++-----------
 drivers/gpu/drm/meson/meson_vclk.h               |  13 +-
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c |   4 +-
 6 files changed, 128 insertions(+), 117 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

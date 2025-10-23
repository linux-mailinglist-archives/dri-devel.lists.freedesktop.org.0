Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D73BFFF22
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97B10E8E7;
	Thu, 23 Oct 2025 08:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="riq8hxsT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X/rOuZnd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="RCKld9Jn";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="q0A2v1ap";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3AD10E8D6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 08:35:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36EAE211ED;
 Thu, 23 Oct 2025 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761208495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PXjmOd0YWA5Xmr/E/bRTf/H7nG1Q+Rh6/BQzsuAmK+4=;
 b=riq8hxsT3kaPc/pDdc1zyoaTZJsIxHaV87LlP7SbXciwAqjAgByvm9mBvWdqyEEvcCZ4Q0
 zOn9cLPKpCOxOztGT6Oggx7vAa9x+oE414LhZNj2Y0ohbU6nHLqVFSd0B7qiaLVJTQoxeJ
 l0V4iAkfHQ+XYZOj13s7jwd4fjSzcnc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761208495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PXjmOd0YWA5Xmr/E/bRTf/H7nG1Q+Rh6/BQzsuAmK+4=;
 b=X/rOuZndqKFh8Xi6MTGCQCxD5iTQfEK1Eze8X7zvxuQv/QhU6DTKgzGYdhLZD5NwYJCnyV
 VwwsbqjimMlU6XCA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761208491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PXjmOd0YWA5Xmr/E/bRTf/H7nG1Q+Rh6/BQzsuAmK+4=;
 b=RCKld9JnAS15NhuJA/ccnCnlk+UOQSxUhiA50+MArA2XoPN4ebncNOE1kUVsPTALSQslVD
 mqe8UtsNM012/2lV8exl3Nd0c4kgv5Y4958FfKxzwefYIAH7VhfU7Z1wx27IuE8oYAFT3b
 NrMq+YYqY5uiqRCT20FVv9VAuKTidF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761208491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=PXjmOd0YWA5Xmr/E/bRTf/H7nG1Q+Rh6/BQzsuAmK+4=;
 b=q0A2v1apcllaKyoBI15P9LmRJ4HQRr32usI2qo4G7id1U+xNVtskpSfYXEvjJ0l4Pst8FY
 5kYBwRf+b2JUXuDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C9905136CF;
 Thu, 23 Oct 2025 08:34:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id M3YCMKro+WikDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Oct 2025 08:34:50 +0000
Date: Thu, 23 Oct 2025 10:34:49 +0200
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
Message-ID: <20251023083449.GA13190@linux-2.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

here is this week's the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-10-23:
Short summary of fixes pull:

panic:
- Fix several issues in size calculations

panthor:
- Fix kernel panic on partial unmap of GPU VA region

rockchip:
- hdmi: Fix HDP setup
The following changes since commit 5801e65206b065b0b2af032f7f1eef222aa2fd83:

  drm/sched: Fix potential double free in drm_sched_job_add_resv_dependencies (2025-10-16 14:26:05 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-10-23

for you to fetch changes up to 23437509a69476d4f896891032d62ac868731668:

  drm/panic: Fix 24bit pixel crossing page boundaries (2025-10-21 11:28:03 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

panic:
- Fix several issues in size calculations

panthor:
- Fix kernel panic on partial unmap of GPU VA region

rockchip:
- hdmi: Fix HDP setup

----------------------------------------------------------------
Akash Goel (1):
      drm/panthor: Fix kernel panic on partial unmap of a GPU VA region

Alok Tiwari (1):
      drm/rockchip: dw_hdmi: use correct SCLIN mask for RK3228

Jocelyn Falempe (6):
      drm/panic: Fix drawing the logo on a small narrow screen
      drm/panic: Fix overlap between qr code and logo
      drm/panic: Fix qr_code, ensure vmargin is positive
      drm/panic: Fix kmsg text drawing rectangle
      drm/panic: Fix divide by 0 if the screen width < font width
      drm/panic: Fix 24bit pixel crossing page boundaries

 drivers/gpu/drm/drm_panic.c                 | 60 ++++++++++++++++++++++++++---
 drivers/gpu/drm/panthor/panthor_mmu.c       | 10 +++--
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c |  2 +-
 3 files changed, 62 insertions(+), 10 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

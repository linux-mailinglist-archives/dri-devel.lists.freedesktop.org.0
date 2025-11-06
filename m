Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7942C3B1CB
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81F7210E2EE;
	Thu,  6 Nov 2025 13:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Qlq4pVBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="izRk8c/E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Qlq4pVBc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="izRk8c/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903C210E2E3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 13:12:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 36761211D1;
 Thu,  6 Nov 2025 13:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762434766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=isWu4PpB97JLoNaYBzb1FWHFAOrEFn4TSVk457XdxLY=;
 b=Qlq4pVBcc9PsZUbv//SGMBxmULLGqXz1fDgHLjSb5qcc1fw8sHAOkyQxZJhvAYG3Xui4tI
 mQOYCLKIIr2eYjkOieRjAGTqu6UE3xZsljVzVi3AqDF0gaeCbslhQAVDOTvInvai6Tc6yy
 qfy8Eajc+YMsRrlYM0Ge832Ls1WG5Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762434766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=isWu4PpB97JLoNaYBzb1FWHFAOrEFn4TSVk457XdxLY=;
 b=izRk8c/EHRvIW0e5ACbU5Kr4xBKA4UHPslsUsn0tAnGEsFE+CBkA2oCbaqm6yf/3LpBT8L
 lbnEoS8Q4RzHw8DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1762434766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=isWu4PpB97JLoNaYBzb1FWHFAOrEFn4TSVk457XdxLY=;
 b=Qlq4pVBcc9PsZUbv//SGMBxmULLGqXz1fDgHLjSb5qcc1fw8sHAOkyQxZJhvAYG3Xui4tI
 mQOYCLKIIr2eYjkOieRjAGTqu6UE3xZsljVzVi3AqDF0gaeCbslhQAVDOTvInvai6Tc6yy
 qfy8Eajc+YMsRrlYM0Ge832Ls1WG5Y0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1762434766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=isWu4PpB97JLoNaYBzb1FWHFAOrEFn4TSVk457XdxLY=;
 b=izRk8c/EHRvIW0e5ACbU5Kr4xBKA4UHPslsUsn0tAnGEsFE+CBkA2oCbaqm6yf/3LpBT8L
 lbnEoS8Q4RzHw8DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C287B139A9;
 Thu,  6 Nov 2025 13:12:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id q5g/Ls2eDGkseAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Nov 2025 13:12:45 +0000
Date: Thu, 6 Nov 2025 14:12:44 +0100
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
Message-ID: <20251106131244.GA155679@2a02-2454-fd5e-fd00-d540-1fd5-75b4-d5e2.dyn6.pyur.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.997]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,imap1.dmz-prg2.suse.org:helo]
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

this is the PR for drm-misc-fixes. Note that there's a UAPI change in
one of the nouveau fixes.

Best regards
Thomas

drm-misc-fixes-2025-11-06:
Short summary of fixes pull:

imagination:
- kconfig: Fix dependencies

nouveau:
- Set DMA mask earlier
- Advertize correct modifiers for GB20x

pixpaper:
- kconfig: Fix dependencies

sched:
- Fix deadlock
The following changes since commit 41dacb39fe79cd2fce42d31fa6658d926489a548:

  Merge tag 'drm-xe-fixes-2025-10-30' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2025-10-31 19:11:16 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-11-06

for you to fetch changes up to b750f5a9d64df6cfe9103c7feb7314694318818d:

  drm/tiny: pixpaper: add explicit dependency on MMU (2025-11-06 13:47:29 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

imagination:
- kconfig: Fix dependencies

nouveau:
- Set DMA mask earlier
- Advertize correct modifiers for GB20x

pixpaper:
- kconfig: Fix dependencies

sched:
- Fix deadlock

----------------------------------------------------------------
James Jones (2):
      drm: define NVIDIA DRM format modifiers for GB20x
      drm/nouveau: Advertise correct modifiers on GB20x

LiangCheng Wang (1):
      drm/tiny: pixpaper: add explicit dependency on MMU

Matt Coster (1):
      drm/imagination: Optionally depend on POWER_SEQUENCING

Pierre-Eric Pelloux-Prayer (1):
      drm/sched: Fix deadlock in drm_sched_entity_kill_jobs_cb

Timur Tabi (1):
      drm/nouveau: set DMA mask before creating the flush page

 drivers/gpu/drm/imagination/Kconfig              |  1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  4 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.h          |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c          | 24 +++++++++++++++--
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c      | 33 +++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c | 24 ++++++++---------
 drivers/gpu/drm/scheduler/sched_entity.c         | 34 +++++++++++++-----------
 drivers/gpu/drm/tiny/Kconfig                     |  1 +
 include/uapi/drm/drm_fourcc.h                    | 23 ++++++++++------
 9 files changed, 107 insertions(+), 38 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)

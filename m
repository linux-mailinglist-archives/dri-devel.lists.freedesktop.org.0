Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4935A8A09DF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 09:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0828510EDE6;
	Thu, 11 Apr 2024 07:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="LO7WrrPG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kjlgjVfe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rHg2EINL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yfYlIHVE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58CB10EEED;
 Thu, 11 Apr 2024 07:34:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFAFD34ED9;
 Thu, 11 Apr 2024 07:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712820846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=enwRlzWIKwDqXI7ONVgwJ1F0+f00BXv7sMew7TIkoeY=;
 b=LO7WrrPGnfayQzbR6SQMaYuDrSCdEmlFYTFsxmRcYNMvx9sNZRWlZzH+8O8Q9LSv+VdvPQ
 vcCAmn4LdH718snnf9GUf+7vn+7aq/k/XRCsyXQtFWNdrN4lBn+d0EC9prdW101nVzhdTR
 E+qgZuvVK4MnD1bcIRH8ejHT8OQm6NM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712820846;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=enwRlzWIKwDqXI7ONVgwJ1F0+f00BXv7sMew7TIkoeY=;
 b=kjlgjVfewITc/YA0YWPPndljJa0fdnL7tfaZBDfki8f/ZUO3uPC5dox+d2U0KHNdJnfBUB
 SHTpg1AMe/v2V8Cw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rHg2EINL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yfYlIHVE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712820844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=enwRlzWIKwDqXI7ONVgwJ1F0+f00BXv7sMew7TIkoeY=;
 b=rHg2EINLDOq4Z1AlEgRQF4TXJk3/S9Iwi1hCNmPL2P8byz1RyrN9qGstOTzltHSLnzzwyR
 02njDMfOU/3FJBjPYuYBhMCRTaIQxl4wnq/LDGv5G/JUYytf2WVSTenytmgsYjNm1zR8tR
 t6Jnh0BJwJtkR8B1wPEROoQ51sG5Zbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712820844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=enwRlzWIKwDqXI7ONVgwJ1F0+f00BXv7sMew7TIkoeY=;
 b=yfYlIHVE1SnGBuOG9l84j89+9g3ykFp8dSMvg/fueT2KoAdLqh+buO7fBIfG8T1RCMgQ0I
 eFEx/o+LtLqoInCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6B048139DE;
 Thu, 11 Apr 2024 07:34:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kMsgGWySF2YrNQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 11 Apr 2024 07:34:04 +0000
Date: Thu, 11 Apr 2024 09:34:03 +0200
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
Message-ID: <20240411073403.GA9895@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: BFAFD34ED9
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 MISSING_XM_UA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
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

here's the PR for drm-misc-fixes for this week.

Best regards
Thomas

drm-misc-fixes-2024-04-11:
Short summary of fixes pull:

ast:
- Fix soft lockup

client:
- Protect connector modes with mode_config mutex

host1x:
- Do not setup DMA for virtual addresses

ivpu:
- Fix deadlock in context_xa
- PCI fixes
- Fixes to error handling

nouveau:
- gsp: Fix OOB access
- Fix casting

panfrost:
- Fix error path in MMU code

qxl:
- Revert "drm/qxl: simplify qxl_fence_wait"

vmwgfx:
- Enable DMA for SEV mappings
The following changes since commit fddf09273807bf6e51537823aaae896e05f147f9:

  drm/display: fix typo (2024-04-01 22:35:16 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-04-11

for you to fetch changes up to 4c08f01934ab67d1d283d5cbaa52b923abcfe4cd:

  drm/vmwgfx: Enable DMA mappings with SEV (2024-04-09 13:36:05 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

ast:
- Fix soft lockup

client:
- Protect connector modes with mode_config mutex

host1x:
- Do not setup DMA for virtual addresses

ivpu:
- Fix deadlock in context_xa
- PCI fixes
- Fixes to error handling

nouveau:
- gsp: Fix OOB access
- Fix casting

panfrost:
- Fix error path in MMU code

qxl:
- Revert "drm/qxl: simplify qxl_fence_wait"

vmwgfx:
- Enable DMA for SEV mappings

----------------------------------------------------------------
Alex Constantino (1):
      Revert "drm/qxl: simplify qxl_fence_wait"

Arnd Bergmann (1):
      nouveau: fix function cast warning

Boris Brezillon (1):
      drm/panfrost: Fix the error path in panfrost_mmu_map_fault_addr()

Jacek Lawrynowicz (5):
      accel/ivpu: Remove d3hot_after_power_off WA
      accel/ivpu: Put NPU back to D3hot after failed resume
      accel/ivpu: Return max freq for DRM_IVPU_PARAM_CORE_CLOCK_RATE
      accel/ivpu: Fix missed error message after VPU rename
      accel/ivpu: Fix deadlock in context_xa

Jammy Huang (1):
      drm/ast: Fix soft lockup

Kees Cook (1):
      nouveau/gsp: Avoid addressing beyond end of rpc->entries

Thierry Reding (1):
      gpu: host1x: Do not setup DMA for virtual devices

Ville Syrjälä (1):
      drm/client: Fully protect modes[] with dev->mode_config.mutex

Wachowski, Karol (3):
      accel/ivpu: Check return code of ipc->lock init
      accel/ivpu: Fix PCI D0 state entry in resume
      accel/ivpu: Improve clarity of MMU error messages

Zack Rusin (1):
      drm/vmwgfx: Enable DMA mappings with SEV

 drivers/accel/ivpu/ivpu_drv.c                      | 40 ++++++-----------
 drivers/accel/ivpu/ivpu_drv.h                      |  3 +-
 drivers/accel/ivpu/ivpu_hw.h                       |  6 +++
 drivers/accel/ivpu/ivpu_hw_37xx.c                  | 11 +++--
 drivers/accel/ivpu/ivpu_hw_40xx.c                  |  6 +++
 drivers/accel/ivpu/ivpu_ipc.c                      |  8 +++-
 drivers/accel/ivpu/ivpu_mmu.c                      |  8 ++--
 drivers/accel/ivpu/ivpu_pm.c                       | 14 +++---
 drivers/gpu/drm/ast/ast_dp.c                       |  3 ++
 drivers/gpu/drm/drm_client_modeset.c               |  3 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/shadowof.c    |  7 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c     |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c            | 13 ++++--
 drivers/gpu/drm/qxl/qxl_release.c                  | 50 +++++++++++++++++++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c                | 11 ++---
 drivers/gpu/host1x/bus.c                           |  8 ----
 include/linux/dma-fence.h                          |  7 +++
 17 files changed, 125 insertions(+), 75 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EFA916A0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDB010EA58;
	Thu, 17 Apr 2025 08:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="RMTT8VTU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lL0EVKsH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OZaq160E";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cc7dlgZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC4510EA58
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:40:47 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F28242118B;
 Thu, 17 Apr 2025 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744879246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SV5u2/M8Z6y5dbn5rBzkGqTSD9IpeWunNphmbx+tkcU=;
 b=RMTT8VTUcK3AZ9dM1Jbmku+gT0HB7v8Id4uTLwUGfiG5DR/aoXV7tUq0BGC1w9lGp2m5T9
 3Kq3LQwOW5EwN7CN7kkhZkDd+FdnzBI+1Ixmc+X7DoDiQIuTw/Bzs2g3xxNKZloSZpdBJE
 gU4tCZRrpozWA0NquzR2JjW/HWuLNTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744879246;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SV5u2/M8Z6y5dbn5rBzkGqTSD9IpeWunNphmbx+tkcU=;
 b=lL0EVKsHRhww64yI2COwRJn8XjjsqWMEBJ+gLIdGazrpycRPmlGNjFr506I50NQBEDKFo2
 D9JnIgU+A12eK5Bg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OZaq160E;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cc7dlgZw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744879245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SV5u2/M8Z6y5dbn5rBzkGqTSD9IpeWunNphmbx+tkcU=;
 b=OZaq160ErPMGEw1SJaEwma1nHO+iopl5MnOzAVyFYpjApFNzIrqocfrjgond8zn/fEheSM
 Zzw7NaYgXfKWKzM1tZPqesh/kJ83jMKYYVXIPQn9TLybX96KdmDpeZOOdhJAMdxa8I4zsV
 JCRMunwmuFndAkVllWW+1pSskn1FgS4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744879245;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SV5u2/M8Z6y5dbn5rBzkGqTSD9IpeWunNphmbx+tkcU=;
 b=cc7dlgZwdnNJkmNFcoybtkPuzUrFLwtuIRoYA0r4hu/PE20Mg3DpJ5+fjsja64/EaeVVwi
 xCAeRmeaeI4/xTAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C7C1388F;
 Thu, 17 Apr 2025 08:40:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id h/4JIIy+AGgrZgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Apr 2025 08:40:44 +0000
Date: Thu, 17 Apr 2025 10:40:43 +0200
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
Message-ID: <20250417084043.GA365738@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F28242118B
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 RCPT_COUNT_TWELVE(0.00)[16];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,
 imap1.dmz-prg2.suse.org:helo, suse.de:dkim]
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

this is the weekly PR of drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-04-17:
Short summary of fixes pull:

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch
The following changes since commit 1d34597a1e23004c7dd0ab5f58ba1ef95fd9ded5:

  drm/rockchip: dw_hdmi_qp: Fix io init for dw_hdmi_qp_rockchip_resume (2025-04-10 10:51:06 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-04-17

for you to fetch changes up to 76c332d119f9048c6e16b52359f401510f18b2ff:

  drm/mgag200: Fix value in <VBLKSTR> register (2025-04-17 09:56:28 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

dma-buf:
- Correctly decrement refcounter on errors

gem:
- Fix test for imported buffers

ivpu:
- Fix debugging
- Fixes to frequency
- Support firmware API 3.28.3
- Flush jobs upon reset

mgag200:
- Set vblank start to correct values

v3d:
- Fix Indirect Dispatch

----------------------------------------------------------------
Andrzej Kacprowski (2):
      accel/ivpu: Fix the NPU's DPU frequency calculation
      accel/ivpu: Show NPU frequency in sysfs

Dan Carpenter (1):
      dma-buf/sw_sync: Decrement refcount on error in sw_sync_ioctl_get_deadline()

Karol Wachowski (2):
      accel/ivpu: Update FW Boot API to version 3.28.3
      accel/ivpu: Add cmdq_id to job related logs

Maciej Falkowski (1):
      accel/ivpu: Flush pending jobs of device's workqueues

Maíra Canal (1):
      drm/v3d: Fix Indirect Dispatch configuration for V3D 7.1.6 and later

Thomas Zimmermann (2):
      drm/gem: Internally test import_attach for imported objects
      drm/mgag200: Fix value in <VBLKSTR> register

 drivers/accel/ivpu/ivpu_drv.c          |  10 +--
 drivers/accel/ivpu/ivpu_fw.c           |  17 ++++-
 drivers/accel/ivpu/ivpu_hw.h           |  16 ++--
 drivers/accel/ivpu/ivpu_hw_btrs.c      | 134 ++++++++++++++++-----------------
 drivers/accel/ivpu/ivpu_hw_btrs.h      |   7 +-
 drivers/accel/ivpu/ivpu_job.c          |  15 ++--
 drivers/accel/ivpu/ivpu_sysfs.c        |  49 +++++++++++-
 drivers/accel/ivpu/vpu_boot_api.h      |  13 +++-
 drivers/accel/ivpu/vpu_jsm_api.h       |  53 ++++++++-----
 drivers/dma-buf/sw_sync.c              |  19 +++--
 drivers/gpu/drm/mgag200/mgag200_mode.c |   2 +-
 drivers/gpu/drm/v3d/v3d_sched.c        |  16 +++-
 include/drm/drm_gem.h                  |   3 +-
 include/uapi/drm/ivpu_accel.h          |   4 +-
 14 files changed, 226 insertions(+), 132 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

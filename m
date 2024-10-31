Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1849B7D2C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 15:43:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 270A610E8C3;
	Thu, 31 Oct 2024 14:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xCgs1Nsh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FBBdGlph";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xCgs1Nsh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="FBBdGlph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DCB10E8B3;
 Thu, 31 Oct 2024 14:43:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B700C2200C;
 Thu, 31 Oct 2024 14:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730385830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=KRY5ozCABIKUrV1nd/Idhi/2iqQFOD2nknyFedKN/cg=;
 b=xCgs1Nshcwa05QJ+ZTWoWkgwRBxShwiF99UBE7e6J9j/BZV+4uaCsRvqpwVOGWJVUQydj8
 /8IyPhQtCWWnpvjWZk/2SPsY9aVnl0udjfSOumK6EqCIoflh2EEMRhXhVP2/EC2M+RoRcl
 PmhjfmZHhXT+38Sv3xe2eKKAInRR98w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730385830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=KRY5ozCABIKUrV1nd/Idhi/2iqQFOD2nknyFedKN/cg=;
 b=FBBdGlphnV/xbBK7OrZqN4WXQWEb/6697MHEZWNjKlQW9giqXFwidnVGcXCm/csILCu0IF
 IHgNMqricAQkZ9Cg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xCgs1Nsh;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=FBBdGlph
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730385830; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=KRY5ozCABIKUrV1nd/Idhi/2iqQFOD2nknyFedKN/cg=;
 b=xCgs1Nshcwa05QJ+ZTWoWkgwRBxShwiF99UBE7e6J9j/BZV+4uaCsRvqpwVOGWJVUQydj8
 /8IyPhQtCWWnpvjWZk/2SPsY9aVnl0udjfSOumK6EqCIoflh2EEMRhXhVP2/EC2M+RoRcl
 PmhjfmZHhXT+38Sv3xe2eKKAInRR98w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730385830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=KRY5ozCABIKUrV1nd/Idhi/2iqQFOD2nknyFedKN/cg=;
 b=FBBdGlphnV/xbBK7OrZqN4WXQWEb/6697MHEZWNjKlQW9giqXFwidnVGcXCm/csILCu0IF
 IHgNMqricAQkZ9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 519B2136A5;
 Thu, 31 Oct 2024 14:43:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6wsvEqaXI2dAEgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 31 Oct 2024 14:43:50 +0000
Date: Thu, 31 Oct 2024 15:43:48 +0100
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
Message-ID: <20241031144348.GA7826@linux-2.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Rspamd-Queue-Id: B700C2200C
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; MIME_TRACE(0.00)[0:+];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_TWELVE(0.00)[16];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; ARC_NA(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
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

this is the week's PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2024-10-31:
Short summary of fixes pull:

ivpu:
- Fix firewall IRQ handling

panthor:
- Fix firmware initialization wrt page sizes
- Fix handling and reporting of dead job groups

sched:
- Guarantee forward progress via WC_MEM_RECLAIM

tests:
- Fix memory leak in drm_display_mode_from_cea_vic()
The following changes since commit 4d95a12beba146b0ca2de59c7ce905bc0aadfd0c:

  Merge tag 'drm-xe-fixes-2024-10-24-1' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes (2024-10-25 16:55:39 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-10-31

for you to fetch changes up to add4163aca0d4a86e9fe4aa513865e4237db8aef:

  drm/tests: hdmi: Fix memory leaks in drm_display_mode_from_cea_vic() (2024-10-31 10:31:35 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

ivpu:
- Fix firewall IRQ handling

panthor:
- Fix firmware initialization wrt page sizes
- Fix handling and reporting of dead job groups

sched:
- Guarantee forward progress via WC_MEM_RECLAIM

tests:
- Fix memory leak in drm_display_mode_from_cea_vic()

----------------------------------------------------------------
Andrzej Kacprowski (1):
      accel/ivpu: Fix NOC firewall interrupt handling

Boris Brezillon (3):
      drm/panthor: Fix firmware initialization on systems with a page size > 4k
      drm/panthor: Fail job creation when the group is dead
      drm/panthor: Report group as timedout when we fail to properly suspend

Dan Carpenter (1):
      drm/tegra: Fix NULL vs IS_ERR() check in probe()

Jinjie Ruan (3):
      drm/tests: helpers: Add helper for drm_display_mode_from_cea_vic()
      drm/connector: hdmi: Fix memory leak in drm_display_mode_from_cea_vic()
      drm/tests: hdmi: Fix memory leaks in drm_display_mode_from_cea_vic()

Matthew Brost (1):
      drm/sched: Mark scheduler work queues with WQ_MEM_RECLAIM

Thomas Zimmermann (1):
      Merge drm/drm-fixes into drm-misc-fixes

 drivers/accel/ivpu/ivpu_debugfs.c                  |  9 +++++
 drivers/accel/ivpu/ivpu_hw.c                       |  1 +
 drivers/accel/ivpu/ivpu_hw.h                       |  1 +
 drivers/accel/ivpu/ivpu_hw_ip.c                    |  5 ++-
 drivers/gpu/drm/panthor/panthor_fw.c               |  4 +--
 drivers/gpu/drm/panthor/panthor_gem.c              | 11 ++++--
 drivers/gpu/drm/panthor/panthor_mmu.c              | 16 +++++++--
 drivers/gpu/drm/panthor/panthor_mmu.h              |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c            | 20 ++++++++---
 drivers/gpu/drm/scheduler/sched_main.c             |  5 +--
 drivers/gpu/drm/tegra/drm.c                        |  4 +--
 drivers/gpu/drm/tests/drm_connector_test.c         | 24 ++++++-------
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  8 ++---
 drivers/gpu/drm/tests/drm_kunit_helpers.c          | 42 ++++++++++++++++++++++
 include/drm/drm_kunit_helpers.h                    |  4 +++
 15 files changed, 122 insertions(+), 33 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

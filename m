Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EEC57A13
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 14:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D748810E80C;
	Thu, 13 Nov 2025 13:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="avVTJyok";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VERKj4Rv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rEXLq3sc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="l7Z0dvqS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B625D10E80C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 13:23:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 482521F78A;
 Thu, 13 Nov 2025 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763040200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eyQkhei8HmaXiLxVT29gG+tiGO6nKZp+mVwAeq2WXnU=;
 b=avVTJyok3Gu9kriSvqt/tev+tRjTObMMJhIKjPG5Lyw6Eela72I9k2unb4OEvf67hM2I3T
 Qg85/0i8abLhfrrsL7Wfr3ZHkDOgYwqM/U2xC+0XQJNutjt6utXuZTQa3p1thPr4/fiU6Y
 3fLchc+7gwIdL1ZlVbqI678LvweEa0Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763040200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eyQkhei8HmaXiLxVT29gG+tiGO6nKZp+mVwAeq2WXnU=;
 b=VERKj4RvHYCQos5BMtms0SX5H6WZqq7uhtqbk79foPXuaFhSQvmNIkAOx6V26GicpyzIK/
 i/J5hRIpfmS9ZkCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1763040199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eyQkhei8HmaXiLxVT29gG+tiGO6nKZp+mVwAeq2WXnU=;
 b=rEXLq3sc29Ej16pB+qTNOfY2Z2TZBQQ1oW1jSL51l1maaYyNrpjCx3MU5sK0zX0X52JSNU
 eQQ78LO3cRwmPIRYPnzEGA59OV9rugZG5daYEmlBagcct0MfyMMakAqGIoRxk3Swjoz0xi
 PtQT/Q/UlHNs+EI97qPt0QKrSObYtxQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1763040199;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eyQkhei8HmaXiLxVT29gG+tiGO6nKZp+mVwAeq2WXnU=;
 b=l7Z0dvqSPXoxTxK/3E8yh6qcuYbQnM6ZPQFuvC2F8soqwyZdeXTB166XfIRVogXiLhG20j
 Sx/paogTat+hzqCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE0793EA61;
 Thu, 13 Nov 2025 13:23:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8MITMcbbFWmnYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Nov 2025 13:23:18 +0000
Date: Thu, 13 Nov 2025 14:23:17 +0100
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
Message-ID: <20251113132317.GA451885@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 MISSING_XM_UA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCPT_COUNT_TWELVE(0.00)[16];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url]
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

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2025-11-13:
Short summary of fixes pull:

client:
- Fix description of module parameter

panthor:
- Flush writes before mapping buffers

vmwgfx:
- Improve command validation
- Improve ref counting
- Fix cursor-plane support
The following changes since commit b750f5a9d64df6cfe9103c7feb7314694318818d:

  drm/tiny: pixpaper: add explicit dependency on MMU (2025-11-06 13:47:29 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-11-13

for you to fetch changes up to 0a4a18e888ae8c8004582f665c5792c84a681668:

  drm/client: fix MODULE_PARM_DESC string for "active" (2025-11-13 14:15:24 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

client:
- Fix description of module parameter

panthor:
- Flush writes before mapping buffers

vmwgfx:
- Improve command validation
- Improve ref counting
- Fix cursor-plane support

----------------------------------------------------------------
Boris Brezillon (1):
      drm/panthor: Flush shmem writes before mapping buffers CPU-uncached

Ian Forbes (3):
      drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE
      drm/vmwgfx: Use kref in vmw_bo_dirty
      drm/vmwgfx: Restore Guest-Backed only cursor plane support

Randy Dunlap (1):
      drm/client: fix MODULE_PARM_DESC string for "active"

 drivers/gpu/drm/clients/drm_client_setup.c   |  4 ++--
 drivers/gpu/drm/panthor/panthor_gem.c        | 18 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.c | 16 +++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_cursor_plane.h |  1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c      |  5 +++++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c   | 12 +++++-------
 6 files changed, 46 insertions(+), 10 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4729DB928
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EF5610ECC8;
	Thu, 28 Nov 2024 14:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="spXBZAos";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QzcpnBrU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="spXBZAos";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QzcpnBrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1510ECC2;
 Thu, 28 Nov 2024 14:00:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3917B21190;
 Thu, 28 Nov 2024 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732802400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+06lfCNDnVD2/bTWmn5jNB1y8xu+76Vcsk9Nst6TDU=;
 b=spXBZAoscIt3YPqSKmP56TV5ZGYPR8DYLDmh0N3qkxyhHuqjN2hNOvygvUPkl/3xgN5NeK
 YzZVXsjoJDuiAvKz0VFgKJAOGcpWl5LgphixlikhBo79xSE6aqbjo+B4YYOc6ukc82oUEu
 ndAaOJKo7sY7mP1Csf2Wql+R0oghs6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732802400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+06lfCNDnVD2/bTWmn5jNB1y8xu+76Vcsk9Nst6TDU=;
 b=QzcpnBrUg/NiE+w/i+8yC6e92kIOb/gkCoOdZclU+gtwib++vwP1ux2MXbOteI6jGb9pPB
 jIgYF6fjGyIcJ6Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1732802400; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+06lfCNDnVD2/bTWmn5jNB1y8xu+76Vcsk9Nst6TDU=;
 b=spXBZAoscIt3YPqSKmP56TV5ZGYPR8DYLDmh0N3qkxyhHuqjN2hNOvygvUPkl/3xgN5NeK
 YzZVXsjoJDuiAvKz0VFgKJAOGcpWl5LgphixlikhBo79xSE6aqbjo+B4YYOc6ukc82oUEu
 ndAaOJKo7sY7mP1Csf2Wql+R0oghs6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1732802400;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l+06lfCNDnVD2/bTWmn5jNB1y8xu+76Vcsk9Nst6TDU=;
 b=QzcpnBrUg/NiE+w/i+8yC6e92kIOb/gkCoOdZclU+gtwib++vwP1ux2MXbOteI6jGb9pPB
 jIgYF6fjGyIcJ6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5CEE13974;
 Thu, 28 Nov 2024 13:59:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id o13SLl93SGfJCAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Nov 2024 13:59:59 +0000
Date: Thu, 28 Nov 2024 14:59:58 +0100
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
Message-ID: <20241128135958.GA244627@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
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

here's the PR of drm-misc-fixes for this week. The first two patches
are from last weeks PR drm-misc-fixes-2024-11-21, which should be merged
first.

Best regards
Thomas

drm-misc-fixes-2024-11-28:
Short summary of fixes pull:

dma-buf:
- Fix dma_fence_array_signaled() to ensure forward progress

dp_mst:
- Fix MST sideband message body length check

sti:
- Add __iomem for mixer_dbg_mxn()'s parameter
The following changes since commit 32c4514455b2b8fde506f8c0962f15c7e4c26f1d:

  drm/bridge: tc358768: Fix DSI command tx (2024-11-14 11:29:42 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-11-28

for you to fetch changes up to 86e8f94789dd6f3e705bfa821e1e416f97a2f863:

  drm/sti: Add __iomem for mixer_dbg_mxn's parameter (2024-11-26 14:02:25 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

dma-buf:
- Fix dma_fence_array_signaled() to ensure forward progress

dp_mst:
- Fix MST sideband message body length check

sti:
- Add __iomem for mixer_dbg_mxn()'s parameter

----------------------------------------------------------------
Christian König (1):
      dma-buf: fix dma_fence_array_signaled v4

Imre Deak (1):
      drm/dp_mst: Fix MST sideband message body length check

Pei Xiao (1):
      drm/sti: Add __iomem for mixer_dbg_mxn's parameter

Tvrtko Ursulin (2):
      dma-fence: Fix reference leak on fence merge failure path
      dma-fence: Use kernel's sort for merging fences

 drivers/dma-buf/dma-fence-array.c             |  28 +++++-
 drivers/dma-buf/dma-fence-unwrap.c            | 126 +++++++++++++-------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   3 +
 drivers/gpu/drm/sti/sti_mixer.c               |   2 +-
 4 files changed, 92 insertions(+), 67 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

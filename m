Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D8E952EEE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 15:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E092310E147;
	Thu, 15 Aug 2024 13:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mZEBrXLa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lgE1YEmT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mZEBrXLa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lgE1YEmT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B857210E134;
 Thu, 15 Aug 2024 13:17:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3FAD4211BB;
 Thu, 15 Aug 2024 13:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723727873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LS94qsNam5prkKC5CID4alIhK/BVn36zRi4KUiz9E6E=;
 b=mZEBrXLaac9+yuGlEjZ+8Kv1aGhOsAV0kvrgGMxh3VPnuVkG53nZrNFLnU4Xkp+8ABa4hj
 5yOkzzMEV+wWh8XfHLBs1OhtAEvaRmKcrL83DCz6ZwUp/bLbSp5r+eLk7UUruF96sOrAPD
 iX9DMh1YHRv15dbvBS2HMuqBPZ6mhis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723727873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LS94qsNam5prkKC5CID4alIhK/BVn36zRi4KUiz9E6E=;
 b=lgE1YEmTBflFxwb+m3COiUr5Sr0aTs4kwc/7GoZr9+6YtWg3DLdhC8qzrQO5daCAseSGeE
 D/ehMgcg9B0tr/Dw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1723727873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LS94qsNam5prkKC5CID4alIhK/BVn36zRi4KUiz9E6E=;
 b=mZEBrXLaac9+yuGlEjZ+8Kv1aGhOsAV0kvrgGMxh3VPnuVkG53nZrNFLnU4Xkp+8ABa4hj
 5yOkzzMEV+wWh8XfHLBs1OhtAEvaRmKcrL83DCz6ZwUp/bLbSp5r+eLk7UUruF96sOrAPD
 iX9DMh1YHRv15dbvBS2HMuqBPZ6mhis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1723727873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LS94qsNam5prkKC5CID4alIhK/BVn36zRi4KUiz9E6E=;
 b=lgE1YEmTBflFxwb+m3COiUr5Sr0aTs4kwc/7GoZr9+6YtWg3DLdhC8qzrQO5daCAseSGeE
 D/ehMgcg9B0tr/Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D199313983;
 Thu, 15 Aug 2024 13:17:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tNvnMQAAvmbaZAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Aug 2024 13:17:52 +0000
Date: Thu, 15 Aug 2024 15:17:51 +0200
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
Message-ID: <20240815131751.GA151031@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Score: -4.30
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
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

here's the weekly PR for drm-misc-fixes. It resolves an OOB access
in v3d and a few minor errors.

Best regards
Thomas

drm-misc-fixes-2024-08-15:
Short summary of fixes pull:

panel:
- dt-bindings style fixes

panel-orientation:
- add quirk for Any Loki Max
- add quirk for Any Loki Zero

rockchip:
- inno-hdmi: fix infoframe upload

v3d:
- fix OOB access in v3d_csd_job_run()
The following changes since commit 929725bd7eb4eea1f75197d9847f3f1ea5afdad1:

  drm/atomic: allow no-op FB_ID updates for async flips (2024-08-06 20:16:31 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2024-08-15

for you to fetch changes up to fd45cc614b8acca5bb435ba37fe9b3f9a17fab84:

  drm/rockchip: inno-hdmi: Fix infoframe upload (2024-08-15 12:31:47 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

panel:
- dt-bindings style fixes

panel-orientation:
- add quirk for Any Loki Max
- add quirk for Any Loki Zero

rockchip:
- inno-hdmi: fix infoframe upload

v3d:
- fix OOB access in v3d_csd_job_run()

----------------------------------------------------------------
Alex Bee (1):
      drm/rockchip: inno-hdmi: Fix infoframe upload

Bouke Sybren Haarsma (2):
      drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
      drm: panel-orientation-quirks: Add quirk for Ayn Loki Max

Douglas Anderson (1):
      dt-bindings: display: panel: samsung,atna45dc02: Fix indentation

Maíra Canal (1):
      drm/v3d: Fix out-of-bounds read in `v3d_csd_job_run()`

 .../bindings/display/panel/samsung,atna33xc20.yaml         | 12 ++++++------
 drivers/gpu/drm/drm_panel_orientation_quirks.c             | 12 ++++++++++++
 drivers/gpu/drm/rockchip/inno_hdmi.c                       |  4 +---
 drivers/gpu/drm/v3d/v3d_sched.c                            | 14 +++++++++++---
 4 files changed, 30 insertions(+), 12 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

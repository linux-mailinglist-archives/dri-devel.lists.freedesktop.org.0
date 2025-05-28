Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21924AC6CED
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 17:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D310E63B;
	Wed, 28 May 2025 15:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="OkB+tWwJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z5n19rmM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OkB+tWwJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z5n19rmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AB110E64E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:35:54 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5E8801F79C;
 Wed, 28 May 2025 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748446552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXv62CC2r0RxZ6SQQgYCr4gGbzuyMxbUXGqctrXYOek=;
 b=OkB+tWwJn5TyhhdZk5gRTOtB/3WHwqE1z90PjIS/tvdz4lDahQGvk5HSEa76oAQ2kg/1/b
 B20qvLXFqVFNGCXDJh79yWEowrOKaAr8LzfcAK0Ed3oElZ8PIbUoQatX9TnxWgG8bBHIbv
 b3sFaDAxi2CSy2Q/eDBj32soLVoFtO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748446552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXv62CC2r0RxZ6SQQgYCr4gGbzuyMxbUXGqctrXYOek=;
 b=z5n19rmMiwEaklI61przui4wcgbfqyN1EQp36L9Z3ElM9cRUJGbmyudyPmUcEQM/A83XMr
 u8u8KRR5DnCvs9Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748446552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXv62CC2r0RxZ6SQQgYCr4gGbzuyMxbUXGqctrXYOek=;
 b=OkB+tWwJn5TyhhdZk5gRTOtB/3WHwqE1z90PjIS/tvdz4lDahQGvk5HSEa76oAQ2kg/1/b
 B20qvLXFqVFNGCXDJh79yWEowrOKaAr8LzfcAK0Ed3oElZ8PIbUoQatX9TnxWgG8bBHIbv
 b3sFaDAxi2CSy2Q/eDBj32soLVoFtO0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748446552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=ZXv62CC2r0RxZ6SQQgYCr4gGbzuyMxbUXGqctrXYOek=;
 b=z5n19rmMiwEaklI61przui4wcgbfqyN1EQp36L9Z3ElM9cRUJGbmyudyPmUcEQM/A83XMr
 u8u8KRR5DnCvs9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E5466136E3;
 Wed, 28 May 2025 15:35:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AhQdNlctN2hHYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 28 May 2025 15:35:51 +0000
Date: Wed, 28 May 2025 17:35:50 +0200
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
Message-ID: <20250528153550.GA21050@linux.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[gmail.com,ffwll.ch]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 MISSING_XM_UA(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWELVE(0.00)[16]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -4.30
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

this is the weekly PR for drm-misc-fixes. Besides DRM, the bugfix
for dummycon possibly affects fbcon and fbdev output as well.

Best regards
Thomas

drm-misc-fixes-2025-05-28:
Short summary of fixes pull:

drm-scheduler:
- signal scheduled fence when killing job

dummycon:
- trigger deferred takeover when switching consoles

ivpu:
- improve logging
- update firmware filenames
- reorder steps in command-queue unregistering
The following changes since commit 6692dbc15e5ed40a3aa037aced65d7b8826c58cd:

  drm/edid: fixed the bug that hdr metadata was not reset (2025-05-19 12:26:08 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/misc/kernel.git tags/drm-misc-fixes-2025-05-28

for you to fetch changes up to 4557cc834712eca4eae7adbd9f0a06bdd8f79c99:

  accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction (2025-05-28 11:49:29 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

drm-scheduler:
- signal scheduled fence when killing job

dummycon:
- trigger deferred takeover when switching consoles

ivpu:
- improve logging
- update firmware filenames
- reorder steps in command-queue unregistering

----------------------------------------------------------------
Jacek Lawrynowicz (2):
      accel/ivpu: Improve buffer object logging
      accel/ivpu: Use firmware names from upstream repo

Karol Wachowski (1):
      accel/ivpu: Reorder Doorbell Unregister and Command Queue Destruction

Lin.Cao (1):
      drm/scheduler: signal scheduled fence when kill job

Thomas Zimmermann (1):
      dummycon: Trigger redraw when switching consoles with deferred takeover

 drivers/accel/ivpu/ivpu_fw.c             | 12 ++++++------
 drivers/accel/ivpu/ivpu_gem.c            | 25 +++++++++++++++++--------
 drivers/accel/ivpu/ivpu_gem.h            |  1 +
 drivers/accel/ivpu/ivpu_job.c            |  8 ++++----
 drivers/gpu/drm/scheduler/sched_entity.c |  1 +
 drivers/video/console/dummycon.c         | 18 +++++++++++++-----
 6 files changed, 42 insertions(+), 23 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

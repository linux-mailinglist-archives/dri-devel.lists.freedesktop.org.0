Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C12CC9EF485
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 18:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E59E10EE3A;
	Thu, 12 Dec 2024 17:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="FRIdUSwj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GvzIeMHu";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FRIdUSwj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="GvzIeMHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB3810E48A;
 Thu, 12 Dec 2024 17:09:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57F4F21179;
 Thu, 12 Dec 2024 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riAyxmCpHxvyVI+atzAWCS2Kb6YWaeWrKulJuLqQaRI=;
 b=FRIdUSwjj8oUjluRUNb6yYs+Q/SFkX4Z8MdFS86OhOYOaThN8s6+gAaCt5ZeVCcA30i6V0
 Iiyx/jFd9ZxsZlm/9p8ZFJ6tF3puvjMORESaLwhO5idtYKi6OUW/lEB9pK6Qk8x/rIQ/30
 JiMnZOt2mm4TRcaKBCwQC3GA0XuHaNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riAyxmCpHxvyVI+atzAWCS2Kb6YWaeWrKulJuLqQaRI=;
 b=GvzIeMHuhvqw41CuRgpYRgTolBGQXd1p+OHdiVsBEgrc1SZtq1Qh+k0HMyYdV9PUn2kaur
 Scp4DhnWsUwqpcAA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FRIdUSwj;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GvzIeMHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1734023360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riAyxmCpHxvyVI+atzAWCS2Kb6YWaeWrKulJuLqQaRI=;
 b=FRIdUSwjj8oUjluRUNb6yYs+Q/SFkX4Z8MdFS86OhOYOaThN8s6+gAaCt5ZeVCcA30i6V0
 Iiyx/jFd9ZxsZlm/9p8ZFJ6tF3puvjMORESaLwhO5idtYKi6OUW/lEB9pK6Qk8x/rIQ/30
 JiMnZOt2mm4TRcaKBCwQC3GA0XuHaNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1734023360;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=riAyxmCpHxvyVI+atzAWCS2Kb6YWaeWrKulJuLqQaRI=;
 b=GvzIeMHuhvqw41CuRgpYRgTolBGQXd1p+OHdiVsBEgrc1SZtq1Qh+k0HMyYdV9PUn2kaur
 Scp4DhnWsUwqpcAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7C6513508;
 Thu, 12 Dec 2024 17:09:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id rHoyN78YW2etIQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Dec 2024 17:09:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jfalempe@redhat.com, javierm@redhat.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/12] drm/{i915,xe}: Convert to DRM client setup
Date: Thu, 12 Dec 2024 18:08:41 +0100
Message-ID: <20241212170913.185939-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 57F4F21179
X-Spam-Score: -3.01
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_HAS_DN(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,ursulin.net,ffwll.ch,gmail.com,kernel.org,redhat.com];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; DKIM_TRACE(0.00)[suse.de:+]
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

i915 and xe are the last remaining drivers that still implement their
own fbdev client. All other clients have been mass converted to DRM's
client setup in in the series at [1]. As Intel drivers require more
effort than others, their changes have been moved into this separate
series.

With DRM's client setup, DRM picks the in-kernel client from the
kernel's config and parameters. Besides fbdev there's also drm_log
available. For fbdev support, the driver only has to implement struct
drm_driver.fbdev_probe, a callback that allocates a compatible
framebuffer.

At first, some details of the Intel implementation have to be rebuild
for the generic client and fbdev handling. Patches 1 to 6 do that.
Hotplugging and suspend/resume are then hidden behind callbacks. Some
Intel-specifics in the restore and suspend code get their own hooks.

Patches 7 to 9 prepare Intel's fbdev implementation ot get things
out of the way.

Patch 10 converts i915 and xe to DRM's client setup. Patches 11 and
12 clean up the remaining code.

Tested with i915 and xe hardware.

[1] https://patchwork.freedesktop.org/series/137391/

Thomas Zimmermann (12):
  drm/{i915,xe}: Suspend/resume fbdev emulation via client interfaces
  drm/client: Add client-hotplug helper
  drm/client: Send pending hotplug events after resume
  drm/i915/display: Remove fbdev suspend and hotplug tracking
  drm/i915/display: fbdev: Move custom restore code to new callback
  drm/i915/display: fbdev: Move custom suspend code to new callback
  drm/i915/display: Remove preferred_bpp from struct intel_fbdev
  drm/i915/display: Remove struct drm_fb_helper from struct intel_fbdev
  drm/i915/display: Move fbdev code around
  drm/{i915,xe}: Run DRM default client setup
  drm/i915/display: Remove compile guard around fbdev debugfs output
  drm/fb-helper: Remove struct drm_fb_helper.fb_probe

 drivers/gpu/drm/drm_client_event.c            |  41 ++-
 drivers/gpu/drm/drm_fb_helper.c               |  20 +-
 .../gpu/drm/i915/display/intel_display_core.h |   1 -
 .../drm/i915/display/intel_display_debugfs.c  |   2 -
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 338 ++++--------------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  17 +-
 drivers/gpu/drm/i915/i915_driver.c            |  10 +-
 drivers/gpu/drm/xe/display/xe_display.c       |  12 +-
 include/drm/drm_client.h                      |   8 +
 include/drm/drm_fb_helper.h                   |  44 ++-
 10 files changed, 176 insertions(+), 317 deletions(-)


base-commit: 7bbcd7df9387f0d9004f997df33f7a9472d9c080
-- 
2.47.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DAFB3E144
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 13:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F9E10E424;
	Mon,  1 Sep 2025 11:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="u3ueMhwG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pXj9H/pl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="u3ueMhwG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pXj9H/pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1699910E423
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 11:15:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9CA481F7FD;
 Mon,  1 Sep 2025 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756725328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0tJn6Vz+3D+Iz+2Tqo9jg2TopzlQTPWlBW3ykeigvRk=;
 b=u3ueMhwGSsrD5B2VIwHEDM6NB1fSWONB/kbtf2aKkA67YM7HZMy255bGzRpKjXp6a28uE4
 KJVfm2tyZvpdj5xMkgO4zbFx3YiqPZwoSSS2/FCsSvSXkfIB+FzqD7PBmN+pKz2d4eVWSm
 BRUBQsP/f6p8AAoy0IB2kogq1qeLO+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756725328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0tJn6Vz+3D+Iz+2Tqo9jg2TopzlQTPWlBW3ykeigvRk=;
 b=pXj9H/plr5/ws6R70b5+7yVUJ7DbuRqitpulpcPHsC/tDSastV8JE7wvrB04fifXqP2LyS
 OI2O3lhOCbqwcfAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1756725328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0tJn6Vz+3D+Iz+2Tqo9jg2TopzlQTPWlBW3ykeigvRk=;
 b=u3ueMhwGSsrD5B2VIwHEDM6NB1fSWONB/kbtf2aKkA67YM7HZMy255bGzRpKjXp6a28uE4
 KJVfm2tyZvpdj5xMkgO4zbFx3YiqPZwoSSS2/FCsSvSXkfIB+FzqD7PBmN+pKz2d4eVWSm
 BRUBQsP/f6p8AAoy0IB2kogq1qeLO+Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1756725328;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0tJn6Vz+3D+Iz+2Tqo9jg2TopzlQTPWlBW3ykeigvRk=;
 b=pXj9H/plr5/ws6R70b5+7yVUJ7DbuRqitpulpcPHsC/tDSastV8JE7wvrB04fifXqP2LyS
 OI2O3lhOCbqwcfAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D09BC1378C;
 Mon,  1 Sep 2025 11:15:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id s8dyMU+AtWj8EAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Sep 2025 11:15:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: louis.chauvet@bootlin.com, drawat.floss@gmail.com, hamohammed.sa@gmail.com,
 melissa.srw@gmail.com, mhklinux@outlook.com, simona@ffwll.ch,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/4] drm: Add vblank timers for devices without interrupts
Date: Mon,  1 Sep 2025 13:06:57 +0200
Message-ID: <20250901111241.233875-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MID_CONTAINS_FROM(1.00)[]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TAGGED_RCPT(0.00)[]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[bootlin.com,gmail.com,outlook.com,ffwll.ch,linux.intel.com]; 
 RCPT_COUNT_SEVEN(0.00)[11];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.de:mid];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -1.30
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

Compositors often depend on vblanks to limit their display-update
rate. Without, they see vblank events ASAP, which breaks the rate-
limit feature. This creates high CPU overhead. It is especially a
problem with virtual devices with fast framebuffer access.

The series moves vkms' vblank timer to DRM and converts the hyperv
DRM driver. An earlier version of this series contains examples of
other updated drivers. In principle, any DRM driver without vblank
hardware can use the timer.

The series has been motivated by a recent discussion about hypervdrm [1]
and other long-standing bug reports. [2][3]

[1] https://lore.kernel.org/dri-devel/20250523161522.409504-1-mhklinux@outlook.com/T/#ma2ebb52b60bfb0325879349377738fadcd7cb7ef
[2] https://bugzilla.suse.com/show_bug.cgi?id=1189174
[3] https://invent.kde.org/plasma/kwin/-/merge_requests/1229#note_284606

Thomas Zimmermann (4):
  drm/vblank: Add vblank timer
  drm/vblank: Add CRTC helpers for simple use cases
  drm/vkms: Convert to DRM's vblank timer
  drm/hypervdrm: Use vblank timer

 Documentation/gpu/drm-kms-helpers.rst       |  12 ++
 drivers/gpu/drm/Makefile                    |   3 +-
 drivers/gpu/drm/drm_vblank.c                | 122 +++++++++++++-
 drivers/gpu/drm/drm_vblank_helper.c         | 176 ++++++++++++++++++++
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  11 ++
 drivers/gpu/drm/vkms/vkms_crtc.c            |  83 +--------
 drivers/gpu/drm/vkms/vkms_drv.h             |   2 -
 include/drm/drm_modeset_helper_vtables.h    |  12 ++
 include/drm/drm_vblank.h                    |  28 ++++
 include/drm/drm_vblank_helper.h             |  56 +++++++
 10 files changed, 424 insertions(+), 81 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_vblank_helper.c
 create mode 100644 include/drm/drm_vblank_helper.h

-- 
2.50.1


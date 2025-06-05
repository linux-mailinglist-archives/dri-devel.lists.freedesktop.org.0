Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24AACF311
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D862D10E977;
	Thu,  5 Jun 2025 15:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vZK5dBTT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="D4EFIBzl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LCkm+fOB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yZ+rBqhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2471410E919
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:30:28 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4791033726;
 Thu,  5 Jun 2025 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OwxD+v6u8AtxBhJlMnDqsFaDzVaudFmsu93T5JIw3I8=;
 b=vZK5dBTTUU8j8itCFuow9DaoNSXj2gbHrQkRKllcnusfeC1gITQSurexrtUo3W/zZqlYzS
 zplRjTCLEMPGm+KpoJIHkj/5VIE1UV99UrvQHWtoGyV4PkiyNYBzdW6WtNn0sPTyfIZIOB
 bgmEbPn9QWHtjYPEqu6fBJ/y/RQn4QA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137418;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OwxD+v6u8AtxBhJlMnDqsFaDzVaudFmsu93T5JIw3I8=;
 b=D4EFIBzl1aXKBIK7nKfkYG7i4poZEwQk36TIqgWCHrCyluXZk+Vdep0CkxnB31jC717kTb
 0uU6O5EqyOiNVKBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=LCkm+fOB;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yZ+rBqhT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1749137417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OwxD+v6u8AtxBhJlMnDqsFaDzVaudFmsu93T5JIw3I8=;
 b=LCkm+fOB69X/vAOyg/87w+X/dQbGljPIJ3q956zo70syZ5H4ii2c9XEBJ203xptSVUXNNH
 Tj6PzknWA9bD6cRQFL0nXqWDN8b8MiESNVmp5zseBwlOW6TBAtMqdCYnAHjMGPMVQJvvbd
 gkBTYy2XOXK4nCL73H+f3EqqaBXmmdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1749137417;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=OwxD+v6u8AtxBhJlMnDqsFaDzVaudFmsu93T5JIw3I8=;
 b=yZ+rBqhT0pTuaF/PFpir1qDqlrsyJsdSs9yMZE1C7Y1z8BAvONyoVDxBR2bsrWOpuDmVO6
 9y9m0358D/NGOtCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D66941373E;
 Thu,  5 Jun 2025 15:30:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Fj8JMwi4QWj3XwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jun 2025 15:30:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mhklinux@outlook.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 drawat.floss@gmail.com, javierm@redhat.com, kraxel@redhat.com,
 louis.chauvet@bootlin.com, hamohammed.sa@gmail.com, melissa.srw@gmail.com,
 fvogt@suse.com
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC PATCH 0/6] drm: Add vblank timers for devices without interrupts
Date: Thu,  5 Jun 2025 17:24:38 +0200
Message-ID: <20250605152637.98493-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4791033726
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCPT_COUNT_TWELVE(0.00)[16];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 ARC_NA(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[outlook.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch,redhat.com,bootlin.com,suse.com];
 DKIM_TRACE(0.00)[suse.de:+]; TO_DN_SOME(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[kde.org:url,suse.com:url,suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[];
 R_RATELIMIT(0.00)[to_ip_from(RL4xcm599wuy3aaiwfjdd1c6ky)];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,outlook.com]
X-Spam-Score: -1.51
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

Compositors often depend on vblanks to limit their display-update
rate. Without, they see vblank events ASAP, which creates high CPU
overhead. This is especially a problem with virtual devices with fast
framebuffer access.

The series moves vkms' vblank timer to DRM and converts a number of
drivers. The final patch rate-limits the output of DRM's framebuffer
console to vblank intervals. It has been taken from [1]. It reduces
the time for doing

  time find /usr/src/linux

from 24s to 20s with the patched bochs driver. Apparently the system
is spending less CPU overhead on display updates.

This is an RFC patchset to see if the approach is feasible. It's been
motivated by a recent discussion about hypervdrm [2] and other long-
standing bug reports. [3][4]

[1] https://patchwork.freedesktop.org/series/66442/
[2] https://lore.kernel.org/dri-devel/20250523161522.409504-1-mhklinux@outlook.com/T/#ma2ebb52b60bfb0325879349377738fadcd7cb7ef
[3] https://bugzilla.suse.com/show_bug.cgi?id=1189174
[4] https://invent.kde.org/plasma/kwin/-/merge_requests/1229#note_284606

Thomas Zimmermann (6):
  drm/vblank: Add vblank timer
  drm/vkms: Use vblank timer
  drm/simpledrm: Use vblank timer
  drm/bochs: Use vblank timer
  drm/hypervdrm: Use vblank timer
  drm/fb-helper: Synchronize dirty worker with vblank

 drivers/gpu/drm/Makefile                    |   3 +-
 drivers/gpu/drm/drm_fb_helper.c             |  20 ++++
 drivers/gpu/drm/drm_vblank_timer.c          | 100 ++++++++++++++++++++
 drivers/gpu/drm/hyperv/hyperv_drm.h         |   4 +
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  70 ++++++++++++++
 drivers/gpu/drm/sysfb/simpledrm.c           |  81 ++++++++++++++++
 drivers/gpu/drm/tiny/bochs.c                |  68 +++++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c            |  49 +++-------
 drivers/gpu/drm/vkms/vkms_drv.h             |   6 +-
 include/drm/drm_vblank_timer.h              |  26 +++++
 10 files changed, 386 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_vblank_timer.c
 create mode 100644 include/drm/drm_vblank_timer.h

-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47156A78025
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 18:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2886D10E116;
	Tue,  1 Apr 2025 16:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="B81H9uYV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TfuZOS7P";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="B81H9uYV";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="TfuZOS7P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F239910E116
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 16:23:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5D16B210F4;
 Tue,  1 Apr 2025 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=B81H9uYVcqYPCkEQu7xCH5yByvIZkyaudGOSl5irJoYCMCPFI55DLzbnQsEH5IuszS7btj
 ZuP/Jy1zxpfU3Fx5aCPLzDwwyVYz3WvjmzmNWNEj03QcBfyVcsDfXRyAep6I22GvK9HkBL
 PEH5YNfbuLz/yc0rYqiRAml1BPULQro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=TfuZOS7PGqfWD9xr/apFssFo6ncPaGUlsibtZayVuoa8On80v/wQ2S0OcclWlb9mocTClM
 gNNscmdXMUm0lGBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743524585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=B81H9uYVcqYPCkEQu7xCH5yByvIZkyaudGOSl5irJoYCMCPFI55DLzbnQsEH5IuszS7btj
 ZuP/Jy1zxpfU3Fx5aCPLzDwwyVYz3WvjmzmNWNEj03QcBfyVcsDfXRyAep6I22GvK9HkBL
 PEH5YNfbuLz/yc0rYqiRAml1BPULQro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743524585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=TfuZOS7PGqfWD9xr/apFssFo6ncPaGUlsibtZayVuoa8On80v/wQ2S0OcclWlb9mocTClM
 gNNscmdXMUm0lGBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 33F59138A5;
 Tue,  1 Apr 2025 16:23:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id wfNWC+kS7GdxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 16:23:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm/udl: Support adapters without vendor firmware
 descriptor
Date: Tue,  1 Apr 2025 18:12:10 +0200
Message-ID: <20250401161929.283244-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCPT_COUNT_FIVE(0.00)[5];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO
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

Fallback to default values for devices without vendor firmware
descriptor. Enables support for such devices. Since we're at it,
improve the descriptor parser.

Patches 1 to 3 do some cleanups for the driver.

Patches 4 to 8 rewrite the parser code for the vendor firmware
descriptor. It's now more compatible and validates the raw input
more reliably.

Patch 9 adds support for the additional devices.

Tested with various DisplayLink adapters, including one without
vendor firmware descriptor.

Thomas Zimmermann (9):
  drm/udl: Remove unused field dev from struct udl_device
  drm/udl: Remove unused field gem_lock from struct udl_device
  drm/udl: Improve type safety when using struct udl_device
  drm/udl: The number of pixels is always positive
  drm/udl: Handle errors from usb_get_descriptor()
  drm/udl: Return error if vendor descriptor is too short
  drm/udl: Treat vendor descriptor as u8
  drm/udl: Validate length in vendor-descriptor parser
  drm/udl: Support adapters without firmware descriptor

 drivers/gpu/drm/udl/udl_drv.c      |   6 +-
 drivers/gpu/drm/udl/udl_drv.h      |  19 ++--
 drivers/gpu/drm/udl/udl_main.c     | 174 +++++++++++++++++------------
 drivers/gpu/drm/udl/udl_modeset.c  |  21 ++--
 drivers/gpu/drm/udl/udl_transfer.c |   6 +-
 5 files changed, 128 insertions(+), 98 deletions(-)

-- 
2.49.0


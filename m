Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289EDA84158
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 13:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB8110E94A;
	Thu, 10 Apr 2025 11:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="W9ThY2Sf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PP/PgZfN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W9ThY2Sf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PP/PgZfN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5CDD10E94A
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 11:02:59 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 548811F38C;
 Thu, 10 Apr 2025 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=W9ThY2SfvjcFHStG+x1V0hOBB+icH4iYSRNYA2EzQdG+LemVoWMvmrAqc/PH/Nv8AMrpHd
 N+yVb+SRJIw8pIDmqO0zIODHHbJZgzVxOKpp++4r0hs6CpxqzjyyRC3of2q6/oKdY/4Usb
 TgTaP6mrvLlOQJ2xfO7DZ0ixkHajn7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=PP/PgZfNQIoowFV3V7NNipgcatp8FV0aK54t+ho5vgjzQvUmZFRSJCJsLhaIHJh54yOpZ+
 sNMmAqWkfBizNCDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=W9ThY2Sf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="PP/PgZfN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744282978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=W9ThY2SfvjcFHStG+x1V0hOBB+icH4iYSRNYA2EzQdG+LemVoWMvmrAqc/PH/Nv8AMrpHd
 N+yVb+SRJIw8pIDmqO0zIODHHbJZgzVxOKpp++4r0hs6CpxqzjyyRC3of2q6/oKdY/4Usb
 TgTaP6mrvLlOQJ2xfO7DZ0ixkHajn7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744282978;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=c5kQpTFo0guy0Q8KEdRexePBPFz0+YM1La0l84HRWvM=;
 b=PP/PgZfNQIoowFV3V7NNipgcatp8FV0aK54t+ho5vgjzQvUmZFRSJCJsLhaIHJh54yOpZ+
 sNMmAqWkfBizNCDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2316813886;
 Thu, 10 Apr 2025 11:02:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id jZHaBmKl92f3OQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 11:02:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com,
	sean@poorly.run,
	patrik.r.jakobsson@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/9] drm/udl: Support adapters without vendor firmware
 descriptor
Date: Thu, 10 Apr 2025 12:58:57 +0200
Message-ID: <20250410105948.25463-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 548811F38C
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[redhat.com,poorly.run,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TAGGED_RCPT(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_TWO(0.00)[2]; DKIM_TRACE(0.00)[suse.de:+];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_FIVE(0.00)[5]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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


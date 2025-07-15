Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2510AB05747
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 11:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 732D010E1FD;
	Tue, 15 Jul 2025 09:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="v17urEst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mb7v/HFI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="v17urEst";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mb7v/HFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C127D10E1FD
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 09:58:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 582281F397;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sZzAyfYgH5KYJVnIa4l3kAkIlVEUgQhME2o/g6RgBfI=;
 b=v17urEst+2+9iknCwWCHmx3HwBp+iknqwpOgsuNsgfsCXq/goc0vipyjpi+XC/+/jrtZR2
 8ilsJxhGiOZ/YZWHhn2NpAQtKH1s4DIRFM/s/cgjgH9ONm0viPbSzgTSmiy9rHQTpPabBE
 RuNODKoUdRzWRGmSNzpFK4RyB5cnxrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sZzAyfYgH5KYJVnIa4l3kAkIlVEUgQhME2o/g6RgBfI=;
 b=mb7v/HFI6rvvuZ9HRn707KUmwiLiYTNzYaxJUaEocdnxP2DfPKV5vtciFXeh1yQL77/Rzb
 h9pGfWigTD6eLZCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=v17urEst;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="mb7v/HFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752573525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sZzAyfYgH5KYJVnIa4l3kAkIlVEUgQhME2o/g6RgBfI=;
 b=v17urEst+2+9iknCwWCHmx3HwBp+iknqwpOgsuNsgfsCXq/goc0vipyjpi+XC/+/jrtZR2
 8ilsJxhGiOZ/YZWHhn2NpAQtKH1s4DIRFM/s/cgjgH9ONm0viPbSzgTSmiy9rHQTpPabBE
 RuNODKoUdRzWRGmSNzpFK4RyB5cnxrU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752573525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sZzAyfYgH5KYJVnIa4l3kAkIlVEUgQhME2o/g6RgBfI=;
 b=mb7v/HFI6rvvuZ9HRn707KUmwiLiYTNzYaxJUaEocdnxP2DfPKV5vtciFXeh1yQL77/Rzb
 h9pGfWigTD6eLZCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0769A13A68;
 Tue, 15 Jul 2025 09:58:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id FFRyAFUmdmhdcQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 09:58:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/radeon: Do not acquire console lock during
 suspend/resume
Date: Tue, 15 Jul 2025 11:50:52 +0200
Message-ID: <20250715095536.58757-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid, suse.de:dkim,
 imap1.dmz-prg2.suse.org:helo, imap1.dmz-prg2.suse.org:rdns]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 582281F397
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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

Radeon is the only driver acquiring the console lock on suspend and
resume by itself. This creates cyclic locking dependencies with the
client-list mutex.

Drop the console locking from radeon and let fbdev client handle the
console locking as necessary. Adopts the behavior of all other DRM
drivers. Fixes the cyclic locking.

Tested by repeatedly suspeding/resuming on Radeon HD 6570.

Thomas Zimmermann (2):
  drm/radeon: Do not hold console lock while suspending clients
  drm/radeon: Do not hold console lock during resume

 drivers/gpu/drm/radeon/radeon_device.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

-- 
2.50.0


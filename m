Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12521948FB4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 14:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072410E34B;
	Tue,  6 Aug 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZyMT0EvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ilF8BiSB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ZyMT0EvD";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ilF8BiSB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDC810E0C6
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 12:56:07 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A92BC1FB4A;
 Tue,  6 Aug 2024 12:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7g+DDKTQthaWs1ojSg7CbykOYjYoVrPYweHNGD4rEkQ=;
 b=ZyMT0EvDl4A9Imahm7S1MzjZeqnekO6XqjzvgbNeLj6DkVLIcqq7KgFlvSHG3lsRC3O3Rr
 bWJs3dKZChEX8dxUWXw56AJslPmutrDoob8uOGLS2yGsRKHo0noUxlincToSml0QatL3Tb
 MCjrs2xzmD9PnjJ6n68iTcCaizgeeLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948965;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7g+DDKTQthaWs1ojSg7CbykOYjYoVrPYweHNGD4rEkQ=;
 b=ilF8BiSBGRjiu1ajIPPeCvPw59sVYgL1m8ri1dnBK+myIYlKNiqhexHEZFgyECvYTIXUjd
 RO+QfH799ur4mLBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1722948965; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7g+DDKTQthaWs1ojSg7CbykOYjYoVrPYweHNGD4rEkQ=;
 b=ZyMT0EvDl4A9Imahm7S1MzjZeqnekO6XqjzvgbNeLj6DkVLIcqq7KgFlvSHG3lsRC3O3Rr
 bWJs3dKZChEX8dxUWXw56AJslPmutrDoob8uOGLS2yGsRKHo0noUxlincToSml0QatL3Tb
 MCjrs2xzmD9PnjJ6n68iTcCaizgeeLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1722948965;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=7g+DDKTQthaWs1ojSg7CbykOYjYoVrPYweHNGD4rEkQ=;
 b=ilF8BiSBGRjiu1ajIPPeCvPw59sVYgL1m8ri1dnBK+myIYlKNiqhexHEZFgyECvYTIXUjd
 RO+QfH799ur4mLBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E66913770;
 Tue,  6 Aug 2024 12:56:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HFajGWUdsmb9PQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Aug 2024 12:56:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm/ast: Transparently handle BMC in outputs
Date: Tue,  6 Aug 2024 14:51:55 +0200
Message-ID: <20240806125601.78650-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.79 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.19)[-0.944];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -2.79
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

Add transparent BMC support to all outputs. If the user disconnects
the physical display, each output will now return display modes for
the BMC. Makes the BMC connector obsolete, so remove it.

The benefit of the new approach is that is works with any userspace.
Most userspace compositors have problems configuring the current BMC
connector. The BMC connector is now gone and only a physical connector
is present.

Also clean up some of the EDID handling in preparation. Switching to
struct drm_edid and its helpers simplifies the code for inclusion of
the BMC support.

A similar approach has been taken for mgag200. [1] Here a server's
display hardware also contains an internal BMC that needs to display
even without the presence of a physical display.

[1] https://patchwork.freedesktop.org/series/136885/

Thomas Zimmermann (9):
  drm/ast: Move code for physical outputs into separate files
  drm/ast: astdp: Move locking into EDID helper
  drm/ast: astdp: Use struct drm_edid and helpers
  drm/ast: astdp: Transparently handle BMC support
  drm/ast: dp501: Use struct drm_edid and helpers
  drm/ast: dp501: Transparently handle BMC support
  drm/ast: sil164: Transparently handle BMC support
  drm/ast: vga: Transparently handle BMC support
  drm/ast: Remove BMC output

 drivers/gpu/drm/ast/Makefile     |   4 +-
 drivers/gpu/drm/ast/ast_dp.c     | 242 ++++++++++++-
 drivers/gpu/drm/ast/ast_dp501.c  | 212 ++++++++++--
 drivers/gpu/drm/ast/ast_drv.h    |  21 +-
 drivers/gpu/drm/ast/ast_mode.c   | 578 -------------------------------
 drivers/gpu/drm/ast/ast_sil164.c | 124 +++++++
 drivers/gpu/drm/ast/ast_vga.c    | 124 +++++++
 7 files changed, 678 insertions(+), 627 deletions(-)
 create mode 100644 drivers/gpu/drm/ast/ast_sil164.c
 create mode 100644 drivers/gpu/drm/ast/ast_vga.c

-- 
2.46.0


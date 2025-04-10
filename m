Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F0A83D44
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 10:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D3910E7BD;
	Thu, 10 Apr 2025 08:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="P4tcaZWe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n5K5CE9x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="P4tcaZWe";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n5K5CE9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0928910E310
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 08:41:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8229821164;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lJ4qSym4Y7TGh4M60LfafkYxRK/X1byazSzj0Fes9co=;
 b=P4tcaZWetZVRSTYBFDlLK6t89AxlOv5pnmqO4ONVcQEZmNDEN945DuV4FiZ3JJfnvax2S5
 7THj+0l9tBsO5GoZdTAVZRRWHQ0SrAA+LRNGGTeh5z/wKqQe3GWRZ7KKdIAhbTrL6EYSuO
 2C8CcsTQ1uEIMmOC+rSTfy+16l9pIB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lJ4qSym4Y7TGh4M60LfafkYxRK/X1byazSzj0Fes9co=;
 b=n5K5CE9x4dirxoRbACgF/kyyyyin2CXfUuJmb2nYFSbCjPQoHKKpj9gRqZu83mnjU9swhO
 k/K4TGTSIvwgpgBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P4tcaZWe;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=n5K5CE9x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1744274498; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lJ4qSym4Y7TGh4M60LfafkYxRK/X1byazSzj0Fes9co=;
 b=P4tcaZWetZVRSTYBFDlLK6t89AxlOv5pnmqO4ONVcQEZmNDEN945DuV4FiZ3JJfnvax2S5
 7THj+0l9tBsO5GoZdTAVZRRWHQ0SrAA+LRNGGTeh5z/wKqQe3GWRZ7KKdIAhbTrL6EYSuO
 2C8CcsTQ1uEIMmOC+rSTfy+16l9pIB0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1744274498;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lJ4qSym4Y7TGh4M60LfafkYxRK/X1byazSzj0Fes9co=;
 b=n5K5CE9x4dirxoRbACgF/kyyyyin2CXfUuJmb2nYFSbCjPQoHKKpj9gRqZu83mnjU9swhO
 k/K4TGTSIvwgpgBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6226713886;
 Thu, 10 Apr 2025 08:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 3F6fFkKE92enDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Apr 2025 08:41:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/3] drm/sysfb: Share framebuffer validation helpers
Date: Thu, 10 Apr 2025 10:37:22 +0200
Message-ID: <20250410083834.10810-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8229821164
X-Spam-Level: 
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 RCPT_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
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

Drivers for system framebuffers validate the provided values against
limits. Share most of the drivers' validation code in the sysfb helper
library and update drivers.

v2:
- fix typos and style

Thomas Zimmermann (3):
  drm/sysfb: Split source file
  drm/sysfb: Share helpers for integer validation
  drm/sysfb: Share helpers for screen_info validation

 drivers/gpu/drm/sysfb/Makefile                |   4 +
 drivers/gpu/drm/sysfb/drm_sysfb.c             |  35 +++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |  48 +++++++
 ...drm_sysfb_helper.c => drm_sysfb_modeset.c} |   4 -
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c | 107 +++++++++++++++
 drivers/gpu/drm/sysfb/efidrm.c                | 126 ++----------------
 drivers/gpu/drm/sysfb/ofdrm.c                 |  12 +-
 drivers/gpu/drm/sysfb/simpledrm.c             |  14 +-
 drivers/gpu/drm/sysfb/vesadrm.c               | 126 ++----------------
 9 files changed, 216 insertions(+), 260 deletions(-)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb.c
 rename drivers/gpu/drm/sysfb/{drm_sysfb_helper.c => drm_sysfb_modeset.c} (98%)
 create mode 100644 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c

-- 
2.49.0


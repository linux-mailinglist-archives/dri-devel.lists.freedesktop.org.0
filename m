Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B409ABD3C9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE87110E3C0;
	Tue, 20 May 2025 09:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Rk8uvcEZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rEX+LJsQ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Rk8uvcEZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rEX+LJsQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DB589A16
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:45:14 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 24D612049E;
 Tue, 20 May 2025 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W4D/+YlUFA4cgaJudX8/ZUWFVRxCOXxcT0pETomqqNw=;
 b=Rk8uvcEZy520HgdKkuy+5HoOhiloyyo7p7wuGzgfpkPm0xQMVl+5+ke+a1aAUgffnG0BrL
 rmXr23TLrwCM2DamzvwIZJ/Kcn3wIUrAC5Liyqe8szEvA24FrCNJgzTDXUI+QVl95lxBh2
 dovhTSe2pBZlguz4NwZ/w359ke6TtGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W4D/+YlUFA4cgaJudX8/ZUWFVRxCOXxcT0pETomqqNw=;
 b=rEX+LJsQ1J1JqjFJWjMeVCJfX9Nrc5g89FtcbhXSGk1nuvxz/kGjQ+WiS48TId+JCKdClL
 780zOCekncjmcBAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1747734311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W4D/+YlUFA4cgaJudX8/ZUWFVRxCOXxcT0pETomqqNw=;
 b=Rk8uvcEZy520HgdKkuy+5HoOhiloyyo7p7wuGzgfpkPm0xQMVl+5+ke+a1aAUgffnG0BrL
 rmXr23TLrwCM2DamzvwIZJ/Kcn3wIUrAC5Liyqe8szEvA24FrCNJgzTDXUI+QVl95lxBh2
 dovhTSe2pBZlguz4NwZ/w359ke6TtGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1747734311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W4D/+YlUFA4cgaJudX8/ZUWFVRxCOXxcT0pETomqqNw=;
 b=rEX+LJsQ1J1JqjFJWjMeVCJfX9Nrc5g89FtcbhXSGk1nuvxz/kGjQ+WiS48TId+JCKdClL
 780zOCekncjmcBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DC3D713A3E;
 Tue, 20 May 2025 09:45:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oT5pNCZPLGhVXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 20 May 2025 09:45:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/5] drm: Provide helpers for programming gamma ramps and
 palettes
Date: Tue, 20 May 2025 11:40:02 +0200
Message-ID: <20250520094203.30545-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

We have a number of drivers that offer simple gamma correction and
palette modes. Depending on their hardware, the drivers process the
provided data in similar ways. Unify the functionality in several
DRM color-management helpers and update the drivers. The new helpers
can load provided data or generate default data to load.

With the drivers; ast, mgag200, ofdrm and vesadrm; gamma ramps are
always 8 bit wide. For 24-bit color depth, 8-bit gamma ramps are being
loaded to hardware as provided. For lower color depths the hardware
often requires the gamma ramp to be reduced to the number of bits
per pixel component, which the new helpers can do automatically. The
exception is ast's hardware, which always uses 8-bit gamma ramps.

The default gamma ramp uses a factor of 1.0 (as has been the case in
existing the per-driver implementations).

Helpers for palettes either load an 8-bit palette or generate a default
palette with increasing luminance. The goal for the default is to keep
the display content visible with black at index 0. A later update could
possibly load a system-specific default palette.

v2:
- fix coding style
- fix typos
- remove note on non-linear default gamma ramps

Thomas Zimmermann (5):
  drm: Add helpers for programming hardware gamma LUTs
  drm/ast: Use helpers for programming gamma ramps and palettes
  drm/mgag200: Use helpers for programming gamma ramps
  drm/ofdrm: Use helpers for programming gamma ramps
  drm/vesadrm: Use helpers for programming gamma ramps

 drivers/gpu/drm/ast/ast_mode.c           |  69 +++++---
 drivers/gpu/drm/drm_color_mgmt.c         | 206 +++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h    |   8 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  82 ++++-----
 drivers/gpu/drm/sysfb/ofdrm.c            |  80 ++++-----
 drivers/gpu/drm/sysfb/vesadrm.c          | 100 ++++-------
 include/drm/drm_color_mgmt.h             |  27 +++
 10 files changed, 385 insertions(+), 199 deletions(-)


base-commit: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: a5a973e527c88a5b47053d7a72aefe0b550197cb
prerequisite-patch-id: 719d09751d38f5da743beed6266585ee063e1e29
-- 
2.49.0


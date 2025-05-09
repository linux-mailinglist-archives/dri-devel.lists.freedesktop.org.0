Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F83AB0D69
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 10:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DAC10E9EA;
	Fri,  9 May 2025 08:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="o26tqfC9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IEVsJ3Xw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="X5QcEwMw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="4xCMr706";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D50510E2D0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 08:42:21 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5CD91F457;
 Fri,  9 May 2025 08:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFSlM9W1i0/DJlo9ZEkSOSk88bgRBN9IwCmt0T7bgfI=;
 b=o26tqfC9iSlNlipQ9JPR0ynR84K9yGsSdMCmgfu9qyMOCRCx/rd+U3rzjzrv7127PtBIGm
 Hfsva3cm8XwQiDWQcXJoyHL7vU6K7dFbQUoy5QtXWzFebkbiTe2v29+HDuCVSSWz+acPHw
 eoYdN86KwI3B/Io6aysodJC9c51sjNc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFSlM9W1i0/DJlo9ZEkSOSk88bgRBN9IwCmt0T7bgfI=;
 b=IEVsJ3XwyhwpDr5Jd5pfimGrfyV66opidJ7v2dtw5m9R/LdaSJDOsCAdo5JUpeln2j9817
 FEvK2+H2MhdvXbDA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=X5QcEwMw;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=4xCMr706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1746780138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFSlM9W1i0/DJlo9ZEkSOSk88bgRBN9IwCmt0T7bgfI=;
 b=X5QcEwMwzCWev4jt3ccmoPdnxblGB4qvKbVNtAG1dl2bZpjjOFzyw2xdKhvm+UIeKG1v8t
 pM585cr0Wrq/Zk70uQbckoRjPBVB8esU7LvD/kH1xlrXePbMicLTbgRPDxAPHkd4hbgUvP
 22JUbsMRx0ZY6MhXaCre6yzkyTTsDP8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1746780138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eFSlM9W1i0/DJlo9ZEkSOSk88bgRBN9IwCmt0T7bgfI=;
 b=4xCMr7064XAksU9oihMgx93dwIYh6JOZZdvQRgL4822dDV/eCUuoU5KMrwt290CDvB1TC6
 Q6AuxBfFEHqhHfCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1B1013931;
 Fri,  9 May 2025 08:42:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id tbwdJuq/HWgpXwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 09 May 2025 08:42:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, airlied@redhat.com,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] drm: Provide helpers for programming gamma ramps and
 palettes
Date: Fri,  9 May 2025 10:23:14 +0200
Message-ID: <20250509083911.39018-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: E5CD91F457
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
 RCVD_VIA_SMTP_AUTH(0.00)[]; ARC_NA(0.00)[];
 RCVD_TLS_ALL(0.00)[]; MIME_TRACE(0.00)[0:+];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 RCPT_COUNT_SEVEN(0.00)[9];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.01
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

With the drivers; ast, mgag200 ofdrm and vesadrm; gamma ramps are
always 8 bit wide. For 24-bit color depth, 8-bit gamma ramps are being
loaded to hardware as provided. For lower color depths the hardware
often requires the gamma ramp to be reduced to the number of bits
per pixel component, which the new helpers can do automatically. The
exception is ast's hardware, which always uses 8-bit gamma ramps.

The default gamma ramp uses a factor of 1.0 (as has been the case in
existing the per-driver implementations). A later update could change
this to the common value of 2.2 or a system-specific value.

Helpers for palettes either load an 8-bit palette or generate a default
palette with increasing luminance. The goal for the default is to keep
the display content visible with black at index 0. A later update could
possibly load a system-specific default palette.

Thomas Zimmermann (5):
  drm: Add helpers for programming hardware gamma LUTs
  drm/ast: Use helpers for programming gamma ramps and palettes
  drm/mgag200: Use helpers for programming gamma ramps
  drm/ofdrm: Use helpers for programming gamma ramps
  drm/vesadrm: Use helpers for programming gamma ramps

 drivers/gpu/drm/ast/ast_mode.c           |  69 +++++---
 drivers/gpu/drm/drm_color_mgmt.c         | 206 +++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h    |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200er.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_g200se.c |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  78 ++++-----
 drivers/gpu/drm/sysfb/ofdrm.c            |  78 ++++-----
 drivers/gpu/drm/sysfb/vesadrm.c          | 100 ++++-------
 include/drm/drm_color_mgmt.h             |  27 +++
 10 files changed, 380 insertions(+), 194 deletions(-)


base-commit: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
-- 
2.49.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 456B8ADD018
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB62510E18F;
	Tue, 17 Jun 2025 14:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="vnWgw1Xd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eccJbCEO";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vnWgw1Xd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eccJbCEO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4BA10E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:39:49 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 06B6A1F79D;
 Tue, 17 Jun 2025 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ka7RlKf5nFpCoOTr4jMy20ZWHD7jL1GDZdcZYmRWqJ4=;
 b=vnWgw1Xd96h4iqRL//3djhVJrP/FOEpVIgQ6M/UyUtCAwQDiXYw7D90Kj1H00FDzod0Mbl
 8+0OB6Ek6W9/T64yk7E0B4/PiGQe1LDoHyqdAVvRuY79KCRrnQhMaC3al3tM2Q5oBqKDSX
 B9IsfE6s5Qra2dvRzcum58T3NYFBLgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ka7RlKf5nFpCoOTr4jMy20ZWHD7jL1GDZdcZYmRWqJ4=;
 b=eccJbCEOubVY3YOCz1PF9Zm+eBJtNeujC0UIfYq3VjjNgk969+OXFQLQgfom7MDozuPQc/
 svKekAkzZrHUBUCw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1750171188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ka7RlKf5nFpCoOTr4jMy20ZWHD7jL1GDZdcZYmRWqJ4=;
 b=vnWgw1Xd96h4iqRL//3djhVJrP/FOEpVIgQ6M/UyUtCAwQDiXYw7D90Kj1H00FDzod0Mbl
 8+0OB6Ek6W9/T64yk7E0B4/PiGQe1LDoHyqdAVvRuY79KCRrnQhMaC3al3tM2Q5oBqKDSX
 B9IsfE6s5Qra2dvRzcum58T3NYFBLgU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1750171188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ka7RlKf5nFpCoOTr4jMy20ZWHD7jL1GDZdcZYmRWqJ4=;
 b=eccJbCEOubVY3YOCz1PF9Zm+eBJtNeujC0UIfYq3VjjNgk969+OXFQLQgfom7MDozuPQc/
 svKekAkzZrHUBUCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7BD413A69;
 Tue, 17 Jun 2025 14:39:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Ly9JMzN+UWh8bQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Jun 2025 14:39:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm/vesadrm: Support 8-bit palettes
Date: Tue, 17 Jun 2025 16:23:12 +0200
Message-ID: <20250617143649.143967-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -2.80
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

VESA provides a wide range ot 8-bit palette modes. Add support to
vesadrm. For compatibility with common userspace the driver also
provides XRGB8888 on top of the palettized output.

Patches 1 to 3 prepare screen_info and struct pixel_format for
indexed formats. This cleans up the code for other drivers as well.
The pixel-format compare functions will be helpful in various places.

Patches 4 to 6 prepare for using RGB332 as intermediate format
between XRGB8888 and C8. This requires support for format conversion
and RGB332 hardware palettes.

Patches 7 to 9 update vesadrm. Patches 7 and 8 prepare the driver
without adding new functionality. Patch 9 adds support for the color
formats C8 and XRGB888. It adjusts output color formats in the plane's
atomic_check helper as needed. Palette setup happens in atomic_flush
as usual.

Tested on VGA hardware. Besides supporting odd use cases, this feature
can also help with testing support for low-end displays. Such displays
often have similar limitations.

Thomas Zimmermann (9):
  video: pixel_format: Add compare helpers
  video: screen_info: Add pixel-format helper for linear framebuffers
  drm/sysfb: Find screen_info format with helpers
  drm/sysfb: Blit to CRTC destination format
  drm/color-mgmt: Prepare for RGB332 palettes
  drm/format-helper: Add XRGB8888-to-RGB332 to drm_fb_blit()
  drm/vesadrm: Rename vesadrm_set_gamma_lut() to vesadrm_set_color_lut()
  drm/vesadrm: Prepare color management for palette-based framebuffers
  drm/vesadrm: Support DRM_FORMAT_C8

 drivers/gpu/drm/drm_color_mgmt.c              |  32 ++++
 drivers/gpu/drm/drm_format_helper.c           |   3 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     |  29 ++--
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  21 ++-
 drivers/gpu/drm/sysfb/vesadrm.c               | 153 ++++++++++++++++--
 drivers/video/screen_info_generic.c           |  55 +++++++
 include/drm/drm_color_mgmt.h                  |   1 +
 include/linux/screen_info.h                   |   2 +
 include/video/pixel_format.h                  |  61 +++++++
 10 files changed, 319 insertions(+), 40 deletions(-)

-- 
2.49.0


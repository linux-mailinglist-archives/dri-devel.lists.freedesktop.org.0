Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD3B0434E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747DE10E4B0;
	Mon, 14 Jul 2025 15:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="smVJt/bB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRGUA5C2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="smVJt/bB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aRGUA5C2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F0D10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52F3A1F798;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wVe6s8QYB1uCPFC+nMhTheFo3unxquSk3FT9BP/Ce8=;
 b=smVJt/bB5vD7oxc272nI+Px381rVQrJYT1mzNqvJCmgGlR0RlNjJKKyOAXMTXE+S4Z90d7
 RpxwPOlpFPl3aiZAErK+Z+eiiLY8bZzw2LHa+2rKYowjynqaLRVktjtEkhLN/Ec9TIdgFP
 pNizsQk+i3WvEjsGjtSEtUHDbNaKu7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wVe6s8QYB1uCPFC+nMhTheFo3unxquSk3FT9BP/Ce8=;
 b=aRGUA5C2k7oOAZgt16BdHSHU0c4rhH1kb3LRJTurEX2g9ufMc0z+ENrFSlVqHYgTLJ4JCX
 MOsFmGNoyRiOKdDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1752506303; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wVe6s8QYB1uCPFC+nMhTheFo3unxquSk3FT9BP/Ce8=;
 b=smVJt/bB5vD7oxc272nI+Px381rVQrJYT1mzNqvJCmgGlR0RlNjJKKyOAXMTXE+S4Z90d7
 RpxwPOlpFPl3aiZAErK+Z+eiiLY8bZzw2LHa+2rKYowjynqaLRVktjtEkhLN/Ec9TIdgFP
 pNizsQk+i3WvEjsGjtSEtUHDbNaKu7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1752506303;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=/wVe6s8QYB1uCPFC+nMhTheFo3unxquSk3FT9BP/Ce8=;
 b=aRGUA5C2k7oOAZgt16BdHSHU0c4rhH1kb3LRJTurEX2g9ufMc0z+ENrFSlVqHYgTLJ4JCX
 MOsFmGNoyRiOKdDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 30316138A1;
 Mon, 14 Jul 2025 15:18:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 2JRfCr8fdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/9] drm/vesadrm: Support 8-bit palettes
Date: Mon, 14 Jul 2025 17:13:00 +0200
Message-ID: <20250714151513.309475-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 MIME_GOOD(-0.10)[text/plain]; RCVD_VIA_SMTP_AUTH(0.00)[];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; ARC_NA(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 
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

VESA provides a wide range of 8-bit palette modes. Add support to
vesadrm. For compatibility with common userspace the driver also
provides XRGB8888 on top of the palettized output.

Patches 1 to 3 prepare screen_info and struct pixel_format for
indexed formats. This cleans up the code for other sysfb drivers as
well. The pixel-format compare functions will be helpful in various
places.

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

v2:
- improve commenting (Javier)

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

 drivers/gpu/drm/drm_color_mgmt.c              |  34 ++++
 drivers/gpu/drm/drm_format_helper.c           |   3 +
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h      |   2 +-
 drivers/gpu/drm/sysfb/drm_sysfb_modeset.c     |  29 ++--
 drivers/gpu/drm/sysfb/drm_sysfb_screen_info.c |  21 ++-
 drivers/gpu/drm/sysfb/vesadrm.c               | 153 ++++++++++++++++--
 drivers/video/screen_info_generic.c           |  55 +++++++
 include/drm/drm_color_mgmt.h                  |   1 +
 include/linux/screen_info.h                   |   2 +
 include/video/pixel_format.h                  |  61 +++++++
 10 files changed, 321 insertions(+), 40 deletions(-)

-- 
2.50.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027D58420B1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3627112ECE;
	Tue, 30 Jan 2024 10:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7C2112EC4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 10:07:20 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98EC31F83F;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8iLDc6AKRFDUoMMqL+ix4s6GrgTr+33LVuIuof2o2A=;
 b=yOPYuVU6ghNGeAK0IPng39K+Xz6tvQXsaKXE18G7lASKwceK3iipV5k4Zl3+cIz0thS2Xv
 0qdKBB5Kqu8xWYSOfyGYm87j2OWYRCuHktinkYNW33FiqO+PMYUC5rZPAEpuwCnr/nM9Ic
 Dmzdo5Lo9K0o3/Jwm6ci01QqWvyVq4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8iLDc6AKRFDUoMMqL+ix4s6GrgTr+33LVuIuof2o2A=;
 b=xW2C4rwN5+36MUigV+k3dMmPUMLc0l2OSRFmUt7RDNVPsqyERTn44bOj24Kf17X3++BxH/
 vCy86Hxldk7U/RAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706609236; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8iLDc6AKRFDUoMMqL+ix4s6GrgTr+33LVuIuof2o2A=;
 b=j0mo4sfnMNN51gErk7Q7WUZ9dhv6GXwmi0gbSE+hgSZDshTpgbUgws8Gl0rxk1LKgNzPq+
 kGuSwRImaOhBS6IUl6164pKsvwE7IJlj3C4OQ/XtCsS7+A15r9hF9QFockAqZIj1DKfRzQ
 To725nAxPdG6b+vVOodPeM8JVpzdhwg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706609236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=W8iLDc6AKRFDUoMMqL+ix4s6GrgTr+33LVuIuof2o2A=;
 b=xr1BEN0Kk2oPGEsQylppth3y7xX7lsupkYiburtxt0yAqz209ji7Spr7VPDkKdgQER1iye
 yh1stRqByEtze0Cw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7773A13462;
 Tue, 30 Jan 2024 10:07:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id sJL8G1TKuGXdcwAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 10:07:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com
Subject: [PATCH 00/23] [RFC] drm/format-helper: Introduce drm_pixmap,
 font support and filling
Date: Tue, 30 Jan 2024 10:53:35 +0100
Message-ID: <20240130100714.12608-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=j0mo4sfn;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=xr1BEN0K
X-Spamd-Result: default: False [-0.31 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
 R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MX_GOOD(-0.01)[];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,patchwork.freedesktop.org:url];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -0.31
X-Rspamd-Queue-Id: 98EC31F83F
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Bar: /
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This RFC patchset implements various features required for DRM panic
handling [1] and should (for now) be seen in that context.

Most of all, the patchset replaces struct drm_framebuffer with struct
drm_pixmap in the format-conversion helpers. DRM pixmap represents a
source of pixel data for the blitting operations. Patches 1 to 19
update the interface, implementation and all of the callers. These
patches could be useful even without DRM panic handling.

With struct drm_pixmap in place, patches 20 to 22 implement rudimentary
support for blitting font data. The pixmap refers to a character's glyph,
which the blit routines write to the destination memory. An example on
blitting strings is given in patch 20's commit description.

Patch 23 adds rudimentary support for fill operations. The design is
based on blitting, but blits the same color into each pixel.

[1] https://patchwork.freedesktop.org/series/122244/

Thomas Zimmermann (23):
  drm/format-helper: Add struct drm_pixmap
  drm/format-helper: Use struct drm_pixmap for drm_fb_memcpy()
  drm/format-helper: Streamline drm_fb_xfrm() implementations
  drm/format-helper: Use struct drm_pixmap internally
  drm/format-helper: Use struct drm_pixmap for drm_fb_swab()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_rgb332()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_rgb565()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_xrgb1555()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_argb1555()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_rgba5551()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_rgb888()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_argb8888()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_abgr8888()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_xbgr8888()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_xrgb2101010()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_argb2101010()
  drm/format-helper: Use struct drm_pixmap for
    drm_fb_xrgb8888_to_gray8()
  drm/format-helper: Use struct drm_pixmap for drm_fb_xrgb8888_to_mono()
  drm/format-helper: Use struct drm_pixmap for drm_fb_blit()
  [DO NOT MERGE] drm/format-helper: Add font-support for DRM pixmap
  [DO NOT MERGE] drm/format-helper: Add color palette
  [DO NOT MERGE] drm/format-helper: Support blitting from C1 to XRGB8888
  [DO NOT MERGE] drm/format-helper: Add drm_fb_fill() to fill screen
    with color

 drivers/gpu/drm/ast/ast_mode.c                |   4 +-
 drivers/gpu/drm/drm_format_helper.c           | 678 ++++++++++++------
 drivers/gpu/drm/drm_mipi_dbi.c                |   9 +-
 drivers/gpu/drm/gud/gud_pipe.c                |  24 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |   4 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c        |   4 +-
 drivers/gpu/drm/solomon/ssd130x.c             |  12 +-
 .../gpu/drm/tests/drm_format_helper_test.c    | 106 ++-
 drivers/gpu/drm/tiny/cirrus.c                 |   6 +-
 drivers/gpu/drm/tiny/ofdrm.c                  |   6 +-
 drivers/gpu/drm/tiny/repaper.c                |   4 +-
 drivers/gpu/drm/tiny/simpledrm.c              |   6 +-
 drivers/gpu/drm/tiny/st7586.c                 |   4 +-
 include/drm/drm_format_helper.h               | 116 ++-
 14 files changed, 678 insertions(+), 305 deletions(-)

-- 
2.43.0


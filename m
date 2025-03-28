Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9FA74C55
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 15:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F8C10EA31;
	Fri, 28 Mar 2025 14:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lkClkZoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1P7ct5Ip";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lkClkZoJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1P7ct5Ip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C926010EA31
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:20:57 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 75B3B1F388;
 Fri, 28 Mar 2025 14:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GyU104PGfNpRWG6oLaVc+rbvefCeem8j9/Cpr8gt03k=;
 b=lkClkZoJ0ASVbpxB2BgdTrHsre8ju6ld9uFpV/6dpqLTXucCnL+6Fm2zPABoyDqTqQHKcu
 oTXlY5GfNzGI8XKglGJwtv3ySlPO4da2E4Zvic0ztvUMR3lBsrdCjD8KVyJwUMxwPyyml4
 AxOK43ciF1ciVOR9jWwZEfgyETFRFks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GyU104PGfNpRWG6oLaVc+rbvefCeem8j9/Cpr8gt03k=;
 b=1P7ct5IpEb6EkW+yZ4ZDewHCCNPNWCkxGTMUu5XyNxxpjkBH+QqspbwHDCFWmkEOYbsq7I
 CHcmGySlWhe/GoCA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=lkClkZoJ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1P7ct5Ip
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743171656; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GyU104PGfNpRWG6oLaVc+rbvefCeem8j9/Cpr8gt03k=;
 b=lkClkZoJ0ASVbpxB2BgdTrHsre8ju6ld9uFpV/6dpqLTXucCnL+6Fm2zPABoyDqTqQHKcu
 oTXlY5GfNzGI8XKglGJwtv3ySlPO4da2E4Zvic0ztvUMR3lBsrdCjD8KVyJwUMxwPyyml4
 AxOK43ciF1ciVOR9jWwZEfgyETFRFks=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743171656;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GyU104PGfNpRWG6oLaVc+rbvefCeem8j9/Cpr8gt03k=;
 b=1P7ct5IpEb6EkW+yZ4ZDewHCCNPNWCkxGTMUu5XyNxxpjkBH+QqspbwHDCFWmkEOYbsq7I
 CHcmGySlWhe/GoCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34F3113998;
 Fri, 28 Mar 2025 14:20:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lRuGC0iw5mdOdQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Mar 2025 14:20:56 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, jani.nikula@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/8] drm/format-helper: Add helpers for line conversion
Date: Fri, 28 Mar 2025 15:14:56 +0100
Message-ID: <20250328141709.217283-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 75B3B1F388
X-Spam-Score: -3.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.998]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; FUZZY_BLOCKED(0.00)[rspamd.com];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,ffwll.ch,gmail.com,kernel.org];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
 RCVD_COUNT_TWO(0.00)[2]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 DKIM_TRACE(0.00)[suse.de:+]
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

Add helpers for converting the pixel format of scanline. This used
to be implemented for each format individually, but only the per-pixel
code is really different among formats.

Patch 1 moves the per-pixel format helpers from drm_draw.c to an
internal header. These functions have equivalents in the format-helper
code. Just update the interface to make them exportable and add some
comments.

Patches 2 to 5 add generic line-conversion helpers. Each takes a 
scanline with pixels with a specific number of bits per pixel and
converts it to a scanline with a specific number of bits per pixel.
Conversion of each individual pixel is done by the provided per-pixel
helper that was extracted from drm_draw.c.

Patches 6 to 8 slightly optimize the line-conversion helpers by
storing multiple pixels at once. With the current code, there are
too many functions to make opimization feasible. But with the new
helpers, there are only a few places to optimize to benefit all use
cases.

Here's a little benchmark for the common use case of watching a
full-screen video under X. The tests measures the average time
to display a single frame. It uses an XRGB8888 framebuffer for each
frame, but displays it to an RGB565 scanout buffer, thus doing format
conversion with the _32to16 helper. The test system is an Intel Core
i5-3470 with an Intel HD2500 graphics card. The graphics driver is
simpledrm at 1024x768 pixels.

- 32-bit memcpy:	 510 µs/frame
- Current code:		1640 µs/frame
- New (unoptimized):	1600 µs/frame
- New (no 64-bit):	1580 µs/frame
- New (optimized):	1470 µs/frame

The first line shows the time to memcpy a single frame to video
memory without format conversion. With conversion, the old and new
code takes roughly 3 times as long. Both variants are comparable
in performance. With 64-bit stores added, the new code is even 10%
faster than the current one. (This is not to be considered a full
performance test. The main objective is to see whether the new code
is on par with the old code, which is the case.)

v2:
- simplify address calculation (Jani)
- fix typos (Jocelyn)

Thomas Zimmermann (8):
  drm/format-helper: Move helpers for pixel conversion to header file
  drm/format-helper: Add generic conversion to 32-bit formats
  drm/format-helper: Add generic conversion to 24-bit formats
  drm/format-helper: Add generic conversion to 16-bit formats
  drm/format-helper: Add generic conversion to 8-bit formats
  drm/format-helper: Optimize 32-to-24-bpp conversion
  drm/format-helper: Optimize 32-to-16-bpp conversion
  drm/format-helper: Optimize 32-to-8-bpp conversion

 drivers/gpu/drm/drm_draw.c            | 100 +------
 drivers/gpu/drm/drm_format_helper.c   | 374 +++++++++++---------------
 drivers/gpu/drm/drm_format_internal.h | 160 +++++++++++
 3 files changed, 335 insertions(+), 299 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_format_internal.h

-- 
2.48.1


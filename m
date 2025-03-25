Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D52CA6EE72
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 12:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8188F10E1BF;
	Tue, 25 Mar 2025 11:04:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ADV0hNg3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jjEwHh0w";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="AeZ2dSPX";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="VY+zTIEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E31610E532
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 11:04:16 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E04992116B;
 Tue, 25 Mar 2025 11:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y8PYONPD34PmbNgnlbiF0gjfOonhL9S1Ra0Gba2Vdvg=;
 b=ADV0hNg31sClRbU4TjVn+Akri+3JrTcTMmyRKFFmaSfzb6Td605zvnzp+fGbxzQxwsk7Uj
 B3AKFmzJUqI1JjYxAXyu4vFOkp5BLU5KrfdwksXG2TLRSkMtqfzxOF08L5p/0MSWSDqW46
 XP8c69DqOHNq8KbCksFfuzLZ7evE1j4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y8PYONPD34PmbNgnlbiF0gjfOonhL9S1Ra0Gba2Vdvg=;
 b=jjEwHh0wyZ8f5Gy1bIaYAkfiFSGRDcpQLp/KyC94Sxvx6Oz6mwfP/A4XImlcrzdt2vdrk4
 slCDPyuEUqN+JZAg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=AeZ2dSPX;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VY+zTIEm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1742900654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y8PYONPD34PmbNgnlbiF0gjfOonhL9S1Ra0Gba2Vdvg=;
 b=AeZ2dSPXxgB1az8Jou7IL3TwPRf2EwepBLl8eLOlS452Hz+9W/V3NU+Sf13TG9q7dF1CAI
 XFsZLH+YJWp0AhvsgPm32leR69UTXJ9gGi5FWNvt+RuIh9muSBEPSqWaYTcddattnKR2cW
 Lti0EoesDGfVLQWrgRR+Qne2teqyHPA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1742900654;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y8PYONPD34PmbNgnlbiF0gjfOonhL9S1Ra0Gba2Vdvg=;
 b=VY+zTIEmEMaWhVk9xI7PC7hyFslE7YCE6bh2DS5Vp/YNLCoV/S4VBNymECeJVzOE3GE6vY
 +tDL3MTHxgVoW4DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A7AAE13957;
 Tue, 25 Mar 2025 11:04:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id DGxjJ66N4meFVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Mar 2025 11:04:14 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/8] drm/format-helper: Add helpers for line conversion
Date: Tue, 25 Mar 2025 11:31:05 +0100
Message-ID: <20250325110407.81107-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E04992116B
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 ARC_NA(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]; RCVD_TLS_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCPT_COUNT_SEVEN(0.00)[7]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 DKIM_TRACE(0.00)[suse.de:+];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
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
faster then the current one. (This is not to be considered a full
performance test. The main objective is to see whether the new code
is on par with the old code, which is the case.)

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
 drivers/gpu/drm/drm_format_helper.c   | 378 ++++++++++++--------------
 drivers/gpu/drm/drm_format_internal.h | 160 +++++++++++
 3 files changed, 339 insertions(+), 299 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_format_internal.h

-- 
2.48.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E8865B0F3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 12:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F4210E311;
	Mon,  2 Jan 2023 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B335D10E311
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 11:29:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7380220B85;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672658970; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=78jTsh0C+PKmg3zcFt+Sxgiw1dST4NMsx2Nf4+McjDI=;
 b=tYxnCX3d87htvGumVyu6Sm5pXff0ERdj6M0ycQHIufTOMnVOmDTBOI5jOGfdTLLaFsNIOn
 qb/PKTYxdN+IS75iC3yd5cyXswoPRF6tGfNOyPuTZj2EeaDVClkubYhqCTeBaYGgK2Bnm2
 oB1GnFQcvB7g8qiyMU+84TMpXrezeWw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672658970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=78jTsh0C+PKmg3zcFt+Sxgiw1dST4NMsx2Nf4+McjDI=;
 b=mZGWUDNa0Oiy+UhXodDBrl+whd8lm/l3RuWTpaOJfX2hXNC6j7dFwotEeqxk2sNa8RvUt5
 BUPDu818KI7iR/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3FC1B13427;
 Mon,  2 Jan 2023 11:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dhKUDhrAsmOOcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 11:29:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 00/13] drm: Fix color-format selection in fbdev emulation
Date: Mon,  2 Jan 2023 12:29:14 +0100
Message-Id: <20230102112927.26565-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Fix the selection of the fbdev emulation's color format and make
XRGB8888 the only emulated color format. Resolves the blank screen
in cases where video= specifies an unsupported color format. Also
resolves the issues around current format-conversion helpers.

Version 2 of the patchset fixes the format-helper test cases on
big-endian platforms. This involves some changes to existing tests
as well.

DRM drivers usually pick a default format for their fbdev emulation.
Via the kernel's video= parameter, users can specify a different
format. If the given format is unsupported by the driver, the fbdev
console screen remains dark. As the console is essential to many
systems, not displaying anything is to be avoided.

Patch 1 fixes the detection of the firmware's native color format.
The meaning of several color parameters is inconsistent among Linux
and various standards. Take this into account.

Patches 2 to 5 fix the existing conversion helpers and test cases
for big-endian platforms. These patches are new in version 2 of the
patchset.

As drivers are supposed to provide XRGB8888 as a default fallback
format, provide XRGB8888 conversion helpers in patches 6 to 9. The
new helpers handle cases where the client uses a XRGB8888 framebuffer
and the display scanout buffer uses a different format. All scanout
formats of the simplefb infrastructure should now be covered. The
patchset also extend the Kunit tests for the new formats.

With format conversion in place, patches 10 and 11 fix the single-probe
function's format selection. The helper now goes over the given video=
parameters until it finds a compatible format. If none is found, the
uses driver's default format.

Patches 12 and 13 clean up DRM code in drivers and helpers.

Tested on x86-64 with EFI output and x86 with various VESA color
modes. Also tested on ppc64 with OF output.

v3:
	* use endian-specific types in format helpers (Jose, LKP bot)
v2:
	* fix problems with big-endian platforms

Thomas Zimmermann (13):
  firmware/sysfb: Fix EFI/VESA format selection
  drm/format-helper: Comment on RGB888 byte order
  drm/format-helper: Fix test-input format conversion
  drm/format-helper: Store RGB565 in little-endian order
  drm/format-helper: Type fixes in format-helper tests
  drm/format-helper: Flip src/dst-format branches in blit helper
  drm/format-helper: Add conversion from XRGB8888 to ARGB8888
  drm/format-helper: Add conversion from XRGB8888 to ARGB2101010
  drm/format-helper: Add conversion from XRGB8888 to 15-bit RGB555
    formats
  drm/fh-helper: Split fbdev single-probe helper
  drm/fb-helper: Fix single-probe color-format selection
  drm/format-helper: Simplify drm_fb_build_fourcc_list()
  drm/format-helper: Remove unnecessary conversion helpers

 drivers/firmware/sysfb_simplefb.c             |  43 +-
 drivers/gpu/drm/drm_fb_helper.c               | 252 ++++++----
 drivers/gpu/drm/drm_format_helper.c           | 462 +++++++++++++-----
 .../gpu/drm/tests/drm_format_helper_test.c    | 386 ++++++++++++++-
 drivers/gpu/drm/tiny/ofdrm.c                  |  20 -
 drivers/gpu/drm/tiny/simpledrm.c              |  21 -
 include/drm/drm_format_helper.h               |  16 +-
 7 files changed, 897 insertions(+), 303 deletions(-)

-- 
2.39.0


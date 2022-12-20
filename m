Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE5652465
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 17:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE9510E0D7;
	Tue, 20 Dec 2022 16:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2D10E0AB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 16:12:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 859354D362;
 Tue, 20 Dec 2022 16:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671552709; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1TNs3bNuTv3H9SLzq39ipeVAOnE35q+0yR6H5mxTZp0=;
 b=p1RU9kPCeCn++t+xM6S6Xy1BlyPWuw+vnBJpYM0/6zcrAlzpOYtzsCuUNA9lDUz7xSlOzb
 uFoF32qLJnR6/Ky4aJOQxC740OWb/pXN8skwV6GFx1JYYcIIDOn8F8NOiewF8VO4Z5OdU2
 oFP1Hs7j7vvpTZyzwKWPlntVFM+iiJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671552709;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=1TNs3bNuTv3H9SLzq39ipeVAOnE35q+0yR6H5mxTZp0=;
 b=d0jUsLKKNmJzQFN4oRvu7a4GC7zIfXozVNd5qMOAJvzP0q9sIYeXUoJF0ZUaF3A8oLHFyg
 by7SmuJ6PsKd3GBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5D4671390E;
 Tue, 20 Dec 2022 16:11:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qLL4FcXeoWMiZQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Dec 2022 16:11:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com,
 jose.exposito89@gmail.com, mairacanal@riseup.net, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 00/13] drm: Fix color-format selection in fbdev emulation
Date: Tue, 20 Dec 2022 17:11:32 +0100
Message-Id: <20221220161145.27568-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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
patcheset.

As drivers are supposed to provide XRGB8888 as a default fallback
format, provide XRGB8888 conversion helpers in patches 6 to 9. The
new helpers handle cases where the client uses a XRGB8888 frambuffer
and the display scanout buffer uses a different format. All scanout
formats of the simplefb infrastructure should now be covered. The
patchse also extend the Kunit tests for the new formats.

With format conversion in place, patches 10 and 11 fix the single-probe
function's format selection. The helper now goes over the given video=
parameters until it finds a compatible format. If none is found, the
uses driver's default format.

Patches 12 and 13 clean up DRM code in drivers and helpers.

Tested on x86-64 with EFI output and x86 with various VESA color
modes. Also tested on ppc64 with OF output.

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
 drivers/gpu/drm/drm_format_helper.c           | 464 +++++++++++++-----
 .../gpu/drm/tests/drm_format_helper_test.c    | 386 ++++++++++++++-
 drivers/gpu/drm/tiny/ofdrm.c                  |  20 -
 drivers/gpu/drm/tiny/simpledrm.c              |  21 -
 include/drm/drm_format_helper.h               |  16 +-
 7 files changed, 898 insertions(+), 304 deletions(-)

-- 
2.39.0


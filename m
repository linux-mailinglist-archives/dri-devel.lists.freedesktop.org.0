Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714764BDC8
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 21:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 035C410E347;
	Tue, 13 Dec 2022 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 126D910E34C
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 20:12:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 54BB3229F3;
 Tue, 13 Dec 2022 20:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670962357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VlgxA8vnoXxRUuAQCBX6lSnbt4eazSo8cA0f5OxBm5w=;
 b=JTGnLOLcffiIjnweAMI6J8Q5I4nK0CUt57bXPb/Vw0/ZGW5BWaTWNGZi5EuwGlKJX05Vbs
 8Xb/lLqjG4k6Ub+RNzcjJpJtCG5yjH1z4rK7p2bgHTc9vIvzBjHYmXjv2c/F9H3s6le9XC
 hDZI6d6+96rTzXjQncLGypb5p4DqFxo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670962357;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VlgxA8vnoXxRUuAQCBX6lSnbt4eazSo8cA0f5OxBm5w=;
 b=RgJ/Y3gTBqd2TyeozRTcS6iAIrhvX/EITQ6eOvy8p2ZTveB8u/Cf2cPlYWIe7PVZdkiabO
 o75NCPNRCYwA/cCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28D1A138EE;
 Tue, 13 Dec 2022 20:12:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MpwmCbXcmGNyJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Dec 2022 20:12:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, jose.exposito89@gmail.com,
 mairacanal@riseup.net
Subject: [PATCH 0/9] drm: Fix color-format selection in fbdev emulation
Date: Tue, 13 Dec 2022 21:12:24 +0100
Message-Id: <20221213201233.9341-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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

DRM drivers usually pick a default format for their fbdev emulation.
Via the kernel's video= parameter, users can specify a different
format. If the given format is unsupported by the driver, the fbdev
console screen remains dark. As the console is essential to many
systems, not displaying anything is to be avoided.

Patch 1 fixes the detection of the firmware's native color format.
The meaning of several color parameters is inconsistent among Linux
and various standards. Take this into account.

As drivers are supposed to provide XRGB8888 as a default fallback
format, provide XRGB8888 conversion helpers in patches 2 to 5. The
new helpers handle cases where the client uses a XRGB8888 frambuffer
and the display scanout buffer uses a different format. All scanout
formats of the simplefb infrastructure should now be covered. The
patchse also extend the Kunit tests for the new formats.

With format conversion in place, patches 6 and 7 fix the single-probe
function's format selection. The helper now goes over the given video=
parameters until it finds a compatible format. If none is found, the
uses driver's default format.

Patches 8 and 9 clean up DRM code in drivers and helpers.

Tested on x86-64 with EFI output and x86 with various VESA color
modes. Also tested on ppc64 with OF output.

Thomas Zimmermann (9):
  firmware/sysfb: Fix EFI/VESA format selection
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
 drivers/gpu/drm/drm_format_helper.c           | 454 +++++++++++++-----
 .../gpu/drm/tests/drm_format_helper_test.c    | 312 ++++++++++++
 drivers/gpu/drm/tiny/ofdrm.c                  |  20 -
 drivers/gpu/drm/tiny/simpledrm.c              |  21 -
 include/drm/drm_format_helper.h               |  16 +-
 7 files changed, 835 insertions(+), 283 deletions(-)


base-commit: d322881f7e33af24901ee8ccaec3beef82f21203
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
-- 
2.38.1


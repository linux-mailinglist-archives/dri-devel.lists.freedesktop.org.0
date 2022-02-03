Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CA4A8320
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB48A10F224;
	Thu,  3 Feb 2022 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4784F10F21F;
 Thu,  3 Feb 2022 11:29:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D08C421126;
 Thu,  3 Feb 2022 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643887770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LVTtBCpcwFCzykVnHh25OaaYgWdpNdrs8NWHgW8hWcg=;
 b=VZ24BOQCOlItI1r5xXzChFbExlbPFeMHeVRgn4fCannLpZ7viT2N+XhVie/IDEtK5XUt+S
 yDsY4xLJySonkg5x4g9cKBeCpG41wVzUNWZukNpBkOfBbQVhBNLgRVh3BsaxCd+2q+a4Gh
 M+Re4s5duTUKtDO6i/hNg799WWFMff4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643887770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LVTtBCpcwFCzykVnHh25OaaYgWdpNdrs8NWHgW8hWcg=;
 b=95yfRmvMRL28Ar01vQQW+tB16iPiIVpKeCckBA6Ai+Q58Db0jr4QFGMgCPmsyhSRsn3x8c
 g32eUvt/5kJY7BDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C46A13BAC;
 Thu,  3 Feb 2022 11:29:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3tSbIJq8+2H0dgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Feb 2022 11:29:30 +0000
Date: Thu, 3 Feb 2022 12:29:29 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <Yfu8mTZQUNt1RwZd@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-fixes. Besides the usual small fixes,
the patches restore hardware acceleration for fbcon.

Best regards
Thomas

drm-misc-fixes-2022-02-03:
 * dma-buf/heaps: Fix potential spectre v1 gadget
 * drm/kmb: Fix potential out-of-bounds access
 * drm/mxsfb: Fix NULL-pointer dereference
 * drm/nouveau: Fix potential out-of-bounds access in BIOS decoding
 * fbdev: Re-add support for fbcon hardware acceleration
The following changes since commit 7fde14d705985dd933a3d916d39daa72b1668098:

  drm/privacy-screen: honor acpi=off in detect_thinkpad_privacy_screen (2022-01-26 15:25:50 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-02-03

for you to fetch changes up to 622c9a3a7868e1eeca39c55305ca3ebec4742b64:

  drm: mxsfb: Fix NULL pointer dereference (2022-02-03 09:31:16 +0100)

----------------------------------------------------------------
 * dma-buf/heaps: Fix potential spectre v1 gadget
 * drm/kmb: Fix potential out-of-bounds access
 * drm/mxsfb: Fix NULL-pointer dereference
 * drm/nouveau: Fix potential out-of-bounds access in BIOS decoding
 * fbdev: Re-add support for fbcon hardware acceleration

----------------------------------------------------------------
Alexander Stein (1):
      drm: mxsfb: Fix NULL pointer dereference

Anitha Chrisanthus (1):
      drm/kmb: Fix for build errors with Warray-bounds

Helge Deller (3):
      Revert "fbdev: Garbage collect fbdev scrolling acceleration, part 1 (from TODO list)"
      Revert "fbcon: Disable accelerated scrolling"
      fbcon: Add option to enable legacy hardware acceleration

Jordy Zomer (1):
      dma-buf: heaps: Fix potential spectre v1 gadget

Nick Lopez (1):
      drm/nouveau: fix off by one in BIOS boundary checking

 Documentation/gpu/todo.rst                      |  24 -
 drivers/dma-buf/dma-heap.c                      |   2 +
 drivers/gpu/drm/kmb/kmb_plane.c                 |   6 -
 drivers/gpu/drm/mxsfb/mxsfb_kms.c               |   6 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c |   2 +-
 drivers/video/console/Kconfig                   |  20 +
 drivers/video/fbdev/core/bitblit.c              |  16 +
 drivers/video/fbdev/core/fbcon.c                | 557 +++++++++++++++++++++++-
 drivers/video/fbdev/core/fbcon.h                |  72 +++
 drivers/video/fbdev/core/fbcon_ccw.c            |  28 +-
 drivers/video/fbdev/core/fbcon_cw.c             |  28 +-
 drivers/video/fbdev/core/fbcon_rotate.h         |   9 +
 drivers/video/fbdev/core/fbcon_ud.c             |  37 +-
 drivers/video/fbdev/core/tileblit.c             |  16 +
 drivers/video/fbdev/skeletonfb.c                |  12 +-
 include/linux/fb.h                              |   2 +-
 16 files changed, 761 insertions(+), 76 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer

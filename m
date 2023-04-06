Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEA26D97F5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 15:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F43E10EBAF;
	Thu,  6 Apr 2023 13:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FC6C10EBAF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 13:21:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE0162259C;
 Thu,  6 Apr 2023 13:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680787270; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GAv6XS5nrrbCBJhJji+K9gU0osW53tEq/QnWPaqpu6s=;
 b=QiV6YYjH4cLGNZD4bxEo5ER3UgqxWlh7iaDqh+z9yKZJ6VDNI6/pzT3TxvyZ34N/Blsy3f
 D1hcokc72kEAFazwuDTtFgoSeeRzbG+a5cqb7MKLDxcjza+IyYk1bJydfxwoT/k1s4OXb9
 lKGRMCN49tQOfFyfhjc/Yqv17T+MKgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680787270;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GAv6XS5nrrbCBJhJji+K9gU0osW53tEq/QnWPaqpu6s=;
 b=rDVTOUDkg0DGqKx+YoK359lxYOEp154ETm+gAyv9e/9JAs0EfomX8Cqm6UWqCDa+MHSThb
 euvrs2RXtQvT/PCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE09A133E5;
 Thu,  6 Apr 2023 13:21:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GHxtLUbHLmSqBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 13:21:10 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v5 0/9] video/aperture: Ignore firmware framebuffers with
 non-primary devices
Date: Thu,  6 Apr 2023 15:21:00 +0200
Message-Id: <20230406132109.32050-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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

Only remove sysfb and VGA devices for primary graphics devices. The
PCI helper for aperture ownership now detects primary devices. Resolves
bug reports about lost framebuffer consoles on systems with multiple
graphics cards.

The series picks up Daniel's patchset at v3 from [1] and cleans up a few
minor things. There's another patch on top that clarifys gma500's
special case.

v5:
	* fix gma500 comment
	* add S-o-b tag with Daniel's Intel address
v4:
	* add gma500 patch on top of v3
	* fix Daniel's S-o-b address
	* fix various typos in the commit messages

Daniel Vetter (8):
  drm/gma500: Use drm_aperture_remove_conflicting_pci_framebuffers
  video/aperture: use generic code to figure out the vga default device
  drm/aperture: Remove primary argument
  video/aperture: Only kick vgacon when the pdev is decoding vga
  video/aperture: Move vga handling to pci function
  video/aperture: Drop primary argument
  video/aperture: Only remove sysfb on the default vga pci device
  fbdev: Simplify fb_is_primary_device for x86

Thomas Zimmermann (1):
  video/aperture: Provide a VGA helper for gma500 and internal use

 arch/x86/video/fbdev.c                      | 13 +---
 drivers/gpu/drm/arm/hdlcd_drv.c             |  2 +-
 drivers/gpu/drm/armada/armada_drv.c         |  2 +-
 drivers/gpu/drm/drm_aperture.c              | 11 +---
 drivers/gpu/drm/gma500/psb_drv.c            | 43 ++++++++++---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  1 -
 drivers/gpu/drm/meson/meson_drv.c           |  2 +-
 drivers/gpu/drm/msm/msm_fbdev.c             |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c |  2 +-
 drivers/gpu/drm/stm/drv.c                   |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c           |  2 +-
 drivers/gpu/drm/tegra/drm.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_drv.c               |  2 +-
 drivers/video/aperture.c                    | 70 ++++++++++++++-------
 drivers/video/fbdev/hyperv_fb.c             |  2 +-
 include/drm/drm_aperture.h                  |  7 +--
 include/linux/aperture.h                    | 16 +++--
 17 files changed, 108 insertions(+), 73 deletions(-)

-- 
2.40.0


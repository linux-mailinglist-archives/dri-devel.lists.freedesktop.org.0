Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 798696D91AF
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383E810EB1B;
	Thu,  6 Apr 2023 08:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1521610EB1B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:32:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3898D1FD76;
 Thu,  6 Apr 2023 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680769962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJCj8Uvt0KzyLJO6eavrEb7OrxraNCNBdnmz7J37JkM=;
 b=mUaGcHYW9Uci4e/HgjWYmw6/RT3n7WuwuKgrRJBIk+HKRApS+ng6AiGJ0/EgON0ulhZ62F
 VEY1TQ5l7AWBQBcSLVRPz9AGx8jn5Q3zgJAn/n7dLoYnYFBwnJF99JL0CRlteXOjJY5HW5
 7q1zc74gpwS3qqB+Haud0IgQzt7Irtg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680769962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fJCj8Uvt0KzyLJO6eavrEb7OrxraNCNBdnmz7J37JkM=;
 b=UhmJXzGPwoVyEcjNHbUmLLdNtSc4Zqze43AF/yM0bCWaNhotFlBTSIj0F6eJXYBY0qFdvt
 UlrJlntETAZGZWBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 17063133E5;
 Thu,  6 Apr 2023 08:32:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 736bBKqDLmQZZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Apr 2023 08:32:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel.vetter@ffwll.ch, patrik.r.jakobsson@gmail.com
Subject: [PATCH v4 0/9] video/aperture: Ignore firmware framebuffers with
 non-primary devices
Date: Thu,  6 Apr 2023 10:32:31 +0200
Message-Id: <20230406083240.14031-1-tzimmermann@suse.de>
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

v4:
	* add gma500 patch on top of v3
	* fix Daniel's S-o-b address
	* fix various typos in the commit messages

[1] https://lore.kernel.org/dri-devel/66f9196e-df2b-19ce-e2ec-15f7a81d63c7@suse.de/T/#t

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


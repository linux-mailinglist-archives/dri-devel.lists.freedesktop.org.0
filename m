Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B322A3DEE89
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 14:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39FA6E852;
	Tue,  3 Aug 2021 12:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9996E563
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 12:59:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E5265200C7;
 Tue,  3 Aug 2021 12:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627995570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oo7yGQ8xWLlslf1gITlpvrc+90Xs1VMWzRRK0oSWyR8=;
 b=FtXSrMLPAZAtwMfAo264mKElr4OQJq1vfwvaPOc6K4HI5szVavwkbEL5dQJTQlEfMmjWZb
 6bPMt707M/uO31+yQSyss6Cx2oobmF6v3+/ur6roBl+kzKKwC2Bc5ryi5Uze7/Es09Fv+l
 8ACDWoW7hAYd37BoQSwFiHMsch8ZeYA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627995570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Oo7yGQ8xWLlslf1gITlpvrc+90Xs1VMWzRRK0oSWyR8=;
 b=uZqe5xiSUzJN3CYZWTWmyh3yPtc2hsBV54E3mbDc6/CyfE/SNjtEepkEvh17H6uYPBhnS5
 Nje//IzmcKzKaIAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6926C13CD6;
 Tue,  3 Aug 2021 12:59:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AjtGGLI9CWExZwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 03 Aug 2021 12:59:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 drawat.floss@gmail.com, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 sam@ravnborg.org
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/11] Provide offset-adjusted framebuffer mappings
Date: Tue,  3 Aug 2021 14:59:17 +0200
Message-Id: <20210803125928.27780-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A framebuffer's offsets field might be non-zero to make the BO data
start at the specified offset within the BO's memory. Handle this
case in drm_gem_fb_vmap() and update all callers. So far, many drivers
ignore the offsets, which can lead to visual artifacts.

Patch 1 adds an optional argument to drm_gem_fb_vmap() to return the
offset-adjusted data address for use with shadow-buffered planes.

Patches 3 and 11 convert gud and vkms, which are the other callers of
drm_gem_fb_vmap(). For gud, it's just a cleanup. Vkms will handle the
framebuffer offsets correctly for its input and output framebuffers.

The other patches convert users of shadow-buffered planes to use the
data address. After conversion, each driver will use the correct data
for non-zero offsets.

Thomas Zimmermann (11):
  drm/gem: Provide offset-adjusted framebuffer BO mappings
  drm/ast: Use offset-adjusted shadow-plane mappings
  drm/gud: Get offset-adjusted mapping from drm_gem_fb_vmap()
  drm/hyperv: Use offset-adjusted shadow-plane mappings
  drm/mgag200: Use offset-adjusted shadow-plane mappings
  drm/cirrus: Use offset-adjusted shadow-plane mappings
  drm/gm12u320: Use offset-adjusted shadow-plane mappings
  drm/simpledrm: Use offset-adjusted shadow-plane mapping
  drm/udl: Use offset-adjusted shadow-plane mapping
  drm/vbox: Use offset-adjusted shadow-plane mappings
  drm/vkms: Use offset-adjusted shadow-plane mappings and output

 drivers/gpu/drm/ast/ast_mode.c               |  2 +-
 drivers/gpu/drm/drm_gem_atomic_helper.c      |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 17 ++++++++++++++++-
 drivers/gpu/drm/gud/gud_pipe.c               |  5 +++--
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c  |  4 ++--
 drivers/gpu/drm/mgag200/mgag200_mode.c       |  4 ++--
 drivers/gpu/drm/tiny/cirrus.c                |  4 ++--
 drivers/gpu/drm/tiny/gm12u320.c              |  4 ++--
 drivers/gpu/drm/tiny/simpledrm.c             |  4 ++--
 drivers/gpu/drm/udl/udl_modeset.c            |  4 ++--
 drivers/gpu/drm/vboxvideo/vbox_mode.c        |  2 +-
 drivers/gpu/drm/vkms/vkms_composer.c         |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h              |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c            |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c        |  2 +-
 include/drm/drm_gem_atomic_helper.h          |  8 ++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  3 ++-
 17 files changed, 48 insertions(+), 22 deletions(-)

--
2.32.0


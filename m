Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898DB3D4F3A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 19:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE856E43D;
	Sun, 25 Jul 2021 17:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20AB6E43C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 17:44:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8EAD321F07;
 Sun, 25 Jul 2021 17:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627235082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5SwN1kaSR05VVM+qvSzI0mUxKs3AyQLZ2WAhlRhX2L8=;
 b=0NXtgwOEbDBnx1F4LdKHMo1QgvncuuZyBFKaJ1RoQQ0CsfqGXBa9bsfC8zWNBR7wVdBir/
 Hk5aMP95BCMtfrurQBfSewNdYpVeOnK1i7s+Rj/NW66KmpVknk0RC6zJfet09C7szFvLYR
 Qfg7IgDpU9jfWOXANX+8shfDkaqARRE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627235082;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5SwN1kaSR05VVM+qvSzI0mUxKs3AyQLZ2WAhlRhX2L8=;
 b=S5VjIGB0ENxrQGV/8/ob7FdXwgv2FFAO/IcEXYwraCQU/upoYOGzWGeSE5/iG7zqKE94zX
 4mmbRVieR7/Y9GBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55F0E13A1A;
 Sun, 25 Jul 2021 17:44:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zdZiEwqj/WCmMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 25 Jul 2021 17:44:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH v2 0/5] drm: Provide framebuffer vmap helpers
Date: Sun, 25 Jul 2021 19:44:33 +0200
Message-Id: <20210725174438.24493-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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

Add the new helpers drm_gem_fb_vmap() and drm_gem_fb_vunmap(), which
provide vmap/vunmap for all BOs of a framebuffer. Convert shadow-
plane helpers, gud and vkms.

Callers of GEM vmap and vunmap functions used to do the minumum work
or get some detail wrong. Therefore shadow-plane helpers were intro-
duced to implement the details for all callers. The vmapping code in
the shadow-plane helpers is also useful for gud and vkms. So it makes
sense to provide rsp helpers. Simply call drm_gem_fb_vmap() to
retrieve mappings of all of a framebuffer's BOs.

Future work: besides the mapping's addresses, drm_gem_fb_vmap() should
also return the mappings with the frambuffer data offset added. These
are the addresses were the actual image data is located. A follow-up
set of patches will implement this feature.

v2:
	* update commit message for first patch (Maxime)
	* fix error handling after DRM_FORMAT_MAX_PLANES changes
	  (kernel test robot)
	* fix includes (kernel test robot)
	* use [static N] notations for array parameters

Thomas Zimmermann (5):
  drm: Define DRM_FORMAT_MAX_PLANES
  drm/gem: Provide drm_gem_fb_{vmap,vunmap}()
  drm/gem: Clear mapping addresses for unused framebuffer planes
  drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
  drm/vkms: Map output framebuffer BOs with drm_gem_fb_vmap()

 drivers/gpu/drm/drm_gem_atomic_helper.c      | 37 +-------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 96 ++++++++++++++++++--
 drivers/gpu/drm/gud/gud_pipe.c               | 10 +-
 drivers/gpu/drm/vkms/vkms_composer.c         |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h              |  6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c        | 21 ++---
 include/drm/drm_fourcc.h                     | 13 ++-
 include/drm/drm_framebuffer.h                |  8 +-
 include/drm/drm_gem_atomic_helper.h          |  3 +-
 include/drm/drm_gem_framebuffer_helper.h     |  6 ++
 10 files changed, 133 insertions(+), 69 deletions(-)


base-commit: 2bda1ca4d4acb4892556fec3a7ea1f02afcd40bb
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.32.0


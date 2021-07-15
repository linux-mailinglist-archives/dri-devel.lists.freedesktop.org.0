Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F883CA4EB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19F26E88D;
	Thu, 15 Jul 2021 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691486E88D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:01:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D8A2922AE0;
 Thu, 15 Jul 2021 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626372095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9yfQDZ/rl1Q1/3uMSin818EcFXSdrcRDjO8i7vYlF4o=;
 b=BRIv6wnh5k8IHBSXP9oUUSwlizAv1tRIXH/m/vWX3tFpkrSjQ/goAe+2SQmmrZbjH8bt8+
 Kq/s2/+vGdD38DI5WzjZ38kJNnectRhN4X1SFOpRyiPF9M/gQ6wmzSaFoZt+1LqDtVLjKE
 yfyYOsfMSV1JeIzgjnOZ/gS9MREam2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626372095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9yfQDZ/rl1Q1/3uMSin818EcFXSdrcRDjO8i7vYlF4o=;
 b=aLNT/jpoofpM9dmUFBdbn9Wu62sBKG7COfH20i5+pU0QZX0sUGDWtWwyksJdendQXBIGmY
 xmhshr1vqsj5BwCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 952F013C41;
 Thu, 15 Jul 2021 18:01:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gYuSIv938GBoIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 18:01:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH 0/5] drm: Provide framebuffer vmap helpers
Date: Thu, 15 Jul 2021 20:01:28 +0200
Message-Id: <20210715180133.3675-1-tzimmermann@suse.de>
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

Thomas Zimmermann (5):
  drm: Define DRM_FORMAT_MAX_PLANES
  drm/gem: Provide drm_gem_fb_{vmap,vunmap}()
  drm/gem: Clear mapping addresses for unused framebuffer planes
  drm/gud: Map framebuffer BOs with drm_gem_fb_vmap()
  drm/vkms: Map output framebuffer BOs with drm_gem_fb_vmap()

 drivers/gpu/drm/drm_gem_atomic_helper.c      | 37 +-------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 88 ++++++++++++++++++--
 drivers/gpu/drm/gud/gud_pipe.c               | 11 +--
 drivers/gpu/drm/vkms/vkms_composer.c         |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h              |  6 +-
 drivers/gpu/drm/vkms/vkms_writeback.c        | 21 +++--
 include/drm/drm_fourcc.h                     | 13 ++-
 include/drm/drm_framebuffer.h                |  8 +-
 include/drm/drm_gem_atomic_helper.h          |  3 +-
 include/drm/drm_gem_framebuffer_helper.h     |  5 ++
 10 files changed, 127 insertions(+), 67 deletions(-)


base-commit: 4d00e2309398147acdbfefbe1deb4b0e78868466
--
2.32.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AB6BCB16
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB2210EA5C;
	Thu, 16 Mar 2023 09:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B0C10E0A4;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED0DD1FE00;
 Thu, 16 Mar 2023 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zqz7fa9d1KFk+W2EKeUIKXxfdJV2phkHTv/JsE+NxxU=;
 b=KsslD+6iec0QtbiLdvV8A5IbB+BXIQsjLBJ/uKRD7q7Bni50RkvPU6RpZ8X4I8HNdppRH0
 iuKlYoi5PwztTScbl3OT/Bn4XFRJlIcQUlk/L6c3pVGwPT+4CF/i5SO9lUMS9A17GbbtTs
 W37nIjjkUAxKJDsTxocNmhif3dbW3eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959459;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zqz7fa9d1KFk+W2EKeUIKXxfdJV2phkHTv/JsE+NxxU=;
 b=cVGMHYOwwpz+4ne7DnYX5yNi/4F378YNYpeE5jXJwjhWeU/JJwYFE1LyLNy+Yk/hzDSrj6
 HsDNFGoafKDRYNDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB012133E0;
 Thu, 16 Mar 2023 09:37:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3JyyLGPjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Date: Thu, 16 Mar 2023 10:37:28 +0100
Message-Id: <20230316093738.28866-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert radeon's fbdev code to drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups.
Only build fbdev support if the config option has been set.

Thomas Zimmermann (10):
  drm/radeon: Move radeon_align_pitch() next to dumb-buffer helpers
  drm/radeon: Improve fbdev object-test helper
  drm/radeon: Remove struct radeon_fbdev
  drm/radeon: Remove test for !screen_base in fbdev probing
  drm/radeon: Move fbdev object helpers before struct fb_ops et al
  drm/radeon: Fix coding style in fbdev emulation
  drm/radeon: Move fbdev cleanup code into fb_destroy callback
  drm/radeon: Correctly clean up failed display probing
  drm/radeon: Implement client-based fbdev emulation
  drm/radeon: Only build fbdev if DRM_FBDEV_EMULATION is set

 drivers/gpu/drm/radeon/Makefile         |   3 +-
 drivers/gpu/drm/radeon/radeon.h         |   2 +
 drivers/gpu/drm/radeon/radeon_display.c |   4 -
 drivers/gpu/drm/radeon/radeon_drv.c     |   3 +-
 drivers/gpu/drm/radeon/radeon_drv.h     |   1 -
 drivers/gpu/drm/radeon/radeon_fb.c      | 400 ----------------------
 drivers/gpu/drm/radeon/radeon_fbdev.c   | 422 ++++++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon_gem.c     |  24 ++
 drivers/gpu/drm/radeon/radeon_kms.c     |  18 -
 drivers/gpu/drm/radeon/radeon_mode.h    |  20 +-
 10 files changed, 464 insertions(+), 433 deletions(-)
 delete mode 100644 drivers/gpu/drm/radeon/radeon_fb.c
 create mode 100644 drivers/gpu/drm/radeon/radeon_fbdev.c


base-commit: ec0708e846b819c8d5b642de42448a87d7526564
-- 
2.39.2


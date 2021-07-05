Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAB03BB828
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 09:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA12889AEA;
	Mon,  5 Jul 2021 07:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A8899F2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 07:46:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A4B631FE20;
 Mon,  5 Jul 2021 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625471194; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ehZIbfV5Psr0Bfybg6QDHnDApYmBAGtFMWdCP6Xt5yg=;
 b=ju/0l8+qmyy0xjM7YrmvDSJYvfJl0jbsPuH3cKKe9Rg6Cd8cc33Sf6Na3qs6KsX4Gp2y9d
 cQXOML3tH4AxR+STL05CgI65G4cCEnKiM0PvFWqgLPXZs/0zM8WoKB5v+b5I6NBbhu+N4P
 otNT+OqEsJR9NfSf3WxGF8Js90Snf8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625471194;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ehZIbfV5Psr0Bfybg6QDHnDApYmBAGtFMWdCP6Xt5yg=;
 b=/G+9At6C2sDSzlC2qIChr+8/napw4X/7TKfzNB6ah/wJbviIYRWualzGh7CrpBsc+ErJIb
 FIZMv4I3UoOo+zAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 71C1D13440;
 Mon,  5 Jul 2021 07:46:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HxuxGtq44mBNDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 07:46:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: melissa.srw@gmail.com, hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Date: Mon,  5 Jul 2021 09:46:29 +0200
Message-Id: <20210705074633.9425-1-tzimmermann@suse.de>
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

Vkms copies each plane's framebuffer into the output buffer; essentially
using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
handles the details of mapping/unmapping shadow buffers into memory for
active planes.

Convert vkms to the helpers. Makes vkms use shared code and gives more
test exposure to shadow-plane helpers.

Thomas Zimmermann (4):
  drm/gem: Export implementation of shadow-plane helpers
  drm/vkms: Inherit plane state from struct drm_shadow_plane_state
  drm/vkms: Let shadow-plane helpers prepare the plane's FB
  drm/vkms: Use dma-buf mapping from shadow-plane state for composing

 drivers/gpu/drm/drm_gem_atomic_helper.c | 55 ++++++++++++++++++++++--
 drivers/gpu/drm/vkms/vkms_composer.c    | 26 ++++++-----
 drivers/gpu/drm/vkms/vkms_drv.h         |  6 ++-
 drivers/gpu/drm/vkms/vkms_plane.c       | 57 ++++++-------------------
 include/drm/drm_gem_atomic_helper.h     |  6 +++
 5 files changed, 86 insertions(+), 64 deletions(-)


base-commit: 3d3b5479895dd6dd133571ded4318adf595708ba
--
2.32.0


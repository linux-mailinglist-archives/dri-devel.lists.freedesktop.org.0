Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F760C9CA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 12:18:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49E610E318;
	Tue, 25 Oct 2022 10:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4797210E2F5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 10:17:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E058321A19;
 Tue, 25 Oct 2022 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666693060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iULc32WbAGt45DnX3lL0m2E8n1oMTwyDaP6ctzHFgvU=;
 b=GMaaGUNtC/NEDRjlM/88NUcLssOW3DjPosM/lNA8EhiSJfoekHMFZhDc3/EA/XL82odQHx
 UQ3CVS0guExLQSmT0uoQEuEvt6l+oh/pHgN3bJUU9C5uI29fziYzzaT3vG0mZ5GJN4ZNva
 XlYH0w+yw5oipkAxR1QhiTLRwyM1lH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666693060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iULc32WbAGt45DnX3lL0m2E8n1oMTwyDaP6ctzHFgvU=;
 b=hVDszFZr5tdh6f0nxDmlRPSEsvOxQE5L+ZJG2WbIGiXYc4ewaPiAxmswCnjx0U86SVgR2R
 4unmnI0SmDq4lkCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B850E13A64;
 Tue, 25 Oct 2022 10:17:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uUMYLMS3V2PkVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 10:17:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com
Subject: [PATCH v2 0/2] drm: Add new plane helpers to begin/end FB access
Date: Tue, 25 Oct 2022 12:17:35 +0200
Message-Id: <20221025101737.8874-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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

This patchset adds the callbacks begin_fb_access and end_fb_access
to struct drm_plane_helper_funcs. They provide hooks to acquire and
release resources that are only held during the commit. It adds
related simple-KMS helpers and converts shadow-plane helpers.

As resource allocation often can fail, we have to do this before an
atomic commit starts the update in order to handle the error. But
prepare_fb is only reverted after the next pageflip. We want to
reduce the time resources are held for a commit, which requires the
new hooks.

With this in place, move shadow-plane helpers' automatic vmap/vunmap
behind the new callbacks. The shadow-plane mapping is only required
during the atomic commit.

Tested with combinations of radeon, udl and simpledrm under X11, Weston
and Wayland-Gnome.

Thomas Zimmermann (2):
  drm/atomic-helper: Add {begin,end}_fb_access to plane helpers
  drm/gem: Implement shadow-plane {begin,end}_fb_access with vmap

 drivers/gpu/drm/drm_atomic_helper.c      | 34 ++++++++++--
 drivers/gpu/drm/drm_gem_atomic_helper.c  | 66 +++++++++++-------------
 drivers/gpu/drm/drm_simple_kms_helper.c  | 26 ++++++++++
 include/drm/drm_gem_atomic_helper.h      | 20 +++----
 include/drm/drm_modeset_helper_vtables.h | 41 ++++++++++++++-
 include/drm/drm_simple_kms_helper.h      | 20 +++++++
 6 files changed, 157 insertions(+), 50 deletions(-)


base-commit: 746559738f1335241ea686566cb654847c20d7a4
-- 
2.38.0


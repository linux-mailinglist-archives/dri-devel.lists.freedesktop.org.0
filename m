Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203D690D31
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8F210EAFA;
	Thu,  9 Feb 2023 15:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D8D210E22D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:41:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3415375ED;
 Thu,  9 Feb 2023 15:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675957269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fLJlIlxmLyiHKZzb2wA/u1jbLOGxVW/AdYU6uffH/os=;
 b=KCqV4lRVPTy50bBeyjJPtZslEGxXAUjZcdavufkqfBErUKrS4mg0Y6hBDr+7RK6RvHwSbu
 tRg61y/qO50YlhSyVxkILl4Iy8rWdSp1WVi0AkcojjVqQo04ledZtRFuCdARILmBEwifen
 daNaZckA1SM1o9kTpV9B9o09bA8gco0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675957269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fLJlIlxmLyiHKZzb2wA/u1jbLOGxVW/AdYU6uffH/os=;
 b=5yY6EcDHUgZiIJiM5K7PO565t9yqxrQIwB8GM5gc/xk+4BmjycI6Rp8v5KUlrTnfSOWbYu
 5fg/3MWEZEzo03Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 729CC1339E;
 Thu,  9 Feb 2023 15:41:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fd7fGhUU5WM5PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 15:41:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, jyri.sarha@iki.fi,
 tomba@kernel.org
Subject: [PATCH 0/6] drm: Add struct drm_plane_helper_funcs.atomic_enable
Date: Thu,  9 Feb 2023 16:41:01 +0100
Message-Id: <20230209154107.30680-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.1
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

Add atomic_enable, a plane helper that enables a plane. It is supposed
to be the inverse of atomic_disable.

While atomic_update can handle all of a plane's enable, disable and
update functionality, many drivers also implement atomic_disable to
do disabling separately. Some drivers also try to detect whether the
plane gets enabled and can benefit if DRM's atomic helpers already
do this. Give them the respective callback. At least in the case of
ast, avoiding to enable the primary plane improves performance with
some BMCs.

Tested on AST2100 hardware.

Thomas Zimmermann (6):
  drm/atomic-helper: Add atomic_enable plane-helper callback
  drm/ast: Implement struct drm_plane_helper_funcs.atomic_enable
  drm/mgag200: Remove disable handling from atomic_update
  drm/mgag200: Implement struct drm_plane_helper_funcs.atomic_enable
  drm/tidss: Remove return values from dispc_plane_{setup,enable}()
  drm/tidss: Implement struct drm_plane_helper_funcs.atomic_enable

 drivers/gpu/drm/ast/ast_mode.c           | 28 ++++++++++++++++-------
 drivers/gpu/drm/drm_atomic_helper.c      | 20 ++++++++++++----
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  3 +++
 drivers/gpu/drm/mgag200/mgag200_mode.c   | 22 ++++++++++--------
 drivers/gpu/drm/tidss/tidss_dispc.c      | 12 ++++------
 drivers/gpu/drm/tidss/tidss_dispc.h      |  8 +++----
 drivers/gpu/drm/tidss/tidss_plane.c      | 20 ++++++++--------
 include/drm/drm_atomic_helper.h          | 26 +++++++++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 29 +++++++++++++++++++++++-
 9 files changed, 124 insertions(+), 44 deletions(-)


base-commit: 1a019dd7a5d25f7c1c9b77931138290e28947e6a
-- 
2.39.1


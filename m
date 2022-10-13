Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E53395FD867
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 13:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320B510E838;
	Thu, 13 Oct 2022 11:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF2F10E838
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 11:29:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 563CE1F385;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665660566; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wQLM+8o8bCMzxAhVym7mt6ajqWX+nFYDRsMvJht7PO0=;
 b=WgSxbpG6AzHVNrelw39vV60V9RFB4rT9wi9H709u62IjlsGL8enQDQxpHX+v8up+GbFZMS
 EiMNQlIKMKG6zk4kqZmS1gakTtO13Ws/qxGrq5sEGFefBStyT5aTDkaKjoRFiv+j9ulV6k
 x9zfsCF257Uv3Rn2d11UJjTuhnul2s4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665660566;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wQLM+8o8bCMzxAhVym7mt6ajqWX+nFYDRsMvJht7PO0=;
 b=ulyplhVC6uJX5ImENdcwOAcvfrHESI4BP2XuEJIs9r8cx8Uz6jgDjngSghng4PItJAfsSG
 DGwA/IX8mmvEbLBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BEBB13AAA;
 Thu, 13 Oct 2022 11:29:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YdebBJb2R2NwYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 11:29:26 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 javierm@redhat.com, ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH v2 0/8] drm/ast: Convert ast driver to SHMEM
Date: Thu, 13 Oct 2022 13:29:15 +0200
Message-Id: <20221013112923.769-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

This patchset converts ast to GEM SHMEM helpers. Fixes problems with
memory allocation and BMC scanout updates.

Patches 1 to 3 are fixes for various minor problems in the ast driver.
We should merge them even without SHMEM support.

Patches 4 to 6 prepare the driver for the conversion. The cursor double
buffering is not required and prevents reuse among the plane code. Style
issues are being fixed separately from the conversion.

The conversion itself is in patch 7. Not only does it fix problems with
memory allocation, it also brings back several high-res display modes
that got lost during the ast driver's conversion to atomic modesetting.
There was an earlier RFC patch of this code that had issues with
rendering performance. [1] We've meanwhile improved in these area and
performance was acceptable on the test systems.

With SHMEM in place, the scanout address for the primary plane does not
have to be changed often. Patch 8 fixes a performance problem where the
BMC output freezes for several seconds after reprogramming the scanout
address or scanline offset.

Tested on AST 2100 and 2300 with fbdev emulation, weston, and Gnome in
X11 and Wayland mode.

v2:
	* additional fixes for BMC output (Jocelyn)
	* fix typos in commit messages (Jocelyn)

[1] https://lore.kernel.org/dri-devel/5a3537c3-2c81-b9de-e4c7-c00577cdd43d@suse.de/

Thomas Zimmermann (8):
  drm/ast: Acquire I/O-register lock in atomic_commit_tail function
  drm/ast: Call drm_atomic_helper_check_plane_state() unconditionally
  drm/ast: Do not call drm_atomic_add_affected_planes()
  drm/ast: Remove cursor double buffering
  drm/ast: Rename struct ast_cursor_plane to struct ast_plane
  drm/ast: Style cleanups in plane code
  drm/ast: Convert ast to SHMEM
  drm/ast: Avoid reprogramming primary-plane scanout address

 drivers/gpu/drm/ast/Kconfig    |   4 +-
 drivers/gpu/drm/ast/ast_drv.c  |   4 +-
 drivers/gpu/drm/ast/ast_drv.h  |  34 +--
 drivers/gpu/drm/ast/ast_main.c |   5 +-
 drivers/gpu/drm/ast/ast_mm.c   |  14 +-
 drivers/gpu/drm/ast/ast_mode.c | 404 ++++++++++++++++-----------------
 6 files changed, 222 insertions(+), 243 deletions(-)


base-commit: 74e2443e7681e4d442b45f551ddf12d09a6f00c3
-- 
2.37.3


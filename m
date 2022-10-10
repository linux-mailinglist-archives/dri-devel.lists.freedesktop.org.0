Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A4B5F9CE2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 12:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C4210E135;
	Mon, 10 Oct 2022 10:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB1F10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:36:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3F2451F8AF;
 Mon, 10 Oct 2022 10:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665398187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8aqK90vvZP1jTa2u4kAYL9z7g1N+6V2TuBuGEttHztQ=;
 b=MoENMCghPgPMl1E4uI9SUUFYZViI5sTHAMz2fKX+DnL52Cskuu0LR96pun8npI+8KCIpIc
 YO9Br0xaypRPivyeBSL1LisIAb7tKoQ96UByL4Iq4/Fu7M5q0lapo1Q708I33cpCVgVbuC
 f+GaEesBcjpK4FH5b1xUORvJehKRG80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665398187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8aqK90vvZP1jTa2u4kAYL9z7g1N+6V2TuBuGEttHztQ=;
 b=CrIXTpaE9mFXPbqtq1t0C2BxYqVeaHBOs/UTrFeiA10F7X2hw+eXkrl9RcMJd7cUQhdOTD
 rKB8VJI21y41ATBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0752613ACA;
 Mon, 10 Oct 2022 10:36:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1pzbAKv1Q2M4LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Oct 2022 10:36:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, daniel@ffwll.ch,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 ilpo.jarvinen@cs.helsinki.fi
Subject: [PATCH 0/8] drm/ast: Convert ast driver to SHMEM
Date: Mon, 10 Oct 2022 12:36:17 +0200
Message-Id: <20221010103625.19958-1-tzimmermann@suse.de>
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
rendering performnce. [1] We've meanwhile improved these areas and
performance was acceptable on the test systems.

With SHMEM in place, the scanout address for the primary plane does not
have to be changed often. Patch 8 fixes a performance problem where the
BMC output freezes for several seconds after reprogramming the scanout
address.

Tested on AST 2100 and 2300 with fbdev emulation, weston, and Gnome in
X11 and Wayland mode.

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
 drivers/gpu/drm/ast/ast_mode.c | 399 ++++++++++++++++-----------------
 6 files changed, 219 insertions(+), 241 deletions(-)


base-commit: 74e2443e7681e4d442b45f551ddf12d09a6f00c3
-- 
2.37.3


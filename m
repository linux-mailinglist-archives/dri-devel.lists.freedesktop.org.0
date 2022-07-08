Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC256B5B1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 11:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C93810FBEA;
	Fri,  8 Jul 2022 09:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B26710FBE1
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 09:39:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DAA4A1F947;
 Fri,  8 Jul 2022 09:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657273170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S39J54AOQtKHgdf1/uDJUznLp9ziy2wqj9uWlS3fqUs=;
 b=nXOmpTLhvLJ0pWJfVguI/OxGc8EnFGMPAiDx/Jwl7T6x7JTwyNc6DJ3sYRB59zRtvfFIM6
 LWeU/pVF/9Ro8FllVTO6hidX0ONZ+xeDNYQ56I/rvyJxBETYAlsRnypab0a/C5pR/5ymfE
 qXb0IGg8uowq6tKO7pjxHm9LbvYVXaA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657273170;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=S39J54AOQtKHgdf1/uDJUznLp9ziy2wqj9uWlS3fqUs=;
 b=kRKQfIaj96cPxNct5u5x2kwZOmNDwukQ9T1gUf3A83aciTstj9a0/clpL8ffkNNRr89oIq
 HyG+tPnWn/3ChfDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B6AB313A7D;
 Fri,  8 Jul 2022 09:39:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VHKxK1L7x2J5TwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Jul 2022 09:39:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH 00/14] drm/mgag200: Move model-specific code into separate
 functions
Date: Fri,  8 Jul 2022 11:39:15 +0200
Message-Id: <20220708093929.4446-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

Mgag200 still mixes model-specific code and generic code in the same
functions. Separate it into distinct helpers.

As part of this effort, convert the driver from simple-KMS helpers
to regular atomic helpers. The latter are way more flexible and can
be adapted easily for each hardware model.

Tested on Matrox G200 and G200EH hardware.

Thomas Zimmermann (14):
  drm/mgag200: Split mgag200_modeset_init()
  drm/mgag200: Move DAC-register setup into model-specific code
  dmr/mgag200: Move ER/EW3 register initializatino to per-model code
  drm/mgag200: Acquire I/O-register lock in atomic_commit_tail function
  drm/mgag200: Store primary plane's color format in CRTC state
  drm/mgag200: Reorganize before dropping simple-KMS helpers
  drm/mgag200: Replace simple-KMS with regular atomic helpers
  drm/mgag200: Set SCROFF in primary-plane code
  drm/mgag200: Add per-device callbacks
  drm/mgag200: Provide per-device callbacks for BMC synchronization
  drm/mgag200: Provide per-device callbacks for PIXPLLC
  drm/mgag200: Move mode-config to model-specific code
  drm/mgag200: Move CRTC atomic_enable to model-specfic code
  drm/mgag200: Remove type field from struct mga_device

 drivers/gpu/drm/mgag200/Makefile          |   4 +-
 drivers/gpu/drm/mgag200/mgag200_bmc.c     |  99 +++
 drivers/gpu/drm/mgag200/mgag200_drv.c     |  21 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 181 +++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 266 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 287 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 181 +++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 324 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 329 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 192 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 446 +++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 336 +++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 727 +++++-----------
 drivers/gpu/drm/mgag200/mgag200_pll.c     | 997 ----------------------
 14 files changed, 2804 insertions(+), 1586 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c


base-commit: 11d480026e922adacd274306728adb6df6dd262a
-- 
2.36.1


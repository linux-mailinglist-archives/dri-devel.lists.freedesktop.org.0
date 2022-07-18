Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E47EF577E98
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A04E8D75F;
	Mon, 18 Jul 2022 09:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1818BFFB
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0950A37424;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=slulOyhnrOu6L/5YncppCifhwo+nbDhZBhV2hjGfrUY=;
 b=m4Z0gPhySf3OpjRY4kFKNUiSVXmJsvjCFiMLfUIMNaXy2GIlQwexJdtP3occOUbuiV59n9
 XxyuCRRIZcFBsagkCzNy5g4CcchetI3F0ac3X6eFKS5ibCiLSYSg8KtBMTWRETiskMVGG/
 mofnXJnmBNfsFVgaDvjBYaKi1D8RmSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=slulOyhnrOu6L/5YncppCifhwo+nbDhZBhV2hjGfrUY=;
 b=zlHl1WR1YktLFAwYSNdsmyPd7ZqrrIpPkhQMxkuc+G2DpwMzeI0Vf6iq0evR/9yvmdGz7X
 bqqyXdORE5L5A/Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D43BF13754;
 Mon, 18 Jul 2022 09:27:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jajhMpon1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 00/14] drm/mgag200: Move model-specific code into separate
 functions
Date: Mon, 18 Jul 2022 11:27:39 +0200
Message-Id: <20220718092753.9598-1-tzimmermann@suse.de>
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

v2:
	* don't duplicate DAC init values unecessarily (Sam, Jocelyn)

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
 drivers/gpu/drm/mgag200/mgag200_drv.h     | 208 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200.c    | 254 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh.c  | 277 +++++-
 drivers/gpu/drm/mgag200/mgag200_g200eh3.c | 181 +++-
 drivers/gpu/drm/mgag200/mgag200_g200er.c  | 315 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ev.c  | 316 ++++++-
 drivers/gpu/drm/mgag200/mgag200_g200ew3.c | 192 ++++-
 drivers/gpu/drm/mgag200/mgag200_g200se.c  | 431 +++++++++-
 drivers/gpu/drm/mgag200/mgag200_g200wb.c  | 326 ++++++-
 drivers/gpu/drm/mgag200/mgag200_mode.c    | 727 +++++-----------
 drivers/gpu/drm/mgag200/mgag200_pll.c     | 997 ----------------------
 14 files changed, 2762 insertions(+), 1586 deletions(-)
 create mode 100644 drivers/gpu/drm/mgag200/mgag200_bmc.c
 delete mode 100644 drivers/gpu/drm/mgag200/mgag200_pll.c


base-commit: ebea934e2651857c9b56cc80bf99460ee18a3592
-- 
2.36.1


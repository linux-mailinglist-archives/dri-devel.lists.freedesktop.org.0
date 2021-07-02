Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40F3B9D27
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 09:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5247989F5B;
	Fri,  2 Jul 2021 07:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22ADE89CC1
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 07:54:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC5302005C;
 Fri,  2 Jul 2021 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=OsPoqp1SOinmTHS2Dhwi+UnPQ6QUbEaPLxYyzr/36Tc7X9UykVQvzIe+U79vokDAyCesjd
 WxxrmAUec0f43YgMovTcP+9GbW4Mru9Q1o7QFhdwQhNx1Ui/AXOIZsJwIeA2ElpUwH3xih
 ahN2cng6DIZvC0EiYgG/3YvsEjB9Vgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=+GHENrySAfreK0CvbOOsNmCY4/g33aK+esfx+atgaJ5S5jOE9lZnfrTQKJGxTfK5a8yLs6
 cW4J+/0E40SQmQDg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8FC4611CD6;
 Fri,  2 Jul 2021 07:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625212476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=OsPoqp1SOinmTHS2Dhwi+UnPQ6QUbEaPLxYyzr/36Tc7X9UykVQvzIe+U79vokDAyCesjd
 WxxrmAUec0f43YgMovTcP+9GbW4Mru9Q1o7QFhdwQhNx1Ui/AXOIZsJwIeA2ElpUwH3xih
 ahN2cng6DIZvC0EiYgG/3YvsEjB9Vgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625212476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4Tv6jbyMyIKQVG1JMkGglWPb6ChlXmHD7QQGXoJILGo=;
 b=+GHENrySAfreK0CvbOOsNmCY4/g33aK+esfx+atgaJ5S5jOE9lZnfrTQKJGxTfK5a8yLs6
 cW4J+/0E40SQmQDg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id WJQ+IjzG3mALDgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jul 2021 07:54:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/3] drm/bochs: Move to tiny/ and simplify
Date: Fri,  2 Jul 2021 09:54:31 +0200
Message-Id: <20210702075434.27677-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the bochs driver to tiny/ and simplify the clean-up code. Also
update GEM VRAM helpers accordingly.

v2:
	* make bochs_mode_funcs static (Daniel, kernel test robot)

Thomas Zimmermann (3):
  drm/bochs: Move to tiny/
  drm/bochs: Use managed initialization for GEM VRAM helpers
  drm/vram-helper: Unexport drm_vram_helper_{alloc,release}_mm()

 MAINTAINERS                           |   2 +-
 drivers/gpu/drm/Kconfig               |   2 -
 drivers/gpu/drm/Makefile              |   1 -
 drivers/gpu/drm/bochs/Kconfig         |  11 -
 drivers/gpu/drm/bochs/Makefile        |   4 -
 drivers/gpu/drm/bochs/bochs.h         |  98 ----
 drivers/gpu/drm/bochs/bochs_drv.c     | 205 -------
 drivers/gpu/drm/bochs/bochs_hw.c      | 323 ------------
 drivers/gpu/drm/bochs/bochs_kms.c     | 178 -------
 drivers/gpu/drm/bochs/bochs_mm.c      |  24 -
 drivers/gpu/drm/drm_gem_vram_helper.c |   9 +-
 drivers/gpu/drm/tiny/Kconfig          |  13 +
 drivers/gpu/drm/tiny/Makefile         |   1 +
 drivers/gpu/drm/tiny/bochs.c          | 733 ++++++++++++++++++++++++++
 include/drm/drm_gem_vram_helper.h     |   4 -
 15 files changed, 751 insertions(+), 857 deletions(-)
 delete mode 100644 drivers/gpu/drm/bochs/Kconfig
 delete mode 100644 drivers/gpu/drm/bochs/Makefile
 delete mode 100644 drivers/gpu/drm/bochs/bochs.h
 delete mode 100644 drivers/gpu/drm/bochs/bochs_drv.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_hw.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_kms.c
 delete mode 100644 drivers/gpu/drm/bochs/bochs_mm.c
 create mode 100644 drivers/gpu/drm/tiny/bochs.c

--
2.32.0


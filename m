Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD6478E4D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BAE11279C;
	Fri, 17 Dec 2021 14:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701FE11277C;
 Fri, 17 Dec 2021 14:46:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB1F51F392;
 Fri, 17 Dec 2021 14:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639752377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YxB0cqlhvJ91NGi/HsQ7Tt+MPtNzBkQB/o1qvCb8FhQ=;
 b=mY+8j3UY7NsmFW9c9CrJ5MMWvrUkiZ5g5MIaDMkHsfjsoN0nR+LsjEQ6b41Ax2aP+XjgZL
 o8L5SXFP6qGHZvEUF75cCObvvG0Y8YEDgTAP72DhSW0vFmoaRBX7MgQX5FuTAFu1KJ969b
 AIjMp7YVftvGTH6f7KOlg9Eo8rclPTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639752377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=YxB0cqlhvJ91NGi/HsQ7Tt+MPtNzBkQB/o1qvCb8FhQ=;
 b=mkoxXt/BuOC4YLCyTF7Z5ZQ3OSGWVbCVMlPIl2W3/uNq6JhacKmdl9Qu1z25k9UYrJt6nY
 0s9veC6qQODue5AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9980C13E1C;
 Fri, 17 Dec 2021 14:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CYoCJLmivGH9KwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Dec 2021 14:46:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [RFC][PATCH 00/10] drm: Add DRM module helpers for existing PCI
 drivers
Date: Fri, 17 Dec 2021 15:46:05 +0100
Message-Id: <20211217144615.32733-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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
Cc: spice-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an RFC patchset to complement the helper macros provided
in [1]. The module helpers create module init and exit helpers that
respect the kernel parameters that enable/disable DRM drivers.

There's one more patch that prepares qxl by moving some code around.
It's required to make use of the helpers from within qxl.

Javier, please see if you find anything useful here and cherry-pick
into your patchset. The driver changes should complement the ones
in your patchset. The module macros are similar to yours and should
be easily mergable.

I tested the macros with ast.

[1] https://patchwork.freedesktop.org/series/98162/

Thomas Zimmermann (10):
  drm: Provide PCI module-init macros
  drm/ast: Replace module-init boiler-plate code with DRM helpers
  drm/bochs: Replace module-init boiler-plate code with DRM helpers
  drm/cirrus: Replace module-init boiler-plate code with DRM helpers
  drm/hisilicon/hibmc: Replace module initialization with DRM helpers
  drm/mgag200: Replace module-init boiler-plate code with DRM helpers
  drm/qxl: Move ioctl array next to its only user
  drm/qxl: Replace module-init boiler-plate code with DRM helpers
  drm/vboxvideo: Replace module-init boiler-plate code with DRM helpers
  drm/vmwgfx: Replace module-init boiler-plate code with DRM helpers

 Documentation/gpu/drm-internals.rst           |  6 ++
 drivers/gpu/drm/ast/ast_drv.c                 | 18 +---
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  3 +-
 drivers/gpu/drm/mgag200/mgag200_drv.c         | 20 +---
 drivers/gpu/drm/qxl/qxl_drv.c                 | 31 +++---
 drivers/gpu/drm/qxl/qxl_drv.h                 | 13 ++-
 drivers/gpu/drm/qxl/qxl_ioctl.c               | 41 ++------
 drivers/gpu/drm/tiny/bochs.c                  | 20 +---
 drivers/gpu/drm/tiny/cirrus.c                 | 17 +---
 drivers/gpu/drm/vboxvideo/vbox_drv.c          | 20 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 24 +----
 include/drm/drm_module.h                      | 95 +++++++++++++++++++
 12 files changed, 145 insertions(+), 163 deletions(-)
 create mode 100644 include/drm/drm_module.h


base-commit: 3f422828221d9ceefcddef0be33561b1646a1cbe
--
2.34.1


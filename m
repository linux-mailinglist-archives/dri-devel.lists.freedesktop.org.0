Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF957E98A5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 10:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4864B10E18B;
	Mon, 13 Nov 2023 09:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BD410E011
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 09:14:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B092F21900;
 Mon, 13 Nov 2023 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1699866883; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i1j3WKiHEGcOpZiIhq78RF3qX7ipbD0X6Czz+Uy0UPE=;
 b=0n/HfhIi5SGKVF00aTddX4FxlyLz/p+/3K8nQCzzKzljWunkT714AiZ8mnuzkFk1Iuv5Bc
 P3Jnpo4NnujrVbvkD7vzLHrSx1RQNrkHBha6U9TkaWAmo+maSRA4/7vQ9fCTRiBa0tIVv/
 bvcxpGKa/WahapEprkE/4mYZuZZU74M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1699866883;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=i1j3WKiHEGcOpZiIhq78RF3qX7ipbD0X6Czz+Uy0UPE=;
 b=asY8tg2Eh70IkNCkC7JWSy3ymJk/ewBCwkXR4oZtw09eNlh1nGT4YfMTh+47xZ7/kUUC3k
 6QRoPP5GFUWy5PBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8060E13398;
 Mon, 13 Nov 2023 09:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Rl9DHgPpUWW0BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Nov 2023 09:14:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH 00/10] drm/ast: Detect device type before init
Date: Mon, 13 Nov 2023 09:50:22 +0100
Message-ID: <20231113091439.17181-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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

Detecting the ast device's chipset type and configuration mode
involves several registers, DT properties and possibly POSTing
parts of the chip. It is preferable to do this before initializing
the DRM driver, so that that each chip type can have an individual
setup code.

The patchset addresses the problem by moving all early detection
code before the allocation of the ast device.

Patch one gets a lock out of the way. The lock is only relevant
for mode setting. Move it there.

Patches 2 and 3 rework the detection of the correct I/O memory
ranges. It is now self-contained, more readable and works without
an instance of struct ast_device.

Patches 4 to 7 rework the setup of various registers that are
required for detection. Access helpers for I/O can now operate
without an instance of struct ast_device. The setup functions
operate on the I/O ranges that have been made available with
patch 3, but again without struct ast_device.

With the detection's internals done, patches 8 and 9 rework the
chip's and config-mode's detection code to operate without struct
ast_device as well.

Finally, patch 10 moves the detection code into the PCI probe
function. it runs before any of the DRM device code. The fucntion
for creating an ast device, ast_device_create(), receives the
detected I/O memory ranges, chip type and configuration mode.

This cleans up the detection code. There is more chip-specific
code in other parts of the driver. In a later patch, the ast device
setup can be split up so that each chip type gets its own code
path that does not interfere with other chips.

Tested on AST1100 and AST2100.

Thomas Zimmermann (10):
  drm/ast: Turn ioregs_lock to modeset_lock
  drm/ast: Rework I/O register setup
  drm/ast: Retrieve I/O-memory ranges without ast device
  drm/ast: Add I/O helpers without ast device
  drm/ast: Enable VGA without ast device instance
  drm/ast: Enable MMIO without ast device instance
  drm/ast: Partially implement POST without ast device instance
  drm/ast: Add enum ast_config_mode
  drm/ast: Detect ast device type and config mode without ast device
  drm/ast: Move detection code into PCI probe helper

 drivers/gpu/drm/ast/ast_drv.c  | 261 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_drv.h  | 101 +++++++++----
 drivers/gpu/drm/ast/ast_main.c | 244 ++----------------------------
 drivers/gpu/drm/ast/ast_mode.c |  26 ++--
 drivers/gpu/drm/ast/ast_post.c |  73 +++++----
 drivers/gpu/drm/ast/ast_reg.h  |  12 +-
 6 files changed, 411 insertions(+), 306 deletions(-)


base-commit: b7816c393496dc4497c1327310821407f7171d8b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.42.0


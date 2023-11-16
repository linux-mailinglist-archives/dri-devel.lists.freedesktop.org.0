Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529E7EDE19
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 11:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C098710E2AD;
	Thu, 16 Nov 2023 10:02:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870F10E2AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 10:02:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D13E32292E;
 Thu, 16 Nov 2023 10:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700128961; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=goQkXYadapi8IVH+mfU9izAoI3ooyJWekmgdumhAfq8=;
 b=yii7KTm5qagz76A+XZQLq7yr9XZ12m0QGM/NaZIYb2iqwVZ6MwFfjwrg3awJDOEEseLaFu
 OJXxw+k4+XJkKIjNt7ZTuIfA3A3r86ARK/laEKE2QIMmhoKz4RZKyQguzIg9mwTF6UODoR
 V2/9SwG3kT1GOU7ZAlWbgTzlUw4G7Zw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700128961;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=goQkXYadapi8IVH+mfU9izAoI3ooyJWekmgdumhAfq8=;
 b=FzzHnivRZ+BN8qwjTkJ68GcA7i7wK3cdIbSxoVFjQtCkpjYiHzIDFa4YVl15e8ETVE9uqV
 e/fDLWUKi/rMybCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A56A31377E;
 Thu, 16 Nov 2023 10:02:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dVeGJ8HoVWXSGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 10:02:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, jfalempe@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, airlied@gmail.com
Subject: [PATCH v2 00/10] drm/ast: Detect device type before init
Date: Thu, 16 Nov 2023 10:59:19 +0100
Message-ID: <20231116100240.22975-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BROKEN_CONTENT_TYPE(1.50)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[8];
 MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[redhat.com,linux.intel.com,kernel.org,ffwll.ch,gmail.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
function. it runs before any of the DRM device code. The function
for creating an ast device, ast_device_create(), receives the
detected I/O memory ranges, chip type and configuration mode.

This cleans up the detection code. There is more chip-specific
code in other parts of the driver. In a later patch, the ast device
setup can be split up so that each chip type gets its own code
path that does not interfere with other chips.

Tested on AST1100 and AST2100.

v2:
	* add missing break statements (Jocelyn)
	* fix length test for I/O range

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

 drivers/gpu/drm/ast/ast_drv.c  | 263 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/ast/ast_drv.h  | 101 +++++++++----
 drivers/gpu/drm/ast/ast_main.c | 244 ++----------------------------
 drivers/gpu/drm/ast/ast_mode.c |  26 ++--
 drivers/gpu/drm/ast/ast_post.c |  73 +++++----
 drivers/gpu/drm/ast/ast_reg.h  |  12 +-
 6 files changed, 413 insertions(+), 306 deletions(-)


base-commit: b7816c393496dc4497c1327310821407f7171d8b
prerequisite-patch-id: 0aa359f6144c4015c140c8a6750be19099c676fb
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: cbc453ee02fae02af22fbfdce56ab732c7a88c36
-- 
2.42.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E85653F975
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 11:20:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FDE12AEE9;
	Tue,  7 Jun 2022 09:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBA412AEDF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 09:20:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C7AB21B35;
 Tue,  7 Jun 2022 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654593609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=He6cT+E5s6fTl6Mg8qgGW+iGWaTzKP2VEHZLk0G4kgA=;
 b=phJzIsrl70cGq5SUVOO8X/HOrw56yHwCOz/aUN/CybHvo8LkDzyhFNS6NzzjbKeikGLN2N
 YbQNG02QHHFm/rnQ5iizv7zGpUfiIJVjWKxVJBhjSKpCYEIPEVAoEz6K6RD5rtYMAhLA3D
 qFv2HkPQgE7T4hMkrVHaez+/5R0wCrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654593609;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=He6cT+E5s6fTl6Mg8qgGW+iGWaTzKP2VEHZLk0G4kgA=;
 b=l8wL17XqSlhZGPFVDdljNcgoydlSBY8w7ls63rsJ6+hNSIZWUA7sEoXmilZBBpo7T0CKoO
 S43siHKGOKW7vAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 703FA13638;
 Tue,  7 Jun 2022 09:20:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id txOWGkkYn2JwLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 09:20:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 patrik.r.jakobsson@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v3 0/5] drm/ast: Connector cleanups and polling
Date: Tue,  7 Jun 2022 11:20:03 +0200
Message-Id: <20220607092008.22123-1-tzimmermann@suse.de>
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

Various cleanups to ast's connector code. Simplifies the code, adds
support for using VGA and ASTDP connectors at the same time, and
initializes polling of the connector status.

Patch 1 was first posted at [1], so this patchset starts at version
2. The implementation of detect_ctx in patch 3 has been added to DRM
helpers as it will be useful for other drivers, such as mgag200 and
udl.

v3:
	* clarify docs for .detext_ctx helper (Patrik)
	* use macros for TX-chip BITS() (Patrik)

Thomas Zimmermann (5):
  drm/ast: Support multiple outputs
  drm/ast: Fix updating the connector's EDID property
  drm/ast: Support output polling
  drm/ast: Fail probing if DCC channel could not be initialized
  drm/ast: Remove struct ast_{vga,sil164}_connector

 drivers/gpu/drm/ast/ast_dp.c       |   5 +-
 drivers/gpu/drm/ast/ast_dp501.c    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h      |  35 ++----
 drivers/gpu/drm/ast/ast_i2c.c      |   7 +-
 drivers/gpu/drm/ast/ast_main.c     |  21 ++--
 drivers/gpu/drm/ast/ast_mode.c     | 165 ++++++++++-------------------
 drivers/gpu/drm/ast/ast_post.c     |   2 +-
 drivers/gpu/drm/drm_probe_helper.c |  40 +++++++
 include/drm/drm_probe_helper.h     |   3 +
 9 files changed, 126 insertions(+), 154 deletions(-)


base-commit: 6034ccb11971698ace6b3af2f6ac02de120a2dc2
-- 
2.36.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2387538F82
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:15:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44661112A0F;
	Tue, 31 May 2022 11:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF229112A0F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:15:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5AA4321B80;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653995706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3hVDFVo/ZgYv5uLz4wl7N/LltSaR1DoUoId2EWTXfuA=;
 b=PqWuMLHpNaSGH31Db6x3QnV9WqQh5zo+81ldLdzJciQR8Otv1zQvJcYJ/Vke8iKwDLcwPf
 lVpvpDmy33SDZi2PirxmuQyTh6ZpzybrCyTvhDZTamgOYBmE1J8bo9ToFMb5SfiL2rwV8v
 Y3E6JS0cky0/324Qsbv01KqEcMXeyuk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653995706;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=3hVDFVo/ZgYv5uLz4wl7N/LltSaR1DoUoId2EWTXfuA=;
 b=NI32oTGn5UYwgRb9KP75ZVvo1Joe3myR9s10I7BEvquL3McK8usOiwyQbxvNzlzW8eDZTa
 wF5nTFzfu61V6rBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3037E13AA2;
 Tue, 31 May 2022 11:15:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tIvtCrr4lWKZSAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 31 May 2022 11:15:06 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, kuohsiang_chou@aspeedtech.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH v2 0/5] drm/ast: Connector cleanups and polling
Date: Tue, 31 May 2022 13:14:57 +0200
Message-Id: <20220531111502.4470-1-tzimmermann@suse.de>
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

Various cleanups to ast's conenctor code. Simplifies the code, adds
support for using VGA and ASTDP connectors at the same time, and
initializes polling of the connector status.

Patch 1 was first posted at [1], so this patchset starts at version
2. The implementation of detect_ctx in patch 3 has been added to DRM
helpers as it will be useful for other drivers, such as mgag200 and
udl.

Thomas Zimmermann (5):
  drm/ast: Support multiple outputs
  drm/ast: Fix updating the connector's EDID property
  drm/ast: Support output polling
  drm/ast: Fail probing if DCC channel could not be initialized
  drm/ast: Remove struct ast_{vga,sil164}_connector

 drivers/gpu/drm/ast/ast_dp.c       |   5 +-
 drivers/gpu/drm/ast/ast_dp501.c    |   2 +-
 drivers/gpu/drm/ast/ast_drv.h      |  30 +-----
 drivers/gpu/drm/ast/ast_i2c.c      |   7 +-
 drivers/gpu/drm/ast/ast_main.c     |  21 ++--
 drivers/gpu/drm/ast/ast_mode.c     | 165 ++++++++++-------------------
 drivers/gpu/drm/ast/ast_post.c     |   2 +-
 drivers/gpu/drm/drm_probe_helper.c |  35 ++++++
 include/drm/drm_probe_helper.h     |   3 +
 9 files changed, 116 insertions(+), 154 deletions(-)


base-commit: 2c8cc5cd20e28afe6b63acb28890e5f57d9bf055
-- 
2.36.1


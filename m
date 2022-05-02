Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2D4517180
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 16:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B73B10EC61;
	Mon,  2 May 2022 14:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A971010EBD3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 14:26:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8BE2C210DF;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651501528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xNCGY8QViDXqWEuRDj2XxHZSR5gxsyut1mXzdr0vUdE=;
 b=KcYoFW3Cb4FAMifJvlHQGeG8wid4JTSY/lEPCNm835djVF1NEeODfUG1/J2MQ/SHp2VQzC
 y9RGwAcFw6vD2lRgLraJZ84/O+tEvmk3I7qAl1rSkHmVGt+2QihA0Fd/VleHEKPoPbxEhw
 qBg3Wk7ssOb2u116KYFSKjBhU0QWEQE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651501528;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=xNCGY8QViDXqWEuRDj2XxHZSR5gxsyut1mXzdr0vUdE=;
 b=iG7LatO4wGL0hnAiYq+w57AJ5AheUboOrdDvIKL+S53TmqBiLLfyvGerZKxIxwBk9Iuraq
 eOsvwi/k6DITldAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69A5A13491;
 Mon,  2 May 2022 14:25:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YQkPGdjpb2J4MgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 May 2022 14:25:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Subject: [PATCH 0/3] drm/{ast,
 mgag200}: Protect I/O regs against concurrent access
Date: Mon,  2 May 2022 16:25:11 +0200
Message-Id: <20220502142514.2174-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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

Protect access to I/O registers in ast and mgag200 via lock. Commit-
tail functions and get-modes operations use the same registers and can
interfere with each other. This can result in failed mode-setting
operations.

As both drivers use fully managed cleanup, the patchset adds a new helper
that initializes a mutex with auto-cleanup.

Thomas Zimmermann (3):
  drm: Add DRM-managed mutex_init()
  drm/ast: Protect concurrent access to I/O registers with lock
  drm/mgag200: Protect concurrent access to I/O registers with lock

 drivers/gpu/drm/ast/ast_drv.h          |  1 +
 drivers/gpu/drm/ast/ast_main.c         |  4 +++
 drivers/gpu/drm/ast/ast_mode.c         | 48 ++++++++++++++++++++++++--
 drivers/gpu/drm/drm_managed.c          | 27 +++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.c  |  6 ++++
 drivers/gpu/drm/mgag200/mgag200_drv.h  |  1 +
 drivers/gpu/drm/mgag200/mgag200_mode.c | 14 ++++++++
 include/drm/drm_managed.h              |  3 ++
 8 files changed, 101 insertions(+), 3 deletions(-)


base-commit: 3ae2e00290c290713e21118220a817a24b44d39f
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
-- 
2.36.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E3169E415
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:58:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999A510E851;
	Tue, 21 Feb 2023 15:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091910E84D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:57:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2576D34CDC;
 Tue, 21 Feb 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676995067; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qH3j2SvWKegTtQv7au7apTqfSU8zntkslJ7+Uqqw0aA=;
 b=ykeFl1NSKCEdZiuMp80K+frKCyDM+D4pkBUU3ZfvAIIgEdhqsDU08lXK5+jGGktIakdqvB
 MvJ5rUP6aJx6uthus1Mv8MM9XEJ7f0Yvh3YQwscSgrb9NyXpUGm+rauFcjUY41OZW64GEe
 ply6wxAY8Cbdj5+5X4B25C9UafvvdS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676995067;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qH3j2SvWKegTtQv7au7apTqfSU8zntkslJ7+Uqqw0aA=;
 b=BxHjKxu5xExYvrcUmaAHE9NFPfC2TpemNGFJ2iysf/AQFWtv977wE8b1SPHYZCXoxSwBMS
 ClFvotoQdTwGkiAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 009D413481;
 Tue, 21 Feb 2023 15:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BszvOvrp9GNOBgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 21 Feb 2023 15:57:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, airlied@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 0/4] drm/ast: Use struct ast_device
Date: Tue, 21 Feb 2023 16:57:41 +0100
Message-Id: <20230221155745.27484-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
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

Rename struct ast_private to struct ast_device. The old name comes
from the time when struct drm_device.dev_private was still in use.
Also update the upcast helper.

The renaming touches ast's I/O-helper macros, which generate warnings
with checkpatch. So fix the I/O helpers in the first two patches of
this patchset.

Tested on AST2100 hardware.

Thomas Zimmermann (4):
  drm/ast: Remove little-endianism from I/O helpers
  drm/ast: Rework definition of I/O read and write helpers
  drm/ast: Rename struct ast_private to struct ast_device
  drm/ast: Rename to_ast_private() to to_ast_device()

 drivers/gpu/drm/ast/ast_dp.c    | 10 ++--
 drivers/gpu/drm/ast/ast_dp501.c | 40 +++++++-------
 drivers/gpu/drm/ast/ast_drv.c   |  2 +-
 drivers/gpu/drm/ast/ast_drv.h   | 84 ++++++++++++-----------------
 drivers/gpu/drm/ast/ast_i2c.c   |  8 +--
 drivers/gpu/drm/ast/ast_main.c  | 24 ++++-----
 drivers/gpu/drm/ast/ast_mm.c    |  4 +-
 drivers/gpu/drm/ast/ast_mode.c  | 78 +++++++++++++--------------
 drivers/gpu/drm/ast/ast_post.c  | 94 ++++++++++++++++-----------------
 9 files changed, 163 insertions(+), 181 deletions(-)

-- 
2.39.2


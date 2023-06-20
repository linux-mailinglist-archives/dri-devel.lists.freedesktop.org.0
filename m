Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C2736BAE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 14:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9B510E2C9;
	Tue, 20 Jun 2023 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F5710E2D9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 12:12:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B9B15218B8;
 Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687263124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=klSNIOMbt2VL2IyeeNqCr1hM5B19djKU9H3/vvK7FQg=;
 b=2NI7rDj5mjvU+SS+6fB9z3ssN41PLgFpMEGRPkW2+zlQJtWldsxvxtDrgKUVocLZ7i8xPI
 eRh/SCE4gO8snzDKtnC8/KqUgaX/ZunztIL23NX1Q13QalikGJGjc9w7R0lIZyEAiTHC8Z
 shTIWn0/7cKK4cI6ckdxaOvBflWgnFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687263124;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=klSNIOMbt2VL2IyeeNqCr1hM5B19djKU9H3/vvK7FQg=;
 b=yjTBhDw2CJ+t5LUSt0Vo4hm+neJ2kNNiHAsydeV2D87o9qlkRS4NTFWIz0Cn7ie7+8sBHj
 4H1ImVdQLmaZNEAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 659DE133A9;
 Tue, 20 Jun 2023 12:12:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8prYF5SXkWSwEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 12:12:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, laurent.pinchart@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
 heiko@sntech.de
Subject: [PATCH 0/3] drm/gem-dma: Remove unnecessary calls
Date: Tue, 20 Jun 2023 14:03:20 +0200
Message-ID: <20230620121202.28263-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove rockchip's dependency on GEM DMA helpers. Rework the GEM DMA
interface to fit the needs of rcar-du.

This intends to be a cleanup with no functional changes. With the
patches merged, a later patchset can attempt to generate some of the
boiler-plate code for struct drm_gem_object_funcs automatically.

Thomas Zimmermann (3):
  drm/rcar-du: Import buffers with GEM DMA's helpers
  drm/rockchip: Resolve dependency in GEM DMA helpers
  drm/gem-dma: Unexport drm_gem_dma_vm_ops

 drivers/gpu/drm/drm_gem_dma_helper.c          | 16 ++++-----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 +++----------------
 drivers/gpu/drm/rockchip/Kconfig              |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  8 +++--
 include/drm/drm_gem_dma_helper.h              |  5 +--
 6 files changed, 22 insertions(+), 43 deletions(-)


base-commit: 32e260cd0d16cee6f33e747679f168d63ea54bf6
-- 
2.41.0


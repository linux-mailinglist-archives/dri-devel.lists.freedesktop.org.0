Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF8731441
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 11:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7DD10E4B5;
	Thu, 15 Jun 2023 09:42:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA63710E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 09:42:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 509E81FDDA;
 Thu, 15 Jun 2023 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686822128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FLxO8h8cGekvohvRSp1jHLf18tW6wwxM6r2IKaJDYIs=;
 b=yj+HVkjHEZwtqSo4YbwQVrysl+Qsn6jl0JShPFCOZq2gPxn70p/WohoKtCPLJlUSC5lsJh
 OQlMeCoi6AacKyM+70gW8fqAsinN6TdFx8+MYVA8VslI2JLbM1xDtm4PIM0glcDmR1HSvt
 srjU1rfwzwxdo/HQiGI4AfUlui4LKqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686822128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=FLxO8h8cGekvohvRSp1jHLf18tW6wwxM6r2IKaJDYIs=;
 b=buJabQ6xZ/oe+ysNE3Qbimv2kvE1Le+hk+xubu8dQwpXVn06SHDZ5q2ByBnkNNAY1+QYok
 5cNQeY1MYtZLNfAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B73413A47;
 Thu, 15 Jun 2023 09:42:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kGauBfDcimQ+WQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jun 2023 09:42:08 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Date: Thu, 15 Jun 2023 11:31:41 +0200
Message-ID: <20230615094206.4424-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set drm_gem_prime_handle_to_fd() and drm_gem_prime_fd_to_handle()
for all DRM drivers. Even drivers that do not support PRIME import
or export of dma-bufs can now import their own buffer objects. This
is required by some userspace, such as wlroots-based compositors, to
share buffers among processes.

The only driver that does not use the drm_gem_prime_*() helpers is
vmwgfx. Once it has been converted, the callbacks in struct drm_driver
can be removed.

Simon Ser implemented the feature for drivers based on GEM VRAM helpers
in [1]. This patchset generalizes the code for all drivers that do not
otherwise support PRIME. Tested by running sway with gma500 hardware.

[1] https://lore.kernel.org/dri-devel/20230302143502.500661-1-contact@emersion.fr/

Thomas Zimmermann (3):
  drm: Enable PRIME import/export for all drivers
  drm: Clear fd/handle callbacks in struct drm_driver
  drm/prime: Unexport helpers for fd/handle conversion

 Documentation/gpu/todo.rst                    | 14 +++++
 drivers/accel/ivpu/ivpu_drv.c                 |  2 -
 drivers/accel/qaic/qaic_drv.c                 |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 -
 drivers/gpu/drm/armada/armada_drv.c           |  2 -
 drivers/gpu/drm/drm_ioctl.c                   |  4 +-
 drivers/gpu/drm/drm_prime.c                   | 62 ++++++++++---------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  2 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 -
 drivers/gpu/drm/i915/i915_driver.c            |  2 -
 drivers/gpu/drm/lima/lima_drv.c               |  2 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 -
 drivers/gpu/drm/msm/msm_drv.c                 |  2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 -
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 -
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 -
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 -
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 -
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 -
 drivers/gpu/drm/tegra/drm.c                   |  2 -
 drivers/gpu/drm/v3d/v3d_drv.c                 |  2 -
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 -
 drivers/gpu/drm/xen/xen_drm_front.c           |  2 -
 include/drm/drm_drv.h                         |  6 ++
 include/drm/drm_gem_dma_helper.h              | 12 ++--
 include/drm/drm_gem_shmem_helper.h            |  6 +-
 include/drm/drm_gem_vram_helper.h             |  4 +-
 include/drm/drm_prime.h                       |  7 ---
 30 files changed, 62 insertions(+), 96 deletions(-)

-- 
2.41.0


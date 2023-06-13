Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9972E699
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 17:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4CD110E393;
	Tue, 13 Jun 2023 15:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571010E392;
 Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8D05C224F5;
 Tue, 13 Jun 2023 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686668686; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rc2DHs6gcS/zrUpB6kT7YF9TjwucLx5JadBSE1cptGs=;
 b=EG31kEuNKwUe2QChFxose7XSWIJ+CjIOBk/fC2kUqEWGMEKzAf4jrwelio/SNTYjFM7Xq9
 IJgWC14JoJFVzo9njnw7BtPp8umEGjMB/WCfCSbgZPJktwJMZ4l3+WkxXmMgRE9dj24AYn
 nWXyzgL0s0V07QxisAcqoMC+J253INY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686668686;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rc2DHs6gcS/zrUpB6kT7YF9TjwucLx5JadBSE1cptGs=;
 b=HTLUdM7/li5WOUexqnsf2xLO0cAT5IbigrXa7JGsI5TgdEovrdqqgeWLCRAnUsVlPTpAMa
 HbMv2nrWXvX7tDDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 593DE13483;
 Tue, 13 Jun 2023 15:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ++3PFI6FiGSGFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 15:04:46 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run
Subject: [PATCH 0/2] drm: Remove gem_prime_mmap callback
Date: Tue, 13 Jun 2023 16:51:31 +0200
Message-ID: <20230613150441.17720-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove the gem_prime_mmap callback from struct drm_driver. Rework
msm, which has its own implementation. Then remove the callback and
call drm_gem_prime_mmap() directly. This closes a long-standing item
on the TODO list.

The change removes the last GEM callback from the driver structure.
GEM memory managers should implement the callbacks in struct dma_buf_ops
and struct drm_gem_object_funcs to adapt the DRM to their needs.

Thomas Zimmermann (2):
  drm/msm: Initialize mmap offset after constructing the buffer object
  drm: Remove struct drm_driver.gem_prime_mmap

 Documentation/gpu/todo.rst                      |  9 ---------
 drivers/accel/ivpu/ivpu_drv.c                   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  1 -
 drivers/gpu/drm/drm_fbdev_dma.c                 |  6 +-----
 drivers/gpu/drm/drm_prime.c                     | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c         |  1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  1 -
 drivers/gpu/drm/lima/lima_drv.c                 |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.c                   |  1 -
 drivers/gpu/drm/msm/msm_drv.h                   |  1 -
 drivers/gpu/drm/msm/msm_gem.c                   |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem_prime.c             | 15 ---------------
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  1 -
 drivers/gpu/drm/panfrost/panfrost_drv.c         |  1 -
 drivers/gpu/drm/pl111/pl111_drv.c               |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c             |  1 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  1 -
 drivers/gpu/drm/v3d/v3d_drv.c                   |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c            |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c             |  1 -
 include/drm/drm_drv.h                           | 14 --------------
 include/drm/drm_gem_dma_helper.h                |  6 ++----
 include/drm/drm_gem_shmem_helper.h              |  1 -
 include/drm/drm_gem_vram_helper.h               |  1 -
 27 files changed, 13 insertions(+), 79 deletions(-)


base-commit: 63a468ec7c7652afa80e3fa6ad203f9e64d04e83
-- 
2.41.0

